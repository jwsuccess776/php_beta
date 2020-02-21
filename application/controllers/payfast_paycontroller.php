<?php
class Payfast_payController extends PaymentController{
	private $key_name="payfast";
	public function recurringPayments() {
	/** Used by the checkout to state the module * supports recurring. */
	return true;
	}
private function getPaymentForm($order_id){
	//die($_SESSION['shopping_cart']["order"]."#");
	$pmObj=new Paymentsettings($this->key_name);
	$payment_settings=$pmObj->getPaymentSettings();
	$orderPaymentObj=new OrderPayment($order_id);
	$payment_gateway_charge=$orderPaymentObj->getOrderPaymentGatewayAmount();
	$order_info=$orderPaymentObj->getOrderPrimaryinfo();
	if ($payment_settings["transaction_mode"]==1) {
		$action_url = 'https://www.paypal.com/cgi-bin/webscr';
	} elseif ($payment_settings["transaction_mode"]==0) {
		$action_url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
	}
	$frm=new Form('frmPayPalStandard','frmPayPalStandard');
	$frm->setRequiredStarWith('x');
	$frm->captionInSameCell(true);
	$frm->setExtra('class="siteForm" validator="system_validator" ');
	$frm->setAction($action_url);
	$frm->setFieldsPerRow(1);
	$frm->addHiddenField('', 'cmd', "_cart");
	$frm->addHiddenField('', 'upload', "1");
	$frm->addHiddenField('', 'business', $payment_settings["merchant_email"]);
	$order_payment_gateway_description=sprintf(Utilities::getLabel('M_Order_Payment_Gateway_Description'),$order_info["site_system_name"],$order_info['invoice']);
	$frm->addHiddenField('', 'item_name_1', $order_payment_gateway_description);
	$frm->addHiddenField('', 'item_number_1', $order_info['invoice']);
	$frm->addHiddenField('', 'amount_1', $payment_gateway_charge);
	$frm->addHiddenField('', 'quantity_1', 1);
	$frm->addHiddenField('', 'currency_code', $order_info["order_currency_code"]);
	$frm->addHiddenField('', 'first_name', $order_info["customer_name"]);
	$frm->addHiddenField('', 'address1', $order_info["customer_billing_address_1"]);
	$frm->addHiddenField('', 'address2', $order_info["customer_billing_address_2"]);
	$frm->addHiddenField('', 'city', $order_info["customer_billing_city"]);
	$frm->addHiddenField('', 'zip', $order_info["customer_billing_postcode"]);
	$frm->addHiddenField('', 'country', $order_info["customer_billing_country"]);
	$frm->addHiddenField('', 'address_override', 0);
	$frm->addHiddenField('', 'email', $order_info['customer_email']);
	$frm->addHiddenField('', 'invoice', $order_info['invoice']);
	$frm->addHiddenField('', 'lc', $order_info['order_language']);
	$frm->addHiddenField('', 'rm', 2);
	$frm->addHiddenField('', 'no_note', 1);
	$frm->addHiddenField('', 'no_shipping', 1);
	$frm->addHiddenField('', 'charset', "utf-8");
	$frm->addHiddenField('', 'return', Utilities::generateAbsoluteUrl('custom','payment_success'));
	$frm->addHiddenField('', 'notify_url', Utilities::generateAbsoluteUrl('paypalstandard_pay','callback'));
	$frm->addHiddenField('', 'cancel_return', Utilities::generateAbsoluteUrl('custom','payment_failed'));
	$frm->addHiddenField('', 'paymentaction', 'sale');  // authorization or sale
	$frm->addHiddenField('', 'custom', $order_id);
	$frm->addHiddenField('', 'bn', $order_info["paypal_bn"]);
	$frm->setJsErrorDisplay('afterfield');
	return $frm;
}


function charge($order_id){
	
/*ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);*/

		$_SESSION['order_criteo'] = $order_id;
		unset($_SESSION['shopping_cart']);
		$payment_itm = array();
		$payment_itm_gtag = array();
        $payment_itm_price = array();
		
		$pmObj=new Paymentsettings($this->key_name);

		if (!$payment_settings=$pmObj->getPaymentSettings()){
			Message::addErrorMessage($pmObj->getError());
			Utilities::redirectUserReferer();
		}

		$orderPaymentObj=new OrderPayment($order_id);
		$payment_amount=$orderPaymentObj->getOrderPaymentGatewayAmount();
		$order_info=$orderPaymentObj->getOrderPrimaryinfo();


$orderObj=new Orders();
$order_info1=$orderObj->getOrderById($order_id);
		
// add 4.5% commision for payfast
/*$mydb=Syspage::getdb();
$extra_commission=($payment_amount * 4.5) /100;
$final_commision = $order_info1['order_site_commission'] + $extra_commission ;
// adding in main order table
$update_query="UPDATE tbl_orders SET order_site_commission='$final_commision' WHERE order_id='".$order_id."'";
$mydb->query($update_query);

// adding in order product 
$select_query="select * from tbl_order_products where opr_order_id = '".$order_id."' ";
$ordred_products=$mydb->query($select_query);
$ordred_product=$mydb->fetch_all($ordred_products);

//echo '<pre>';
//print_r($ordred_product);
foreach($ordred_product as $op)
{
	$extra_commission = ( $op['opr_customer_buying_price'] * 4.5 )/100;
	$final_commision = $op['opr_commission_charged'] + $extra_commission ;
	
	$opr_commission_percentage = $op['opr_commission_percentage'] + 4.5;
	
	$update_query="UPDATE tbl_order_products SET opr_commission_charged='$final_commision',opr_commission_percentage = '".$opr_commission_percentage."'  WHERE opr_id='".$op['opr_id']."'";
	$mydb->query($update_query);
	//print_r($op);
}
 */


 



















		$mydb = Syspage::getdb();
		$commission_query="select * from tbl_order_products where opr_order_id = ".$order_id." ";
		$commission_dets=$mydb->query($commission_query);
		if($commission_dets->num_rows>0)
		{
			$commission_res=$mydb->fetch_all($commission_dets);
			foreach($commission_res as $com_row)
			{
				$opr_id=$com_row['opr_id'];
				    
				    $payment_itm[] = array(
			      'id'=>$com_row['opr_product_id'],
			      'price'=>$com_row['opr_sale_price'],
			      'quantity'=>$com_row['opr_qty']
			    );

				 $payment_itm_gtag[] = array(
                     'id'=>'sellsa-'.$com_row['opr_product_id']
                );
                $payment_itm_price[] = array(
                     'price'=>$com_row['opr_sale_price']
                );

				$opr_commission_charged=$com_row['opr_commission_charged'];
				$opr_commission_percentage=$com_row['opr_commission_percentage'];
				$opr_net_charged=$com_row['opr_net_charged'];
				
				$opr_commission_percentage = $opr_commission_percentage + 4.5;
				
				$new_commision_charged =  ($opr_net_charged * 4.5)/100;
				
				$opr_commission_charged = $opr_commission_charged + $new_commision_charged;
				
				$opr_update_query="UPDATE tbl_order_products SET opr_commission_charged ='$opr_commission_charged', opr_commission_percentage = '$opr_commission_percentage'  WHERE opr_id='".$opr_id."'";
				$mydb->query($opr_update_query);
				
				//echo 'updated <br/>';
				
			}
			
			
			$original_order=$mydb->query("select * from tbl_orders where order_id = '".$order_id."'  limit 1");
			if($original_order->num_rows>0)
			{
				$original_ord=$mydb->fetch_all($original_order);
				//echo '<pre>';
				//print_r($original_ord);
				
				$old_order_site_commission=$original_ord[0]['order_site_commission'];
				$order_net_charged=$original_ord[0]['order_net_charged'];
				
				$new_commission_charge= ($order_net_charged * 4.5)/100;
				
				$old_order_site_commission = $old_order_site_commission + $new_commission_charge;
				
				$order_update_query="UPDATE tbl_orders SET order_site_commission ='$old_order_site_commission' WHERE order_id='".$order_id."'";
				$mydb->query($order_update_query);
				
			}
			//print_r($result);
			
		}

 
 
 
 
 
 
 
 
 
 
 

		if ($order_info && $order_info["order_payment_status"]==0){
			/*echo "<pre>";print_r($frm);exit;*/
			$this->set('payment_amount', $payment_amount);
		}else{
			$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
		}

		$this->set('order_info', $order_info);
		$_SESSION['criteo_session'] = json_encode($payment_itm);	
		//exit;
		$_SESSION['gtag_session'] = json_encode($payment_itm_gtag);
                $_SESSION['gtag_session_price'] = json_encode($payment_itm_price);
		$this->_template->render(true,false);	
	
 
}

