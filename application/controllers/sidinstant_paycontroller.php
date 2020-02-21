<?php
class Sidinstant_paycontroller extends PaymentController{
	private $key_name="sidinstant";
	public function recurringPayments() {
	/** Used by the checkout to state the module * supports recurring. */
	return true;
	}
 
function charge($order_id){
 
	
	
	
/*ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);*/

		$payment_itm = array();
		 $payment_itm_gtag = array();
                $payment_itm_price = array();

		$_SESSION['order_criteo'] = $order_id;

		unset($_SESSION['shopping_cart']);
		$pmObj=new Paymentsettings($this->key_name);

		if (!$payment_settings=$pmObj->getPaymentSettings()){
			Message::addErrorMessage($pmObj->getError());
			Utilities::redirectUserReferer();
		}

		$orderPaymentObj=new OrderPayment($order_id);
		$payment_amount=$orderPaymentObj->getOrderPaymentGatewayAmount();
		$order_info=$orderPaymentObj->getOrderPrimaryinfo();
 
 
 $myorder=new Orders($order_id); 
 $myorderinfo=$myorder->getOrderById($order_id);
 /*echo '<pre>';
 print_r($myorderinfo);
 exit;
*/
//echo '<pre>';
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

 

		if ($order_info && $order_info["order_payment_status"]==0){
			/*echo "<pre>";print_r($frm);exit;*/
			$this->set('payment_amount', $payment_amount);
		}else{
			$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
		}
		
		/*
		echo '<pre>';
		print_r($order_info);
		echo '</pre>';
		exit;*/
		$this->set('order_info', $order_info);
		
		 $_SESSION['criteo_session'] = json_encode($payment_itm);
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


            $myorder = new Orders($order_id);
            $myorderinfo = $myorder->getOrderById($order_id);
            /* echo '<pre>';
              print_r($myorderinfo);
              exit;
             */
//echo '<pre>';
            $mydb = Syspage::getdb();
            $commission_query = "select * from tbl_order_products where opr_order_id = " . $order_id . " ";
            //echo $commission_query;
            $commission_dets = $mydb->query($commission_query);
            //print_r($commission_dets);
            if ($commission_dets->num_rows > 0)
            {
                $commission_res = $mydb->fetch_all($commission_dets);
                foreach ($commission_res as $com_row)
                {
                    //print_r($com_row);

                    $opr_id = $com_row['opr_id'];
                    $opr_commission_charged = $com_row['opr_commission_charged_static'];
                    $opr_commission_percentage = $com_row['opr_commission_percentage_static'];
                    $opr_net_charged = $com_row['opr_net_charged'];
                    
                    $opr_commission_percentage = $opr_commission_percentage + 2;

                    $new_commision_charged = ($opr_net_charged * 2) / 100;

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

                    $new_commission_charge = ($order_net_charged * 2) / 100;

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

            /*
              echo '<pre>';
              print_r($order_info);
              echo '</pre>';
              exit; */
            $this->set('order_info', $order_info);


            $this->_template->render(true, false);
        }


 
public function merchant_notification()
{
/*
$myfile = fopen("sid_pay122.txt", "w") or die("Unable to open file!");
$txt = implode(' | ',$_POST);
foreach($_POST as $key=>$val)
{
	$txt.=' | '.$key.' = '.$val;
}
fwrite($myfile, $txt);
fclose($myfile);
// echo 'created';*/
 
 
 

 
header( 'HTTP/1.0 200 OK' );
$post_data = $_POST;
$mydb = Syspage::getdb();

$pfData = $_POST;
if( isset($pfData['SID_CUSTOM_01']) && $pfData['SID_CUSTOM_01']=="Product") // order product payament
{
	$order_id = $pfData['SID_REFERENCE'];
	$orderObj=new Orders();
	$order_info1=$orderObj->getOrderById($order_id);
		
	$payment_status= '0';
	$payment_status_name= 'Pending'; 			  
	$ordered_product_status='1';
	switch( $pfData['SID_STATUS'] )
	{
	 case 'COMPLETED':
	 
	 	$payment_status= '1';
	 	$ordered_product_status='2';
	 	$payment_status_name= 'Completed';
	 	 
	 	//$emailNotificationObj=new Emailnotifications();
	 	//$emailNotificationObj->New_Order_Buyer_Admin($order_id);	
	 	//$emailNotificationObj->New_Order_Vendor($order_id);	
	 	
	 	
	 	
	 	
	 	
	 	
	 	
	 break;
	 case 'CANCELLED':
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
		'sidinstant', 
		'".$pfData['SID_TNXID']."', 
		'".$pfData['SID_AMOUNT']."', 
		'".$pfData['SID_STATUS']."', 
		'".$pfData['SID_STATUS']."', 
		'".$pfData['SID_STATUS']."', 
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
elseif(isset($pfData['SID_CUSTOM_01']) && $pfData['SID_CUSTOM_01']=="Subscription")
{
	$order_id = $pfData['SID_REFERENCE'];
	$res=$mydb->query("select * from tbl_subscription_merchant_package_orders where mporder_id = '".$order_id."' limit 1");
	$order_info=$mydb->fetch_all($res);

	$res=$mydb->query("select * from tbl_subscription_merchant_packages where merchantpack_id = '".$order_info[0]['mporder_merchantpack_id']."' limit 1");
	$main_package=$mydb->fetch_all($res);

	$res=$mydb->query("select * from tbl_subscription_merchant_sub_packages where merchantsubpack_id = '".$order_info[0]['mporder_merchantsubpack_id']."' limit 1");
	$sub_package=$mydb->fetch_all($res);
	
	$payment_status= '1';
 	$payment_status_name= 'Pending'; 
 	switch( $pfData['SID_STATUS'] )
 	{
		case 'COMPLETED':
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

            // $update_prev_commission = $mydb->query("UPDATE tbl_commission_settings SET "
            //                 . "commsetting_is_deleted='1' "
            //                 . "WHERE commsetting_vendor='" . $order_info['mporder_user_id'] . "'");
            // $insert_new_commission = $mydb->query("INSERT INTO tbl_commission_settings (commsetting_vendor,commsetting_fees,commsetting_is_deleted) VALUES ('" . $order_info['mporder_user_id'] . "', '" . $order_info['mporder_merchantpack_commission'] . "', '0')");


		 break;
		 case 'CANCELLED':
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
	
	
	$mydb->query("insert into tbl_subscription_merchant_package_transactions (mptran_mporder_id, mptran_mode, mptran_date, mptran_gateway_transaction_id, mptran_amount, mptran_gateway_charges, mptran_payment_type, mptran_payment_status, mptran_active_from, mptran_active_till) VALUES ('".$pfData['SID_REFERENCE']."', 'SidInstant', '".date('Y-m-d')."', '".$pfData['SID_TNXID']."', '".$pfData['amount_gross']."', '".$pfData['SID_AMOUNT']."', 'instant', '".$payment_status_name."', '".$start_date."', '".$subscription_date."' ) ");


	
	//$mydb->query("UPDATE  tbl_subscription_merchant_package_orders SET mporder_mpo_status_id = '".$payment_status."', mporder_date_updated = '".date('Y-m-d')."', mporder_subscription_start_date = '".$start_date."', mporder_subscription_end_date ='".$subscription_date."' where mporder_id = '".$order_id."' ");
            $mydb->query("UPDATE  tbl_subscription_merchant_package_orders SET "
                    . "mporder_mpo_status_id = '" . $payment_status . "', "
                    . "mporder_date_updated = '" . date('Y-m-d') . "', "
                    . "mporder_subscription_start_date = '" . $start_date . "', "
                    . "mporder_subscription_end_date ='" . $subscription_date . "', "
                    . "mporder_payment_status = '" . $paid_status . "', "// added on 13 aug 2018
                    . "mporder_payment_method = 'SidInstant' "// added on 13 aug 2018
                    . "where mporder_id = '" . $order_id . "' ");


 
}
elseif(isset($pfData['SID_CUSTOM_01']) && $pfData['SID_CUSTOM_01']=="Wallet")
{
/*	
$myfile = fopen("sid_pay_for_wallet.txt", "w") or die("Unable to open file!");
foreach($_POST as $key=>$val)
{
	$txt.=' | '.$key.' = '.$val;
}
fwrite($myfile, $txt);
fclose($myfile);
*/
 
	$order_id = $pfData['SID_REFERENCE'];
	//$payment_settings=$pmObj->getPaymentSettings();
	
	$db = Syspage::getdb();    
	$query = "SELECT * FROM tbl_recharge_wallet_requests WHERE rwr_id = '".$order_id."' limit 1";
	$rs = $db->query($query);
	$current_row=$db->fetch_all($rs);
    
	        
	
	$payment_status= '1';
 	$payment_status_name= 'Pending'; 
 	switch( $pfData['SID_STATUS'] )
 	{
		case 'COMPLETED':
		 	$payment_status= '6';
		 	$payment_status_name= 'Completed';
		 	
				
		$utxn_status=1;
		$rwr_comments='Received credits for <a href="javascript:">#'.$current_row[0]['rwr_invoice_number'].' </a>';
		$query="INSERT INTO tbl_user_transactions (utxn_user_id, utxn_date, utxn_credit,utxn_debit,utxn_comments,utxn_status,utxn_order_id,utxn_withdrawal_id)
VALUES ('".$current_row[0]['rwr_member_id']."', '".$current_row[0]['rwr_date']."', '".$current_row[0]['rwr_amount']."', '0.0000', '".$rwr_comments."',1,'0', '0')"	;
		$db->query($query);
		
		
		$query="UPDATE tbl_recharge_wallet_requests SET rwr_payment_status='Paid' WHERE rwr_id=$order_id";
		$db->query($query);
		
	
		 break;
		 case 'CANCELLED':
			$payment_status= '3';
			$payment_status_name= 'Failed';
			// There was an error, update your application
			//$order_payment_status = $payment_settings['txn_status_others'];
			
		 break;
		  default:

    		// If unknown status, do nothing (safest course of action)
 		break;
	}
	

	
 
} 	 
}


public function order_payment_notify()
{

$myfile = fopen("sid_pay333.txt", "w") or die("Unable to open file!");
$txt = 'hello working';
fwrite($myfile, $txt);
fclose($myfile);
//exit;

header( 'HTTP/1.0 200 OK' );
$post_data = $_POST;

/*
$str="";
foreach($post_data as $key=>$pd)
{
	$str.= ' key = '.$key.' value = '.$pd.' /n \n';
}
*/
//$post_str=implode(', ',$post_data);
 
 
 
 
 
 
header( 'HTTP/1.0 200 OK' );
$mydb = Syspage::getdb();

$pfData = $_POST;
$order_id = $pfData['SID_REFERENCE'];


$orderObj=new Orders();
$order_info1=$orderObj->getOrderById($order_id);
	
$payment_status= '0';
$payment_status_name= 'Pending'; 			  
$ordered_product_status='1';
switch( $pfData['SID_STATUS'] )
{
 case 'COMPLETED':
 
 	$payment_status= '1';
 	$ordered_product_status='2';
 	$payment_status_name= 'Completed';
 	 
 	$emailNotificationObj=new Emailnotifications();
 	$emailNotificationObj->New_Order_Buyer_Admin($order_id);	
 	$emailNotificationObj->New_Order_Vendor($order_id);	
 break;
 case 'CANCELLED':
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
	'sidinstant', 
	'".$pfData['SID_TNXID']."', 
	'".$pfData['SID_AMOUNT']."', 
	'".$pfData['SID_STATUS']."', 
	'".$pfData['SID_STATUS']."', 
	'".$pfData['SID_STATUS']."', 
	'".date('Y-m-d H:i')."'  
	
	) ";
 
 

$mydb->query($query2);
  
	 
}



public function sid_payment()
{
	/*echo '<pre>';
	print_r($_POST);
	print_r($_GET);*/
	if(isset($_POST) && count($_POST)>0)
	{ 
		$post=$_POST;
		if($post['SID_STATUS']=='CANCELLED')
		{
			echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_failed";</script>';
		}
	}
	 
	echo '<script>window.location = "https://www.sellsa.co.za/custom/payment_success";</script>';
	
	
	//	echo '<script>window.location = "https://sellsa.co.za/custom/payment_success";</script>';
}
/*
public function payment_success()
{
	echo '<script>window.location = "https://sellsa.co.za/custom/payment_success";</script>';
}
*/
/*
public function payment_cancelled()
{
	echo '<script>window.location = "https://sellsa.co.za/custom/payment_failed";</script>';
}
*/


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
		$this->set('payment_amount', $payment_amount);
	}else{
		$this->set('error', Utilities::getLabel('M_INVALID_ORDER_PAID_CANCELLED'));
	}
	$this->set('recharge_txn_info', $recharge_txn_info);
	$this->_template->render(true,false);	
}


 
 
}
