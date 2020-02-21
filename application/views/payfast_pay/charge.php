<?php
	
	//echo $payment_amount.'<br/>';
	//$payment_amount= $payment_amount + ($payment_amount * (4.5 /100));
	//echo $payment_amount.'<br/>';
//	$payment_amount=str_replace('.',',',$payment_amount);
	//echo $payment_amount.'<br/>';
	//exit;
?>

<?php defined('SYSTEM_INIT') or die('Invalid Usage'); //print_r($order_info); ?>
<div class="payment-page">
  <div class="cc-payment">
    <div class="logo-payment"><img src="<?php echo Utilities::generateUrl('image', 'site_logo',array(Settings::getSetting("CONF_FRONT_LOGO"), 'THUMB'), CONF_WEBROOT_URL)?>" alt=""/></div>
    <div class="reff total-pay">
      <p class="fl"><?=Utilities::getLabel('L_Payable_Amount')?>:  <strong><?php echo $payment_amount?></strong> </p>
      <p class="fr"><?=Utilities::getLabel('L_Order_Invoice')?>: <strong><?php echo Utilities::displayNotApplicable($order_info["invoice"])?></strong> </p>
      
    </div>
    <div class="payment-from">
			<?php  if (!isset($error)): ?>
<?php 
$testingMode = FALSE;
//$testingMode = TRUE;

//Live Details
$merchant_id ='10802811';	
$merchant_key ='cdqu5btoi7een';	

//sandbox details
//$merchant_id ='10005769';	
//$merchant_key ='mszaaqadob2po';	
$amount =$payment_amount;	
$item_name =$order_info['invoice'];	

	$data = array(
          // Merchant details
          'merchant_id' => $merchant_id,
  		  'merchant_key' => $merchant_key,
  		  'return_url' => 'https://www.sellsa.co.za/payfast_pay/payment_success',
          'cancel_url' => 'https://www.sellsa.co.za/payfast_pay/payment_cancelled',
          'notify_url' => 'https://www.sellsa.co.za/payfast_pay/order_payment_notify',
          'name_first' => $order_info['customer_name'],
          'name_last'  => '',
          'email_address'=> $order_info['customer_email'],
          'm_payment_id' => $order_info['id'],
  		  'amount' =>$amount, 
  		  'item_name' => $item_name,
//        'item_description' => 'Item Description',
     );       
     
     
$pfOutput ='';
foreach( $data as $key => $val )
{
    if(!empty($val))
    {
        $pfOutput .= $key .'='. urlencode( trim( $val ) ) .'&';
    }
}
// Remove last ampersand
$getString = substr( $pfOutput, 0, -1 );
if( isset( $passPhrase ) && $paymode!='sandbox' )
{
    $getString .= '&passphrase='.$passPhrase;
}
// ----------------------------------------------------------------------------------------------------------------
//$getString .= '&passphrase=Rajendra827';
$getString .= '&passphrase=Faheemjogiat';
// ----------------------------------------------------------------------------------------------------------------
$pfSignature = md5( $getString );
$data['signature'] = $pfSignature;

	  // If in testing mode use the sandbox domain ?  sandbox.payfast.co.za else www.payfast.co.za
      
      $pfHost = $testingMode ? 'sandbox.payfast.co.za' : 'www.payfast.co.za';
      $htmlForm = '
<form name="frmPayPalStandard" action="https://'.$pfHost.'/eng/process" method="post">'; foreach($data as $name=> $value) { $htmlForm .= '<input name="'.$name.'" type="hidden" value="'.$value.'" />'; } $htmlForm .= '<p> We are redirecting you to payment page...</p></form>'; 

echo $htmlForm;
 
 ?>
            <?php  else: ?>
				  <div class="alert alert-danger"><?php echo $error?><div>
			<?php  endif;?>
    </div>
  </div>
</div>
<script type="text/javascript">
   $(function(){
		setTimeout(function(){ $('form[name="frmPayPalStandard"]').submit() }, 5000); 
	})
</script>	
