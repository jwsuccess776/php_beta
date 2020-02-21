<?php 

$data = array(
          // Merchant details
          'merchant_id' => '10802811',
          'merchant_key' => 'cdqu5btoi7een',
          'return_url' => 'http://sellsa.co.za/payfast/return.php',
          'cancel_url' => 'http://sellsa.co.za/payfast/cancel.php',
          'notify_url' => 'http://sellsa.co.za/payfast/notify.php',
	          'name_first' => 'Rajendra',
	          'name_last'  => 'Patil',
	          'email_address'=> 'sbtu01@payfast.co.za',
	          'm_payment_id' => '2', //Unique payment ID to pass through to notify_url
	          'amount' =>200, //Amount needs to be in ZAR, 
          //if you have a multicurrency system, the conversion needs to place before building this array 
          'item_name' => 'Pass Payment',
          'item_description' => 'Item Description',
          'payment_method' => 'cc', //custom integer to be passed through           
          'subscription_type' => 2 //'custom string to be passed through with the transaction to the notify_url page'            
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

$pfSignature = md5( $getString );
//$data['signature'] = $pfSignature;


	 // echo '<pre>';
	//  print_r($data);
	//  exit;
	  // If in testing mode use the sandbox domain ?  sandbox.payfast.co.za else www.payfast.co.za
      $testingMode = true;
      $pfHost = $testingMode ? 'sandbox.payfast.co.za' : 'www.payfast.co.za';
      $htmlForm = '
<form action="https://'.$pfHost.'/eng/process" method="post">'; foreach($data as $name=> $value) { $htmlForm .= '<input name="'.$name.'" type="hidden" value="'.$value.'" />'; } $htmlForm .= '<input type="submit" value="Pay Now" /></form>'; echo $htmlForm;

?>