        function pay_now($order_id)
        {

            /* ini_set('display_errors', 1);
              ini_set('display_startup_errors', 1);
              error_reporting(E_ALL); */


            //unset($_SESSION['shopping_cart']);
            $pmObj = new Paymentsettings($this->key_name);

            if (!$payment_settings = $pmObj->getPaymentSettings())
            {
                Message::addErrorMessage($pmObj->getError());
                Utilities::redirectUserReferer();
            }

            $orderPaymentObj = new OrderPayment($order_id);
            $payment_amount = $orderPaymentObj->getOrderPaymentGatewayAmount();
            $order_info = $orderPaymentObj->getOrderPrimaryinfo();


            $orderObj = new Orders();
            $order_info1 = $orderObj->getOrderById($order_id);

// add 4.5% commision for payfast
            /* $mydb=Syspage::getdb();
              $extra_commission=($payment_amount * 4.5) /100;
              $final_commision = $order_info1['order_site_commission'] + $extra_commission ;
              // adding in main order table
              $update_query="UPDATE tbl_orders SET order_site_commission='$final_commision' WHERE order_id='".$order_id."'";
              $mydb->query($update_query);

              // adding in order product
              $select_query="select * from tbl_order_products where opr_order_id = '".$order_id."' ";
              $ordred_products=$mydb->query($select_query);
              $ordred_product=$mydb->fetch_all($ordred_products);

              //echo '<pre>';
              //print_r($ordred_product);
              foreach($ordred_product as $op)
              {
              $extra_commission = ( $op['opr_customer_buying_price'] * 4.5 )/100;
              $final_commision = $op['opr_commission_charged'] + $extra_commission ;

              $opr_commission_percentage = $op['opr_commission_percentage'] + 4.5;

              $update_query="UPDATE tbl_order_products SET opr_commission_charged='$final_commision',opr_commission_percentage = '".$opr_commission_percentage."'  WHERE opr_id='".$op['opr_id']."'";
              $mydb->query($update_query);
              //print_r($op);
              }
             */

            $mydb = Syspage::getdb();
            $payment_itm = array();  
            $commission_query = "select * from tbl_order_products where opr_order_id = " . $order_id . " ";
            $commission_dets = $mydb->query($commission_query);
            if ($commission_dets->num_rows > 0)
            {
                $commission_res = $mydb->fetch_all($commission_dets);
                foreach ($commission_res as $com_row)
                {
                    $opr_id = $com_row['opr_id'];

                        $payment_itm[] = array(
			      'id'=>'sellsa-'.$com_row['opr_product_id'],
			      'price'=>$com_row['opr_sale_price'],
			      'quantity'=>$com_row['opr_qty']
			    );
                        
                    $opr_commission_charged = $com_row['opr_commission_charged_static'];
                    $opr_commission_percentage = $com_row['opr_commission_percentage_static'];
                    $opr_net_charged = $com_row['opr_net_charged'];

                    $opr_commission_percentage = $opr_commission_percentage + 4.5;

                    $new_commision_charged = ($opr_net_charged * 4.5) / 100;

                    $opr_commission_charged = $opr_commission_charged + $new_commision_charged;

                    $opr_update_query = "UPDATE tbl_order_products SET opr_commission_charged ='$opr_commission_charged', opr_commission_percentage = '$opr_commission_percentage'  WHERE opr_id='" . $opr_id . "'";
                    $mydb->query($opr_update_query);

                    //echo 'updated <br/>';
                }


                $original_order = $mydb->query("select * from tbl_orders where order_id = '" . $order_id . "'  limit 1");
                if ($original_order->num_rows > 0)
                {
                    $original_ord = $mydb->fetch_all($original_order);
                    //echo '<pre>';
                    //print_r($original_ord);

                    $old_order_site_commission = $original_ord[0]['order_site_commission_static'];
                    $order_net_charged = $original_ord[0]['order_net_charged'];

                    $new_commission_charge = ($order_net_charged * 4.5) / 100;

                    $old_order_site_commission = $old_order_site_commission + $new_commission_charge;

                    $order_update_query = "UPDATE tbl_orders SET order_site_commission ='$old_order_site_commission' WHERE order_id='" . $order_id . "'";
                    $mydb->query($order_update_query);
                }
                //print_r($result);
            }













            if ($order_info && $order_info["order_payment_status"] == 0)
            {
                /* echo "<pre>";print_r($frm);exit; */
                $this->set('payment_amount', $payment_amount);
            }
            else
            {
                $this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
            }

            $this->set('order_info', $order_info);
            $_SESSION['criteo_session'] = json_encode($payment_itm);
            //exit;
            $this->_template->render(true, false);
        }



function charge_($order_id){
	$pmObj=new Paymentsettings($this->key_name);
	if (!$payment_settings=$pmObj->getPaymentSettings()){
		Message::addErrorMessage($pmObj->getError());
		Utilities::redirectUserReferer();
	}
	$orderPaymentObj=new OrderPayment($order_id);
	$payment_amount=$orderPaymentObj->getOrderPaymentGatewayAmount();
	$order_info=$orderPaymentObj->getOrderPrimaryinfo();
	if ($order_info && $order_info["order_payment_status"]==0){
		$frm=$this->getPaymentForm($order_id);
		$this->set('frm', $frm);
		$this->set('payment_amount', $payment_amount);
	}else{
		$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
	}
	$this->set('order_info', $order_info);
	$this->_template->render(true,false);	
}


public function callback() {
	$pmObj=new Paymentsettings($this->key_name);
	$payment_settings=$pmObj->getPaymentSettings();
	$post = Syspage::getPostedVar();
	$order_id = (isset($post['custom']))?$post['custom']:0;
	$orderPaymentObj=new OrderPayment($order_id);
	$payment_gateway_charge=$orderPaymentObj->getOrderPaymentGatewayAmount();
	if ($payment_gateway_charge>0){
		$request = 'cmd=_notify-validate';
		foreach ($post as $key => $value) {
			$request .= '&' . $key . '=' . urlencode(html_entity_decode($value, ENT_QUOTES, 'UTF-8'));
		}
		
		if ($payment_settings["transaction_mode"]==1) {
			$curl = curl_init('https://www.paypal.com/cgi-bin/webscr');
		} elseif ($payment_settings["transaction_mode"]==0) {
			$curl = curl_init('https://www.sandbox.paypal.com/cgi-bin/webscr');
		}
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $request);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		$response = curl_exec($curl);
		if ((strcmp($response, 'VERIFIED') == 0 || strcmp($response, 'UNVERIFIED') == 0) && isset($post['payment_status'])) {
			$order_payment_status = $payment_settings['order_status_initial'];
			switch($post['payment_status']) {
				case 'Pending':
				$order_payment_status = $payment_settings['order_status_pending'];
				break;
				case 'Processed':
				$order_payment_status = $payment_settings['order_status_processed'];
				break;
				case 'Completed':
				$order_payment_status = $payment_settings['order_status_completed'];
				break;
				default:
				$order_payment_status = $payment_settings['order_status_others'];
				break;
			}
			$receiver_match = (strtolower($post['receiver_email']) == strtolower($payment_settings['merchant_email']));
			$total_paid_match = ((float)$post['mc_gross'] == $payment_gateway_charge);
			if (!$receiver_match) {
				$request .= "\n\n PP_STANDARD :: RECEIVER EMAIL MISMATCH! " . strtolower($post['receiver_email']) . "\n\n";
			}
			if (!$total_paid_match) {
				$request .= "\n\n PP_STANDARD :: TOTAL PAID MISMATCH! " . strtolower($post['mc_gross']) . "\n\n";
			}
			if ($order_payment_status==1 && $receiver_match && $total_paid_match){
				$orderPaymentObj->addOrderPayment($payment_settings["pmethod_name"],$post["txn_id"],$payment_gateway_charge,Utilities::getLabel("L_Received_Payment"),$request."#".$response);
			}else{
				$orderPaymentObj->addOrderPaymentComments($request);
			}
		}
		curl_close($curl);
	}
}
private function getWalletPaymentForm($recharge_txn_id){
	$pmObj=new PPCPaymentsettings($this->key_name);
	$payment_settings=$pmObj->getPaymentSettings();
	$wrObj=new WalletRecharge($recharge_txn_id);
	$payment_gateway_charge=$wrObj->getPaymentGatewayAmount();
	$recharge_txn_info=$wrObj->getWalletRechargePrimaryinfo();
	if ($payment_settings["transaction_mode"]==1) {
		$action_url = 'https://www.paypal.com/cgi-bin/webscr';
	} elseif ($payment_settings["transaction_mode"]==0) {
		$action_url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
	}
	$frm=new Form('frmPayPalStandard','frmPayPalStandard');
	$frm->setRequiredStarWith('x');
	$frm->captionInSameCell(true);
	$frm->setExtra('class="siteForm" validator="system_validator" ');
	$frm->setAction($action_url);
	$frm->setFieldsPerRow(1);
	$frm->addHiddenField('', 'cmd', "_xclick");
//$frm->addHiddenField('', 'upload', "1");
	$frm->addHiddenField('', 'business', $payment_settings["merchant_email"]);
	$order_payment_gateway_description=sprintf(Utilities::getLabel('M_Wallet_Recharge_Payment_Gateway_Description'),$recharge_txn_info["system_name"],$recharge_txn_info['invoice']);
	$frm->addHiddenField('', 'item_name', $order_payment_gateway_description);
// $frm->addHiddenField('', 'item_name_1', $order_payment_gateway_description);
	$frm->addHiddenField('', 'item_number', $recharge_txn_info['invoice']);
	$frm->addHiddenField('', 'amount', $payment_gateway_charge);
//$frm->addHiddenField('', 'quantity_1', 0);
	$frm->addHiddenField('', 'currency_code', $recharge_txn_info["currency"]);
	$frm->addHiddenField('', 'first_name', $recharge_txn_info["name"]);
	$frm->addHiddenField('', 'email', $recharge_txn_info['email']);
	$frm->addHiddenField('', 'invoice', $recharge_txn_info['invoice']);
	$frm->addHiddenField('', 'lc', 'en');
	$frm->addHiddenField('', 'rm', 2);
	$frm->addHiddenField('', 'no_note', 1);
	$frm->addHiddenField('', 'no_shipping', 1);
	$frm->addHiddenField('', 'charset', "utf-8");
	$frm->addHiddenField('', 'return', Utilities::generateAbsoluteUrl('account','payment_success'));
	$frm->addHiddenField('', 'notify_url', Utilities::generateAbsoluteUrl('paypalstandard_pay','wallet_callback'));
	$frm->addHiddenField('', 'cancel_return', Utilities::generateAbsoluteUrl('account','payment_failed'));
$frm->addHiddenField('', 'paymentaction', 'sale');  // authorization or sale
$frm->addHiddenField('', 'custom', $recharge_txn_id);
$frm->addHiddenField('', 'bn', $recharge_txn_info["paypal_bn"]);
$frm->setJsErrorDisplay('afterfield');
return $frm;
}
function charge_for_wallet($recharge_txn_id){
	$pmObj=new PPCPaymentsettings($this->key_name);
	if (!$payment_settings=$pmObj->getPaymentSettings()){
		Message::addErrorMessage($pmObj->getError());
		Utilities::redirectUserReferer();
	}
	$wrObj=new WalletRecharge($recharge_txn_id);
	$payment_amount=$wrObj->getPaymentGatewayAmount();
	$recharge_txn_info=$wrObj->getWalletRechargePrimaryinfo();
	if ($recharge_txn_info && $recharge_txn_info["payment_status"]==0){
		$frm=$this->getWalletPaymentForm($recharge_txn_id);
		$this->set('frm', $frm);
		$this->set('payment_amount', $payment_amount);
	}else{
		$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
	}
	$this->set('recharge_txn_info', $recharge_txn_info);
	$this->_template->render(true,false);	
}
public function wallet_callback() {
	$pmObj=new PPCPaymentsettings($this->key_name);
	$payment_settings=$pmObj->getPaymentSettings();
	$post = Syspage::getPostedVar();
	$recharge_txn_id = (isset($post['custom']))?$post['custom']:0;
	$wrObj=new WalletRecharge($recharge_txn_id);
	$payment_gateway_charge=$wrObj->getPaymentGatewayAmount();
	if ($payment_gateway_charge>0){
		$request = 'cmd=_notify-validate';
		foreach ($post as $key => $value) {
			$request .= '&' . $key . '=' . urlencode(html_entity_decode($value, ENT_QUOTES, 'UTF-8'));
		}
		if ($payment_settings["transaction_mode"]==1) {
			$curl = curl_init('https://www.paypal.com/cgi-bin/webscr');
		} elseif ($payment_settings["transaction_mode"]==0) {
			$curl = curl_init('https://www.sandbox.paypal.com/cgi-bin/webscr');
		}
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $request);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		$response = curl_exec($curl);
		if ((strcmp($response, 'VERIFIED') == 0 || strcmp($response, 'UNVERIFIED') == 0) && isset($post['payment_status'])) {
			$order_payment_status = $payment_settings['order_status_initial'];
			switch($post['payment_status']) {
				case 'Pending':
				$order_payment_status = $payment_settings['txn_status_pending'];
				break;
				case 'Processed':
				$order_payment_status = $payment_settings['txn_status_processed'];
				break;
				case 'Completed':
				$order_payment_status = $payment_settings['txn_status_completed'];
				break;
				default:
				$order_payment_status = $payment_settings['txn_status_others'];
				break;
			}
			$receiver_match = (strtolower($post['receiver_email']) == strtolower($payment_settings['merchant_email']));
			$total_paid_match = ((float)$post['mc_gross'] == $payment_gateway_charge);
			if (!$receiver_match) {
				$request .= "\n\n PP_STANDARD :: RECEIVER EMAIL MISMATCH! " . strtolower($post['receiver_email']) . "\n\n";
			}
			if (!$total_paid_match) {
				$request .= "\n\n PP_STANDARD :: TOTAL PAID MISMATCH! " . strtolower($post['mc_gross']) . "\n\n";
			}
			if ($order_payment_status==1 && $receiver_match && $total_paid_match){
				$wrObj->markWalletRechargeRequestPaid($payment_settings["ppcpmethod_name"],$post["txn_id"],$request."#".$response);
			}			
		}
		curl_close($curl);
	}
}
private function getSubscriptionPaymentForm($order_id){
	$pmObj=new SubscriptionPaymentsettings($this->key_name);
	$payment_settings=$pmObj->getPaymentSettings();
	$orderPaymentObj=new SubscriptionOrderPayment($order_id);
	$payment_gateway_charge=$orderPaymentObj->getOrderPaymentGatewayAmount();
	$recurring_payment_gateway_charge=$orderPaymentObj->getRecurringOrderPaymentGatewayAmount();
	$order_info=$orderPaymentObj->getOrderPrimaryinfo();
	if ($payment_settings["transaction_mode"]==1) {
		$action_url = 'https://www.paypal.com/cgi-bin/webscr';
	} elseif ($payment_settings["transaction_mode"]==0) {
		$action_url = 'https://www.sandbox.paypal.com/cgi-bin/webscr';
	}
	$frm=new Form('frmPayPalStandard','frmPayPalStandard');
	$frm->setRequiredStarWith('x');
	$frm->captionInSameCell(true);
	$frm->setExtra('class="siteForm" validator="system_validator" ');
	$frm->setAction($action_url);
	$frm->setFieldsPerRow(1);
	$frm->addHiddenField('', 'cmd', "_xclick-subscriptions");
	$frm->addHiddenField('', 'upload', "1");
	$frm->addHiddenField('', 'business', $payment_settings["merchant_email"]);
	$order_payment_gateway_description = substr(strip_tags($order_info['mporder_merchantpack_desc']), 0, 126);
	$frm->addHiddenField('', 'item_name', $order_payment_gateway_description);
	if ($payment_gateway_charge!=$recurring_payment_gateway_charge){
		$frm->addHiddenField('', 'a1', $payment_gateway_charge);
		$frm->addHiddenField('', 'p1', $order_info['mporder_recurring_billing_cycle_frequency']);
		$frm->addHiddenField('', 't1', $order_info['mporder_recurring_billing_cycle_period']);
	}
	/* Start Free Trial Period */
	/*$frm->addHiddenField('', 'a1', 0);
	$frm->addHiddenField('', 'p1', 5);
	$frm->addHiddenField('', 't1', 'D');*/
	/* End Free Trial Period */
	$frm->addHiddenField('', 'a3', $recurring_payment_gateway_charge);
	$frm->addHiddenField('', 'p3', $order_info['mporder_recurring_billing_cycle_frequency']);
	$frm->addHiddenField('', 't3', $order_info['mporder_recurring_billing_cycle_period']);
	$frm->addHiddenField('', 'src', 1);
	if ($order_info['mporder_recurring_billing_cycle']!='9999')
	$frm->addHiddenField('', 'srt', min(array($order_info['mporder_recurring_billing_cycle'],52)));
	$frm->addHiddenField('', 'no_note', 1);
	$frm->addHiddenField('', 'invoice', $order_info['invoice']);
	$frm->addHiddenField('', 'modify', 0);
	$frm->addHiddenField('', 'currency_code', $order_info["mporder_currency_code"]);
	$frm->addHiddenField('', 'first_name', $order_info["customer_name"]);
	$frm->addHiddenField('', 'email', $order_info['customer_email']);
	$frm->addHiddenField('', 'lc', $order_info['order_language']);
	$frm->addHiddenField('', 'rm', 2);
	$frm->addHiddenField('', 'sra', 1);
	$frm->addHiddenField('', 'charset', "utf-8");
	$frm->addHiddenField('', 'return', Utilities::generateAbsoluteUrl('custom','package_payment_success'));
	$frm->addHiddenField('', 'notify_url', Utilities::generateAbsoluteUrl('paypalstandard_pay','package_callback'));
	$frm->addHiddenField('', 'cancel_return', Utilities::generateAbsoluteUrl('custom','package_payment_failed'));
	$frm->addHiddenField('', 'custom', $order_id);
	$frm->addHiddenField('', 'bn', $order_info["paypal_bn"]);
	$frm->setJsErrorDisplay('afterfield');
	return $frm;
	}
