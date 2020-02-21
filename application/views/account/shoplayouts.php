<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div class="body clearfix">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <h3><?php echo Utilities::getLabel('L_Shop_Layout_Templates')?></h3>
            <div class="space-lft-right">
<!--	             --><?// if (!$shop_is_deleted) {?>
<!--		        	<div class="wrapform">-->
                    <form method="post" action="shoplayouts">
                        <div class="col-md-12" style="background-color: white">
                            <div class="col-md-3" style="padding: 10px;">
                                <img style="display: block; margin: 0 auto;" src="../../../public/images/sell-co-template-1.png">
                                <input name="shop_template" <?php echo $shop_template == 1 ? 'checked' : ''; ?> value="1" style="margin: 0 auto; display: block; margin-top: 15px" type="radio">
                            </div>

                            <div class="col-md-3" style="padding: 10px;">
                                <img style="display: block; margin: 0 auto;" src="../../../public/images/sell-co-template-2.png">
                                <input name="shop_template" <?php echo $shop_template == 2 ? 'checked' : ''; ?> value="2" style="margin: 0 auto; display: block; margin-top: 15px" type="radio">
                            </div>

                            <div class="col-md-3" style="padding: 10px;">
                                <img style="display: block; margin: 0 auto;" src="../../../public/images/sell-co-template-3.png">
                                <input name="shop_template" <?php echo $shop_template == 3 ? 'checked' : ''; ?> value="3" style="margin: 0 auto; display: block; margin-top: 15px" type="radio">
                            </div>

                            <div class="col-md-3" style="padding: 10px;">
                                <img style="display: block; margin: 0 auto;" src="../../../public/images/sell-co-template-4.png">
                                <input name="shop_template" <?php echo $shop_template == 4 ? 'checked' : ''; ?> value="4" style="margin: 0 auto; display: block; margin-top: 15px" type="radio">
                            </div>

                            <div class="col-md-3" style="padding: 10px;">
                                <img style="display: block; margin: 0 auto;" src="../../../public/images/sell-co-template-5.png">
                                <input name="shop_template" <?php echo $shop_template == 5 ? 'checked' : ''; ?> value="5" style="margin: 0 auto; display: block; margin-top: 15px" type="radio">
                            </div>
                        </div>
                    </form>
<!--        			--><?php //echo $frmShopInfo->getFormHtml(); ?>
<!--            	</div>-->
<!--	            --><?// } ?>
          	</div>
        </div>
      </div>
    </div>
  </div>
 
<script type="text/javascript">
$(document).ready(function(){
    $('input[type=radio]').on('change', function() {
        $(this).closest("form").submit();
    });
});
</script>