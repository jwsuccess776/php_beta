<?php

    class Sagepay_payController extends PaymentController
    {

        private $key_name = "sagepay";

        function charge($order_id)
        {   
             $payment_itm = array();

             $payment_itm_gtag = array();
                $payment_itm_price = array();

            $_SESSION['order_criteo'] = $order_id;

            unset($_SESSION['shopping_cart']);
            $pmObj = new Paymentsettings($this->key_name);

            if (!$payment_settings = $pmObj->getPaymentSettings())
            {
                Message::addErrorMessage($pmObj->getError());
                Utilities::redirectUserReferer();
            }

            $orderPaymentObj = new OrderPayment($order_id);
            $payment_amount = $orderPaymentObj->getOrderPaymentGatewayAmount();
            $order_info = $orderPaymentObj->getOrderPrimaryinfo();


            $myorder = new Orders($order_id);
            $myorderinfo = $myorder->getOrderById($order_id);
            /* echo '<pre>';
              print_r($myorderinfo);
              exit;
             */
//echo '<pre>';
            $mydb = Syspage::getdb();
            $commission_query = "select * from tbl_order_products where opr_order_id = " . $order_id . " ";
            //echo $commission_query;
            $commission_dets = $mydb->query($commission_query);
            //print_r($commission_dets);
            if ($commission_dets->num_rows > 0)
            {
                $commission_res = $mydb->fetch_all($commission_dets);
                foreach ($commission_res as $com_row)
                {
                    //print_r($com_row);

                    $opr_id = $com_row['opr_id'];

                    $payment_itm[] = array(
                  'id'=>'sellsa-'.$com_row['opr_product_id'],
                  'price'=>$com_row['opr_sale_price'],
                  'quantity'=>$com_row['opr_qty']
                );

                    $payment_itm_gtag[] = array(
                     'id'=>'sellsa-'.$com_row['opr_product_id']
                );
                $payment_itm_price[] = array(
                     'price'=>$com_row['opr_sale_price']
                );

                    $opr_commission_charged = $com_row['opr_commission_charged'];
                    $opr_commission_percentage = $com_row['opr_commission_percentage'];
                    $opr_net_charged = $com_row['opr_net_charged'];

                    $opr_commission_percentage = $opr_commission_percentage + 5;

                    $new_commision_charged = ($opr_net_charged * 5) / 100;

                    $opr_commission_charged = $opr_commission_charged + $new_commision_charged;

                    $opr_update_query = "UPDATE tbl_order_products SET opr_commission_charged ='$opr_commission_charged', opr_commission_percentage = '$opr_commission_percentage'  WHERE opr_id='" . $opr_id . "'";
                    $mydb->query($opr_update_query);

                    //echo 'updated <br/>';
                }


                $original_order = $mydb->query("select * from tbl_orders where order_id = '" . $order_id . "'  limit 1");
                if ($original_order->num_rows > 0)
                {
                    $original_ord = $mydb->fetch_all($original_order);
                    //echo '<pre>';
                    //print_r($original_ord);

                    $old_order_site_commission = $original_ord[0]['order_site_commission'];
                    $order_net_charged = $original_ord[0]['order_net_charged'];

                    $new_commission_charge = ($order_net_charged * 5) / 100;

                    $old_order_site_commission = $old_order_site_commission + $new_commission_charge;

                    $order_update_query = "UPDATE tbl_orders SET order_site_commission ='$old_order_site_commission' WHERE order_id='" . $order_id . "'";
                    $mydb->query($order_update_query);
                }
                //print_r($result);
            }



            if ($order_info && $order_info["order_payment_status"] == 0)
            {
                /* echo "<pre>";print_r($frm);exit; */
                $this->set('payment_amount', $payment_amount);
            }
            else
            {
                $this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
            }

            /*
              echo '<pre>';
              print_r($order_info);
              echo '</pre>';
              exit; */
              $_SESSION['criteo_session'] = json_encode($payment_itm);
              $_SESSION['gtag_session'] = json_encode($payment_itm_gtag);
                $_SESSION['gtag_session_price'] = json_encode($payment_itm_price);

            $this->set('order_info', $order_info);

            $this->_template->render(true, false);
        }

        function pay_now($order_id)
        {
            //unset($_SESSION['shopping_cart']);
            $pmObj = new Paymentsettings($this->key_name);

            if (!$payment_settings = $pmObj->getPaymentSettings())
            {
                Message::addErrorMessage($pmObj->getError());
                Utilities::redirectUserReferer();
            }

            $orderPaymentObj = new OrderPayment($order_id);
            $payment_amount = $orderPaymentObj->getOrderPaymentGatewayAmount();
            $order_info = $orderPaymentObj->getOrderPrimaryinfo();


            $myorder = new Orders($order_id);
            $myorderinfo = $myorder->getOrderById($order_id);
            /* echo '<pre>';
              print_r($myorderinfo);
              exit;
             */
//echo '<pre>';
            $mydb = Syspage::getdb();
            $commission_query = "select * from tbl_order_products where opr_order_id = " . $order_id . " ";
            //echo $commission_query;
            $commission_dets = $mydb->query($commission_query);
            //print_r($commission_dets);
            if ($commission_dets->num_rows > 0)
            {
                $commission_res = $mydb->fetch_all($commission_dets);
                foreach ($commission_res as $com_row)
                {
                    //print_r($com_row);

                    $opr_id = $com_row['opr_id'];
                    $opr_commission_charged = $com_row['opr_commission_charged_static'];
                    $opr_commission_percentage = $com_row['opr_commission_percentage_static'];
                    $opr_net_charged = $com_row['opr_net_charged'];

                    $opr_commission_percentage = $opr_commission_percentage + 5;

                    $new_commision_charged = ($opr_net_charged * 5) / 100;

                    $opr_commission_charged = $opr_commission_charged + $new_commision_charged;

                    $opr_update_query = "UPDATE tbl_order_products SET opr_commission_charged ='$opr_commission_charged', opr_commission_percentage = '$opr_commission_percentage'  WHERE opr_id='" . $opr_id . "'";
                    $mydb->query($opr_update_query);

                    //echo 'updated <br/>';
                }


                $original_order = $mydb->query("select * from tbl_orders where order_id = '" . $order_id . "'  limit 1");
                if ($original_order->num_rows > 0)
                {
                    $original_ord = $mydb->fetch_all($original_order);
                    //echo '<pre>';
                    //print_r($original_ord);

                    $old_order_site_commission = $original_ord[0]['order_site_commission_static'];
                    $order_net_charged = $original_ord[0]['order_net_charged'];
                    $new_commission_charge = ($order_net_charged * 5) / 100;

                    $old_order_site_commission = $old_order_site_commission + $new_commission_charge;

                    $order_update_query = "UPDATE tbl_orders SET order_site_commission ='$old_order_site_commission' WHERE order_id='" . $order_id . "'";
                    $mydb->query($order_update_query);
                }
                //print_r($result);
            }



            if ($order_info && $order_info["order_payment_status"] == 0)
            {
                /* echo "<pre>";print_r($frm);exit; */
                $this->set('payment_amount', $payment_amount);
            }
            else
            {
                $this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
            }

            /*
              echo '<pre>';
              print_r($order_info);
              echo '</pre>';
              exit; */
            $this->set('order_info', $order_info);

            $this->_template->render(true, false);
        }

        public function notify()
        {
            header('HTTP/1.0 200 OK');

            $post_data = $_POST;
            $mydb = Syspage::getdb();
            $pfData = $_POST;

            if ((isset($pfData['TransactionAccepted'])) && ($pfData['Extra2'] == "Product")) // order product payament
            {
                $order_id = $pfData['Extra1'];
                $orderObj = new Orders();
                $order_info1 = $orderObj->getOrderById($order_id);
                $payment_status = '0';
                $payment_status_name = 'Pending';
                $ordered_product_status = '1';

                switch ($pfData['TransactionAccepted'])
                {
                    case 'true':

                        $payment_status = '1';
                        $ordered_product_status = '2';
                        $payment_status_name = 'Completed';

                        //$emailNotificationObj = new Emailnotifications();
                        //$emailNotificationObj->New_Order_Buyer_Admin($order_id);
                        //$emailNotificationObj->New_Order_Vendor($order_id);

                        break;
                    case 'false':
                        $payment_status = '0';
                        $payment_status_name = 'Failed';
                        // There was an error, update your application
                        break;
                    default:

                        // If unknown status, do nothing (safest course of action)
                        break;
                }


                $query3 = "UPDATE tbl_order_products SET opr_status ='$ordered_product_status'  WHERE opr_order_id='" . $order_info1['order_id'] . "'";
                $mydb->query($query3);

                $query1 = "UPDATE tbl_orders SET order_payment_status='$payment_status', order_status ='1'  WHERE order_id='" . $order_info1['order_id'] . "'";
                $mydb->query($query1);


                $query2 = "insert into tbl_order_payments (
		op_order_id, 
		op_payment_method, 
		op_gateway_txn_id, 
		op_amount, 
		op_gateway_status, 
		op_comments, 
		op_gateway_response, 
		op_date 
		) 
		
		values (
		'" . $order_id . "', 
		'sagepay', 
		'" . $pfData['Reference'] . "', 
		'" . $pfData['Amount'] . "', 
		'" . $pfData['TransactionAccepted'] . "', 
		'" . $pfData['TransactionAccepted'] . "', 
		'" . $pfData['TransactionAccepted'] . "', 
		'" . date('Y-m-d H:i') . "'  
		
		) ";
        
        $mydb->query($query2);
                
        //For status History with notification 16 Aug 2018

        if ($orderObj->addOrderHistory($order_id, 1, "-NA-", true)) {
            $sub_orders = $orderObj->getChildOrders(array("order" => $order_id));
            foreach ($sub_orders as $subkey => $subval) {
                $orderObj->addChildOrderHistory($subval["opr_id"], $ordered_product_status, '', true);
            }
        }
        
            $emailNotificationObj=new Emailnotifications();
            $emailNotificationObj->New_Order_Vendor($order_id);	//Added 14-sep-2018

        
            }
        }

        public function accept()
        {
            mail('hanwant0@gmail.com', 'sagepay_notify', $_POST);
            p($_POST);
        }

        public function decline()
        {
            mail('hanwant0@gmail.com', 'sagepay_notify', $_POST);
            p($_POST);
        }

        public function payment_process()
        {
            $post_data = $_POST;
            $mydb = Syspage::getdb();
            $pfData = $_POST;


            if ((isset($pfData['TransactionAccepted'])) && ($pfData['Extra2'] == "Product")) // order product payament
            {
//                $order_id = $pfData['Extra1'];
//                $orderObj = new Orders();
//                $order_info1 = $orderObj->getOrderById($order_id);
//                $payment_status = '0';
//                $payment_status_name = 'Pending';
//                $ordered_product_status = '1';
//
//                switch ($pfData['TransactionAccepted'])
//                {
//                    case 'true':
//
//                        $payment_status = '1';
//                        $ordered_product_status = '2';
//                        $payment_status_name = 'Completed';
//
//                        $emailNotificationObj = new Emailnotifications();
//                        $emailNotificationObj->New_Order_Buyer_Admin($order_id);
//                        $emailNotificationObj->New_Order_Vendor($order_id);
//
//                        break;
//                    case 'false':
//                        $payment_status = '0';
//                        $payment_status_name = 'Failed';
//                        // There was an error, update your application
//                        break;
//                    default:
//
//                        // If unknown status, do nothing (safest course of action)
//                        break;
//                }
//
//
//                $query3 = "UPDATE tbl_order_products SET opr_status ='$ordered_product_status'  WHERE opr_order_id='" . $order_info1['order_id'] . "'";
//                $mydb->query($query3);
//
//                $query1 = "UPDATE tbl_orders SET order_payment_status='$payment_status', order_status ='1'  WHERE order_id='" . $order_info1['order_id'] . "'";
//                $mydb->query($query1);
//
//
//                $query2 = "insert into tbl_order_payments (
//		op_order_id, 
//		op_payment_method, 
//		op_gateway_txn_id, 
//		op_amount, 
//		op_gateway_status, 
//		op_comments, 
//		op_gateway_response, 
//		op_date 
//		) 
//		
//		values (
//		'" . $order_id . "', 
//		'sagepay', 
//		'" . $pfData['Reference'] . "', 
//		'" . $pfData['Amount'] . "', 
//		'" . $pfData['TransactionAccepted'] . "', 
//		'" . $pfData['TransactionAccepted'] . "', 
//		'" . $pfData['TransactionAccepted'] . "', 
//		'" . date('Y-m-d H:i') . "'  
//		
//		) ";
//                $mydb->query($query2);

                if ($pfData['TransactionAccepted'] == 'false')
                {
                    echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_failed";</script>';
                }
                else
                {
                    echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_success";</script>';
                }
            }
        }

        public function sagepay_payment()
        {
            /* echo '<pre>';
              print_r($_POST);
              print_r($_GET); */

            if (isset($_POST) && count($_POST) > 0)
            {
                $post = $_POST;
                if ($post['TransactionAccepted'] == 'false')
                {
                    echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_failed";</script>';
                }
            }
            echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_success";</script>';

            //	echo '<script>window.location = "https://sellsa.co.za/custom/payment_success";</script>';
        }

    }
    
