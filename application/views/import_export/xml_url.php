<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
     <div class="body clearfix">
          <?php include CONF_THEME_PATH . 'account/_partial/account_subheader.php'; ?>
          <div class="fixed-container">
            <div class="dashboard">
              <?php include CONF_THEME_PATH .'account/_partial/account_leftpanel.php'; ?>
               <div class="data-side">
                    <?php include CONF_THEME_PATH .'account/_partial/account_tabs.php'; ?>
                  <div class="tabz-content">
                <h3><?php echo Utilities::getLabel('M_Bulk_Import_Export')?></h3>
          <ul class="arrowTabs">
           <li <? if ($tabSelected=="export") {?> class="active" <? }?>><a href="<?php echo Utilities::generateUrl('import_export','default_action',array('export')); ?>"><?php echo Utilities::getLabel('L_Export')?></a></li>
           <li <? if ($tabSelected=="import") {?> class="active" <? }?>><a href="<?php echo Utilities::generateUrl('import_export','default_action',array('import')); ?>"><?php echo Utilities::getLabel('L_Import')?></a></li>
           <li <? if ($tabSelected=="settings") {?> class="active" <? }?>><a href="<?php echo Utilities::generateUrl('import_export','default_action',array('settings')); ?>"><?php echo Utilities::getLabel('L_Settings')?></a></li>
          <!-- <li <? if ($tabSelected=="import_xml") {?> class="active" <? }?>><a href="<?php echo Utilities::generateUrl('import_export','import_xml',array('import_xml')); ?>"><?php echo Utilities::getLabel('Custom_Import_xml')?> </a></li> -->

          <li <? if ($tabSelected=="xml_url") {?> class="active" <? }?>><a href="<?php echo Utilities::generateUrl('import_export','xml_url',array('xml_url')); ?>"><?php echo Utilities::getLabel('L_Import')?>-URL</a></li>
             
          </ul>
        <div class="space-lft-right">
          <div class="wrapform">
                      <?php //echo $frm->getFormHtml(); ?>    
                      
                      <?php if($_action=='first-section'){ ?>
                          <form method="post" action="/import_export/xml_url" name="frmSettings" id="frmSettings" enctype="multipart/form-data" class="siteForm">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm">
                                      <tbody>
                                         <tr>
                                           <td width="25%" valign="baseline" colspan="2"><span class="panelTitleHeading">Import url</span><small>Enter your URL. you want to import products:</small></td>
                                         </tr>
                                         <tr>
                                            <td width="25%" valign="baseline"></td>
                                              <td>
                                              <table class="field4">
                                               <tbody>
                                                  <tr>
                                                     <td><input type="radio" id="add" name="incremental_url" value="1" title="">
                                                      <label for="add"> <?php echo Utilities::getLabel('L_Yes')." (Update and/or add data)"; ?> </label></td>
                                                  </tr>
                                                  <tr>
                                                     <td><input type="radio" id="update" name="incremental_url" value="0" title="" checked=""><label for="update"> <?php echo Utilities::getLabel('L_No')." (Delete all  Old data)"; ?></label></td>
                                                  </tr>

                                                  <tr>
                                                    <td>

                                                      <input type="checkbox" name="daily_update" id="daily_update" value="1" title="Free Shipping" style="">
                                                       <label for="daily_update">Url Update 12pm daily </label>
                                                    </td>
                                                  </tr>
                                               </tbody>
                                            </table> 
                                           </td>
                                          </tr>
                                         <tr>
                                            <td width="25%" valign="baseline">Enter Your URL</td>
                                            <td>
                                              <input type="text" name="url" id="url" value="" class="showHide" title="Set Url" required="required" >
                                              <!-- autocomplete="off" -->
                                            </td>
                                           </tr>
                                         <tr>
                                            <td width="25%" valign="baseline">&nbsp;</td>
                                            <td><input type="submit" name="btn_submit" id="btn_submit" title="&nbsp;" value="Next"></td>
                                         </tr>
                                      </tbody>
                                   </table>
                                   <input type="hidden" name="mode" value="set_url" title="">
                                </form>
                      <?php } ?>

                      <?php if($_action=='second-section'){ ?>
                           <form method="post" action="/import_export/column_setting" name="frmSettings" id="frmSettings" class="siteForm">

                              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm">
                                   <tbody>
                                      <tr>
                                         <td width="50%" valign="baseline"><span class="panelTitleHeading">Categories Imported</span></td>
                                         <td><span class="panelTitleHeading">Shipping class</span></td>
                                      </tr>
                                      <tr>
                                         <td>
                                            <select name="prod_category[]" class="product_category small primary" required="required" title="Product Category" id="">
                                               <option value="">Select</option>
                                                <?php foreach($category_tree_array as $k=>$v) {?>
                                               <option value="<?php echo $v['category_id'] ?>"><?php echo $v['category_name'] ?></option>
                                             <?php } ?>
                                            </select>
                                            <span id="show_sub_categories"></span>
                                         </td>

                                          <td>
                                              <select name="shipping_class" class="small primary" required="required" title="Product Shipping Class" id="">     <option value="">Select</option>
                                                    <?php foreach($arr_listing as $k=>$v) {?>
                                                   <option value="<?php echo $v['id'] ?>"><?php echo $v['class_name'] ?></option>
                                                 <?php } ?>
                                              </select>
                                        </td>
                                      </tr>
                                  </tbody>
                                </table> 


                              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm">
                                 <tbody>
                                    <tr>
                                       <td width="50%" valign="baseline"><span class="panelTitleHeading">Match With SellSa</span></td>
                                       <td><span class="panelTitleHeading">Current Xml Column</span></td>
                                    </tr>
                                  <tr>
                                      <td width="50%" valign="baseline">Product Name
                                      </td>
                                      <td>
                                        <select name="prod_name" required>
                                          <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td width="50%" valign="baseline">Product Sku
                                      </td>
                                      <td>
                                        <select name="prod_sku">
                                          <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td width="50%" valign="baseline">Product Slug
                                      </td>
                                      <td>
                                        <select name="prod_slug">
                                          <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td width="50%" valign="baseline">Product Retail price
                                      </td>
                                      <td>
                                       <select name="prod_retail_price">
                                        <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td width="50%" valign="baseline">Product Sale Price
                                      </td>
                                      <td>
                                        <select name="prod_sale_price">
                                          <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>

                                  <tr>
                                      <td width="50%" valign="baseline">Product Stock(Qty in number)
                                      </td>
                                      <td>
                                        <select name="prod_stock">
                                          <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr> 
                                  <tr>
                                      <td width="50%" valign="baseline">Product Description
                                      </td>
                                      <td>
                                        <select name="prod_long_desc">
                                          <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>
                                   
                                    <tr>
                                      <td width="50%" valign="baseline">Product Image
                                      </td>
                                      <td>
                                       <select name="prod_image">
                                        <option></option>
                                          <?php foreach ($column as $key => $value) {?>
                                            <option value="<?php echo $value;?>"><?php echo $value;?></option>  
                                          <?php } ?>
                                        </select>
                                      </td>
                                  </tr>

                                    <tr>
                                       <td width="25%" valign="baseline">&nbsp;</td>
                                       <td><input type="submit" name="btn_submit" id="btn_submit" title="&nbsp;" value="Finish"></td>
                                    </tr>
                                 </tbody>
                              </table>
                              <input type="hidden" name="url_page" value="<?php echo $url_page; ?>" title="">

                              <input type="hidden" name="mode" value="category_selection" title="">
                              <!-- <input type="hidden" name="prod_category" value="" title=""> -->
                           </form>

                      <?php } ?>
          </div>
        </div>
            </div>
        </div>
      </div>
    </div>
  </div>
<script type="text/javascript">
  
 $('.product_category').livequery('change', function() {
    me = $(this);
    $(this).nextAll('.product_category').remove();
    if (me.hasClass("primary")){
      $('#show_sub_categories').html('');
    }
    
    var cat_id = $(this).val();
    var href=generateUrl('common', 'child_categories',[cat_id],webroot);
        callAjax(href,'', function(t){
      var ans = parseJsonData(t);
      if(ans === false || ans==""){
        return false
      }
      var response = '<select class="product_category" name="prod_category[]">'
      response=response+'<option value="">Select</option>';
      $.each(ans, function(key, value) {
        response=response+'<option value="'+key+'">'+value+'</option>';
          });
      response = response+'</select>';
      $('#show_sub_categories').append(unescape(response));
      
    })
  });

  </script>