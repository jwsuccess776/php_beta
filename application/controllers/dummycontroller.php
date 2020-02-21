<?php
class DummyController extends Controller{
	
	function p(){
		$prObj= new Products();
		$prObj->joinWithDetailTable();
		$prObj->joinWithCategoryTable();
		$prObj->joinWithBrandsTable();
		$prObj->addSpecialPrice();
		$prObj->joinWithDetailTable();
		$prObj->setPageSize(50);
		$arr = array('black','black phone','fashion','portable','sofa','clothing','shirt','white');
		$prObj->applyConditions(array('keyword'=>$arr[rand(0,count($arr))]));
		//$prObj->getProducts(array('name'=>$name));
		$prObj->selectFields('tp.*');
		
		echo($prObj->getquery()."<br/><br/>");
	}
		
	function info(){
		echo phpinfo();
	}
	
	function curl(){
		/*$result  = Utilities::curl_post('http://www.regcheck.org.uk/api/reg.asmx/CheckIndia',array('RegistrationNumber'=>'DL2CQ4191','username'=>'Nishant'));
		Utilities::printArray($result);*/
		
		$post = array('RegistrationNumber'=>'DL2CQ4191','username'=>'Nishant');
		$ch = curl_init('http://www.regcheck.org.uk/api/reg.asmx/CheckIndia');
		curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
		//curl_setopt($ch, CURLOPT_POSTFIELDS, $post);
		curl_setopt($ch,CURLOPT_POST,count($post));
		curl_setopt($ch,CURLOPT_POSTFIELDS, http_build_query($post));
		// execute!
		$response = curl_exec($ch);
		// close the connection, release resources used
		curl_close($ch);
		// do anything you want with your response
		var_dump($response);

	}
	
	
	/*function info($id){
		$p = new Products();
		$c = $p->getData($id);
		print_r($c);
		die();
	}*/
	//Owh84QFzQYWr2TmxN7tatA
	function sendgrid(){
		$this->addRecipienttoList();
		//$this->addRecipients('rbhalla'.rand(1,100).'@dummyid.com');
	}
	
	function addRecipienttoList(){
			//cmJoYWxsYTYxQGR1bW15aWQuY29t
			$url = 'https://api.sendgrid.com/v3/';
			$request =  $url.'contactdb/lists/985656/recipients/cmJoYWxsYTYxQGR1bW15aWQuY29t';  //12345 is list_id
			
			// Generate curl request
			$ch = curl_init();
			$userid = 'yokart';
			$userkey= 'welcome123';
			curl_setopt($ch, CURLOPT_HEADER, False);
			curl_setopt($ch, CURLOPT_POST, true);   
			curl_setopt($ch, CURLOPT_URL, $request);
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_TIMEOUT, 60);
			curl_setopt($ch, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
			curl_setopt($ch, CURLOPT_HTTPAUTH, CURLAUTH_BASIC ) ; 
			curl_setopt($ch, CURLOPT_USERPWD, $userid.':'.$userkey);  
			// Apply the JSON to our curl call
			$data = curl_exec($ch);
			if (curl_errno($ch)) {
			print "Error: " . curl_error($ch);
			} else {
			// Show me the result
			curl_close($ch);
			}
			var_dump($data);
			print_r($data);
		
	}
	