function package_charge($order_id){
	
	$pmObj=new SubscriptionPaymentsettings($this->key_name);
	/*echo "<pre>";
	print_r($pmObj);
	exit;*/
	
	if (!$payment_settings=$pmObj->getPaymentSettings()){
		Message::addErrorMessage($pmObj->getError());
		Utilities::redirectUserReferer();
	}
	$orderPaymentObj=new SubscriptionOrderPayment($order_id);
	$payment_amount=$orderPaymentObj->getOrderPaymentGatewayAmount();
	$order_info=$orderPaymentObj->getOrderPrimaryinfo();
	
	/*echo "<pre>";
	print_r($order_info);
	echo "</pre>";
	exit;*/
	if ($order_info && $order_info["mporder_payment_status"]==0){
		//$frm=$this->getSubscriptionPaymentForm($order_id);
		//$this->set('frm', $frm);
		$this->set('payment_amount', $payment_amount);
	}else{
		$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
	}
	$this->set('order_info', $order_info);
	$this->_template->render(true,false);	
}


	private function getPaymentForm_($order_id,$referance){

		$frm=new Form('frmPaymentForm','frmPaymentForm');

		$frm->setRequiredStarWith('x');

		$frm->setValidatorJsObjectName('system_validator');

		$frm->setExtra('class="siteForm" validator="system_validator" ');

		$frm->setAction(Utilities::generateUrl('TransferBank_pay','send',array($order_id)));

		$frm->captionInSameCell(true);

		$frm->setFieldsPerRow(1);

		$pmObj=new Paymentsettings($this->key_name);

		$payment_settings=$pmObj->getPaymentSettings();

		$fld=$frm->addHtml('', 'htmlNote',Utilities::getLabel('M_Bank_Transfer_Note'));

		$fld->merge_caption=true;

	 	
		//$fld=$frm->addHtml('', 'htmlNote','<div class="alert alert-info">'.nl2br($payment_settings["bank_details"]).'</div>');


		$fld->merge_caption=true;

		$frm->addSubmitButton('','btn_submit',"Confirm Order",'button-confirm');

		$frm->setJsErrorDisplay('afterfield');

		return $frm;

	}
	
