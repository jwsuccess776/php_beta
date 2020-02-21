<?php defined('SYSTEM_INIT') or die('Invalid Usage'); global $product_types; ?>
<div class="body clearfix">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <h3><?php echo Utilities::getLabel('L_My_Products')?></h3>
          <ul class="arrowTabs">
                <li><a href="<?php echo Utilities::generateUrl('account', 'publications')?>"><?php echo Utilities::getLabel('L_Active_items')?></a></li>
                <li><a href="<?php echo Utilities::generateUrl('account', 'paused_publications')?>"><?php echo Utilities::getLabel('L_Paused_Items')?></a></li>

              <li class="active"><a href="<?php echo Utilities::generateUrl('account', 'shippingclass_publications')?>"><?php echo Utilities::getLabel('L_Shipping_classes')?></a></li>
          </ul>

            <div class="fr right-elemnts"> <a href="<?php echo Utilities::generateUrl('account', 'product_form')?>" class="btn small blue"><?php echo Utilities::getLabel('L_Add_a_Product')?></a> </div>

          <div class="fr right-elemnts"> <a href="<?php echo Utilities::generateUrl('account', 'shipping_class')?>" class="btn small blue"><?php echo Utilities::getLabel('L_ADD_SHIPPING_CLASS')?></a> </div>
          
          
          <div class="clearfix"></div>
          
          <?php if (is_array($arr_listing) && count($arr_listing)>0):?>
          <div class="darkgray-form clearfix">
            <div class="left-txt"> 
			 <?php if (!empty($arr_listing)):?>
             <?php echo sprintf(Utilities::getLabel('L_Items_x_to_y_of_z_total'),$start_record,$end_record,$total_records)?> 
             <?php endif; ?></div>
            <div class="search-dashboard">
              <form method="post" name="frmSrchListings" id="frmSrchListings" action="<?php echo Utilities::generateUrl('account','shippingclass_publications')?>">
              	 <input type="text" placeholder="<?php echo Utilities::getLabel('L_Search')?>" name="keyword" value="<?php echo $keyword?>">
                 <input type="hidden" name="page" value="1"/>
             	 <input type="submit" value="">
             </form>
            </div>
          </div>
          <div class="tbl-listing">
            <table>
              <tr>
                <th width="10%"></th>
                <th width="27%"><?php echo Utilities::getLabel('L_Name')?></th>

                <th width="15%"><?php echo Utilities::getLabel('L_Actions')?></th>
              </tr>
              <?php
              $cnt=0; foreach ($arr_listing as $sn=>$row): $sn++;  ?>
              <tr>
                  <td></td>
                <td width="30%">
                    <!--<a href="<?php /*echo Utilities::generateUrl('products', 'view', array($row['id']))*/?>" target="_blank">-->
                        <span class="cellcaption"><?php echo Utilities::getLabel('L_Name')?></span>
                        <strong class="red-txt"><?php echo trim($row["class_name"]) ?></strong>
                    <!--</a>-->
                </td>

                <td>
                    <span class="cellcaption"><?php echo Utilities::getLabel('L_Action')?></span>
				    <a href="<?php echo Utilities::generateUrl('account', 'shipping_class', array($row['id']))?>" title="<?php echo Utilities::getLabel('L_Edit')?>" class="actions" >
                        <img src="<?php echo CONF_WEBROOT_URL?>images/retina/tag.svg" alt="">
                    </a>

                
                <a onclick="return(confirm('<?php echo Utilities::getLabel('L_Are_you_sure_delete_class')?>'));" href="<?php echo Utilities::generateUrl('account', 'remove_shipping_class', array($row['id']))?>" title="<?php echo Utilities::getLabel('L_Remove')?>" class="actions" >
                    <img src="<?php echo CONF_WEBROOT_URL?>images/retina/delete.svg" alt="">
                </a>
                
               </td>
              </tr> 
              <?php endforeach;?>
            </table>
            <?php if ($pages>1):?>
            <div class="pager">
              <ul>
              <?php echo getPageString('<li><a href="javascript:void(0)" onclick="listPages(xxpagexx);">xxpagexx</a></li>', $pages, $page,'<li class="active"><a  href="javascript:void(0)">xxpagexx</a></li>', '<li>...</li>');?>
              </ul>
            </div>
            <?php endif;?>
          </div>
		  <?php else:?>    
	        	<div class="space-lft-right">
                	<div class="alert alert-info">
    	    			<?php echo Utilities::getLabel('L_You_do_not_have_listings')?>
		        	</div>
                </div>
          <?php endif;?>
        </div>
        
      </div>
    </div>
  </div>
