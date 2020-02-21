<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
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
						        <p>Your subscription has been successfully processed!</p>
						        <p>You can view your order history by going to the <a href="/account/dashboard_buyer">my account</a> page and by clicking on <a href="/account/subscriptions">history</a>.</p>
						        
						        <p>If you have any questions please <a href="/custom/contact_us">contact us</a> here </p>
						        <p>We thank you for your subscription!</p>						        
					        <div class="gap"></div>
			        	 </div>
			        	 <a href="<?php echo Utilities::getSiteUrl(); ?>" class="btn green"><?php echo Utilities::getLabel('L_Continue_Shopping')?></a> 
			        	 
						</div>
                        
                        
                     
                        
			        </div>
                    
                    
                    
        		</div>
	        </div>
        </div>
    </div>
  