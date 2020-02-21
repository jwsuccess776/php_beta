<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<?php 

/*echo "<pre>";
print_r();*/
///=======
/*if(isset($_SESSION['order_criteo'])){
	$order_criteo = $_SESSION['order_criteo'];
}else{
	$order_criteo = '';
}

if(isset($_SESSION['criteo_session'])){
	$json_criteo = $_SESSION['criteo_session'];
}else{
	$json_criteo = '';
}*/


if(isset($_SESSION['gtag_session'])){
  $json_gtag = $_SESSION['gtag_session'];
}else{
  $json_gtag = '';
}


if(isset($_SESSION['gtag_session_price'])){
  $json_gtag_price = $_SESSION['gtag_session_price'];
}else{
  $json_gtag_price = '100';
}



if(isset($_SESSION['logged_user']['email'])){
  $email = $_SESSION['logged_user']['email'];
}else{
  $email = "";
} 

/*print_r($a);
echo "</pre>";
die('end here');*/

 ?>
<!--  <script type="text/javascript" src="//static.criteo.net/js/ld/ld.js" async="true"></script>

<script type="text/javascript">

window.criteo_q = window.criteo_q || [];

window.criteo_q.push(

{ event: "setAccount", account: 62859 },

{ event: "setEmail", email: "<?php echo $email;?>" },

{ event: "setSiteType", type: "d" },

{ event: "trackTransaction", id: "<?php echo $order_criteo;?>", item: "<?php echo $json_criteo?>"}

);

</script> -->

<!-- Event snippet for Sales conversion page -->

<script>
  gtag('event', 'conversion', {
      'send_to': 'AW-849203835/SdtmCM370agBEPuk95QD',
      'value': <?php echo $json_gtag_price;?>,                               
      'currency': 'ZAR',
      'transaction_id': '<?php echo $order_criteo;?>'
  });
</script>

<script>
  gtag('event', 'page_view', {
    'send_to': 'AW-849203835',
    'ecomm_pagetype': 'purchase',
    'ecomm_prodid': '<?php echo $json_gtag?>',
    'user_id': '<?php echo $email;?>'
  });
</script>


<div>
        <div class="body clearfix">
        	<div class="innerContainer">
		        <div class="greyarea">
        			<div class="fixed-container">
				        <div class="sucessarea">
					        <div class="container"> 
                            <img src="<?php echo CONF_WEBROOT_URL?>images/success.png" alt="<?php echo Utilities::getLabel('L_Payment_Success')?>">
					        <h2><span><?php echo Utilities::getLabel('L_Congratulations')?>!</span></h2>
					        <div class="gap"></div>
						        <?php echo Utilities::renderHtml($text_message)?>
					        <div class="gap"></div>
			        	 </div>
	       				 <?php if(!$hide_header_footer){?>
						    <a href="<?php echo Utilities::getSiteUrl(); ?>" class="btn green"><?php echo Utilities::getLabel('L_Continue_Shopping')?></a> 
						 <?php }?>
						</div>
                        
                        
                        <? if (count($smart_recommended_products)>0) {?>
        <div class="section category-list" >
        	    <div class="main-heading">
	        	    <h3><?php echo Utilities::getLabel('L_Recommended_Products_For_You') ?></h3>
    	        </div>
                <div class="shop-list products-carousel <? if (count($smart_recommended_products)<6):?>less_items<?php endif; ?>">
		            <?php  foreach ($smart_recommended_products as $product) { 
					           include CONF_THEME_PATH . 'common/product_thumb_view.php';
		            }  ?>
        	    </div>
            </div>
        <? } ?>
                        
			        </div>
                    
                    
                    
        		</div>
	        </div>
        </div>
    </div>
    <script>
  fbq('track', 'Purchase');
</script>
<script> 
gtag('event', 'page_view', 
            {'send_to': 'AW-849203835', 'ecomm_pagetype': 'purchase'});
</script>
  