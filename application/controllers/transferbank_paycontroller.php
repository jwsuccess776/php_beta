<?php

class TransferBank_payController extends PaymentController{

	private $key_name="TransferBank";

	private function getPaymentForm($order_id){

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

	 
		$fld=$frm->addHtml('', 'htmlNote','<div class="alert alert-info">'.nl2br($payment_settings["bank_details"]).'</div>');
		//$fld=$frm->addHtml('', 'htmlNote',$myhtml);

		$fld->merge_caption=true;

		$frm->addSubmitButton('','btn_submit',"Confirm Order",'button-confirm');

		$frm->setJsErrorDisplay('afterfield');

		return $frm;

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

			
$myhtml = '
<table style="font-size: 12px;">


	
	 <tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/absa.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/capitec.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
 	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/fnb.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/investec.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>

	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/nedbank.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>

	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/rmb.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/sellsa_eft.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> '.$referance.'	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	 
 
</table>
                  
  ';		
		//$fld=$frm->addHtml('', 'htmlNote','<div class="alert alert-info">'.nl2br($payment_settings["bank_details"]).'</div>');
		$fld=$frm->addHtml('', 'htmlNote',$myhtml);

		$fld->merge_caption=true;

		$frm->addSubmitButton('','btn_submit',"Confirm Order",'button-confirm');

		$frm->setJsErrorDisplay('afterfield');

		return $frm;

	}

	function charge($order_id){

		$pmObj=new Paymentsettings($this->key_name);

		if (!$payment_settings=$pmObj->getPaymentSettings()){

			Message::addErrorMessage($pmObj->getError());

			Utilities::redirectUserReferer();

		}

		$orderPaymentObj=new OrderPayment($order_id);

		$payment_amount=$orderPaymentObj->getOrderPaymentGatewayAmount();

		$order_info=$orderPaymentObj->getOrderPrimaryinfo();
 
		if ($order_info && $order_info["order_payment_status"]==0){

			$frm=$this->getPaymentForm_($order_id,$order_info['reference']);

			$this->set('frm', $frm);

			$this->set('payment_amount', $payment_amount);

		}else{

			$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));

		}

		$this->set('order_info', $order_info);

		$this->_template->render(true,false);	

	}

	private function getWalletPaymentForm($recharge_txn_id){

		$frm=new Form('frmPaymentForm','frmPaymentForm');

		$frm->setRequiredStarWith('x');

		$frm->setValidatorJsObjectName('system_validator');

		$frm->setExtra('class="siteForm" validator="system_validator" ');

		$frm->setAction(Utilities::generateUrl('TransferBank_pay','send_wallet_recharge',array($recharge_txn_id)));

		$frm->captionInSameCell(true);

		$frm->setFieldsPerRow(1);

		$pmObj=new PPCPaymentsettings($this->key_name);

		$payment_settings=$pmObj->getPaymentSettings();

		$fld=$frm->addHtml('', 'htmlNote',Utilities::getLabel('M_Bank_Transfer_Note'));

		$fld->merge_caption=true;

		$fld=$frm->addHtml('', 'htmlNote','<div class="alert alert-info">'.nl2br($payment_settings["bank_details"]).'</div>');

		$fld->merge_caption=true;

		$frm->addSubmitButton('','btn_submit',Utilities::getLabel('L_Return_Back_to_My_Account'),'button-confirm');

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

	public function send_wallet_recharge($recharge_txn_id) {

		Message::addMessage(Utilities::getLabel('M_transfer_fund_bank'));

		Utilities::redirectUser(Utilities::generateUrl('account', 'credits'));	

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

			$comment .= $payment_settings["bank_details"] . "\n\n";

			$comment .= Utilities::getLabel('M_PAYMENT_NOTE');

			$orderPaymentObj->addOrderPaymentComments($comment);

			$json['redirect'] = Utilities::generateUrl('custom','payment_success');

		}else{

			$json['error'] = 'Invalid Request.';

		}

		curl_close($curl);

		echo json_encode($json);

	}

}

