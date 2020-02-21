<style>
    .select_disable select{
        pointer-events:none;
        background: #cccccc;
    }
</style>
<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<form action="<?php echo Utilities::generateUrl('cart','save_shipping_address')?>" method="post" enctype="multipart/form-data" id="frmSaveShipping">	
              <table width="100%" cellspacing="0" cellpadding="0" border="0" class="cart-tbl">
                <thead>
                  <tr>
                    <th width="15%"><?php echo Utilities::getLabel('M_Product')?> </th>
                    <th width="35%"><?php echo Utilities::getLabel('M_Product_Information')?> </th>
                    <th width="40%"><?php echo Utilities::getLabel('M_Shipping')?></th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                <?php
                $tmp_cart_array = array();

                foreach ($products as $key=> $product_detail) {
                    //$product_shipping_class_id[$key] = $product1['shipping_class_id'];
                   $shipping_class_id=$product_detail["shipping_class_id"]==0?$product_detail["key"]:$product_detail["shipping_class_id"];
                    $product_key=$product_detail["key"];
                    $tmp_cart_array[$shipping_class_id][] = $product_key;
                }
               // p($tmp_cart_array,0);
                $tmp_product_array=array();

                     foreach ($tmp_cart_array as $classid=>$products_arr){


                      $td_rows_span_counts=count($products_arr);
                      $td_rows_span_counter=0;
                      $show_row_span="N";

                     foreach ($products_arr as $key=>$productkey)
                     {
                         $tmp_product_array[]=  $products[$productkey];
                         $product=$products[$productkey];

                         $p_key = $product['key'];
                       ?>
                <tr id="cart-row-<?php echo md5($p_key); ?>">
                    <td>
                        <div class="pro-image">
                            <a href="<?php echo Utilities::generateUrl('products','view',array($product["product_id"]))?>">
                                <img src="<?php echo Utilities::generateUrl('image','product_image',array($product["product_id"],'THUMB'))?>" alt="<?php echo $product["name"]?>"/>
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="product-name"><span class="mobile-caption"><?php echo Utilities::getLabel('M_Product_Information')?></span><a href="<?php echo Utilities::generateUrl('products','view',array($product["product_id"]))?>"><?php echo $product["name"]?></a>
                            <?php if ($product['option']) { ?>
                                <?php foreach ($product['option'] as $option) { ?>
                                    <br />
                                    - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                                <?php } ?>
                            <?php } ?>
                            <?php if ($product['shipping_free']) { ?>
                                <br />
                                - <small><?php echo Utilities::getLabel('L_Free_Shipping')?></small>
                            <?php } ?>
                        </div>
                        <div class="price"><span class="mobile-caption"><?php echo Utilities::getLabel('M_Price')?></span><?php echo Utilities::displayMoneyFormat($product['price'],true,true); ?>
                        </div>
                    </td>
                      <?php
                         if($td_rows_span_counter < $td_rows_span_counts)
                         {
                           if($show_row_span=="N")
                           {
                               $show_row_span="Y";
                              ?>
                               <td rowspan="<?php echo $td_rows_span_counts;?>">
                                   <?php
                                   if ($product['shipping']){
                                       ////////////////////////Start MY CODE NIK ///////////////////////////////
                                       if(!empty($product['shipping_class_id']) && $product['shipping_class_id']!=0)
                                       {

                                           if (count($product["shipping_options"] && !Settings::getSetting("CONF_SHIPSTATION_API_STATUS"))) {
                                       foreach ($product["shipping_options"] as $skey => $sval):
                                         $shipping_class_list[$product['product_id']][$skey] = $sval["class_name"];
                                       endforeach;

                                        $shipping_options[$product['product_id']][0] = Utilities::getLabel('M_Select_Shipping');
                                         foreach ($product["shipping_options"] as $skey => $sval):

                                           $country_code = empty($sval["country_code"]) ? "" : " (" . $sval["country_code"] . ")";
                                           $shipping_charges = $sval["prod_ship_free"] == 0 ? $sval["pship_charges"] : 0;
                                           $shipping_options[$product['product_id']][$skey] = $sval["scompany_name"] . " - " . $sval["sduration_label"] . $country_code . " (+" . Utilities::displayMoneyFormat($shipping_charges) . ")";

                                         endforeach;

                                               //Utilities::printArray($shipping_options);

                                           $carrierCode = "";
                                           $selectedService = "";
                                           $selectedShippingType="";
                                           $displayManualOptions = "style='display:none'";
                                           if ($product['is_ship_station_selected']) {
                                               $shippingCodes = explode(" ", $product['selected_shipping_option']['sduration_label']);
                                               $carrierCode = strtolower($shippingCodes[0]);
                                               $service_code = str_replace(" ", "_", $product['selected_shipping_option']['sduration_label']);
                                               $servicesList = $cartObj->getCarrierShipmentServicesList(md5($p_key), $carrierCode);
                                               $selectedShippingType = 0;
                                               foreach ($servicesList as $key => $value) {
                                                   $splits = explode("-", $key);
                                                   $label = $splits[0];
                                                   if (strtoupper($label) == strtoupper($service_code)) {
                                                       $selectedService = $key;
                                                   }
                                               }
                                           }else if($product['is_shipping_selected']){
                                               $selectedShippingType=1;
                                               $displayManualOptions = "style='display:block'";
                                           }

                                           $select_shipping_options = createDropDownFromArray('shipping_locations[' . md5($p_key) . ']', $shipping_options[$product['product_id']], $product["shipping_id"], 'class="form-control "', '');

                                           $select_shipping_class = createDropDownFromArray('shipping_class[' . md5($p_key) . ']', $shipping_class_list[$product['product_id']], $product["shipping_id"], 'class="form-control "', '');

                                               $serviceProviders = createDropDownFromArray('shipping_services[' . md5($p_key) . ']', $servicesList, $selectedService, 'class="form-control courier_services "  ', Utilities::getLabel('M_Select_Service'));
                                           ?>
                                           <?=Utilities::getLabel('M_Select_Shipping') ?><br>

                                           <?php
                                           $newShippingOption = array(
                                               "" => Utilities::getLabel('M_Select_Shipping_Method'),
                                               //1 => Utilities::getLabel('M_Flat_Shipping_Rate'),
                                           );
                                           if (count($product["shipping_options"])){
                                               $newShippingOption[1] = Utilities::getLabel('M_Flat_Shipping_Rate');
                                           }
                                           if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) {
                                               $newShippingOption[0] = Utilities::getLabel('M_Calculated_Shipping');
                                           }

                                           //if(empty($shipping_class_list[$product['product_id']]))
                                           echo createDropDownFromArray('shipping_type[' . md5($p_key) . ']', $newShippingOption, $selectedShippingType, 'class="form-control shipping_method"', '');
                                           ?>

                                           <div class='manual_shipping select_disable' <?php echo $displayManualOptions ?>>
                                               <?= Utilities::getLabel('M_CLASS_NAME') ?>
                                               <br>
                                               <?php echo $select_shipping_class ?>
                                           </div>

                                           <div class='manual_shipping' <?php echo $displayManualOptions ?>>
                                               <!-- --><?/*= Utilities::getLabel('M_CLASS_NAME') */?>
                                               <?= Utilities::getLabel('M_Select_Shipping_Provider') ?>
                                               <br>
                                               <?php echo $select_shipping_options ?>
                                           </div>


                                           <?php if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS"))
                                                {
                                               ?>
                                               <div class='shipstation_selectbox'>
                                                   <?= Utilities::getLabel('M_Select_Shipping_Provider') ?><br>
                                                   <?php echo $courierProviders ?>
                                                   <?= Utilities::getLabel('M_Select_Shipping_Carrier') ?>
                                                   <span class="services_loader"></span><br>
                                                   <?php echo $serviceProviders ?>
                                               </div>
                                           <?php } ?>
                                       <?php }
                                       else
                                       { ?>
                                           <div class="alert alert-warning">
                                               <?= Utilities::getLabel('M_Message_Product_not_available_shipping') ?>
                                           </div>
                                           <?php
                                       }
                                   }

                                   else
                                   {
                                       if (count($product["shipping_options"] && !Settings::getSetting("CONF_SHIPSTATION_API_STATUS"))) {
                                           $shipping_options[$product['product_id']][0] = Utilities::getLabel('M_Select_Shipping');
                                           foreach ($product["shipping_options"] as $skey => $sval):
                                               $country_code = empty($sval["country_code"]) ? "" : " (" . $sval["country_code"] . ")";
                                               $shipping_charges = $sval["prod_ship_free"] == 0 ? $sval["pship_charges"] : 0;
                                               $shipping_options[$product['product_id']][$skey] = $sval["scompany_name"] . " - " . $sval["sduration_label"] . $country_code . " (+" . Utilities::displayMoneyFormat($shipping_charges) . ")";
                                           endforeach;

                                           //Utilities::printArray($shipping_options);

                                           $carrierCode = "";
                                           $selectedService = "";
                                           $selectedShippingType="";
                                           $displayManualOptions = "style='display:none'";

                                           if ($product['is_ship_station_selected']) {

                                               $shippingCodes = explode(" ", $product['selected_shipping_option']['sduration_label']);
                                               $carrierCode = strtolower($shippingCodes[0]);
                                               $service_code = str_replace(" ", "_", $product['selected_shipping_option']['sduration_label']);
                                               $servicesList = $cartObj->getCarrierShipmentServicesList(md5($p_key), $carrierCode);
                                               $selectedShippingType = 0;
                                               foreach ($servicesList as $key => $value) {
                                                   $splits = explode("-", $key);
                                                   $label = $splits[0];
                                                   if (strtoupper($label) == strtoupper($service_code)) {
                                                       $selectedService = $key;
                                                   }
                                               }
                                           }else if($product['is_shipping_selected']){
                                               $selectedShippingType=1;
                                               $displayManualOptions = "style='display:block'";
                                           }



                                           $select_shipping_options = createDropDownFromArray('shipping_locations[' . md5($p_key) . ']', $shipping_options[$product['product_id']], $product["shipping_id"], 'class="form-control "', '');

                                           $courierProviders = createDropDownFromArray('shipping_carrier[' . md5($p_key) . ']', $shipStationCarrierList, $carrierCode, 'class="form-control courier_carriers" onChange="loadShippingCarriers(this);"  data-product-key=\'' . md5($p_key) . '\'', '');
                                           $serviceProviders = createDropDownFromArray('shipping_services[' . md5($p_key) . ']', $servicesList, $selectedService, 'class="form-control courier_services "  ', Utilities::getLabel('M_Select_Service'));
                                           ?>
                                           <?= Utilities::getLabel('M_Select_Shipping') ?><br>
                                           <?php
                                           $newShippingOption = array(
                                               "" => Utilities::getLabel('M_Select_Shipping_Method'),
                                               //1 => Utilities::getLabel('M_Flat_Shipping_Rate'),
                                           );
                                           if (count($product["shipping_options"])){
                                               $newShippingOption[1] = Utilities::getLabel('M_Flat_Shipping_Rate');
                                           }
                                           if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) {
                                               $newShippingOption[0] = Utilities::getLabel('M_Calculated_Shipping');
                                           }
                                           echo createDropDownFromArray('shipping_type[' . md5($p_key) . ']', $newShippingOption, $selectedShippingType, 'class="form-control shipping_method"', '');
                                           ?>

                                           <div class='manual_shipping' <?php echo $displayManualOptions ?>>
                                               <?= Utilities::getLabel('M_Select_Shipping_Provider') ?><br>
                                               <?php echo $select_shipping_options ?>
                                           </div>

                                           <?php if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) { ?>
                                               <div class='shipstation_selectbox'>
                                                   <?= Utilities::getLabel('M_Select_Shipping_Provider') ?><br>
                                                   <?php echo $courierProviders ?>
                                                   <?= Utilities::getLabel('M_Select_Shipping_Carrier') ?>
                                                   <span class="services_loader"></span><br>
                                                   <?php echo $serviceProviders ?>
                                               </div>
                                           <?php } ?>
                                       <?php }
                                       else
                                       { ?>
                                           <div class="alert alert-warning">
                                               <?= Utilities::getLabel('M_Message_Product_not_available_shipping') ?>
                                           </div>
                                           <?php
                                       }
                                   }
                               }
                               else
                               {
                                   ?>
                                   <?php echo Utilities::getLabel('M_Delivery_details_not_applicable')?>
                                   <?php
                               }
                               ?>
                               <span id="ajax_<?= $sn ?>"></span>
                           </td>
                       <?php
                       }

                     }
                    ?>
                    <td>
                        <a href="javascript:void(0);" onclick="cart.short_remove('<?php echo md5($p_key); ?>');" class="actions">
                            <img src="<?php echo CONF_WEBROOT_URL?>images/action-icn-delete.png" width="16" height="17" alt="<?php echo Utilities::getLabel('L_Remove')?>"/>
                        </a>
                    </td>
                </tr>
                    <?php
                         $td_rows_span_counter++;
                       }
                         //p($tmp_product_array);
                     }?>



                <!--////////////////////////////////////////////////////////////////-->

                <?php
                $products=array();

                foreach ($products as $key=>$product) { $sn++;

                      ?>
                  <tr id="cart-row-<?php echo md5($product['key']); ?>">
                    <td>
                        <div class="pro-image">
                            <a href="<?php echo Utilities::generateUrl('products','view',array($product["product_id"]))?>">
                                <img src="<?php echo Utilities::generateUrl('image','product_image',array($product["product_id"],'THUMB'))?>" alt="<?php echo $product["name"]?>"/>
                            </a>
                        </div>
                    </td>
                    <td>
                        <div class="product-name"><span class="mobile-caption"><?php echo Utilities::getLabel('M_Product_Information')?></span><a href="<?php echo Utilities::generateUrl('products','view',array($product["product_id"]))?>"><?php echo $product["name"]?></a>
                      <?php if ($product['option']) { ?>
                      <?php foreach ($product['option'] as $option) { ?>
                      <br />
                      - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small>
                      <?php } ?>
                      <?php } ?>
                        <?php if ($product['shipping_free']) { ?>
                             <br />
                                 - <small><?php echo Utilities::getLabel('L_Free_Shipping')?></small>
                          <?php } ?>
                       </div>
                       <div class="price"><span class="mobile-caption"><?php echo Utilities::getLabel('M_Price')?></span><?php echo Utilities::displayMoneyFormat($product['price'],true,true); ?>
                        </div>
                    </td>
                     
                    <td>
                        <?php
						   if ($product['shipping']){
                            ////////////////////////Start MY CODE NIK ///////////////////////////////
						   if(!empty($product['shipping_class_id']) && $product['shipping_class_id']!=0)
                           {
                               if (count($product["shipping_options"] && !Settings::getSetting("CONF_SHIPSTATION_API_STATUS"))) {


                                    foreach ($product["shipping_options"] as $skey => $sval):
                                        $shipping_class_list[$product['product_id']][$skey] = $sval["class_name"];
                                   endforeach;


                                   $shipping_options[$product['product_id']][0] = Utilities::getLabel('M_Select_Shipping');

                                   foreach ($product["shipping_options"] as $skey => $sval):

                                       $country_code = empty($sval["country_code"]) ? "" : " (" . $sval["country_code"] . ")";
                                       $shipping_charges = $sval["prod_ship_free"] == 0 ? $sval["pship_charges"] : 0;
                                       $shipping_options[$product['product_id']][$skey] = $sval["scompany_name"] . " - " . $sval["sduration_label"] . $country_code . " (+" . Utilities::displayMoneyFormat($shipping_charges) . ")";

                                   endforeach;

                                   //Utilities::printArray($shipping_options);

                                   $carrierCode = "";
                                   $selectedService = "";
                                   $selectedShippingType="";
                                   $displayManualOptions = "style='display:none'";
                                   if ($product['is_ship_station_selected']) {
                                       $shippingCodes = explode(" ", $product['selected_shipping_option']['sduration_label']);
                                       $carrierCode = strtolower($shippingCodes[0]);
                                       $service_code = str_replace(" ", "_", $product['selected_shipping_option']['sduration_label']);
                                       $servicesList = $cartObj->getCarrierShipmentServicesList(md5($product['key']), $carrierCode);
                                       $selectedShippingType = 0;
                                       foreach ($servicesList as $key => $value) {
                                           $splits = explode("-", $key);
                                           $label = $splits[0];
                                           if (strtoupper($label) == strtoupper($service_code)) {
                                               $selectedService = $key;
                                           }
                                       }
                                   }else if($product['is_shipping_selected']){
                                       $selectedShippingType=1;
                                       $displayManualOptions = "style='display:block'";
                                   }

                                   $select_shipping_options = createDropDownFromArray('shipping_locations[' . md5($product['key']) . ']', $shipping_options[$product['product_id']], $product["shipping_id"], 'class="form-control "', '');

                                   $select_shipping_class = createDropDownFromArray('shipping_class[' . md5($product['key']) . ']', $shipping_class_list[$product['product_id']], $product["shipping_id"], 'class="form-control "', '');
                                   ?>
                                   <?=Utilities::getLabel('M_Select_Shipping') ?><br>

                                   <?php
                                   $newShippingOption = array(
                                       "" => Utilities::getLabel('M_Select_Shipping_Method'),
                                       //1 => Utilities::getLabel('M_Flat_Shipping_Rate'),
                                   );
                                   if (count($product["shipping_options"])){
                                       $newShippingOption[1] = Utilities::getLabel('M_Flat_Shipping_Rate');
                                   }
                                   if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) {
                                       $newShippingOption[0] = Utilities::getLabel('M_Calculated_Shipping');
                                   }

                                   //if(empty($shipping_class_list[$product['product_id']]))
                                   echo createDropDownFromArray('shipping_type[' . md5($product['key']) . ']', $newShippingOption, $selectedShippingType, 'class="form-control shipping_method"', '');
                                   ?>

                                   <div class='manual_shipping select_disable' <?php echo $displayManualOptions ?>>
                                       <?= Utilities::getLabel('M_CLASS_NAME') ?>
                                       <br>
                                       <?php echo $select_shipping_class ?>
                                   </div>

                                       <div class='manual_shipping' <?php echo $displayManualOptions ?>>
                                          <!-- --><?/*= Utilities::getLabel('M_CLASS_NAME') */?>
                                           <?= Utilities::getLabel('M_Select_Shipping_Provider') ?>
                                           <br>
                                           <?php echo $select_shipping_options ?>
                                       </div>


                                   <?php if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) {
                                       ?>
                                       <div class='shipstation_selectbox'>
                                           <?= Utilities::getLabel('M_Select_Shipping_Provider') ?><br>
                                           <?php echo $courierProviders ?>
                                           <?= Utilities::getLabel('M_Select_Shipping_Carrier') ?>
                                           <span class="services_loader"></span><br>
                                           <?php echo $serviceProviders ?>
                                       </div>
                                   <?php } ?>
                               <?php }
                               else
                               { ?>
                                   <div class="alert alert-warning">
                                       <?= Utilities::getLabel('M_Message_Product_not_available_shipping') ?>
                                   </div>
                                   <?php
                               }
                           }
                           else
                           {

                               if (count($product["shipping_options"] && !Settings::getSetting("CONF_SHIPSTATION_API_STATUS"))) {
                                   $shipping_options[$product['product_id']][0] = Utilities::getLabel('M_Select_Shipping');
                                   foreach ($product["shipping_options"] as $skey => $sval):
                                       $country_code = empty($sval["country_code"]) ? "" : " (" . $sval["country_code"] . ")";
                                       $shipping_charges = $sval["prod_ship_free"] == 0 ? $sval["pship_charges"] : 0;
                                       $shipping_options[$product['product_id']][$skey] = $sval["scompany_name"] . " - " . $sval["sduration_label"] . $country_code . " (+" . Utilities::displayMoneyFormat($shipping_charges) . ")";
                                   endforeach;

                                   //Utilities::printArray($shipping_options);

                                   $carrierCode = "";
                                   $selectedService = "";
                                   $selectedShippingType="";
                                   $displayManualOptions = "style='display:none'";
                                   if ($product['is_ship_station_selected']) {
                                       $shippingCodes = explode(" ", $product['selected_shipping_option']['sduration_label']);
                                       $carrierCode = strtolower($shippingCodes[0]);
                                       $service_code = str_replace(" ", "_", $product['selected_shipping_option']['sduration_label']);
                                       $servicesList = $cartObj->getCarrierShipmentServicesList(md5($product['key']), $carrierCode);
                                       $selectedShippingType = 0;
                                       foreach ($servicesList as $key => $value) {
                                           $splits = explode("-", $key);
                                           $label = $splits[0];
                                           if (strtoupper($label) == strtoupper($service_code)) {
                                               $selectedService = $key;
                                           }
                                       }
                                   }else if($product['is_shipping_selected']){
                                       $selectedShippingType=1;
                                       $displayManualOptions = "style='display:block'";
                                   }
                                   $select_shipping_options = createDropDownFromArray('shipping_locations[' . md5($product['key']) . ']', $shipping_options[$product['product_id']], $product["shipping_id"], 'class="form-control "', '');
                                   $courierProviders = createDropDownFromArray('shipping_carrier[' . md5($product['key']) . ']', $shipStationCarrierList, $carrierCode, 'class="form-control courier_carriers" onChange="loadShippingCarriers(this);"  data-product-key=\'' . md5($product['key']) . '\'', '');
                                   $serviceProviders = createDropDownFromArray('shipping_services[' . md5($product['key']) . ']', $servicesList, $selectedService, 'class="form-control courier_services "  ', Utilities::getLabel('M_Select_Service'));
                                   ?>
                                   <?= Utilities::getLabel('M_Select_Shipping') ?><br>
                                   <?php


                                   $newShippingOption = array(
                                       "" => Utilities::getLabel('M_Select_Shipping_Method'),
                                       //1 => Utilities::getLabel('M_Flat_Shipping_Rate'),
                                   );
                                   if (count($product["shipping_options"])){
                                       $newShippingOption[1] = Utilities::getLabel('M_Flat_Shipping_Rate');
                                   }
                                   if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) {
                                       $newShippingOption[0] = Utilities::getLabel('M_Calculated_Shipping');
                                   }
                                   echo createDropDownFromArray('shipping_type[' . md5($product['key']) . ']', $newShippingOption, $selectedShippingType, 'class="form-control shipping_method"', '');
                                   ?>

                                   <div class='manual_shipping' <?php echo $displayManualOptions ?>>
                                       <?= Utilities::getLabel('M_Select_Shipping_Provider') ?><br>
                                       <?php echo $select_shipping_options ?>
                                   </div>

                                   <?php if (Settings::getSetting("CONF_SHIPSTATION_API_STATUS")) { ?>
                                       <div class='shipstation_selectbox'>
                                           <?= Utilities::getLabel('M_Select_Shipping_Provider') ?><br>
                                           <?php echo $courierProviders ?>
                                           <?= Utilities::getLabel('M_Select_Shipping_Carrier') ?>
                                           <span class="services_loader"></span><br>
                                           <?php echo $serviceProviders ?>
                                       </div>
                                   <?php } ?>
                               <?php }
                               else
                               { ?>
                                   <div class="alert alert-warning">
                                       <?= Utilities::getLabel('M_Message_Product_not_available_shipping') ?>
                                   </div>
                                   <?php
                               }
                           }
						 }
						 else
                         {
                         ?>
                            <?php echo Utilities::getLabel('M_Delivery_details_not_applicable')?>
                        <?php
                         }
                         ?>
                        <span id="ajax_<?= $sn ?>"></span>
                    </td>
                       <td>
                           <a href="javascript:void(0);" onclick="cart.short_remove('<?php echo md5($p_key); ?>');" class="actions">
                               <img src="<?php echo CONF_WEBROOT_URL?>images/action-icn-delete.png" width="16" height="17" alt="<?php echo Utilities::getLabel('L_Remove')?>"/>
                           </a>
                       </td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
              <div class="total-bottom clearfix">
            	<div class="total-side">
    	          <div class="btn-row"> <a href="javascript:void(0);" id="cartSaveShipping" class="btn primary-btn"> <?php echo Utilities::getLabel('M_Continue')?> </a></div>
               </div>
          	 </div>
             </form>
             
<script type="text/javascript">
    $('.shipstation_selectbox').hide();
    $('.shipping_method').on("change", function () {
        if ($(this).val() == "0") {
            $(this).parent().find('.shipstation_selectbox').show();
            $(this).parent().find('.manual_shipping').find('select').val(0);
            $(this).parent().find('.manual_shipping').hide();
        } else if($(this).val() == "1") {
            resetShipstationSelectBox(this);
            $(this).parent().find('.shipstation_selectbox').hide();
            $(this).parent().find('.manual_shipping').show();
        }
    });
    function resetShipstationSelectBox(obj) {
        $(obj).parent().find('.courier_carriers').val(0);
        loadShippingCarriers(obj);
        return true;
    }
</script>                 