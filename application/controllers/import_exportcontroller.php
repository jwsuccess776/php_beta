<?php
class Import_exportController extends CommonController
{
    function __construct($model,$controller,$action)
    {
        parent::__construct($model, $controller, $action);
        $this->db = Syspage::getdb();
        if ($action!="update_product_image"){
            Utilities::checkLogin();
            $userObj=new User();
            $this->user_details=$userObj->getUserById($this->getLoggedUserId());
            $this->shop_id= $this->user_details['shop_id'];
            $this->user_id= $this->user_details['shop_user_id'];
            if(!$userObj->canAccessSupplierDashboard($this->getLoggedUserId())){
                Utilities::redirectUser(Utilities::generateUrl('account','supplier_approval_form'));
            }
            $this->set('user_details',$this->user_details); 
            $this->set('controller',$controller);
            $this->set('action',$action);
            $display_buyer_supplier_tab="S";
            $_SESSION["buyer_supplier_tab"]=$display_buyer_supplier_tab;
            $this->set('buyer_supplier_tab',$display_buyer_supplier_tab);
            $this->Importexport=new Importexport($this->shop_id);       
        }
    }
    
    function default_action($type='export')
    {       

            $frm=$this->getForm($type);
            $post = Syspage::getPostedVar();
    
            if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])){
                if(intVal($this->shop_id)==0 || intVal($this->user_id)==0){
                    Message::addErrorMessage(Utilities::getLabel('L_UserId_Or_UserShop_Does_Not_Exist'));
                    Utilities::redirectUser(Utilities::generateUrl('import_export', 'default_action',array($type)));
                }else{
                    if(!$frm->validate($post)){
                        Message::addErrorMessage($frm->getValidationErrors());
                    }                   
                    switch($post["mode"]){
                        case 'settings':
                           // die('setting');
                        $this->Importexport->editSetting('export_import',$post,$this->shop_id);
                        Message::addMessage(Utilities::getLabel('L_Setting_Updated_Successfully'));
                        Utilities::redirectUser(Utilities::generateUrl('import_export', 'default_action',array($type)));
                        break;
                        case 'import':  
                            //die('import');
                        if ($this->Importexport->isUploadedFileValidFile($_FILES['upload'])){       
                            if(!Utilities::saveFile($_FILES['upload']['tmp_name'],$_FILES['upload']['name'], $attachment, 'importexport/')){
                                Message::addError($attachment);
                            }
        /* $settingsObj=new Settings();
        $settingsObj->backupDatabase('before_import'); */
        $post["attachment"]=$attachment;
        
        //$incremental = ($post['incremental']) ? true : false;
        $incremental = true;
        if ($this->Importexport->upload($_FILES['upload']['tmp_name'],$incremental,$this->user_id)===true) {
            Message::addMessage(Utilities::getLabel('M_YOUR_ACTION_PERFORMED_SUCCESSFULLY'));
            Utilities::redirectUser(Utilities::generateUrl('import_export', 'default_action',array($type)));
        }
        }else{
            Message::addErrorMessage(Utilities::getLabel('L_Invalid_File_Upload'));
        }                       
        break;
                    case 'import_xml':  
                                //die('import');
                            if ($this->Importexport->isUploadedFileValidFileXML($_FILES['upload'])){        
                                if(!Utilities::saveFile($_FILES['upload']['tmp_name'],$_FILES['upload']['name'], $attachment, 'importexport/')){
                                    Message::addError($attachment);
                                }
        /* $settingsObj=new Settings();
        $settingsObj->backupDatabase('before_import'); */
        $post["attachment"]=$attachment;
        
        //$incremental = ($post['incremental']) ? true : false;
        $incremental = true;
        $xml=$this->Importexport->upload_data($_FILES['upload']['tmp_name'],$incremental,$attachment,$this->user_id);
        
        //Utilities::redirectUser(Utilities::generateUrl('import_export', 'default_action',array('choose_options')));
            
        // echo '<pre>';
        //         print_r($xml);
        //         echo '</pre>';
        
        //         die('test12345');
        
        if ($this->Importexport->upload_data($_FILES['upload']['tmp_name'],$incremental,$attachment,$this->user_id)===true) {
            Message::addMessage(Utilities::getLabel('M_YOUR_ACTION_PERFORMED_SUCCESSFULLY'));
            Utilities::redirectUser(Utilities::generateUrl('import_export', 'default_action',array($type)));
        }
        }else{
            Message::addErrorMessage(Utilities::getLabel('L_Invalid_File_Upload'));
        }                       
        break;
        case 'choose_options': 
        break;  
        case 'export':                      
        $this->download();                      
        break;                      
        }               
        }
        }
        $res=$this->Importexport->getSetting('export_import',$this->shop_id);   
        $frm->fill($res);       
        $this->set('tabSelected',$type);
        $this->set('frm',$frm);
        $this->_template->render();     
    }
    private function getForm($type)
    { 
        $frm = new Form('frmSettings','frmSettings');
        $frm->addHiddenField('', 'mode',$type);     
        switch($type){
            case 'export':
            $fld=$frm->addHtml('','','<span class="panelTitleHeading">'.Utilities::getLabel('L_Export_Data_XLSX_Spreadsheet_File.').'</span><small>'.Utilities::getLabel('L_Select_What_You_Want_Export').'</small>');
            $fld->merge_caption=true;
            $arr=array('c'=>Utilities::getLabel('L_Categories').' ('.Utilities::getLabel('L_Including_Category_Data_Filter').')','p'=>Utilities::getLabel('L_Products').' ('.Utilities::getLabel('M_Including_Product_Options_Specials_Discounts_Attributes_Filters_Shipping').')','o'=>Utilities::getLabel('L_Option_Definitions'),'a'=>Utilities::getLabel('L_Attribute_Definitions'),'f'=>Utilities::getLabel('L_Filter_Definitions'),'sd'=>Utilities::getLabel('L_Shipping_Durations'),'sc'=>Utilities::getLabel('L_Shipping_Companies')/* ,'s'=>'Shops' */,'b'=>Utilities::getLabel('L_Brands'),'cn'=>Utilities::getLabel('L_Countries'),'sq'=>Utilities::getLabel('L_Products_Stock_And_SKU'));
            $frm->addRadioButtons('','export_type',$arr,'p','1','class="field4"');
            $frm->addHtml('','',Utilities::getLabel('M_Select_Data_Range').'<br /><small class="showHide">('.Utilities::getLabel('L_Optional_Leave_Empty').')</small>');    
            //$frm->addRadioButtons('','range_type',array('id'=>Utilities::getLabel('L_By_Id_Range'),'page'=>Utilities::getLabel('L_By_Batches')),'','','','class="field4 showHide range_type" onClick="loadRangeType(this)"');
            $frm->addRadioButtons('','range_type',array('id'=>Utilities::getLabel('L_By_Id_Range'),'page'=>Utilities::getLabel('L_By_Batches')),'','1','','class="field4 showHide range_type" onClick="loadRangeType(this)"');
            $frm->addTextBox('<span id="minLabel">'.Utilities::getLabel('L_Start_Id').'</span>','min','','min','class="showHide"');
            $frm->addTextBox('<span id="maxLabel">'.Utilities::getLabel('L_End_ID').'</span>','max','','max','class="showHide"');
            break;
            case 'import':
            $fld=$frm->addHtml('','','<span class="panelTitleHeading">'.Utilities::getLabel('L_Import_XlS_XLSX_Or_ODS_File').'</span><small>'.Utilities::getLabel('L_Spreadsheet_Can_Have_Only_Products').'<br />'.Utilities::getLabel('L_Do_Export_First_For_Format').'</small>');
            $fld->merge_caption=true;
            $frm->addRadioButtons('','incremental',array(1=>Utilities::getLabel('L_Yes')." (".Utilities::getLabel('L_Update_And_Or_Add_Data').")",0=>Utilities::getLabel('L_No')." (".Utilities::getLabel('L_Delete_All_Old_Data').")"),'','1','class="field4"');               
            $frm->addHtml('','',Utilities::getLabel('L_File_To_Be_Uploaded'));
            $fld=$frm->addFileUpload('', 'upload', 'upload', '');
    /* $fld->html_before_field='<div class="filefield"><span class="filename"></span>';
    $fld->html_after_field='<label class="filelabel">Browse File</label></div>'; */
    break;
        case 'import_xml':
            $fld=$frm->addHtml('','','<span class="panelTitleHeading">Import from a XML spreadsheet file</span><small>'.Utilities::getLabel('L_Spreadsheet_Can_Have_Only_Products').'<br />'.Utilities::getLabel('L_Do_Export_First_For_Format').'</small>');
            $fld->merge_caption=true;
                    
            $frm->addHtml('','',Utilities::getLabel('L_File_To_Be_Uploaded'));
            $fld=$frm->addFileUpload('', 'upload', 'upload', '');
    
    break;
    case 'choose_options':
            
            $frm->addHiddenField('', 'prod_category');
            $fld=$frm->addHtml('','','<span class="panelTitleHeading">Choose Options</span>');
            
            $cObj = new Categories();
            $cat_arr = array_reverse($cObj->funcGetCategoryStructure($cval["prod_category"]));
            $cat_id = $cat_arr[0]['category_id'];
            if ($cat_id > 0) {
                foreach ($cat_arr as $ckey => $cval) {
                    $incr++;
                    ${'fld_' . $incr} = $frm->addSelectBox(Utilities::getLabel('M_Product_Category'), 'prod_category[]', $cObj->getParentAssociativeArray($cval['category_parent'], 1), $cval['category_id'], ' class="product_category small primary" required ', Utilities::getLabel('M_Select'));
                    //${'fld_'.$incr}->requirements()->setRequired();
                    if ($incr > 1) {
                        $j = $incr - 1;
                        ${'fld_' . $j}->attachField(${'fld_' . $incr});
                    }
                    if ($incr == count($cat_arr))
                        ${'fld_' . $incr}->html_after_field = '<span id="show_sub_categories"></span>';
                }
            }else {
                $fld = $frm->addSelectBox(Utilities::getLabel('M_Product_Category'), 'prod_category[]', $cObj->getParentAssociativeArray(0, 1), $cat_id, 'class="product_category small primary"  required', Utilities::getLabel('M_Select'));
                //$fld->requirements()->setRequired();
                $fld->html_after_field = '<span id="show_sub_categories"></span>';
            }
                
        
    
    break;
    case 'settings':
    $fld=$frm->addHtml('','','<span class="panelTitleHeading">'.Utilities::getLabel('L_Bulk_Import_Export_Settings').'</span>');
    $fld->merge_caption=true;           
    $fld=$frm->addCheckBox('','export_import_settings_use_brand_id','1','export_import_settings_use_brand_id','class="field4"');
    $fld->html_after_field=" Use brand_id instead of brand name in worksheets 'Products' ";
    $fld=$frm->addCheckBox('','export_import_settings_use_option_id','1','export_import_settings_use_option_id','class="field4"');
    $fld->html_after_field=" Use option_id instead of option name in worksheets 'ProductOption' and 'ProductOptionValues' ";
    $fld=$frm->addCheckBox('','export_import_settings_use_option_value_id','1','export_import_settings_use_option_value_id','class="field4"');
    $fld->html_after_field=" Use option_value_id instead of option_value name in worksheet 'ProductOptionValues'  </small>";
    $fld=$frm->addCheckBox('','export_import_settings_use_attribute_group_id','1','export_import_settings_use_attribute_group_id','class="field4"');
    $fld->html_after_field=" Use attribute_group_id instead of attribute_group name in worksheet 'ProductAttributes'";
    $fld=$frm->addCheckBox('','export_import_settings_use_attribute_id','1','export_import_settings_use_attribute_id','class="field4"');
    $fld->html_after_field=" Use attribute_id instead of attribute name in worksheet 'ProductAttributes' "; 
    $fld=$frm->addCheckBox('','export_import_settings_use_filter_group_id','1','export_import_settings_use_filter_group_id','class="field4"');
    $fld->html_after_field=" Use filter_group_id instead of filter_group name in worksheets 'ProductFilters' and 'CategoryFilters' ";
    $fld=$frm->addCheckBox('','export_import_settings_use_filter_id','1','export_import_settings_use_filter_id','class="field4"');
    $fld->html_after_field=" Use filter_id instead of filter name in worksheets 'ProductFilters' and 'CategoryFilters' ";
    $fld=$frm->addCheckBox('','export_import_settings_use_ship_country_id','1','export_import_settings_use_ship_country_id','class="field4"');
    $fld->html_after_field=" Use country_id instead of country name in worksheets 'Products' and 'ProductShippingRates' ";
    $fld=$frm->addCheckBox('','export_import_settings_use_ship_company_id','1','export_import_settings_use_ship_company_id','class="field4"');
    $fld->html_after_field=" Use company_id instead of company name in worksheets 'ProductShippingRates' ";
    $fld=$frm->addCheckBox('','export_import_settings_use_ship_duration_id','1','export_import_settings_use_ship_duration_id','class="field4"');
    $fld->html_after_field=" Use duration_id instead of duration name in worksheets 'ProductShippingRates' ";
    break;
    }
    $btnLable=($type=='settings')?Utilities::getLabel('L_Update'):ucwords(Utilities::getLabel('L_'.$type)); 
    $btnLable=($type=='choose_options')?save:ucwords(Utilities::getLabel('L_'.$type));
    $frm->addSubmitButton('&nbsp;','btn_submit',$btnLable);
    $frm->setTableProperties('width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm"');
    $frm->setLeftColumnProperties('width="25%" valign="baseline"');
    //$frm->setAction(Utilities::generateUrl('configurations', 'update'));
    $frm->setExtra('class="siteForm"');
    $frm->setJsErrorDisplay('afterfield');
    return $frm;
    }
    function download()
    {
        $post=Syspage::getPostedVar();
        $export_type = $post['export_type'];        
        if($post['range_type']=='page'){
            $post['max']=($post['max']>1)?$post['max']:2;
        }
        switch ($export_type) {
            case 'c':
            case 'p':
            $min = null;
            if (isset( $post['min'] ) && ($post['min']!='')&& (intval($post['min'])>0)) {
                $min = intval($post['min']);
            }
            $max = null;
            if (isset( $post['max'] ) && ($post['max']!='')&& (intval($post['max'])>1)) {
                $max = intval($post['max']);
            }
            if (($min==null) || ($max==null)) {
                $this->Importexport->download($export_type, null, null, null, null,$this->user_id);
            } else if ($post['range_type'] == 'id') {
                $this->Importexport->download($export_type, null, null, $min, $max,$this->user_id);
            } else {                                        
                $this->Importexport->download($export_type, $min*($max-1-1), $min, null, null,$this->user_id);
            }
            break;
            case 'o': 
            $this->Importexport->download('o', null, null, null, null);
            break;
            case 'a':
            $this->Importexport->download('a', null, null, null, null);
            break;
            case 'f': 
            if ($this->Importexport->existFilter()) {
                $this->Importexport->download('f', null, null, null, null);
                break;
            }
            break;
            case 'sd':
            $this->Importexport->download('sd', null, null, null, null);
            break;
            case 'sc':
            $this->Importexport->download('sc', null, null, null, null);
            break;
            case 'sq':
            $this->Importexport->download('sq', null, null, null, null,$this->user_id);
            break;  
            case 's':
            $this->Importexport->download('s', null, null, null, null);
            break;
            case 'b':
            $this->Importexport->download('b', null, null, null, null);
            break;
            case 'cn':
            $this->Importexport->download('cn', null, null, null, null);
            break;          
            default:
            break;
        }
    }
    function update_product_image()
    {
        $Importexport=new Importexport();
        $row=$Importexport->getProductTempImages(150);      
        foreach($row as $val){          
            $image_name=$Importexport->getImageName($val['image_file']);            
            if($image_name!=''){
                $imgArr = array();
                $imgArr['image_prod_id'] = $val['image_prod_id'];
                $imgArr['image_default'] = $val['image_default'];
                $imgArr['image_temp'] = $val['image_temp'];
                $imgArr['image_file'] = $image_name;
                if($val['old_image_id']>0){
                    $imgArr['image_id'] =$val['old_image_id'];
                }
                $Importexport->updateProductImages($imgArr);                
                $imgTemp=array('image_id'=>$val['image_id'],'image_downloaded'=>1,'image_scrapped'=>date('Y-m-d H:i:s'));
            }else{
                $imgTemp=array('image_id'=>$val['image_id'],'image_scrapped'=>date('Y-m-d H:i:s'));
            }                       
            $Importexport->updateProductTempImages($imgTemp);           
        }
        echo "Done";
    }
    function import_xml()
    {
      
       $xml = ''; 
       $product_collection = array();

        $post = Syspage::getPostedVar();
        if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])){
           
            if ($this->Importexport->isUploadedFileValidFileXML($_FILES['upload'])){        
            if(!Utilities::saveFile($_FILES['upload']['tmp_name'],$_FILES['upload']['name'], $attachment, 'importexport/')){
                Message::addError($attachment);
            }
            $post["attachment"]=$attachment;
            $incremental = true;
            $xml=$this->Importexport->upload_data($_FILES['upload']['tmp_name'],$incremental,$attachment,$this->user_id);
            $path=CONF_INSTALLATION_PATH . 'user-uploads/importexport/';
            $fullpath = $path.$attachment;
            
            $_SESSION['product_file_path_name'] = $fullpath;
            $_SESSION['incremental'] = $_POST['incremental'];

            $product_collection = $this->product_collection($xml);
            if(!$product_collection){
                Message::addErrorMessage(Utilities::getLabel('L_Invalid_File_Upload'));
            }
            if ($this->Importexport->upload_data($_FILES['upload']['tmp_name'],$incremental,$attachment,$this->user_id)===true) {
                Message::addMessage(Utilities::getLabel('M_YOUR_ACTION_PERFORMED_SUCCESSFULLY'));
                Utilities::redirectUser(Utilities::generateUrl('import_export', 'default_action',array($type)));
            }
        }else{
            Message::addErrorMessage(Utilities::getLabel('L_Invalid_File_Upload'));
        }
            
            
        }
        $this->set('tabSelected','import_xml');
        
        
        if($xml==''){
            $this->set('_action', 'first-section');    
        }
        if($xml !='' && $mode='import_xml'){
           // $frm = $this->option_from();
            $categories_query = $this->db->query("select * from tbl_categories  where category_parent = '0' and  category_type = '1' and category_status=1 and category_is_deleted=0 order by category_display_order,category_name");
            
            while($categories=$this->db->fetch($categories_query)){
               $category_tree_array[] = $categories;
                  // $category_tree_array = self::funcGetCategoryStructure($categories['category_parent'],$category_tree_array);
            }

            $total_cat = array();
            foreach ($product_collection as $key => $value) {
                $pro_array = (array)$value;
                $total_cat[] = $pro_array['category'];
            }
            $unque_cat_ids = array_unique($total_cat); 
            $this->set('unque_cat_ids',$unque_cat_ids);    
            $this->set('category_tree_array',$category_tree_array);    
            $this->set('_action', 'second-section');
        }
        
        $this->_template->render();    
    }


    function category_selection(){
        $post = Syspage::getPostedVar();
        if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])){
                $mode = $_POST['mode'];
                if($mode=='category_selection'){
                    $unque_cat_ids = $_POST['unque_cat_ids'];
                    $prod_category = $_POST['prod_category'];
                    $combine = array_combine($unque_cat_ids,$prod_category);
                    $this->set('selected_category',json_encode($combine));
                    $user_id = $this->getLoggedUserId();
                    $user_shop_id = 0;
                    if (!empty($this->user_details['shop_id']))
                        $user_shop_id = $this->user_details['shop_id'];

                    $criteria = array("shippingclass_shop" => $user_shop_id, 'shippingclass_added_by' => $user_id);
                    $psObj = new Shippingclass(true, true);

                    $psObj->selectFields(array('tp.*', 'ts.shop_id', 'ts.shop_user_id'));
                    $this->set('arr_listing', $psObj->getShippingclass($criteria));

                }

                if($mode=="add_shipping_class"){
                     $xml_final = simplexml_load_file($_SESSION['product_file_path_name']);
                    $product_collection = $this->product_collection($xml_final);    
                   
                    $combine_category = (array)json_decode($_POST['selected_category']);
                    
                    $category_filter = array();
                    foreach($combine_category as $cc_k=>$cc_value){
                        foreach ($cc_value as $key => $value) {
                            if($value!=''){
                                $category_filter[$cc_k] = $value;
                            }
                        }
                    }
                   $final_product_collection = array();
                   $shipping_class_name = $_POST['shipping_class'];

                   if($_SESSION['incremental']){
                        foreach ($product_collection as $key => $value) {

                        $select_query="select * from tbl_products where
                            prod_added_by = '".$this->getLoggedUserId()."' AND prod_sku ='".$value['productsku']."' AND prod_shop='".$this->user_details['shop_id']."'";
                        $ordred_products=$this->db->query($select_query);
                        $ordred_product=$this->db->fetch_all($ordred_products);
                        $product_id = $ordred_product['0']['prod_id'];

                        /* if sku not available then updated*/
                        if($product_id){
                            $prod_retail_price = $value['price']?$value['price']:0;
                            $prod_stock = $value['quantity']?$value['quantity']:0;
                           $query1 = "UPDATE `tbl_products` SET
                            `prod_category`='".$category_filter[$value['category']]."',
                            `prod_name`='".$value['productname']."',
                            `shipping_class_id`='".$shipping_class_name."',
                            `prod_slug`='".$value['slug']."',
                            `prod_image`='".$value['featuredimage']."',
                            `prod_retail_price`='".$prod_retail_price."',
                            `prod_sale_price`='".$value['saleprice']."',
                            `prod_stock`='".$prod_stock."'
                             WHERE prod_id='".$product_id."'";
                            if($this->db->query($query1)){
                               
                            $query2 = "UPDATE `tbl_prod_details` SET 
                                prod_length = '".$value['length']."',
                                prod_width = '".$value['width']."',
                                prod_height = '".$value['height']."',
                                prod_weight = '".$value['weight']."',
                                prod_tags = '".$value['tag']."',
                                prod_long_desc = '".$value['description']."',
                                prod_meta_title='".$value['productname']."',
                                prod_tags = '".$value['tag']."'
                                WHERE prod_id ='".$product_id."'";

                            $this->db->query($query2); 

                            $where_alias = "products_id=$product_id";
                            $query3 = "UPDATE `tbl_url_alias` SET url_alias_keyword ='".$value['productname']."' WHERE url_alias_query = '".$where_alias."'";
                            //$this->db->query($query3);
                            
                            $query4 = "UPDATE `tbl_product_images` SET image_file = '".$value['featuredimage']."' WHERE image_prod_id='".$product_id."' ";

                            $this->db->query($query4);
                            }
                        }else{

                            /* if sku not available then inserted*/
                            $final_product_collection = array(
                                'prod_added_by'=> $this->getLoggedUserId(),
                                'prod_category'=>$category_filter[$value['category']],
                                'prod_sku'=>$value['productsku'],
                                'prod_type' =>'1',
                                'prod_name'=>$value['productname'],
                                'shipping_class_id'=>$shipping_class_name,
                                'prod_slug'=>$value['slug'],
                                'prod_image'=>$value['featuredimage'],
                                'prod_brand'=>0,
                                'prod_model'=>'',
                                'prod_shop'=>$this->user_details['shop_id'],
                                'prod_retail_price'=>$value['price']?$value['price']:0,
                                'prod_sale_price'=>$value['saleprice'],
                                'prod_shipping'=>0,
                                'prod_stock'=>$value['quantity']?$value['quantity']:0,
                                'prod_shipping_country'=>0,
                                'prod_min_order_qty'=>1,
                                'prod_subtract_stock'=>1,
                                'prod_requires_shipping'=>1,
                                'prod_track_inventory'=>0,
                                'prod_threshold_stock_level'=>0,
                                'prod_group'=>0,
                                'prod_markup'=>0,
                                'prod_markup_type'=>'',
                                'prod_view_count'=>0,
                                'prod_sold_count'=>0,
                                'prod_condition'=>'N',
                                'prod_condition_level'=>0,
                                'prod_added_on'=>date('Y-m-d h:i:s'),
                                'prod_published_on'=>date('Y-m-d h:i:s'),
                                'prod_status'=>1,
                                'prod_is_expired'=>0,
                                'prod_is_deleted'=>0,
                                'prod_display_order'=>1,
                                'prod_enable_cod_orders'=>0,
                            );

                            if ($this->db->insert_from_array('tbl_products', 
                                 $final_product_collection)){
                            //     /* Product details */
                                    $inserted_item_id = $this->db->insert_id();
                                    $product_details = array(
                                        'prod_id'=>$inserted_item_id,
                                        'prod_length'=>$value['length'],
                                        'prod_width' =>$value['width'],
                                        'prod_height'=>$value['height'],
                                        'prod_weight'=>$value['weight'],
                                        'prod_length_class'=>'CM',
                                        'prod_weight_class'=>'KG',
                                        'prod_tags'=>$value['tag'],
                                        'prod_youtube_video'=>'',
                                        'prod_short_desc'=>'',
                                        'prod_long_desc'=>$value['description'],
                                        'prod_meta_title'=>$value['productname'],
                                        'prod_meta_title'=>'',
                                        'prod_meta_keywords'=>'',
                                        'prod_meta_description'=>'',
                                        'prod_featuered'=>'',
                                        'prod_ship_free'=>'',
                                        'prod_tax_free'=>'',
                                        'prod_available_date'=>date('Y-m-d'),
                                    );
                                }    
                                $this->db->insert_from_array('tbl_prod_details', 
                                $product_details);
                                /* Product URL alias */
                                $url_alias = array(
                                        'url_alias_query'=>"products_id=$inserted_item_id",
                                        'url_alias_keyword'=>$value['productname'],
                                );

                                $this->db->insert_from_array('tbl_url_alias', $url_alias);
                                /*Product images*/
                                $image_info = array(
                                    'image_prod_id'=>$inserted_item_id,
                                    'image_session'=>'',
                                    'image_file'=>$value['featuredimage'],
                                    'image_default'=>'',
                                    'image_temp'=>'',
                                    'image_ordering'=>'',
                                );
                                $this->db->insert_from_array('tbl_product_images', $image_info);
                        }                        
                    }
                }else if(!$_SESSION['incremental']){
                    
                    /*$delete_query="DELETE  FROM tbl_products where
                            prod_added_by = '".$this->getLoggedUserId()."' AND prod_shop='".$this->user_details['shop_id']."'";
                    $ordred_products=$this->db->query($delete_query);*/

                    $delete_query="UPDATE  tbl_products SET prod_status = '0' where
                            prod_added_by = '".$this->getLoggedUserId()."' AND prod_shop='".$this->user_details['shop_id']."'";
                    $ordred_products=$this->db->query($delete_query);

                    
                    foreach ($product_collection as $key => $value) {
                        /* if user select the  Delete all old data before Import*/
                            $final_product_collection = array(
                                'prod_added_by'=> $this->getLoggedUserId(),
                                'prod_category'=>$category_filter[$value['category']],
                                'prod_sku'=>$value['productsku'],
                                'prod_type' =>'1',
                                'prod_status' => '1' ,
                                'prod_name'=>$value['productname'],
                                'shipping_class_id'=>$shipping_class_name,
                                'prod_slug'=>$value['slug'],
                                'prod_image'=>$value['featuredimage'],
                                'prod_brand'=>0,
                                'prod_model'=>'',
                                'prod_shop'=>$this->user_details['shop_id'],
                                'prod_retail_price'=>$value['price']?$value['price']:0,
                                'prod_sale_price'=>$value['saleprice'],
                                'prod_shipping'=>0,
                                'prod_stock'=>$value['quantity']?$value['quantity']:0,
                                'prod_shipping_country'=>0,
                                'prod_min_order_qty'=>1,
                                'prod_subtract_stock'=>1,
                                'prod_requires_shipping'=>1,
                                'prod_track_inventory'=>0,
                                'prod_threshold_stock_level'=>0,
                                'prod_group'=>0,
                                'prod_markup'=>0,
                                'prod_markup_type'=>'',
                                'prod_view_count'=>0,
                                'prod_sold_count'=>0,
                                'prod_condition'=>'N',
                                'prod_condition_level'=>0,
                                'prod_added_on'=>date('Y-m-d h:i:s'),
                                'prod_published_on'=>date('Y-m-d h:i:s'),
                                'prod_status'=>1,
                                'prod_is_expired'=>0,
                                'prod_is_deleted'=>0,
                                'prod_display_order'=>1,
                                'prod_enable_cod_orders'=>0,
                            );

                            if ($this->db->insert_from_array('tbl_products', 
                                 $final_product_collection)){
                            //     /* Product details */
                                    $inserted_item_id = $this->db->insert_id();
                                    $product_details = array(
                                        'prod_id'=>$inserted_item_id,
                                        'prod_length'=>$value['length'],
                                        'prod_width' =>$value['width'],
                                        'prod_height'=>$value['height'],
                                        'prod_weight'=>$value['weight'],
                                        'prod_length_class'=>'CM',
                                        'prod_weight_class'=>'KG',
                                        'prod_tags'=>$value['tag'],
                                        'prod_youtube_video'=>'',
                                        'prod_short_desc'=>'',
                                        'prod_long_desc'=>$value['description'],
                                        'prod_meta_title'=>$value['productname'],
                                        'prod_meta_title'=>'',
                                        'prod_meta_keywords'=>'',
                                        'prod_meta_description'=>'',
                                        'prod_featuered'=>'',
                                        'prod_ship_free'=>'',
                                        'prod_tax_free'=>'',
                                        'prod_available_date'=>date('Y-m-d'),
                                    );
                                }    
                                $this->db->insert_from_array('tbl_prod_details', 
                                $product_details);
                                /* Product URL alias */
                                $url_alias = array(
                                        'url_alias_query'=>"products_id=$inserted_item_id",
                                        'url_alias_keyword'=>$value['productname'],
                                );

                                $this->db->insert_from_array('tbl_url_alias', $url_alias);
                                /*Product images*/
                                $image_info = array(
                                    'image_prod_id'=>$inserted_item_id,
                                    'image_session'=>'',
                                    'image_file'=>$value['featuredimage'],
                                    'image_default'=>'',
                                    'image_temp'=>'',
                                    'image_ordering'=>'',
                                );
                                $this->db->insert_from_array('tbl_product_images', $image_info);
                        
                    }
                }  
                Utilities::redirectUser(Utilities::generateUrl('import_export','import_xml',array('import_xml'))); 
            }
        }
        $this->set('tabSelected','import_xml');
        $this->_template->render();  
    }
    
    function product_collection($xml){
        
        $product_collection = array();
        foreach ($xml->product as $pr => $prv) {
            if(isset($prv->description)){
                $description = html_entity_decode((string)$prv->description);
            }else{
                $description = '';
            }

            $product_collection[] = array(
                    'productid'=>(string)$prv->productid,
                    'productsku'=>html_entity_decode((string)$prv->productsku),
                    'productname'=>html_entity_decode((string)$prv->productname),
                    'posttitle'=>html_entity_decode((string)$prv->posttitle),
                    'slug'=>html_entity_decode((string)$prv->slug),
                    'permalink'=>html_entity_decode((string)$prv->permalink),
                    'producturi'=>html_entity_decode((string)$prv->producturi),
                    'description'=>$description,
                    'excerpt'=>html_entity_decode((string)$prv->excerpt),
                    'productpublished'=>html_entity_decode((string)$prv->productpublished),
                    'productmodified'=>html_entity_decode((string)$prv->productmodified),
                    'type'=>html_entity_decode((string)$prv->type),
                    'price'=>html_entity_decode((string)$prv->price),
                    'saleprice'=>html_entity_decode((string)$prv->saleprice),
                    'salepricedatesfrom'=>html_entity_decode((string)$prv->salepricedatesfrom),
                    'salepricedatesto'=>html_entity_decode((string)$prv->salepricedatesto),
                    'weight'=>html_entity_decode((string)$prv->weight),
                    'weightunit'=>html_entity_decode((string)$prv->weightunit),
                    'height'=>html_entity_decode((string)$prv->height),
                    'heightunit'=>html_entity_decode((string)$prv->heightunit),
                    'width'=>html_entity_decode((string)$prv->width),
                    'widthunit'=>html_entity_decode((string)$prv->widthunit),
                    'length'=>html_entity_decode((string)$prv->length),
                    'lengthunit'=>html_entity_decode((string)$prv->lengthunit),
                    'category'=>html_entity_decode((string)$prv->category),
                    'tag'=>html_entity_decode((string)$prv->tag),
                    'featuredimage'=>html_entity_decode((string)$prv->featuredimage),
                    'shippingclass'=>html_entity_decode((string)$prv->shippingclass),
                    'quantity'=>html_entity_decode((string)$prv->quantity),
                    'stockstatus'=>html_entity_decode((string)$prv->stockstatus),
                    'externalurl'=>html_entity_decode((string)$prv->externalurl),
                    'productstatus'=>html_entity_decode((string)$prv->productstatus),
                );
            }
            return $product_collection;
    }

    function xml_url(){
        ///Message::addMessage(Utilities::getLabel('L_Invalid_File_Upload'));
        // error_reporting(E_ALL);
        // ini_set('display_errors', 'On');
        
        $post = Syspage::getPostedVar();
        if($xml==''){
            $this->set('_action', 'first-section');    
        }

        if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($post['btn_submit'])){
                
            $_SESSION['incremental_url'] = $_POST['incremental_url'];
            
            if($_POST['daily_update']){
                $daily_update = $_POST['daily_update'];
            }else{
                $daily_update = 0;
            }
            
            if($_SESSION['incremental_url']){
               // echo "Yes updated";
            }else if(!$_SESSION['incremental_url']){
               // echo "deleted";
                /*$delete_query="DELETE  FROM tbl_products where           prod_added_by = '".$this->getLoggedUserId()."' AND prod_shop='".$this->user_details['shop_id']."'";
                $ordred_products=$this->db->query($delete_query);*/
            }            

            /*Here deleted all the url records*/

            $url_cron ="DELETE  FROM tbl_url_cron where  user_id = '".$this->getLoggedUserId()."' AND shop_id='".$this->user_details['shop_id']."'";
            $ordred_products=$this->db->query($url_cron);

            $cron_setting ="DELETE  FROM tbl_url_column_setting where  user_id = '".$this->getLoggedUserId()."' AND shop_id='".$this->user_details['shop_id']."'";
            $ordred_products=$this->db->query($cron_setting);


            $set_cron = array(
                'user_id'=>$this->getLoggedUserId(),
                'shop_id'=>$this->user_details['shop_id'],
                'url'=>$_POST['url'],
                'status'=>$daily_update,
            );

            $this->db->insert_from_array('tbl_url_cron',$set_cron);
            $url_id = $this->db->insert_id();

            $_SESSION['URL_POST'] = $_POST['url'];

            $column = $this->xml_parser($_POST['url'],'column',array());
            
            /*Adding Category */
            $criteria = array("shippingclass_shop" => $this->user_details['shop_id'], 'shippingclass_added_by' => $this->getLoggedUserId());
            $psObj = new Shippingclass(true, true);

                    $psObj->selectFields(array('tp.*', 'ts.shop_id', 'ts.shop_user_id'));
                    $this->set('arr_listing', $psObj->getShippingclass($criteria));

            $categories_query = $this->db->query("select * from tbl_categories  where category_parent = '0' and  category_type = '1' and category_status=1 and category_is_deleted=0 order by category_display_order,category_name");
            
                while($categories=$this->db->fetch($categories_query)){
                   $category_tree_array[] = $categories;
                }

            $_SESSION['avail_column'] = array_unique($column);

            $this->set('category_tree_array',$category_tree_array); 
            $this->set('column',array_unique($column));  
            $this->set('url_page',$url_id);  
            $this->set('_action', 'second-section');    
        }



        $this->set('tabSelected','xml_url');
        $this->_template->render(); 
    }


 
    function column_setting(){
        // error_reporting(E_ALL);
        // ini_set('display_errors', 1);
       if($_SERVER['REQUEST_METHOD'] == 'POST'){
            $category_id = end(array_filter($_POST['prod_category']));
            $shipping_id = $_POST['shipping_class'];

            $update_category="UPDATE  tbl_url_cron SET category_id = '".$category_id."',shipping_id='".$shipping_id."' where user_id = '".$this->getLoggedUserId()."' AND shop_id='".$this->user_details['shop_id']."'";
            $ordred_products=$this->db->query($update_category);

            set_time_limit(0);
            $data = array(
                    'user_id'   =>$this->getLoggedUserId(),
                    'shop_id'   =>$this->user_details['shop_id'],
                    'cron_id'   =>$_POST['url_page'],
                    'prod_name' =>$_POST['prod_name'],
                    'prod_sku'  =>$_POST['prod_sku'],
                    'prod_slug' =>$_POST['prod_slug'],
                    'prod_retail_price' =>$_POST['prod_retail_price'],
                    'prod_sale_price'   =>$_POST['prod_sale_price'],
                    'prod_stock'    =>$_POST['prod_stock'],
                    'prod_long_desc'    =>$_POST['prod_long_desc'],
                    'prod_image'    =>$_POST['prod_image']
                    
            );
            $rows = $this->xml_parser($_SESSION['URL_POST'],'rows',$data);
            $xml_node_count = $this->xml_node_count($_SESSION['URL_POST'],'rows',$data);
            
            if($xml_node_count){
                $count_elemenet =  $xml_node_count;
            }else{
                $count_elemenet = count($rows[$data['prod_name']]);
            }
           

           // $count_elemenet = count($rows[$data['prod_name']]);
            $array = array();
            for ($i=0; $i < $count_elemenet; $i++) { 
                
                
                $p_name = str_replace("'", "",$rows[$data['prod_name']][$i]);
                $p_name = str_replace('"', '',$p_name);
                $p_name = str_replace(',', '',$p_name);
                $p_name = str_replace('/', '-', $p_name);

                $p_name = str_replace('&', '-', $p_name);

                $slug   = str_replace("'", "",$rows[$data['prod_slug']][$i]);
                $slug   = str_replace('"', '',$slug);
                $slug   = str_replace(',', '',$slug);
                $slug   = str_replace('&', '',$slug);
               
                $desc   = str_replace("'", "",$rows[$data['prod_long_desc']][$i]);
                $desc   = str_replace('"', '',$desc);
                $desc   = str_replace(',', '',$desc);
                $desc   = str_replace('&', '',$desc);
               
                $sku    = str_replace("'", "",$rows[$data['prod_sku']][$i]);
                $sku    = str_replace('"', '',$sku);
                $sku    = str_replace(',', '',$sku);
                $sku    = str_replace('&', '',$sku);
            /*   $array[] = array(
                        'prod_name'         =>preg_replace('/[^A-Za-z0-9\-]/', '', $p_name),
                        'prod_sku'          =>preg_replace('/[^A-Za-z0-9\-]/', '', $sku),
                        'prod_slug'         =>preg_replace('/[^A-Za-z0-9\-]/', '', $slug),
                        'prod_retail_price' =>(float)$rows[$data['prod_retail_price']][$i],
                        'prod_sale_price'   =>(float)$rows[$data['prod_sale_price']][$i],
                        'prod_stock'        =>preg_replace('/[^A-Za-z0-9\-]/', '', $rows[$data['prod_stock']][$i]),
                        'prod_long_desc'    =>preg_replace('/[^A-Za-z0-9\-]/', '', $desc),
                        'prod_image'        =>preg_replace('/[^A-Za-z0-9\-]/', '', $rows[$data['prod_image']][$i]),
                );*/
                $product_stock = 0;
                switch (trim($rows[$data['prod_stock']][$i])) {
                    case 'in stock':
                        $product_stock = 4;
                        break;
                     case 'out of stock':
                        $product_stock = 0;
                        break;
                    default:
                        $product_stock = $rows[$data['prod_stock']][$i];
                        break;
                }
                

                 $array[] = array(
                        'prod_name'         =>trim($p_name),
                        'prod_sku'          =>trim($sku),
                        'prod_slug'         =>trim($slug),
                        'prod_retail_price' =>(float)$rows[$data['prod_retail_price']][$i],
                        'prod_sale_price'   =>(float)$rows[$data['prod_sale_price']][$i],
                        'prod_stock'        => $product_stock,
                        'prod_long_desc'    =>preg_replace('/[^A-Za-z0-9\-]/', ' ', $desc),
                        'prod_image'        =>$rows[$data['prod_image']][$i],
                );
            }
          
            $this->db->insert_from_array('tbl_url_column_setting',$data);
            $url_id = $this->db->insert_id();
            if($_SESSION['incremental_url']){

                $update_query="UPDATE  tbl_products SET prod_status = '0' where is_imported = '1' AND prod_added_by = '".$this->getLoggedUserId()."' AND prod_shop='".$this->user_details['shop_id']."'";
                $ordred_products=$this->db->query($update_query);
                
                foreach ($array as $key => $value) {
                  

               
                    $select_query="select * from tbl_products where
                        prod_added_by = '".$this->getLoggedUserId()."' AND  prod_name = '".trim($value['prod_name'])."' AND prod_shop='".$this->user_details['shop_id']."'";
                
                    $ordred_products=$this->db->query($select_query);
                    $ordred_product=$this->db->fetch_all($ordred_products);
                    
                    if($ordred_product['0']['prod_id']){
                        $product_id = $ordred_product['0']['prod_id'];
                    }else{
                        $product_id = 0;
                    }

                     if($product_id){/*

                      echo "test in product id";

                        $prod_retail_price = $value['prod_retail_price']?$value['prod_retail_price']:0;
                        $prod_stock = $value['prod_stock']?$value['prod_stock']:0;
                        
                        $query1 = "UPDATE `tbl_products` SET
                        
                        `prod_name`='".trim($value['prod_name'])."',
                        `prod_status` = '1',
                        `prod_slug`='".$value['prod_slug']."',
                        `prod_image`='".$value['prod_image']."',
                        `prod_retail_price`='".$value['prod_retail_price']."',
                        `prod_sale_price`='".$value['prod_sale_price']."',
                        `prod_stock`='".$prod_stock."',
                        `shipping_class_id` = '".$shipping_id."',
                        `is_imported` = '1',
                         WHERE prod_id='".$product_id."'";
                        
                       // $a = $this->db->query($query1);
                         if($this->db->query($query1)){                        
                       $query2 = "UPDATE `tbl_prod_details` SET 
                            prod_long_desc = '".$value['prod_long_desc']."',
                            prod_meta_title='".$value['prod_name']."'
                            WHERE prod_id ='".$product_id."'";
    
                        $this->db->query($query2); 
                        $where_alias = "products_id=$product_id";
                       $query3 = "UPDATE `tbl_url_alias` SET url_alias_keyword ='".$value['prod_name']."' WHERE url_alias_query = '".$where_alias."'";
                        //$this->db->query($query3);
                        
                        $query4 = "UPDATE `tbl_product_images` SET image_file = '".$value['prod_image']."' WHERE image_prod_id='".$product_id."' ";
                            $this->db->query($query4);
                        }
                    */}else{
                     //IF new products added
                        $final_product_collection = array(
                                'prod_added_by'=> $this->getLoggedUserId(),
                                'prod_category'=>$category_id,
                                'prod_sku'=>trim($value['prod_sku']),
                                'prod_type' =>'1',
                                'prod_name'=>trim($value['prod_name']),
                                'shipping_class_id'=>$shipping_id,
                                'prod_slug'=>$value['prod_slug'],
                                'prod_image'=>$value['prod_image'],
                                'prod_brand'=>0,
                                'prod_model'=>'',
                                'prod_shop'=>$this->user_details['shop_id'],
                                'prod_retail_price'=>$value['prod_retail_price']?$value['prod_retail_price']:0,
                                'prod_sale_price'=>$value['prod_sale_price']?$value['prod_sale_price']:0,
                                'prod_shipping'=>0,
                                'prod_stock'=>$value['prod_stock']?$value['prod_stock']:0,
                                'prod_shipping_country'=>0,
                                'prod_min_order_qty'=>1,
                                'prod_subtract_stock'=>1,
                                'prod_requires_shipping'=>1,
                                'prod_track_inventory'=>0,
                                'prod_threshold_stock_level'=>0,
                                'prod_group'=>0,
                                'prod_markup'=>0,
                                'prod_markup_type'=>'',
                                'prod_view_count'=>0,
                                'prod_sold_count'=>0,
                                'prod_condition'=>'N',
                                'prod_condition_level'=>0,
                                'prod_added_on'=>date('Y-m-d h:i:s'),
                                'prod_published_on'=>date('Y-m-d h:i:s'),
                                'prod_status'=>'1',
                                'prod_is_expired'=>0,
                                'prod_is_deleted'=>0,
                                'prod_display_order'=>1,
                                'prod_enable_cod_orders'=>0,
                                'is_imported' => '1',
                            );
                           if ($this->db->insert_from_array('tbl_products', 
                                 $final_product_collection)){
                                    $inserted_item_id = $this->db->insert_id();
                                    
                                    $product_details = array(
                                        'prod_id'=>$inserted_item_id,
                                        'prod_length'=>'',
                                        'prod_width' =>'',
                                        'prod_height'=>'',
                                        'prod_weight'=>'',
                                        'prod_length_class'=>'CM',
                                        'prod_weight_class'=>'KG',
                                        'prod_tags'=>$value['tag'],
                                        'prod_youtube_video'=>'',
                                        'prod_short_desc'=>$value['prod_long_desc'],
                                        'prod_long_desc'=>$value['prod_long_desc'],
                                        'prod_meta_title'=>$value['prod_name'],
                                        'prod_meta_title'=>'',
                                        'prod_meta_keywords'=>'',
                                        'prod_meta_description'=>'',
                                        'prod_featuered'=>'',
                                        'prod_ship_free'=>'',
                                        'prod_tax_free'=>'',
                                        'prod_available_date'=>date('Y-m-d'),
                                    );
                       $this->db->insert_from_array('tbl_prod_details',$product_details);
                       }
                        $url_a = "products_id=".$inserted_item_id;
                        $url_alias = array(
                                        'url_alias_query'=>$url_a,
                                        'url_alias_keyword'=>$value['prod_name'],
                                );

                        $this->db->insert_from_array('tbl_url_alias', $url_alias);
                       // $error = $this->db->getError();
                        $image_info = array(
                                    'image_prod_id'=>$inserted_item_id,
                                    'image_session'=>'',
                                    'image_file'=>$value['prod_image'],
                                    'image_default'=>'',
                                    'image_temp'=>'',
                                    'image_ordering'=>'',
                                );
                        $this->db->insert_from_array('tbl_product_images', $image_info);
                    }

                /* */}


            }else if(!$_SESSION['incremental_url']){

                $shipping_id = $_POST['shipping_class'];
                $update_query="UPDATE  tbl_products SET prod_status = '0' where is_imported = '1' AND prod_added_by = '".$this->getLoggedUserId()."' AND prod_shop='".$this->user_details['shop_id']."'";
                $ordred_products=$this->db->query($update_query);

                foreach ($array as $key => $value) {
                    $final_product_collection = array(
                        'prod_added_by'=> $this->getLoggedUserId(),
                        'prod_category'=>$category_id,
                        'prod_sku'=>trim($value['prod_sku']),
                        'prod_type' =>'1',
                        'prod_name'=>trim($value['prod_name']),
                        'shipping_class_id'=>$shipping_id,
                        'prod_slug'=>$value['prod_slug'],
                        'prod_image'=>$value['prod_image'],
                        'prod_brand'=>0,
                        'prod_model'=>'',
                        'prod_shop'=>$this->user_details['shop_id'],
                        'prod_retail_price'=>$value['prod_retail_price']?$value['prod_retail_price']:0,
                        'prod_sale_price'=>$value['prod_sale_price']?$value['prod_sale_price']:0,
                        'prod_shipping'=>0,
                        'prod_stock'=>$value['prod_stock']?$value['prod_stock']:0,
                        'prod_shipping_country'=>0,
                        'prod_min_order_qty'=>1,
                        'prod_subtract_stock'=>1,
                        'prod_requires_shipping'=>1,
                        'prod_track_inventory'=>0,
                        'prod_threshold_stock_level'=>0,
                        'prod_group'=>0,
                        'prod_markup'=>0,
                        'prod_markup_type'=>'',
                        'prod_view_count'=>0,
                        'prod_sold_count'=>0,
                        'prod_condition'=>'N',
                        'prod_condition_level'=>0,
                        'prod_added_on'=>date('Y-m-d h:i:s'),
                        'prod_published_on'=>date('Y-m-d h:i:s'),
                        'prod_status'=>'1',
                        'prod_is_expired'=>0,
                        'prod_is_deleted'=>0,
                        'prod_display_order'=>1,
                        'prod_enable_cod_orders'=>0,
                        'is_imported' => '1',
                    );
                   
                    if ($this->db->insert_from_array('tbl_products',$final_product_collection)){
                                $inserted_item_id = $this->db->insert_id();
                                $product_details = array(
                                    'prod_id'=>$inserted_item_id,
                                    'prod_length'=>'',
                                    'prod_width' =>'',
                                    'prod_height'=>'',
                                    'prod_weight'=>'',
                                    'prod_length_class'=>'CM',
                                    'prod_weight_class'=>'KG',
                                    'prod_tags'=>$value['tag'],
                                    'prod_youtube_video'=>'',
                                    'prod_short_desc'=>$value['prod_long_desc'],
                                    'prod_long_desc'=>$value['prod_long_desc'],
                                    'prod_meta_title'=>$value['prod_name'],
                                    'prod_meta_title'=>'',
                                    'prod_meta_keywords'=>'',
                                    'prod_meta_description'=>'',
                                    'prod_featuered'=>'',
                                    'prod_ship_free'=>'',
                                    'prod_tax_free'=>'',
                                    'prod_available_date'=>date('Y-m-d'),
                                );
                                
                    $this->db->insert_from_array('tbl_prod_details',$product_details);
                   }
                    
                $url_a = "products_id=".$inserted_item_id;
                $url_alias = array(
                                'url_alias_query'=>$url_a,
                               'url_alias_keyword'=>$value['prod_name'],
                );

                $this->db->insert_from_array('tbl_url_alias', $url_alias);
                                            $image_info = array(
                                        'image_prod_id'=>$inserted_item_id,
                                        'image_session'=>'',
                                        'image_file'=>$value['prod_image'],
                                        'image_default'=>'',
                                        'image_temp'=>'',
                                        'image_ordering'=>'',
                                    );
                $this->db->insert_from_array('tbl_product_images', $image_info);
                }
            }
           Utilities::redirectUser(Utilities::generateUrl('import_export', '',''));
       }else{
        Utilities::redirectUser(Utilities::generateUrl('import_export', '',''));
        }
    }

    function xml_parser($url,$type,$user_nodes=array()){
        set_time_limit(0);
        $xml = file_get_contents($url);
       // $data = simplexml_load_string($xml);

        $data = simplexml_load_file($url);

        $column = array();

        if($data->channel)
        {
            $object= new DOMDocument();
            $object->loadXML($xml);
            $result=array();
            $get_all_node[] = array();
            $k = 0;
            foreach($object->getElementsByTagName("item") as $item){ 
                foreach($item->childNodes as $node){ 
                   if($node instanceof DOMElement)        
                    {    
                        $get_all_node[$k][] = $node->tagName;
                    }  
                }
            $k++;
            }
            /*echo "<pre>===";
            print_r($object->getElementsByTagName("item"));
            echo "</pre>";
            die('proccess in xml parser');*/
             static $m = 0;
             $arr_push = array();
             foreach($object->getElementsByTagName("item") as $item){ 
                $length = $item->childNodes->length;
                $total_avail_column = $_SESSION['avail_column'];
                $total_avail_column_1 = $_SESSION['avail_column'];
                /*echo"<pre>";
                echo $length;
                echo"</pre>";*/
                $i = 0;
                foreach($item->childNodes as $node){ 
               /* echo "<pre>";
                print_r($node);
                echo"</pre>";*/
                   if($node instanceof DOMElement)        
                    {  
            
                    if(!in_array($m,$arr_push)){
                        $b =  array_diff($user_nodes, $get_all_node[$m]);
                        if($b){
                            foreach ($b as $y => $e) {
                             //   $row[$e][]=''; 
                            }
                        }
                    }
                    /*echo "<pre>================<br>";
                    print_r($_SESSION['avail_column']);
                    echo "</pre>===============<br>";*/
                    /*echo "<pre>";
                        print_r($node->tagName);
                    echo"</pre>";*/
                    if (($key = array_search($node->tagName, $total_avail_column)) !== false) {
                        unset($total_avail_column[$key]);
                    }
                   /* echo "<pre> total_avail_column";
                    print_r($total_avail_column);
                    echo"</pre>Vishnu";*/
                    $column[] = $node->tagName;
                    $row[$node->tagName][]=$node->textContent;
                    /*echo "<br> End Game:-";
                    $abc = key($row);
                    echo  print_r($row[$abc]);
                    echo "</br>";*/
                    if(count($total_avail_column)=='1'){
                        $keys = array_keys($total_avail_column);

                       // $row[$total_avail_column[$keys[0]]][] = '';
                    }
                    array_push($arr_push,$m);
                    

                    } 
               $i++;
                }
            $m++;
            if(count($total_avail_column)){
               /* echo "Missing column  <br><pre>";
                print_r($total_avail_column);
                echo '</pre><br>';*/

               /* echo "Total column  <br><pre>";
                print_r($total_avail_column_1);
                echo '</pre><br>';*/

               // $keys = array_keys($total_avail_column);

                
                       
                foreach ($total_avail_column as $key => $value) {

                    if (($key = array_search($value, $total_avail_column_1)) !== false) {
                        unset($total_avail_column_1[$key]);

                    }
                    $end_array = end($total_avail_column_1);
                    $end_game = $row[$end_array];
                    foreach ($end_game as $key_2 => $value_2) {
                        $last_key = $key_2;
                    }
                    /*echo '<br>'.$total_avail_column.' '.$last_key.'<br>';
                    echo "<br>Before one step<pre>";
                    print_r($row); 
                    echo "</pre>";*/
                    $row[$value][$last_key] = '';   
                }


                // $row[$total_avail_column[$keys[0]]][] = '';
            }

              /* echo "<br>One by one<pre>";
               print_r($row);
               echo "</pre>"; */
            }
        }
        else
        {
            foreach ($data as $key){    
                foreach($key as $key1){
                    foreach($key1 as $item => $value){
                        $column[] = $item;
                        $row[$item][] = htmlspecialchars($value);
                    }
                }
            }
        }
        //die('End here');
        /*echo "<pre>";
        print_r($row);
        echo "</pre>";*/
       // die;
        if($type=='column'){
            return $column;
        }else if($type=='rows'){
            return $row;
        }else{
            die('Xml not valid for parsing.');
        }
    }

    function xml_node_count($url,$type,$user_nodes=array()){
        set_time_limit(0);
        $xml = file_get_contents($url);
       // $data = simplexml_load_string($xml);

        $data = simplexml_load_file($url);

        $column = array();

        if($data->channel)
        {
            $object= new DOMDocument();
            $object->loadXML($xml);
            $result=array();
            $get_all_node[] = array();
            $k = 0;
            foreach($object->getElementsByTagName("item") as $item){ 
                foreach($item->childNodes as $node){ 
                   if($node instanceof DOMElement)        
                    {    
                        $get_all_node[$k][] = $node->tagName;
                    }  
                }
            $k++;
            }
            /*echo "<pre>===";
            print_r($get_all_node);
            echo "</pre>";
            die;*/
            return  count($get_all_node);
        }
        else
        {
            foreach ($data as $key){    
                foreach($key as $key1){
                    foreach($key1 as $item => $value){
                        $column[] = $item;
                        $row[$item][] = htmlspecialchars($value);
                    }
                }
            }
        }
    }

    /*function xml_parser($url,$type,$user_nodes=array()){
      //  ignore_user_abort(true);
        set_time_limit(0);
        
        $xml = file_get_contents($url);
        $data = simplexml_load_string($xml);
        $column = array();

        if($data->channel)
        {
            $object= new DOMDocument();
            $object->loadXML($xml);
            $tagValues=array("g:id","title","link");
            $result=array();
            foreach($object->getElementsByTagName("item") as $item){ 
                foreach($item->childNodes as $node){ 
                   if($node instanceof DOMElement)        
                    {     
                        $column[] = $node->tagName;
                        $row[$node->tagName][]=htmlspecialchars($node->textContent);           
                    }  
                }
            }
        }
        else
        {
            foreach ($data as $key){    
                foreach($key as $key1){
                    foreach($key1 as $item => $value){
                        $column[] = $item;
                        $row[$item][] = htmlspecialchars($value);
                    }
                }
            }
        }

        if($type=='column'){
            return $column;
        }else if($type=='rows'){
            return $row;
        }else{
            die('Xml not valid for parsing.');
        }
    }*/


}
