<?php defined('SYSTEM_INIT') or die('Invalid Usage'); global $product_types; ?>
<div class="body clearfix vishnupratap">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <h3><?php echo Utilities::getLabel('L_My_Products')?></h3>
          <ul class="arrowTabs">
                <li class="active"><a href="<?php echo Utilities::generateUrl('account', 'publications')?>"><?php echo Utilities::getLabel('L_Active_items')?></a></li>
                <li><a href="<?php echo Utilities::generateUrl('account', 'paused_publications')?>"><?php echo Utilities::getLabel('L_Paused_Items')?></a></li>

              <li><a href="<?php echo Utilities::generateUrl('account', 'shippingclass_publications')?>"><?php echo Utilities::getLabel('L_Shipping_classes')?></a></li>

          </ul>

          <div class="fr right-elemnts"> <a href="<?php echo Utilities::generateUrl('account', 'product_form')?>" class="btn small blue"><?php echo Utilities::getLabel('L_Add_a_Product')?></a> </div>
          <div class="fr right-elemnts"> <a href="<?php echo Utilities::generateUrl('account', 'shipping_class')?>" class="btn small blue"><?php echo Utilities::getLabel('L_ADD_SHIPPING_CLASS')?></a> </div>
          <div class="clearfix"></div>          
          <div class="darkgray-form clearfix">
            <div class="left-txt"> 
            </div>
            <div class="search-dashboard">
              <form method="post" name="frmSrchListings" id="frmSrchListings" action="<?php echo Utilities::generateUrl('account','publications')?>">
                  <input type="text" placeholder="<?php echo Utilities::getLabel('L_Search')?>" name="keyword" value="">
                  <input type="hidden" name="page" value="1"/>
                <input type="submit" value="">
              </form>
            </div>
          </div>
          <div class="tbl-listing">          
          </div>
         
        </div>
      </div>
    </div>
</div>
