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
					<li <? if ($tabSelected=="import_xml") {?> class="active" <? }?>><a href="<?php echo Utilities::generateUrl('import_export','import_xml',array('import_xml')); ?>"><?php echo Utilities::getLabel('L_Import')?> - XML</a></li>
					</ul>
				<div class="space-lft-right">
					<div class="wrapform">
            <?php 
            // echo "<pre>";
            // print_r($arr_listing);
            // echo "</pre>"; 
            ?>
        	        <form method="post" action="/import_export/category_selection" name="frmSettings" id="frmSettings" enctype="multipart/form-data" class="siteForm">
                     <table width="100%" border="0" cellspacing="0" cellpadding="0" class="siteForm">
                        <tbody>
                           <tr>
                              <td width="25%" valign="baseline" colspan="2"><span class="panelTitleHeading">Select Shipping Class to assing to all products</span></td>
                           </tr>
                           <tr>
                              <td width="25%" valign="baseline"></td>
                              <td>Shipping class</td>
                           </tr>
                           <tr>
                              <td width="25%" valign="baseline"></td>
                              <td>
                                  <select name="shipping_class" class="small primary" required="" title="Product Shipping Class" id="">     <option value="">Select</option>
                                        <?php foreach($arr_listing as $k=>$v) {?>
                                       <option value="<?php echo $v['id'] ?>"><?php echo $v['class_name'] ?></option>
                                     <?php } ?>
                                  </select>


                                <!-- <input type="text" name="shipping_class" id="shipping_class" title=""> -->


                              </td>
                              <td><input type="hidden" name="selected_category" id="selected_category" value="<?php echo $selected_category; ?>" title=""></td>
                           </tr>
                           <tr>
                              <td width="25%" valign="baseline">&nbsp;</td>
                              <td><input type="submit" name="btn_submit" id="btn_submit" title="&nbsp;" value="Save"></td>
                           </tr>
                        </tbody>
                     </table>
                  <input type="hidden" name="mode" value="add_shipping_class" title="">
                  </form>
        	        
              </div>
				  </div>
            </div>
        </div>
      </div>
    </div>
  </div>