function order_charge($order_id){

/*ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);*/


		unset($_SESSION['shopping_cart']);
		$pmObj=new Paymentsettings($this->key_name);

		if (!$payment_settings=$pmObj->getPaymentSettings()){
			Message::addErrorMessage($pmObj->getError());
			Utilities::redirectUserReferer();
		}

		$orderPaymentObj=new OrderPayment($order_id);
		$payment_amount=$orderPaymentObj->getOrderPaymentGatewayAmount();
		$order_info=$orderPaymentObj->getOrderPrimaryinfo();

//echo '<pre>';
//print_r($order_info);


$orderObj=new Orders();
$order_info1=$orderObj->getOrderById($order_id);
		
// add 4.5% commision for payfast
$mydb=Syspage::getdb();

$extra_commission=($payment_amount * 4.5) /100;
$final_commision = $order_info1['order_site_commission'] + $extra_commission ;
// adding in main order table
$update_query="UPDATE tbl_orders SET order_site_commission='$final_commision' WHERE order_id='".$order_id."'";
$mydb->query($update_query);

// adding in order product 
$select_query="select * from tbl_order_products where opr_order_id = '".$order_id."' ";
$ordred_products=$mydb->query($select_query);
$ordred_product=$mydb->fetch_all($ordred_products);

//echo '<pre>';
//print_r($ordred_product);
foreach($ordred_product as $op)
{
	$extra_commission = ( $op['opr_customer_buying_price'] * 4.5 )/100;
	$final_commision = $op['opr_commission_charged'] + $extra_commission ;
	
	$opr_commission_percentage = $op['opr_commission_percentage'] + 4.5;
	
	$update_query="UPDATE tbl_order_products SET opr_commission_charged='$final_commision',opr_commission_percentage = '".$opr_commission_percentage."'  WHERE opr_id='".$op['opr_id']."'";
	$mydb->query($update_query);
	//print_r($op);
}
/*echo '</pre>';
exit;*/




		if ($order_info && $order_info["order_payment_status"]==0){
			/*echo "<pre>";print_r($frm);exit;*/
			$this->set('payment_amount', $payment_amount);
		}else{
			$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
		}

		$this->set('order_info', $order_info);
		$this->_template->render(true,false);	
	
 
}


