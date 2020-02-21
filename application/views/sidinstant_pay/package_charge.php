<?php defined('SYSTEM_INIT') or die('Invalid Usage'); //print_r($order_info); ?>
<div class="payment-page">
  <div class="cc-payment">
    <div class="logo-payment"><img src="<?php echo Utilities::generateUrl('image', 'site_logo',array(Settings::getSetting("CONF_FRONT_LOGO"), 'THUMB'), CONF_WEBROOT_URL)?>" alt=""/></div>
    <div class="reff total-pay">
      <p class="fl"><?=Utilities::getLabel('L_Payable_Amount')?>:  <strong><?php echo Utilities::displayMoneyFormat($payment_amount)?></strong> </p>
      <p class="fr"><?=Utilities::getLabel('L_Order_Invoice')?>: <strong><?php echo Utilities::displayNotApplicable($order_info["invoice"])?></strong> </p>
      
    </div>
    <div class="payment-from">
			<?php  if (!isset($error)): ?>
<?php 

	$amount =$payment_amount;
	
	//$sid_merchant = 'SELLSA';
	$sid_merchant = 'SELLSA';
	$sid_currency = 'ZAR';
	$sid_country = 'ZA';
	$sid_buyer_reference = $order_info['id'];
	$sid_reference = $sid_buyer_reference;
	$sid_default_reference = '';
	$sid_amount = $amount;
	$SID_CUSTOM_01 = 'Subscription';
	$SID_CUSTOM_02 = '';
	$SID_CUSTOM_03 = '';
	$SID_CUSTOM_04 = '';
	$SID_CUSTOM_05 = '';
	$sid_secret_key = '2ohVUaAnEeeZRsCWWpVS6T5hp3B1vnayAQDKq26HRXHLCf6gwYdbmJhjs';
	$sid_consistent = strtoupper(hash('sha512', $sid_merchant.$sid_currency.$sid_country.$sid_reference.$sid_buyer_reference.$sid_default_reference.$sid_amount.$SID_CUSTOM_01.$SID_CUSTOM_02.$SID_CUSTOM_03.$SID_CUSTOM_04.$SID_CUSTOM_05.$sid_secret_key)); 
 ?>
 
 
<FORM METHOD="POST" name="frmSIDINSTANT" ACTION="https://www.sidpayment.com/paySID/">
 <INPUT TYPE="HIDDEN" NAME="sid_merchant" VALUE="<?=$sid_merchant?>" />
 <INPUT TYPE="HIDDEN" NAME="sid_currency" VALUE="<?=$sid_currency?>" />
 <INPUT TYPE="HIDDEN" NAME="sid_country" VALUE="<?=$sid_country?>" />
 <INPUT TYPE="HIDDEN" NAME="sid_reference" VALUE="<?=$sid_reference?>" />
 <INPUT TYPE="HIDDEN" NAME="sid_buyer_reference" VALUE="<?=$sid_buyer_reference?>" />
 
 <INPUT TYPE="HIDDEN" NAME="sid_default_reference" VALUE="<?=$sid_default_reference?>" />
 <INPUT TYPE="HIDDEN" NAME="sid_amount" VALUE="<?=$sid_amount?>" />
 
 
 <INPUT TYPE="HIDDEN" NAME="SID_CUSTOM_01" VALUE="<?=$SID_CUSTOM_01?>" />
 <INPUT TYPE="HIDDEN" NAME="SID_CUSTOM_02" VALUE="<?=$SID_CUSTOM_02?>" />
 <INPUT TYPE="HIDDEN" NAME="SID_CUSTOM_03" VALUE="<?=$SID_CUSTOM_03?>" />
 <INPUT TYPE="HIDDEN" NAME="SID_CUSTOM_04" VALUE="<?=$SID_CUSTOM_04?>" />
 <INPUT TYPE="HIDDEN" NAME="SID_CUSTOM_05" VALUE="<?=$SID_CUSTOM_05?>" />
 
 <INPUT TYPE="HIDDEN" NAME="sid_consistent" VALUE="<?=$sid_consistent?>" />

 
 
 <p> We are redirecting you to payment page...</p>
 
</FORM>
 
 
            <?php  else: ?>
				  <div class="alert alert-danger"><?php echo $error?><div>
			<?php  endif;?>
    </div>
  </div>
</div>
<script type="text/javascript">
    $(function(){
		setTimeout(function(){ $('form[name="frmSIDINSTANT"]').submit() }, 5000);
	})
</script>	
  