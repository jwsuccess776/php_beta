<?php

    class CronController extends CommonController
    {
 
        function timer_reach_2_days_alert()
        {
            header('HTTP/1.0 200 OK');
            $mydb = Syspage::getdb();
            $emailNotificationObj = new Emailnotifications();
            //$start_time = date('Y-m-d H:i:s', strtotime('-2 days', strtotime(date('Y-m-d H:i'))));
            $start_time = date('Y-m-d H:i:s', strtotime('-1 days', strtotime(date('Y-m-d H:i'))));
            $end_time = date('Y-m-d H:i:s', strtotime('+59 seconds', strtotime($start_time)));
            $order_query = "select * from tbl_orders where order_payment_status=0  AND order_date_added BETWEEN '$start_time ' AND '$end_time'";
            //p($start_time,0);
            $order_obj = $mydb->query($order_query);
            if ($order_obj->num_rows > 0)
            {
                $order_data = $mydb->fetch_all($order_obj);
                foreach ($order_data as $key => $value)
                {
                    $emailNotificationObj->timer_reach_2_days_alert($value['order_id']);
                }
            }
        }

        function auto_cancel_order()
        {
            header('HTTP/1.0 200 OK');

            $mydb = Syspage::getdb();
            $emailNotificationObj = new Emailnotifications();
            $start_time = date('Y-m-d H:i:s', strtotime('-'.AUTO_CANCELLED_DAYS.' days', strtotime(date('Y-m-d H:i'))));
            //p($start_time,0);
            $end_time = date('Y-m-d H:i:s', strtotime('+59 seconds', strtotime($start_time)));
            //p($end_time);
            $order_query = "select * from tbl_orders where order_payment_status='0'  AND order_date_added BETWEEN '$start_time ' AND '$end_time'";
            //p($start_time,0);
            $order_obj = $mydb->query($order_query);
            if ($order_obj->num_rows > 0)
            {
                $order_data = $mydb->fetch_all($order_obj);
                foreach ($order_data as $key => $value)
                {
                    $oObj = new Orders();
                    $order_id = $value['order_id'];
                    $order = $oObj->getOrderById($order_id);

                    if ($order == false)
                    {
                        //Message::addErrorMessage('Error: Please perform this action on valid record.');
                        //dieJsonError(Message::getHtml());
                    }
                    if (!$order["order_payment_status"])
                    {
                        if ($oObj->addOrderPaymentHistory($order_id, -1, "Order Cancelled", 1))
                        {
                            //Message::addMessage('Success: Order has been cancelled successfully.');
                            if ($oObj->refundOrderPaidAmount($order_id))
                            {
                                $oObj->refundOrderRewardPoints($order_id);
                                //Message::addMessage('Success: Order paid amount refunded & reward points reversed successfully.');
                                //dieJsonSuccess(Message::getHtml());
                            }
                            else
                            {
                                //Message::addErrorMessage($oObj->getError());
                                //dieJsonError(Message::getHtml());
                            }
                        }
                    }
                }
            }
        }
        
        
        function product_list($pObj, $criteria) {
    //        $criteria = array(
    //            'pagesize' => '200',
    //            'page' => '1'
    //        );
    
            $pObj->joinWithDetailTable();
            $pObj->joinWithCategoryTable();
            $pObj->joinWithBrandsTable();
            $pObj->joinWithPromotionsTable();
            $pObj->addSpecialPrice();
            $pObj->setPageSize($criteria['pagesize']);
            $pObj->setPageNumber($criteria['page']);
            $pObj->selectFields(array('tp.*', 'ts.*', 'tu.*', 'tpb.brand_name', 'tpd.prod_long_desc', 'IF(prod_stock >0, "1", "0" ) as available'));
            $products = $pObj->getProducts($criteria);
    
            return $products;
        }

        
        function product_list_data() {  

            $pathSuffix = 'product_catalog';
            $pathSuffix = Utilities::getCurrUploadDirPath($pathSuffix);
            $dir = CONF_INSTALLATION_PATH . 'public/' . $pathSuffix;
    
            if (!is_writable($dir)) {
                $response = "Directory $dir is not writable, or does not exist. Please check";
                return false;
            }
    
            $filename = $dir . '/dpa_product_catalog_feed.csv';
            unlink($filename);
            $file = fopen($filename, 'w');
    
            fputcsv($file, array(
                'id',
                'availability',
                'condition',
                'description',
                'image_link',
                'link',
                'title',
                'price',
                'brand',
                'mpn'
                    )
            );
    
    
    
            $criteria = array(
                'pagesize' => '100',
                'page' => '1'
            );
    
            $pObj = new Products();
            $products = $this->product_list($pObj, $criteria);
            $total_records = $pObj->getTotalRecords();
            $total_pages = $pObj->getTotalPages();
    
            foreach ($products as $pkey => $pval) {
                $arr = $pObj->product_additional_info($pval);
                //p($arr);
    
                $row = array(
                    'id' => 'sellsa-' . $pval['prod_id'],
                    'availability' => 'in stock',
                    'condition' => 'new',
                    'description' => strip_tags($pval['prod_long_desc']),
                    'image_link' => 'https://' . $_SERVER['SERVER_NAME'] . $arr['prod_image_url'],
                    'link' => 'https://' . $_SERVER['SERVER_NAME'] . $arr['prod_url'],
                    'title' => $pval['prod_name'],
                    'price' => $pval['prod_sale_price'] . ' ZAR',
                    'brand' => $pval['brand_name'],
                    'mpn'=>$pval['prod_id']
                );
    
                fputcsv($file, $row);
            }
    
            if ($total_pages > 1) {
                for ($i = 2; $i <= $total_pages; $i++) {
    
                    $criteria = array(
                        'pagesize' => '100',
                        'page' => $i
                    );
                    $products = $this->product_list($pObj, $criteria);
    
                    //p($i,0);
                    //p($total_pages,0);
                    //p($products,0);
    
                    foreach ($products as $pkey => $pval) {
                        $arr = $pObj->product_additional_info($pval);
                        //p($arr);
    
                        $row = array(
                            'id' => 'sellsa-' . $pval['prod_id'],
                            'availability' => 'in stock',
                            'condition' => 'new',
                            'description' => strip_tags($pval['prod_long_desc']),
                            'image_link' => 'https://' . $_SERVER['SERVER_NAME'] . $arr['prod_image_url'],
                            'link' => 'https://' . $_SERVER['SERVER_NAME'] . $arr['prod_url'],
                            'title' => $pval['prod_name'],
                            'price' => $pval['prod_sale_price'] . ' ZAR',
                            'brand' => $pval['brand_name'],
                            'mpn'=>$pval['prod_id']
                        );
    
                        fputcsv($file, $row);
                    }
                }
            }
    
            fclose($file);
        }
        
        function generateGoogleMerchantXml($start=0,$end=10) {
            //SET SHOP VARIABLES
            $shop_name = "Sellsa";
            $shop_link = "https://sellsa.co.za";
    
    
    //GET PRODUCTS FROM DATABASE
    
            $feed_products = [];
    
            $criteria = array(
                'pagesize' => '10000',
                'page' => '1'
            );
            

              $mydb = Syspage::getdb();
        
       $order_query = "SELECT tp.prod_id,tp.prod_name,tp.prod_sale_price,tp.prod_image,tp.prod_stock,tp.prod_shop,tpd.prod_long_desc,tpb.brand_name,'' as promotion_id,'' as special,''as favorite,'' as prod_enable_cod_orders,ts.shop_name FROM `tbl_products` as tp 

LEFT JOIN tbl_shops as ts ON tp.prod_shop=ts.shop_id

INNER JOIN tbl_users as tu ON ts.shop_user_id=tu.user_id

LEFT JOIN tbl_prod_details as tpd ON tp.prod_id=tpd.prod_id

LEFT JOIN tbl_categories as tc ON tp.prod_category=tc.category_id

LEFT JOIN tbl_product_brands as tpb ON tp.prod_brand=tpb.brand_id

WHERE tp.prod_is_expired = '0' AND ts.shop_status = '1' AND ts.shop_vendor_display_status='1' AND tu.user_status='1' AND tu.user_is_deleted='0' AND tu.user_email_verified='1' AND tp.prod_status='1' AND tp.prod_is_deleted = '0' AND tp.prod_stock!=0 AND tp.prod_shop NOT IN ('107', '1368')
 ORDER BY `prod_id` DESC  LIMIT $start, $end";


   /*$order_query = "SELECT tp.prod_id,tp.prod_name,tp.prod_sale_price,tp.prod_stock,tp.prod_shop,'' as prod_long_desc,'' as brand_name,'' as promotion_id,'' as special,''as favorite,'' as prod_enable_cod_orders FROM `tbl_products` as tp 

LEFT JOIN tbl_shops as ts ON tp.prod_shop=ts.shop_id

INNER JOIN tbl_users as tu ON ts.shop_user_id=tu.user_id

LEFT JOIN tbl_prod_details as tpd ON tp.prod_id=tpd.prod_id

LEFT JOIN tbl_categories as tc ON tp.prod_category=tc.category_id

LEFT JOIN tbl_product_brands as tpb ON tp.prod_brand=tpb.brand_id

WHERE tp.prod_is_expired = '0' AND tp.prod_is_deleted = '0' AND tp.prod_status='1'  
 ORDER BY `prod_id` DESC"; */


        $order_obj = $mydb->query($order_query);
        $products = $mydb->fetch_all($order_obj);
        // echo "<pre>";
        // print_r($order_data);
        // echo "</pre>";
        // die;

            /*$pObj = new Products();
    
            $pObj->joinWithDetailTable();
            $pObj->joinWithCategoryTable();
            $pObj->joinWithBrandsTable();
            $pObj->joinWithPromotionsTable();
            $pObj->addSpecialPrice();
            $pObj->setPageSize($criteria['pagesize']);
            $pObj->setPageNumber($criteria['page']);
            $pObj->selectFields(array('tp.*', 'ts.*', 'tu.*', 'tpb.brand_name', 'tpd.prod_long_desc', 'IF(prod_stock >0, "1", "0" ) as available'));
            $products = $pObj->getProducts($criteria);*/
            
            //LOOP THROUGH PRODUCTS
            foreach ($products as $key => $product) {
               /* echo $product['prod_id'];
                echo "<br>";*/
               // $arr = $pObj->product_additional_info($product);
              /*  echo "<pre>";
                print_r($product);
                echo "</pre>";*/
                // echo $product['prod_image'];
                // echo "<br>";
                $gf_product = []; //CREATE EMPTY ARRAY FOR GOOGLE-FRIENDLY INFO 
                //feed attributes
                $gf_product['g:id'] = 'sellsa-' . $product['prod_id'];
                $gf_product['g:title'] = $product['prod_name'];
               // $gf_product['g:description'] = strip_tags($product['prod_long_desc']);
                $gf_product['g:link'] = 'https://' . $_SERVER['SERVER_NAME'] . Utilities::generateUrl('products', 'view', array($product["prod_id"]));
                //'https://' . $_SERVER['SERVER_NAME'] . $arr['prod_url'];
                if($product['prod_image']!=''){
                    $gf_product['g:image_link'] = $product['prod_image'];

                }else{
                    $gf_product['g:image_link'] = 'https://'. $_SERVER['SERVER_NAME'] .Utilities::generateUrl('image', 'product_image', array($product["prod_id"], 'MEDIUM'));
    
                }
                
                //'https://' . $_SERVER['SERVER_NAME'] . $arr['prod_image_url'];
               // $gf_product['g:availability'] = $product['prod_stock'];
                $gf_product['g:availability'] = 'in stock';
                $gf_product['g:price'] = $product['prod_sale_price'] . ' ZAR';
               // $gf_product['g:brand'] = $product['brand_name'];
                //$gf_product['g:gtin'] = $product['gtin'];
                $gf_product['g:mpn'] = $product['prod_id'];
    //            if (($gf_product['g:gtin'] == "") && ($gf_product['g:mpn'] == "")) {
    //                $gf_product['g:identifier_exists'] = "no";
    //            }
                $gf_product['g:condition'] = 'NEW'; //must be NEW or USED
                $gf_product['g:custom_label_0'] = $product['shop_name'];
                 $gf_product['g:description'] = strip_tags($product['prod_long_desc']);
                 $gf_product['g:brand'] = $product['brand_name'];
                 
                $feed_products[] = $gf_product;
            }
    
            // echo "<pre>";

            // print_r($feed_products);
            // echo "</pre>";
            // die;
            //p($feed_products);
            $doc = new DOMDocument('1.0', 'UTF-8');
    
            $xmlRoot = $doc->createElement("rss");
            $xmlRoot = $doc->appendChild($xmlRoot);
            $xmlRoot->setAttribute('version', '2.0');
            $xmlRoot->setAttributeNS('http://www.w3.org/2000/xmlns/', 'xmlns:g', "http://base.google.com/ns/1.0");
    
            $channelNode = $xmlRoot->appendChild($doc->createElement('channel'));
            $channelNode->appendChild($doc->createElement('title', $shop_name));
            $channelNode->appendChild($doc->createElement('link', $shop_link));
    
            foreach ($feed_products as $product) {
                $itemNode = $channelNode->appendChild($doc->createElement('item'));
                foreach ($product as $key => $value) {
                    if ($value != "") {
                        if (is_array($product[$key])) {
                            $subItemNode = $itemNode->appendChild($doc->createElement($key));
                            foreach ($product[$key] as $key2 => $value2) {
                                $subItemNode->appendChild($doc->createElement($key2))->appendChild($doc->createTextNode($value2));
                            }
                        } else {
                            $itemNode->appendChild($doc->createElement($key))->appendChild($doc->createTextNode($value));
                        }
                    } else {
    
                        $itemNode->appendChild($doc->createElement($key));
                    }
                }
            }
    
    
            $doc->formatOutput = true;
            echo $doc->saveXML();
            exit();
        }

    public function count_products(){
       $mydb = Syspage::getdb();
        
       $order_query = "SELECT count(tp.prod_id) as product_count FROM `tbl_products` as tp 
LEFT JOIN tbl_shops as ts ON tp.prod_shop=ts.shop_id
INNER JOIN tbl_users as tu ON ts.shop_user_id=tu.user_id
WHERE tp.prod_is_expired = '0' AND ts.shop_status = '1' AND ts.shop_vendor_display_status='1' AND tu.user_status='1' AND tu.user_is_deleted='0' AND tu.user_email_verified='1' AND tp.prod_status='1' AND tp.prod_is_deleted = '0'";

        $order_obj = $mydb->query($order_query);
        $order_data = $mydb->fetch_all($order_obj);
      
        echo "TOTAL LIVE PRODUCTS  :-  ". $order_data['0']['product_count'];

    }

    public function generatepricecheckXML($start=0,$end=10){
        ini_set('memory_limit', '-1');
            $shop_name = "Sellsa";
            $shop_link = "https://sellsa.co.za";
            //GET PRODUCTS FROM DATABASE
            $feed_products = [];
            $criteria = array(
                'pagesize' => '10000',
                'page' => '1'
            );
            

            $mydb = Syspage::getdb();
            $order_query = "SELECT tp.prod_id,tp.prod_name,tp.prod_sale_price,tp.prod_image,tp.prod_stock,tp.prod_shop,tpd.prod_long_desc,tpb.brand_name,'' as promotion_id,'' as special,''as favorite,'' as prod_enable_cod_orders,ts.shop_name,tc.category_name FROM `tbl_products` as tp 
            LEFT JOIN tbl_shops as ts ON tp.prod_shop=ts.shop_id
            INNER JOIN tbl_users as tu ON ts.shop_user_id=tu.user_id
            LEFT JOIN tbl_prod_details as tpd ON tp.prod_id=tpd.prod_id
            LEFT JOIN tbl_categories as tc ON tp.prod_category=tc.category_id
            LEFT JOIN tbl_product_brands as tpb ON tp.prod_brand=tpb.brand_id
            WHERE tp.prod_is_expired = '0' AND ts.shop_status = '1' AND ts.shop_vendor_display_status='1' AND tu.user_status='1' AND tu.user_is_deleted='0' AND tu.user_email_verified='1' AND tp.prod_status='1' AND tp.prod_stock!=0
            ORDER BY `prod_id` DESC  LIMIT $start, $end";


        $order_obj = $mydb->query($order_query);
        $products = $mydb->fetch_all($order_obj);
        /*echo "<pre>";
        print_r($products);
        echo "</pre>";
        die;*/
            
            //LOOP THROUGH PRODUCTS
        foreach ($products as $key => $product) {
            $gf_product = []; //CREATE EMPTY ARRAY FOR GOOGLE-FRIENDLY INFO 
            $gf_product['Category'] = $product['category_name'];
            $gf_product['ProductName'] = $product['prod_name'];
            $gf_product['OfferName'] = $product['prod_name'];
            $gf_product['ProductURL']  = 'https://' . $_SERVER['SERVER_NAME'] . Utilities::generateUrl('products', 'view', array($product["prod_id"]));
            if($product['prod_image']!=''){
                $gf_product['ImageURL'] = $product['prod_image'];

            }else{
                $gf_product['ImageURL'] = 'https://'. $_SERVER['SERVER_NAME'] .Utilities::generateUrl('image', 'product_image', array($product["prod_id"], 'MEDIUM'));

            }
            $gf_product['StockAvailability'] = 'in stock';
            $gf_product['Price'] = $product['prod_sale_price'];
            $gf_product['SalePrice'] = $product['prod_sale_price'];
            $gf_product['ProductLongDescription'] = strip_tags($product['prod_long_desc']);
           // $gf_product['is_mp'] = '1';
            $gf_product['Manufacturer'] = ' ';
            $feed_products[] = $gf_product;
        }   
    
          
              
            $doc = new DOMDocument('1.0', 'UTF-8');
    
            $xmlRoot = $doc->createElement("xml");
            $xmlRoot = $doc->appendChild($xmlRoot);
            $xmlRoot->setAttribute('version', '2.0');
            $xmlRoot->setAttribute('encoding', 'UTF-8');
            $channelNode = $xmlRoot->appendChild($doc->createElement('Offers'));
          
                
            foreach ($feed_products as $product) {
                
                $itemNode = $channelNode->appendChild($doc->createElement('Offer'));
                foreach ($product as $key => $value) {
                    if ($value != "") {
                        if (is_array($product[$key])) {
                            $subItemNode = $itemNode->appendChild($doc->createElement($key));
                            foreach ($product[$key] as $key2 => $value2) {
                                $subItemNode->appendChild($doc->createElement($key2))->appendChild($doc->createTextNode($value2));
                            }
                        } else {
                            $itemNode->appendChild($doc->createElement($key))->appendChild($doc->createTextNode($value));
                        }
                    } else {
    
                        $itemNode->appendChild($doc->createElement($key));
                    }
                }
            }
    
            
            $doc->formatOutput = true;
            
            echo $doc->saveXML();
              exit();


           /* echo "<pre>";
            print_r($feed_products);
            echo "<pre>";*/
           /* $x = '<xml version="2.0" encoding="UTF-8">';
            $x.='<Offers>';
            foreach ($feed_products as $product) {
                //var_dump($product);
                $x.='<Offer>';
                foreach ($product as $key => $value) {
                   // echo $key.' '.$value.'<br>';
                    $x.='<'.$key.'>'.$value.'</'.$key.'>';
                }
                 $x.='</Offer>';
            }     

            $x.='</Offers>';
            $x.='</xml>';

            echo $x;*/

          
    }
  
    public function testingxml(){
        
            $x = '<xml version="2.0" encoding="UTF-8">';
            $x.='<Offers>';
            $x.='<Offer>';  
            $x.='<Category>Baa</Category>';   
            $x.='<ProductName>Baa</ProductName>';   
            $x.='<Manufacturer>Baa</Manufacturer>';   
            $x.='<ModelNumber>Baa</ModelNumber>';   
            $x.='</Offer>';   

            $x.='</Offers>';
            $x.='</xml>';

            echo $x;


    }
    }
    