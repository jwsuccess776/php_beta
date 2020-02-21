<meta name="description" content="Have a question about selling or buying online? Contact us here or buy emailing us at support@sellsa.co.za, you can also check out FAQ page here">
<meta name="keywords" content="Start Selling Online,sell online,selling products online from home,sell online for free,online selling sites South Africa,online selling business,how to sell products online in South Africa,how to sell a product online for free in South Africa,selling products online for free,how to sell products online without a website,contact us, need help,">
<meta name="author" content="Sell-SA">
<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div>
    <div class="body clearfix">
   		<div class="pageBar">
            <div class="fixed-container">
                <h1 class="pageTitle"><?php echo Utilities::getLabel('L_Contact_Us')?></h1>
            </div>
	    </div>
    	<div class="innerContainer">
		    <div class="greyarea">
			    <div class="fixed-container">
				    <div class="grid_1">
				    <?php 
					    $contact_content=str_replace('{SITEROOT}', CONF_WEBROOT_URL, $contact_content); 
					    echo Utilities::renderHtml($contact_content,true) 
				    ?>
			    	</div>
				    <div class="grid_2">
					    <h4><?php echo Utilities::getLabel('F_Drop_us_a_Line')?></h4>
				    	<?php echo $frm->getFormHtml();?>
			    	</div>
		    	</div>
	    	</div>
    	</div>
    </div>
</div>
<script src='https://www.google.com/recaptcha/api.js'></script>