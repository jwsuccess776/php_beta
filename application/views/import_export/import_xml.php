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
            	            <form method="post" action="/import_export/import_xml" name="frmSettings" id="frmSettings" enctype="multipart/form-data" class="siteForm">
                                   <table width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm">
                                      <tbody>
                                         <tr>
                                            <td width="25%" valign="baseline" colspan="2"><span class="panelTitleHeading"><?php   
                                            echo Utilities::getLabel('Custom_Import_xml_text');
                                            ?></span><small><?php echo Utilities::getLabel('Custom_Spreadsheet_Can_Have_Only_Products').'<br />';//Utilities::getLabel('L_Do_Export_First_For_Format'); ?></small></td>
                                         </tr>
                                         <tr>
                                            <td width="25%" valign="baseline"></td>
                                              <td>
                                              <table class="field4">
                                               <tbody>
                                                  <tr>
                                                     <td><input type="radio" id="add" name="incremental" value="1" title="">
                                                      <label for="add"> <?php echo Utilities::getLabel('L_Yes')." (".Utilities::getLabel('Custom_Update_And_Or_Add_Data').")"; ?> </label></td>
                                                  </tr>
                                                  <tr>
                                                     <td><input type="radio" id="update" name="incremental" value="0" title="" checked=""><label for="update"> <?php echo Utilities::getLabel('L_No')." (".Utilities::getLabel('Custom_Delete_All_Old_Data').")"; ?></label></td>
                                                  </tr>
                                               </tbody>
                                            </table> 
                                           </td>
                                          </tr>
                                         <tr>
                                            <td width="25%" valign="baseline"></td>
                                            <td><?php echo Utilities::getLabel('Custom_File_To_Be_Uploaded'); ?></td>
                                         </tr>
                                         <tr>
                                            <td width="25%" valign="baseline"></td>
                                            <td><input type="file" name="upload" id="upload" title=""></td>
                                         </tr>
                                         <tr>
                                            <td width="25%" valign="baseline">&nbsp;</td>
                                            <td><input type="submit" name="btn_submit" id="btn_submit" title="&nbsp;" value="Import Xml"></td>
                                         </tr>
                                      </tbody>
                                   </table>
                                   <input type="hidden" name="mode" value="import_xml" title="">
                                </form>
            	        <?php } ?>
            	        
            	         
            	        
            	        <?php if($_action=='second-section'){ ?>
            	             <form method="post" action="/import_export/category_selection" name="frmSettings" id="frmSettings" class="siteForm">
                              <table width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm">
                                 <tbody>
                                    <tr>
                                       <td width="50%" valign="baseline"><span class="panelTitleHeading">Categories Imported</span></td>
                                       <td><span class="panelTitleHeading">Shipping class</span></td>
                                    </tr>
                                    <?php foreach ($unque_cat_ids as $key => $value) {?>
                                    <tr>
                                       <td width="50%" valign="baseline">
                                       <input readonly type="text" name="unque_cat_ids[<?php echo $key;?>]" value="<?php echo $value;?>">
                                      </td>
                                       <td>
                                          <select name="prod_category[<?php echo $key;?>][]" class="product_category<?php echo $key;?> small primary<?php echo $key;?>" required="" title="Product Category" id="">
                                             <option value="">Select</option>
                                              <?php foreach($category_tree_array as $k=>$v) {?>
                                             <option value="<?php echo $v['category_id'] ?>"><?php echo $v['category_name'] ?></option>
                                           <?php } ?>
                                          </select>
                                          <span id="show_sub_categories<?php echo $key?>"></span>
                                       </td>
                                    </tr>
                                  <?php } ?>
                                    <tr>
                                       <td width="25%" valign="baseline">&nbsp;</td>
                                       <td><input type="submit" name="btn_submit" id="btn_submit" title="&nbsp;" value="Next"></td>
                                    </tr>
                                 </tbody>
                              </table>
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
  <?php foreach ($unque_cat_ids as $key => $value) {?>
  $('.product_category<?php echo $key;?>').livequery('change', function() {
      me = $(this);
      $(this).nextAll('.product_category<?php echo $key;?>').remove();
      if (me.hasClass("primary<?php echo $key;?>")){
        $('#show_sub_categories<?php echo $key;?>').html('');
      }
      
      var cat_id = $(this).val();
      var href=generateUrl('common', 'child_categories',[cat_id],webroot);
          callAjax(href,'', function(t){
        var ans = parseJsonData(t);
        if(ans === false || ans==""){
          return false
        }
        var response = '<select class="product_category<?php echo $key;?>" name="prod_category[<?php echo $key;?>][]">'
        response=response+'<option value="">Select</option>';
        $.each(ans, function(key, value) {
          response=response+'<option value="'+key+'">'+value+'</option>';
            });
        response = response+'</select>';
        $('#show_sub_categories<?php echo $key;?>').append(unescape(response));
        
      })
    });

<?php } ?>
  </script>