	function addRecipients($email){
			$url = 'https://api.sendgrid.com/v3/';
			$request =  $url.'contactdb/recipients';  //12345 is list_id
			$params = array(array(
				'email' => $email,
			));
			$userid = 'yokart';
			$userkey= 'welcome123';
			$json_post_fields = json_encode($params);
			// Generate curl request
			$session = curl_init($request);
			curl_setopt ($session, CURLOPT_POST, FALSE);
			// Tell curl that this is the body of the GET
			curl_setopt($session, CURLOPT_HTTPAUTH, CURLAUTH_BASIC ) ; 
			curl_setopt($session, CURLOPT_USERPWD, $userid.':'.$userkey); 
			// Tell curl not to return headers, but do return the response
			curl_setopt($session, CURLOPT_HEADER, False);
			curl_setopt($session, CURLOPT_HTTPHEADER,array('Content-Type: application/json')); 
			// Tell PHP not to use SSLv3 (instead opting for TLS)
			curl_setopt($session, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
			curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
			// Apply the JSON to our curl call
			curl_setopt($session, CURLOPT_POSTFIELDS, $json_post_fields);
			$data = curl_exec($session);
			if (curl_errno($session)) {
				print "Error: " . curl_error($session);
			} else {
			// Show me the result
			curl_close($ch);
			}
			print_r($data);
			//die($data->new_count."#");
	}
	function xlist(){
			$url = 'https://api.sendgrid.com/v3';
			$request =  $url.'/contactdb/recipients';
			// Generate curl request
			$userid = 'yokart';
			$userkey= 'welcome123';
			$params = array(array(
				'email' => 'amitkray@gmail.com',
				'first_name' => 'Amit',
				'last_name' => 'Kumar'
			));
			$json_post_fields = json_encode($params);
			
			$session = curl_init($request);
			// Tell curl to use HTTP get
			curl_setopt ($session, CURLOPT_POST, FALSE);
			// Tell curl that this is the body of the GET
			curl_setopt($session, CURLOPT_HTTPAUTH, CURLAUTH_BASIC ) ; 
			curl_setopt($session, CURLOPT_USERPWD, $userid.':'.$userkey); 
			// Tell curl not to return headers, but do return the response
			curl_setopt($session, CURLOPT_HEADER, False);
			curl_setopt($session, CURLOPT_HTTPHEADER,array('Content-Type: application/json')); 
			// Tell PHP not to use SSLv3 (instead opting for TLS)
			curl_setopt($session, CURLOPT_SSLVERSION, CURL_SSLVERSION_TLSv1_2);
			curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
			curl_setopt($ch, CURLOPT_POSTFIELDS, $json_post_fields);
			
			// obtain response
			$response = curl_exec($session);
			var_dump($response);
			curl_close($session);
	}
	
	function add_user_new($email) {
			$url = 'https://api.sendgrid.com/';
			 $user = 'yokart';
			 $pass = 'welcome123';
			
			 $params = array(
				  'api_user' => $user,
				  'api_key' => $pass,
				  'to' => $email,
				  'subject' => 'testing from sendgrid',
				  'html' => 'testing sendgrid',
				  'text' => 'testing sendgrid',
				  'from' => 'yokart@dummyid.com',
			   );
			
			 $request = $url.'api/mail.send.json';
			
			 // Generate curl request
			 $session = curl_init($request);
			
			 // Tell curl to use HTTP POST
			 curl_setopt ($session, CURLOPT_POST, true);
			
			 // Tell curl that this is the body of the POST
			 curl_setopt ($session, CURLOPT_POSTFIELDS, $params);
			
			 // Tell curl not to return headers, but do return the response
			 curl_setopt($session, CURLOPT_HEADER, false);
			 curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
			
			 // obtain response
			 $response = curl_exec($session);
			 curl_close($session);
			
			 // print everything out
			 print_r($response);
				}
	
	
	function example(){
		echo(Utilities::getLabel('M_CHARGED_TAX_COLLECTED_FOR_ORDER'));
		die(Utilities::getLabel('M_ERROR_DOWNLOAD_EXPIRED'));
		$this->_template->render();	
	}
	
	function payu_latem(){
		$this->_template->render(false,false);	
	}
	
	function test_abc($v){
		//return($v.$v);
		$str .= "'".$v."',";
		return substr($str,0,strlen($str)-1);
		//return $v;
	}
	
	
	function default_action(){
		$oObj=new Orders();
		$order_id = 1;
		$oObj->addChildOrderHistory($order_id,5,'TT','Y','T1');
		
		die(Utilities::getLabel('M_Buyer_Selected_Cash_on_delivery'));
		$this->db = Syspage::getdb();
		$pObj= new Products();
		$digital_files = $pObj->getProductDigitalFiles(1009);
		foreach($digital_files as $dgkey=>$dgval){
			if ($dgval["pfile_max_download_times"]!="-1")
				$downloadCount=$product["quantity"]*$dgval["pfile_max_download_times"];
			else
				$downloadCount=$dgval["pfile_max_download_times"];
			
			$values = array(
					'opf_opr_id'=>$inserted_item_id,
					'opf_file_download_name'=>$dgval['pfile_download_name'],
					'opf_file_name'=>$dgval["pfile_name"],
					'opf_file_max_download_times'=>$downloadCount,
					'opf_file_can_be_downloaded_within_days'=>$dgval['pfile_can_be_downloaded_within_days'],
					'opf_remaining_downloaded_times'=>$downloadCount,
				);
				if(!$this->db->insert_from_array('tbl_order_product_files', $values)){
					return false;
				}
		
		}
		die(Utilities::getLabel('L_Max_allowed_file_size'));
		$valid_mime_types = preg_replace('~\r?\n~', "\n", Settings::getSetting("CONF_FILE_MIME_ALLOWED"));
		$valid_arr = explode("\n", $valid_mime_types);
		foreach($valid_arr as $vkey=>$vval){
			$valid_extensions .= "'".$vval."',";
		}
		//$valid_extensions = array_map(array($this, 'test_abc'), $valid_arr);
		print_r($valid_extensions);
		die();
		$this->db = Syspage::getdb();
		for($j=1;$j<=10;$j++){
			$random_number = rand(1,10);
			$this->db->query("INSERT IGNORE INTO tbl_testing SET file_name = 'file-name" . $random_number . "',count = '" .$random_number . "', date = '" . date('Y-m-d') . "' ON DUPLICATE KEY UPDATE count = '" . $random_number ."'");
		}
		die('TT');
		$order_id=2;
		$arr = array('abc'=>time(),'test1'=>time(),'mc_gross'=>34.38,'payment_status'=>"Pending");
		$orderPaymentObj=new SubscriptionOrderPayment($order_id);
		$payment_gateway_response_data = array(
				'subgatewaytxn_mporder_id'		=>	$order_id,
				'subgatewaytxn_mode'			=>	'PaypalStandard',
				'subgatewaytxn_transaction_id'	=>	time(),
				'subgatewaytxn_response'	=>	serialize($arr),
				'subgatewaytxn_amount'			=>	$arr['mc_gross'],
				'subgatewaytxn_status'	=>	$arr['payment_status'],
				);
			
			if( !$orderPaymentObj->addPaymentGatewayResponse($payment_gateway_response_data) ){
				$this->log($payment_gateway_response_data, "Could Not Save Package Transaction Data");
			}
		die('aa');	
		$order_id = 135;
		$pmObj=new SubscriptionPaymentsettings('PaypalStandard');
		$payment_settings=$pmObj->getPaymentSettings();
		$orderPaymentObj=new SubscriptionOrderPayment($order_id);
		$subscription_status_id = $payment_settings['order_status_payment'];
		$order_update_arr = array(
				'mporder_mpo_status_id'	=>	$subscription_status_id, 
				'mporder_gateway_subscription_id' =>	'I-LKJDVU9HVMA2',
				); 
			if( !$orderPaymentObj->updateOrderInfo( $order_id, $order_update_arr) ){
				//$this->log($order_update_arr, "Could Not Save Package Order Data");
			}
			$orderPaymentObj->addOrderHistory( $order_id, $subscription_status_id,'',true );
			
		/*$orderPaymentObj->addOrderHistory( 135, $subscription_status_id,'',true );
		$orderPaymentObj->addOrderHistory( 135, $subscription_status_id,'',true );*/
		die('ab');
		
		$subscriptionOrderObj=new SubscriptionOrderPayment(14);
		$subscriptionOrderObj->updateOrderPaymentStatus(14,1);
		die();
		$orderPaymentObj=new SubscriptionOrderPayment(107);
		$orderPaymentObj->addOrderPayment('Test AAA',time(),10,Utilities::getLabel("L_Payment_Received"),'AAA',1);
		die();
		
		$cObj = new Cart();
		$r = $cObj->getProducts();
		Utilities::printarray($r);
		die();
		die('TT');
		Utilities::printArray($conf_arr_buyer_types);
		if (!Utilities::checkBuyerLogin(false)){
			die('ss');
			Message::addErrorMessage(Utilities::getLabel('M_Please_login_with_buyer_account'));
			Utilities::redirectUser(Utilities::generateUrl('cart')); 
		}
		die('A');
		Message::addErrorMessage(Utilities::getLabel('M_There_was_problem_authenticating_googleplus_account'));
				Utilities::redirectUser(Utilities::generateUrl('user','account'));
				
		$pObj= new Products();
		$pObj->joinWithDetailTable();
		$pObj->joinWithCategoryTable();
		$pObj->joinWithBrandsTable();
		$pObj->joinWithPromotionsTable();
		$pObj->addSpecialPrice();
		
		$pObj->selectFields(array('tp.*','ts.shop_id','ts.shop_user_id','ts.shop_name','ts.shop_title','tu.user_id','tu.user_name','tu.user_username','tu.user_email','IF(prod_stock >0, "1", "0" ) as available'));
		$products = $pObj->getProducts(array('category'=>251));
		die($pObj->getquery());
		
		
		$prodObj=new Products();
		$prodObj->joinWithBrandsTable();
		$product_info = $prodObj->getData(182,array("status"=>1));
		print_r($product_info);
		die();		
		echo Utilities::generateAbsoluteUrl('image', 'social_feed_image',array(Settings::getSetting("CONF_SOCIAL_FEED_IMAGE")),"/");
		die();
	
		die(Utilities::getLabel('L_We_are_redirecting_payment_page'));
		$r= file_get_contents('http://www.fatbit.com');
		die($r);
		$subscriptionOrderObj=new SubscriptionOrderPayment(6);
		$products = $subscriptionOrderObj->updateOrderPaymentStatus(6,1);
		die($products."#");
		$srObj= new SubscriptionOrders();
		$r = $srObj->getSubscriptionDetailForEmailTemplate(2);
		die($r);
		/*$srObj= new SubscriptionOrders();
		$order_info = $srObj->getSubscriptionOrderById(1);
		$cmObj=new Commissions();
			$arr['commission_setting'][] = array('vendor_id'=>(int)$order_info['mporder_user_id'],'fees'=>$order_info['mporder_merchantpack_commission']);
			$cmObj->addUpdateCommissionSettings($arr);
		die('Test');*/
		$orderPaymentObj=new SubscriptionOrderPayment(6);
		$sub_detail = $orderPaymentObj->addOrderPayment('PayPal','AAAA11111',5.80,Utilities::getLabel("L_Subscription_Signed_Up"),'TTTT',false,false);
		Utilities::printArray($sub_detail);
		die($sub_detail);
		$p = new Promotions();
		$p->addPromotionClicksHistory(1);
		die('TT');
		$orderObj=new Orders();
		$order_items_table_format=$orderObj->getOrderDetail(11);
		die(session_id()."#");
		$obj = new Products();
		global $db;
		$srch = new SearchBase('tbl_product_images', 'tpi');
		$srch->addOrder('tpi.image_default', 'desc');
		$srch->addOrder('tpi.image_id','desc');
		$srch->addOrder('tpi.image_prod_id', 'asc');
		$srch->doNotLimitRecords(true);
		$srch->doNotCalculateRecords(true);
		$rs = $srch->getResultSet();
		$product_images = $db->fetch_all($rs);
		$arr = array();
		if(is_array($product_images)){	
			foreach($product_images as $img){
				if(isset($arr[$img['image_prod_id']][$img['image_file']]) && $arr[$img['image_prod_id']][$img['image_file']] > 0){	
					$db->query("delete from `tbl_product_images` where image_id = '".intval($img['image_id'])."'"); 
				}else{
					$arr[$img['image_prod_id']][$img['image_file']] = $img['image_id'];
				}	
			}	
		}
	}
	function set_products_shipping(){
		global $db;
		$this->db=$db;
		$pObj=new Products();
		$arr_listing=$pObj->getProducts();
		foreach ($arr_listing as $sn=>$row) {
			if ($row['prod_id']!=292){
				$this->db->deleteRecords('tbl_product_shipping_rates', array('smt' => 'pship_prod_id = ?', 'vals' => array($row['prod_id'])));
				$this->db->query("insert into `tbl_product_shipping_rates` (`pship_prod_id`, `pship_country`, `pship_company`, `pship_duration`, `pship_charges`, `pship_additional_charges`) ( SELECT ".$row['prod_id'].",`pship_country`, `pship_company`, `pship_duration`, `pship_charges`, `pship_additional_charges` FROM `tbl_product_shipping_rates` WHERE `pship_prod_id` = 292 ORDER BY `pship_prod_id` ASC )");
			}
		}
	}
function popup(){
	$this->_template->render(false,false);
}
function test_smtp(){
	$mail = new PHPMailer(true);
	$mail->IsSMTP();
	$mail->SMTPAuth = true;
	$mail->IsHTML(true);
	$mail->Host = 'mail.marketsanat.com';
	$mail->Port = 26;
	$mail->Username = 'test@marketsanat.com';
	$mail->Password = 'Test!!22';
	$mail->SMTPSecure = 'tls';
	$mail->SMTPDebug = true;
	$mail->SetFrom('test@marketsanat.com', 'test');
	$mail->Subject = 'test Headers test From marketsanat';
	$mail->AltBody="This is text only alternative body.";
	$mail->MsgHTML('<b>Headers test</b><br><br>Port: 26, Secure: tls' );
	//$mail->AddAddress('ravibhalla@dummyid.com', 'Ravi Sir');
	if(!$mail->send()) {
		echo 'Message could not be sent.';
		echo 'Mailer Error: ' . $mail->ErrorInfo;
		exit;
	}
	echo 'Message has been sent';
}
/*function example(){
	Syspage::addJs(array('js/jquery.magnific-popup.min.js'), false);
	Syspage::addCss(array('css/magnific-popup.css','css/popup.css'), false);
	$this->_template->render();	
}*/
function display_image($type,$path,$width,$height){
	switch(strtoupper($type)){
		case 'O':
		return Utilities::showOriginalImage($path);
		break;
		case 'R':
		return Utilities::showImage($path, $width, $height,'dummy/','product-no-image.jpg',false);
		break;	
	}
}
function test()
{
	global $db;
	$this->db=$db;
	$srch = new SearchBase('tbl_user_reward_points', 'tur');
	$srch->addOrder('tur.urp_reward_id', 'asc');		
	$srch->doNotLimitRecords();
	$rs = $srch->getResultSet();
	$res=$this->db->fetch_all($rs);
	$rewardObj=new Rewards();
	foreach($res as $val){
		$rewardId=$val['urp_reward_id'];
//$res=$rewardObj->getAndSetRewardsPointBreakup($rewardId);			
		if($rewardId < 1){
			die('M_INVALID_REQUEST');
		}
		$srch = new SearchBase('tbl_user_reward_points', 'tur');
		$srch->addCondition('tur.urp_reward_id', '=', intval($rewardId));
		$rs = $srch->getResultSet();
		$result=$this->db->fetch($rs);
/* printArray($result);
echo "<br>============<br>"; */
if(!empty($result)){
	$assignValues=array(
		'urpdetail_urp_reward_id'=>$result['urp_reward_id'],
		'urpdetail_points'=>$result['urp_points'],
		'urpdetail_expiry'=>$result['urp_date_expiry'],
		'urpdetail_used'=>0,
		'urpdetail_used_ref_id'=>$result['urp_referrer_id'],
		);
	$rewardObj->addRewardsPointsBreakup($assignValues);
	if($result['urp_points']<0){
		$userRewardPoints=abs($result['urp_points']);
//echo 'userRewardPoints-'.$userRewardPoints.'<br>';
		$criteria=array('urpdetail_used'=>'0','user'=>$result['urp_user_id']);	
		$unUsedRewardsPointsArr=$this->getUserRewardsPointsSearch($criteria,$result['urp_date_added']);
/* printArray($unUsedRewardsPointsArr);
echo "<br>============<br>";  */
foreach($unUsedRewardsPointsArr as $val){
	if($userRewardPoints==0){break;}
	if($val['urpdetail_points']>0){
		if($val['urpdetail_points']<=$userRewardPoints){
			$userRewardPoints=$userRewardPoints-$val['urpdetail_points'];
			$updateValues=array('urpdetail_used'=>1);
			$whr=array('smt' => 'urpdetail_id = ?', 'vals' => array($val['urpdetail_id']));		
			$this->db->update_from_array('tbl_user_reward_point_breakup',$updateValues,$whr);
		}else{
			$difference=$val['urpdetail_points']-$userRewardPoints;
			$updateValues=array('urpdetail_used'=>1,'urpdetail_points'=>$userRewardPoints);
			$whr=array('smt' => 'urpdetail_id = ?', 'vals' => array($val['urpdetail_id']));		
			$this->db->update_from_array('tbl_user_reward_point_breakup',$updateValues,$whr);
			$insertValuesArr=array(
				'urpdetail_urp_reward_id'=>$val['urpdetail_urp_reward_id'],
				'urpdetail_points'=>$difference,
				'urpdetail_expiry'=>$val['urpdetail_expiry'],
				'urpdetail_used'=>0,
				'urpdetail_used_ref_id'=>$val['urp_referrer_id'],
				);
			$rewardObj->addRewardsPointsBreakup($insertValuesArr);							
			$userRewardPoints=0;
		}					
	}
}							
}			
}
} 
}
function getUserRewardsPointsSearch($criteria,$expiry){
	$srch = new SearchBase('tbl_user_reward_points', 'tur');
	$srch->addFld("turb.*,tur.*, if( urp_date_expiry = '0000-00-00', 1, 0 ) AS sort ");	
	$srch->joinTable('tbl_user_reward_point_breakup', 'INNER JOIN', 'turb.urpdetail_urp_reward_id=tur.urp_reward_id', 'turb');
	$srch->joinTable('tbl_users', 'INNER JOIN', 'tur.urp_user_id=tu.user_id', 'tu');
	foreach($criteria as $key=>$val) {
		if(strval($val)=='') continue;
		switch($key) {
			case 'page':
			$srch->setPageNumber($val);
			break;	
			case 'pagesize':
			$srch->setPageSize($val);
			break;
			case 'user':
			$srch->addCondition('tur.urp_user_id', '=', intval($val));
			break;
			case 'urpdetail_used':
			$srch->addCondition('turb.urpdetail_used', '=', intval($val));
			$srch->addCondition('turb.urpdetail_points', '>', 0);	
			break;					
			case 'reward_id':
			case 'urp_reward_id':
			$srch->addCondition('tur.urp_reward_id', '=', intval($val));
			break;
		}
	}
	$srch->addDirectCondition("( turb.urpdetail_expiry >= '".$expiry."' OR turb.urpdetail_expiry = '0000-00-00' )");		
	$srch->addOrder('tur.urp_date_added','asc');
	$srch->addOrder('sort','asc');
	$srch->addOrder('turb.urpdetail_expiry','asc');
	$srch->doNotLimitRecords();
	$rs = $srch->getResultSet();		
	return $this->db->fetch_all($rs);
}
}