public function payment_success()
{
	echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_success";</script>';
}



public function payment_cancelled()
{
	echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_failed";</script>';
}






 
public function order_payment_notify()
{

header( 'HTTP/1.0 200 OK' );
flush();

$pfData = $_POST;


/*echo "<pre>";
print_r($pfData);
die;*/   
$myfile = fopen("payfast_today.txt", "w") or die("Unable to open file!");
$txt = implode(' == ',$pfData);
fwrite($myfile, $txt);
fclose($myfile);
 
// Posted variables from ITN

  
$mydb = Syspage::getdb();

//update db
$order_id = $pfData['m_payment_id'];


		$orderObj=new Orders();
		$order_info1=$orderObj->getOrderById($order_id);
		//print_r($order_info1);

		//echo "<pre>";
		//print_r($order_info);
		//print_r($order_info1);
		//echo $user_details['totUserBalance'];
		//exit;
		
			$cartObj=new Cart();
			$cartObj->clear();
			$cartObj->updateUserCart();
			
			/**
			* 
			* @var  rajendra
			*       line : 342 to 357
			* 
			*/
			
			
			
			
			

	
 $payment_status= '0';
 $payment_status_name= 'Pending'; 			 
 
 $ordered_product_status='1';
 
 		 
switch( $pfData['payment_status'] )
{
 case 'COMPLETE':
 
 	$payment_status= '1';
 	$ordered_product_status='2';
 	$payment_status_name= 'Completed';
 	 
 	//$emailNotificationObj=new Emailnotifications();
 	//$emailNotificationObj->New_Order_Buyer_Admin($order_id);	
 	//$emailNotificationObj->New_Order_Vendor($order_id);	
 break;
 case 'FAILED':
	$payment_status= '0';
	$payment_status_name= 'Failed';
    // There was an error, update your application
 break;
 default:

    // If unknown status, do nothing (safest course of action)
 break;
}


$query3="UPDATE tbl_order_products SET opr_status ='$ordered_product_status'  WHERE opr_order_id='".$order_info1['order_id']."'";
$mydb->query($query3);

$query1="UPDATE tbl_orders SET order_payment_status='$payment_status', order_status ='1'  WHERE order_id='".$order_info1['order_id']."'";
$mydb->query($query1);


$query2="insert into tbl_order_payments (
	op_order_id, 
	op_payment_method, 
	op_gateway_txn_id, 
	op_amount, 
	op_gateway_status, 
	op_comments, 
	op_gateway_response, 
	op_date 
	) 
	
	values (
	'".$order_id."', 
	'payfast', 
	'".$pfData['pf_payment_id']."', 
	'".$pfData['amount_gross']."', 
	'".$pfData['payment_status']."', 
	'".$pfData['payment_status']."', 
	'".$pfData['payment_status']."', 
	'".date('Y-m-d H:i')."'  
	
	) ";
 
