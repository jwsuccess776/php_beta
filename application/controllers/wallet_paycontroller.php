<?php
class Wallet_payController extends PaymentController{
	public function recharge($recharge_id){
		$wrObj=new WalletRecharge();
		$recharge_info = $wrObj->getWalletRequests(array("id"=>$recharge_id,"status"=>0,"pagesize"=>1));
		if ($recharge_info==false){
			Message::addErrorMessage(Utilities::getLabel('M_INVALID_WALLET_REQUEST_PAID_CANCELLED'));
			Utilities::redirectUserReferer();
		}
		$ppcpaymentMethodObj=new PPCPaymentMethods();
		$this->set('payment_methods',$ppcpaymentMethodObj->getPaymentMethods(array("status"=>1)));
		$this->set('recharge_info',$recharge_info);
		$this->set('recharge_id',$recharge_id);
		$this->_template->render(true,false);	
	}
	function payment_tab($recharge_id,$ppcpmethod_id){
		$wrObj=new WalletRecharge();
		$recharge_info = $wrObj->getWalletRequests(array("id"=>$recharge_id,"status"=>0,"pagesize"=>1));
		if ($recharge_info==false)
			$this->set('error', Utilities::getLabel('M_INVALID_WALLET_REQUEST_PAID_CANCELLED'));
		$this->set('recharge_info',$recharge_info);
		$ppcpaymentMethodObj=new PPCPaymentMethods();
		$payment_method=$ppcpaymentMethodObj->getData($ppcpmethod_id);
		$this->set('payment_method',$payment_method);
		$frm=new Form('frmPaymentTabForm','frmPaymentTabForm');
		$frm->setExtra('class="siteForm"');
		$frm->setAction(Utilities::generateUrl(strtolower(str_replace("_","",$payment_method["ppcpmethod_code"]))."_pay",'charge_for_wallet',array($recharge_id)));
		$frm->setFieldsPerRow(1);
		$frm->addHiddenField('', 'recharge_id',$recharge_id);
		$fld=$frm->addSubmitButton('','btn_submit',Utilities::getLabel('M_Confirm_Payment'),'button-confirm','class="btn primary-btn"');
		$fld->merge_caption=true;
		$this->set('frm',$frm);
		$this->_template->render(false,false);	
	}
	public function confirm_recharge() {
		$post = Syspage::getPostedVar();
		$json = array();
		if (isset($post['recharge_id'])) {
			$recharge_id=$post['recharge_id'];
			$wrObj=new WalletRecharge();
			$recharge_info = $wrObj->getWalletRequests(array("id"=>$recharge_id,"user"=>User::getLoggedUserId(),"status"=>0,"pagesize"=>1));
			if ($recharge_info){
				$json['success'] = 1;
			}else{
				$json['error'] = Utilities::getLabel('M_ERROR_INVALID_REQUEST');
			}
		}
		echo json_encode($json);
	}
	public function send() {
		$post = Syspage::getPostedVar();
		$order_id=$_SESSION['shopping_cart']["order"];
		$orderObj=new Orders();
		$order_info = $orderObj->getOrderById($order_id,array("payment_status"=>0));
		$_SESSION['order_criteo'] = $order_info['order_id'];
		
		/*echo '<pre>';
		print_r($order_info);
		exit;*/
		$payment_itm = array();
		$payment_itm_gtag = array();
		$payment_itm_price = array();
		if ($order_info){
			/**************** Start Reduce Reward Points of Buyer *********************/
			if ($order_info['order_reward_points']>0){
				$rewardObj=new Rewards();
				$rewardArray=array(
					"urp_user_id"=>$order_info['order_user_id'],
					"urp_referrer_id"=>0,
					"urp_points"=>(int)-$order_info['order_reward_points'],
					"urp_description"=>sprintf(Utilities::getLabel('L_Used_Reward_Points_Order_Invoice_Number'),'<i>'.$order_info['order_invoice_number'].'</i>'),
					);
				if($reward_point_id = $rewardObj->addRewardPoints($rewardArray)){
					$emailNotificationObj=new Emailnotifications();
					$emailNotificationObj->sendRewardPointsNotification($reward_point_id);
				}else{
					$this->error=$rewardObj->getError();
					return false;
				}
			}
			/**************** End Reduce Reward Points of Buyer *********************/
			$cartObj=new Cart();
			$cartObj->clear();
			$cartObj->updateUserCart();
			$order_payment_financials=$orderObj->getOrderPaymentFinancials($order_id);	
			/* Charging User Credits */
			if ($order_payment_financials["order_credits_charge"]>0){
				$orderPaymentObj=new OrderPayment($order_id);
				$orderPaymentObj->chargeUserWallet($order_payment_financials["order_credits_charge"],$order_id);
				


 // wallet add 2% extra in order start
 
 		$mydb = Syspage::getdb();
		$commission_query="select * from tbl_order_products where opr_order_id = ".$order_id." ";
		//echo $commission_query;
		$commission_dets=$mydb->query($commission_query);
		//print_r($commission_dets);
		if($commission_dets->num_rows>0)
		{
			$commission_res=$mydb->fetch_all($commission_dets);
			foreach($commission_res as $com_row)
			{
				//print_r($com_row);
				
				$opr_id=$com_row['opr_id'];

				 $payment_itm[] = array(
			      'id'=>'sellsa-'.$com_row['opr_product_id'],
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
				
				$opr_commission_percentage = $opr_commission_percentage + 2;
				
				$new_commision_charged =  ($opr_net_charged * 2)/100;
				
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
				
				$new_commission_charge= ($order_net_charged * 2)/100;
				
				$old_order_site_commission = $old_order_site_commission + $new_commission_charge;
				
				$order_update_query="UPDATE tbl_orders SET order_site_commission ='$old_order_site_commission' WHERE order_id='".$order_id."'";
				$mydb->query($order_update_query);
				
			}
			//print_r($result);
			
		}

 
 
 
 // wallet add 2% extra in order end


					
			}
			$json['redirect'] = Utilities::generateUrl('custom','payment_success');
		}else{
			$json['error'] = Utilities::getLabel('M_Invalid_Request');;
		}

		$_SESSION['criteo_session'] = json_encode($payment_itm);
		$_SESSION['gtag_session'] = json_encode($payment_itm_gtag);
		$_SESSION['gtag_session_price'] = json_encode($payment_itm_price);
		curl_close($curl);
		echo json_encode($json);
	}
}