$mydb->query($query2);
 
//For status History with notification 16 Aug 2018
if ($orderObj->addOrderHistory($order_id, 1, "-NA-", true)) {
    $sub_orders = $orderObj->getChildOrders(array("order" => $order_id));
    foreach ($sub_orders as $subkey => $subval) {
        $orderObj->addChildOrderHistory($subval["opr_id"], $ordered_product_status, '', true);
    }
}

    $emailNotificationObj=new Emailnotifications();
	$emailNotificationObj->New_Order_Vendor($order_id);	//Added 14-sep-2018


  
	 
}



public function send($order_id) {

		$pmObj=new Paymentsettings($this->key_name);

		$payment_settings=$pmObj->getPaymentSettings();

		$post = Syspage::getPostedVar();

		$orderPaymentObj=new OrderPayment($order_id);

		$order_info=$orderPaymentObj->getOrderPrimaryinfo();
		$order_info1=$orderPaymentObj->getOrderById($order_id);

		//echo "<pre>";
		//print_r($order_info);
		//print_r($order_info1);
		
		
		//echo $user_details['totUserBalance'];
		//exit;
		
		if ($order_info && $order_info1){

			$cartObj=new Cart();

			$cartObj->clear();

			$cartObj->updateUserCart();
			
			
			/**
			* 
			* @var  rajendra
			*       line : 342 to 357
			* 
			*/
			
			$order_user_id=$order_info1['order_user_id'];
			$userObj=new User($order_user_id);
			$user_details=$userObj->getUserById($order_user_id,array("status"=>1));
		
			
			if($order_info1['order_wallet_selected']=='1')
			{
				$orderPaymentObj->chargeUserWallet($user_details['totUserBalance'],$order_info1['order_id']);
			}
			

			$comment  = Utilities::getLabel('M_PAYMENT_INSTRUCTIONS') . "\n\n";

			//$comment .= $payment_settings["bank_details"] . "\n\n";

			$comment .= Utilities::getLabel('M_PAYMENT_NOTE');

			$orderPaymentObj->addOrderPaymentComments($comment);

			$json['redirect'] = Utilities::generateUrl('custom','payment_success');

		}else{

			$json['error'] = 'Invalid Request.';

		}

		curl_close($curl);

		echo json_encode($json);

	}



public function payment_notify()
{

header( 'HTTP/1.0 200 OK' );
flush();
$mydb = Syspage::getdb();

// Posted variables from ITN
$pfData = $_POST;
//update db
$order_id = $pfData['m_payment_id'];


$res=$mydb->query("select * from tbl_subscription_merchant_package_orders where mporder_id = '".$order_id."' limit 1");
$order_info=$mydb->fetch_all($res);

$res=$mydb->query("select * from tbl_subscription_merchant_packages where merchantpack_id = '".$order_info[0]['mporder_merchantpack_id']."' limit 1");
$main_package=$mydb->fetch_all($res);

$res=$mydb->query("select * from tbl_subscription_merchant_sub_packages where merchantsubpack_id = '".$order_info[0]['mporder_merchantsubpack_id']."' limit 1");
$sub_package=$mydb->fetch_all($res);
 
 $payment_status= '1';
 $payment_status_name= 'Pending'; 			 
 		 
switch( $pfData['payment_status'] )
{
 case 'COMPLETE':
 
 	//$payment_status= '6';
 	$payment_status= '2';
 	$payment_status_name= 'Completed';
 	$subscription_date= date('Y-m-d', strtotime("+".$sub_package[0]['merchantsubpack_subs_frequency']." days"));
 	$start_date=date('Y-m-d');
	$paid_status='1';
 	
 	//14 aug 2018
 	$cmObj = new Commissions();
    $arr['commission_setting'][] = array('vendor_id' => (int) $order_info[0]['mporder_user_id'], 'fees' => $order_info[0]['mporder_merchantpack_commission']);
    $cmObj->addUpdateCommissionSettings($arr);
    
            //     $update_prev_commission = $mydb->query("UPDATE tbl_commission_settings SET "
            //                 . "commsetting_is_deleted='1' "
            //                 . "WHERE commsetting_vendor='" . $order_info['mporder_user_id'] . "'");
            // $insert_new_commission = $mydb->query("INSERT INTO tbl_commission_settings (commsetting_vendor,commsetting_fees,commsetting_is_deleted) VALUES ('" . $order_info['mporder_user_id'] . "', '" . $order_info['mporder_merchantpack_commission'] . "', '0')");

 		
 break;
 case 'FAILED':
	$payment_status= '3';
	$payment_status_name= 'Failed';
	$subscription_date="";
	$start_date="";
	$paid_status='0';
    // There was an error, update your application
 break;
 default:

    // If unknown status, do nothing (safest course of action)
 break;
}


$mydb->query("insert into tbl_subscription_merchant_package_transactions (mptran_mporder_id, mptran_mode, mptran_date, mptran_gateway_transaction_id, mptran_amount, mptran_gateway_charges, mptran_payment_type, mptran_payment_status, mptran_active_from, mptran_active_till) VALUES ('".$pfData['m_payment_id']."', 'PayFast', '".date('Y-m-d')."', '".$pfData['pf_payment_id']."', '".$pfData['amount_gross']."', '".$pfData['amount_fee']."', 'instant', '".$payment_status_name."', '".$start_date."', '".$subscription_date."' ) ");
 		
 		
 		
 		
//$mydb->query("UPDATE  tbl_subscription_merchant_package_orders SET mporder_mpo_status_id = '".$payment_status."', mporder_date_updated = '".date('Y-m-d')."', mporder_subscription_start_date = '".$start_date."', mporder_subscription_end_date ='".$subscription_date."' where mporder_id = '".$order_id."' ");
 
             $mydb->query("UPDATE  tbl_subscription_merchant_package_orders SET "
                    . "mporder_mpo_status_id = '" . $payment_status . "', "
                    . "mporder_date_updated = '" . date('Y-m-d') . "', "
                    . "mporder_subscription_start_date = '" . $start_date . "', "
                    . "mporder_subscription_end_date ='" . $subscription_date . "', "
                    . "mporder_payment_status = '" . $paid_status . "', "// added on 13 aug 2018
                    . "mporder_payment_method = 'PayFast'"// added on 13 aug 2018
                    . "where mporder_id = '" . $order_id . "' ");
		
 		
	 
}


public function package_callback() {
	$post = Syspage::getPostedVar();
	foreach ($post as $key => $value) {
		$request .= '&' . $key . '=' . urlencode(html_entity_decode($value, ENT_QUOTES, 'UTF-8'));
	}	
	//mail('ravibhalla@dummyid.com','PayPal Subscription IPN',$request);
		
	$pmObj=new SubscriptionPaymentsettings($this->key_name);
	$payment_settings=$pmObj->getPaymentSettings();
	$post = Syspage::getPostedVar();
	$order_id = (isset($post['custom']))?$post['custom']:0;
	$orderPaymentObj=new SubscriptionOrderPayment($order_id);
	$order_info=$orderPaymentObj->getOrderPrimaryinfo();
	$payment_gateway_charge=$orderPaymentObj->getOrderPaymentGatewayAmount();
	$recurring_payment_gateway_charge=$orderPaymentObj->getRecurringOrderPaymentGatewayAmount();
	if ($order_info){
		$request = 'cmd=_notify-validate';
		foreach ($post as $key => $value) {
			$request .= '&' . $key . '=' . urlencode(html_entity_decode($value, ENT_QUOTES, 'UTF-8'));
		}
		if ($payment_settings["transaction_mode"]==1) {
			$curl = curl_init('https://www.paypal.com/cgi-bin/webscr');
		} elseif ($payment_settings["transaction_mode"]==0) {
			$curl = curl_init('https://www.sandbox.paypal.com/cgi-bin/webscr');
		}
		curl_setopt($curl, CURLOPT_POST, true);
		curl_setopt($curl, CURLOPT_POSTFIELDS, $request);
		curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);
		curl_setopt($curl, CURLOPT_HEADER, false);
		curl_setopt($curl, CURLOPT_TIMEOUT, 30);
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
		$response = curl_exec($curl);
		if ((strcmp($response, 'VERIFIED') == 0)) {
			$subscription_payment_status = 0;
			switch(strtoupper($post['txn_type'])) {
				case 'SUBSCR_CANCEL':
					$subscription_status_id = $payment_settings['order_status_cancelled'];
				break;
				case 'SUBSCR_SIGNUP':
					$subscription_status_id = $payment_settings['order_status_signup'];
					$orderPaymentObj->addOrderPayment($payment_settings["subscriptionpmethod_name"],$post['txn_id'],$post['mc_gross'],Utilities::getLabel("L_Subscription_Signed_Up"),$request,false);
					
					/* Cancel old previous active subscription[  */
					$subscription_order_info=$orderPaymentObj->getSubscriptionOrderById($order_id);
					if( $subscription_order_info['mporder_old_mporder_id'] > 0 ){
						$old_order_info = $orderPaymentObj->getSubscriptionOrderById( $subscription_order_info['mporder_old_mporder_id'] );
						if( $old_order_info && $old_order_info['mporder_gateway_subscription_id'] != '' ){
							if( strpos($old_order_info['mporder_gateway_subscription_id'],'FREE') === FALSE ){
								$ppExpObj = new PaypalStandard();
								$subscription_cancelation_result = $ppExpObj->recurringCancel( $old_order_info['mporder_gateway_subscription_id'] );
								if( isset($subscription_cancelation_result['PROFILEID']) ) {
								$order_update_arr = array( 'mporder_mpo_status_id' => Settings::getSetting("CONF_CANCELLED_SUBSCRIPTION_STATUS") );
								$orderPaymentObj->updateOrderInfo( $old_order_info['mporder_id'], $order_update_arr);
							}
						} else {
							$order_update_arr = array( 'mporder_mpo_status_id' => Settings::getSetting("CONF_CANCELLED_SUBSCRIPTION_STATUS") );
							$orderPaymentObj->updateOrderInfo( $old_order_info['mporder_id'], $order_update_arr);
							
						}
						$orderPaymentObj->addOrderHistory( $old_order_info['mporder_id'], Settings::getSetting("CONF_CANCELLED_SUBSCRIPTION_STATUS"),'',true );
					}
					
				}
		
					
				break;
				case 'SUBSCR_PAYMENT':
						$mptran_active_from = date("Y-m-d H:i:s");
						$days =  $order_info['mporder_merchantsubpack_subs_frequency'];
						$mptran_active_till = date('Y-m-d H:i:s', strtotime("+".$days." Day", strtotime(date("Y-m-d H:i:s"))));
						$paypal_transaction_data = array(
							'mptran_mporder_id'		=>	$order_id,
							'mptran_mode'			=>	$this->key_name,
							'mptran_gateway_transaction_id'	=>	$post['txn_id'],
							'mptran_payment_type'			=>	$post['payment_type'],
							'mptran_gateway_parent_transaction_id'	=>	$post['parent_txn_id'],
							'mptran_gateway_response'	=>	serialize($post),
							'mptran_amount'			=>	$post['mc_gross'],
							'mptran_gateway_charges'	=>	$post['payment_fee'],
							'mptran_payment_status'	=>	$post['payment_status'],
							'mptran_pending_reason'	=>	$post['pending_reason'],
							'mptran_recurring_type'	=>	'-1', //NA
							'mptran_active_from' 			=>	$mptran_active_from,
							'mptran_active_till'			=>	$mptran_active_till,
							);
						$packageTxnObj = new PackageTransactions();
						if( !$packageTxnObj->addTransaction($paypal_transaction_data) ){
							$this->log($paypal_transaction_data, "Could Not Save Package Transaction Data");
						}
			
					$orderPaymentObj->addOrderPayment($payment_settings["subscriptionpmethod_name"],$post['txn_id'],$post['mc_gross'],Utilities::getLabel("L_Payment_Received"),$request,1);
					$subscription_status_id = $payment_settings['order_status_payment'];
				break;
				case 'SUBSCR_FAILED':
					$subscription_status_id = $payment_settings['order_status_failed'];
				break;
				case 'SUBSCR_EOT':
					$subscription_status_id = $payment_settings['order_status_eot'];
				break;
				default:
					$subscription_status_id = $payment_settings['order_status_others'];
				break;
			}
			$order_update_arr = array(
				'mporder_mpo_status_id'	=>	$subscription_status_id, 
				'mporder_gateway_subscription_id' =>	$post['subscr_id'],
				); 
			if( !$orderPaymentObj->updateOrderInfo( $order_id, $order_update_arr) ){
				$this->log($order_update_arr, "Could Not Save Package Order Data");
			}
			$orderPaymentObj->addOrderHistory( $order_id, $subscription_status_id,'',true );
			
						
			$payment_gateway_response_data = array(
				'subgatewaytxn_mporder_id'		=>	$order_id,
				'subgatewaytxn_mode'			=>	$this->key_name,
				'subgatewaytxn_transaction_id'	=>	$post['txn_id'],
				'subgatewaytxn_response'	=>	serialize($post),
				'subgatewaytxn_amount'			=>	$post['mc_gross'],
				'subgatewaytxn_status'	=>	$post['payment_status'],
				);
			
			if( !$orderPaymentObj->addPaymentGatewayResponse($payment_gateway_response_data) ){
				$this->log($payment_gateway_response_data, "Could Not Save Package Transaction Data");
			}
			
			
		}else{
			//mail('ravibhalla@dummyid.com','IPN Not Verified','IPN Not Verified');
		}
		curl_close($curl);
	}
	
	}
	
	private function log($data, $title = null) {
		Paymentmethods::writeLog('PayPal Express debug ('.$title.'): '.json_encode($data));
	}
}
