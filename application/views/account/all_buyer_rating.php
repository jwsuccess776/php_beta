<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>

 
<div class="body clearfix">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <div class="tabz-content">
              <h3><?php echo Utilities::getLabel('M_Your_Product_Purchases')?></h3>
              <div class="orders-list">
                <ul>
                  <li> <a href="<?php echo Utilities::generateUrl('account', 'orders')?>"><span class="txt-big"><?php echo Utilities::displayMoneyFormat($user_details["totUserOrderPurchases"])?> </span>
                    <p><?php echo Utilities::getLabel('M_Total_Purchases')?></p>
                    </a> </li>
                  <li> <a href="<?php echo Utilities::generateUrl('account', 'credits')?>"><span class="txt-big"><?php echo Utilities::displayMoneyFormat($user_details["totUserBalance"])?> </span>
                    <p><?php echo Utilities::getLabel('M_My_Total_Credits')?></p>
                    </a> </li>
                    <li><a href="<?php echo Utilities::generateUrl('account', 'orders')?>"><span class="txt-big"><?php echo $user_details["totUserOrders"]?> </span>
                    <p><?php echo Utilities::getLabel('M_Total_Orders')?></p>
                    </a> </li>
                    <li> <a href="<?php echo Utilities::generateUrl('account', 'messages')?>"><span class="txt-big"><?php echo $user_details["unreadMessages"]?></span>
                    <p><?php echo Utilities::getLabel('M_Unread_Messages')?></p>
                    </a> </li>
                </ul>
              </div>
              
              
<?php

		$past_month_total_product =0;
		$past_three_month_total_product =0;
		$till_date_total_product =0;
		
	//	echo '<pre>';
		//print_r($shop['shop_id']);
		//exit;
		
		// Past Month
		$query="select * from tbl_order_rating where tor_buyer_id = '".$user_details['user_id']."' and  YEAR(tor_date_time) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AND MONTH(tor_date_time) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH)  ";
		
		$mydb = Syspage::getdb();
		$rs= $mydb->query($query);
		$past_month_ratings=$mydb->fetch_all($rs);
		$past_month_total_product=count($past_month_ratings);
		
		// past 3 month
		$query="select * from tbl_order_rating  where tor_buyer_id = '".$user_details['user_id']."' and YEAR(tor_date_time) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) AND MONTH(tor_date_time) = MONTH(CURRENT_DATE - INTERVAL 3 MONTH)   ";
		//echo $query;
		$mydb = Syspage::getdb();
		$rs= $mydb->query($query);
		$past_three_month_ratings=$mydb->fetch_all($rs);
		$past_three_month_total_product=count($past_three_month_ratings);
		

		// till date reviews
		$query="select * from tbl_order_rating where tor_buyer_id = '".$user_details['user_id']."' ";
		//echo $query;
		$mydb = Syspage::getdb();
		$rs= $mydb->query($query);
		$till_date_ratings=$mydb->fetch_all($rs);
		$till_date_total_product=count($till_date_ratings);
		
		
		
		//echo $past_month_total_product;
		 
		//print_r($all_ratings);
		//exit; 
		
		
		
?>              
              
              
              
              
              <div class="gap"></div>
              <div class="tbl-dashboard">
                <div class="tbl-left">
                  <div class="box-head">
                	<h3>Buyer Ratings</h3>
              	  </div>





<table class="table table-striped">
          		<tr>
          			<th></th>
          			<th style="text-align: center" >Item Bought</th>
          			<th style="text-align: center" ><img src="/images/happy-xxl.png" width="20" height="20" /> Positive</th>
          			<th style="text-align: center" ><img src="/images/nutral.png" width="20" height="20" /> Neutral</th>
          			<th style="text-align: center" ><img src="/images/unhappy.png" width="20" height="20" /> Negative</th>
          		</tr>
          		<tr>
          			<td>Past Month</td>
          			<td align="center"><?=$past_month_total_product?></td>
          			<td align="center"><?php 
$neutral=0;   $positive=0;     $negative=0;          			          			
          			if($past_month_total_product<=0) echo $past_month_total_product; else {
     $neutral=0;     				
     $positive=0;     				
     $negative=0;     				
	 foreach($past_month_ratings as $tdr)
	 {
	 	
	 	if($tdr['tor_rating']==1)
	 		$positive++;
	 	elseif($tdr['tor_rating']==0)
	 		$neutral++;
	 	else
	 		$negative++;
	 } 
	 
	 echo $positive;
	         				
          				
} ?></td>
          			<td align="center"><?=$neutral?></td>
          			<td align="center"><?=$negative?></td>
          		</tr>
          		<tr>
          			<td>Past 3 Month</td>
          			<td align="center"><?=$past_three_month_total_product?></td>
          			<td align="center"><?php 

   $neutral=0;   $positive=0;     $negative=0;          			
          			if($past_three_month_total_product<=0) echo $past_three_month_total_product; else {
       				
	 foreach($past_three_month_ratings as $tdr)
	 {
	 	
	 	if($tdr['tor_rating']==1)
	 		$positive++;
	 	elseif($tdr['tor_rating']==0)
	 		$neutral++;
	 	else
	 		$negative++;
	 } 
	 
	 echo $positive;
	         				
          				
} ?></td>
          			<td align="center"><?=$neutral?></td>
          			<td align="center"><?=$negative?></td>
          		</tr>
          		
          		<tr>
          			<td>Total Till Date</td>
          			<td align="center"><?=$till_date_total_product?></td>
          			<td align="center"><?php 
$neutral=0;   $positive=0;     $negative=0;          			          			
          			if($till_date_total_product<=0) echo $till_date_total_product; else {
     $neutral=0;     				
     $positive=0;     				
     $negative=0;     				
	 foreach($till_date_ratings as $tdr)
	 {
	 	
	 	if($tdr['tor_rating']==1)
	 		$positive++;
	 	elseif($tdr['tor_rating']==0)
	 		$neutral++;
	 	else
	 		$negative++;
	 } 
	 
	 echo $positive;
	         				
          				
} ?></td>
          			<td align="center"><?=$neutral?></td>
          			<td align="center"><?=$negative?></td>
          		</tr>
          	</table>
          	


  
  
  
  

<?php 
	$mydb=Syspage::getdb();
	$query="select * from tbl_order_rating t1, tbl_order_products t2 where t1.tor_buyer_id ='".$user_details['user_id']."' and t1.tor_status = '1' and t2.opr_id = t1.tor_opr_id order by t1.tor_date_time desc";
	//$query="select * from tbl_order_rating t1 where t1.tor_buyer_id ='".$user_details['user_id']."' and t1.tor_status = '1' order by t1.tor_date_time desc'";
		;
	$__rs=$mydb->query($query);
	$rating=$mydb->fetch_all($__rs);
	/*echo '<pre>';
	print_r($rating);
	echo '</pre>';*/
	if(count($rating)>0)
	{
?>
 <div class="box-head">
		<h3>All Ratings</h3>
  </div>
  <section class="allreviews" style="padding: 10px 20px">
		<span id="reviews-list">
<?php 
	foreach($rating as $rate)
	{
		
		$userObj=new User();
		$seller=$userObj->getUserById($rate['tor_seller_id'],array("status"=>1));
		
		/*echo '<pre>';
		print_r($rate);
		echo '</pre>';*/
		
?>
	<div class="reviewList">
          <aside class="grid_1" style="width: 15%">
            <figure class="photo"><img src="/image/user//SMALL" alt="creowebt"></figure>
            <span class="postedname"><span>Reviewed by </span><?=$seller['user_name']?></span> </aside>
          <aside class="grid_2"  style="width: 83%">
            <div class="ratingWrap">
               <div class="rating">
                   <?php if($rate['tor_rating']=='1') { ?>
	                	<img src="/images/happy-xxl.png" width="20" height="20" />
	               <?php }elseif($rate['tor_rating']=='0') { ?> 	
	                	<img src="/images/nutral.png" width="20" height="20" />
	               <?php }elseif($rate['tor_rating']=='-1') { ?>
	                	<img src="/images/unhappy.png" width="20" height="20" />
	               <?php } ?> 	 	
          		</div>
            </div>
            <span class="datetext"><?=date('Y-m-d',strtotime($rate['tor_date_time']))?></span>
            <div class="collectionreviews">
              <div class="secionreviews">
                <p class="reviewtxt"><?=$rate['tor_feedback']?></p>
                
<div class="itemdetails">
  
  <figure class="itemthumb"><img src="<?php echo Utilities::generateUrl('image','product_image',array($rate["opr_product_id"],'THUMB'))?>" alt="<?php echo $rate["opr_name"]?>"></figure>
  <span class="item_name"><a href="<?php echo Utilities::generateUrl('products','view',array($rate["opr_product_id"]))?>"><?php echo $rate["opr_name"]?></a></span> 
         
</div>


              </div>
            </div>
          </aside>
        </div>
<?php		
	}
?>		
		
		</span>
</section>
                                          
<?php		
	}
?>                                
		
 
                              
                              
                              
                              
                	  
                  <?php if (count($buyer_orders)>0 && (!empty($buyer_orders))){ ?>	
                  <div class="latest-order">

          	
          	                  
                  
                  </div>
                  <?php }else{?>
                  <div class="space-lft-right">
                      <div class="alert alert-info">
                        <p><?php echo Utilities::getLabel('L_You_have_not_placed_any_order')?></p>
                      </div>
                  </div> 
                <?php }?>
                  
                  
                  
                  <div class="gap"></div>
                </div>
                <div class="tbl-right">
                  <h3><?php echo Utilities::getLabel('M_Latest_Messages')?></h3>
                  <div class="message-list">
	                  <ul>
                  	<?php if (count($messages)>0) {
						 foreach ($messages as $key=>$val):?> 	
                      <li>
                        <div class="pic">
                        <img class="img" alt="" src="<?php echo Utilities::generateUrl('image', 'user',array($val["message_sent_by_profile"],'SMALL'))?>">
                        </div>
                        <div class="text">
                          <h4><?php echo $val["message_sent_by_username"]?></h4>
                          <p><?php echo substringbywords($val["message_text"],100)?></p>
                          <a class="readmore" href="<?php echo Utilities::generateUrl('account', 'view_message',array($val["message_thread"],$val["message_id"]))?>"><img alt="" src="<?php echo CONF_WEBROOT_URL?>images/reammore.png"></a> </div>
                      </li>
                      <?php endforeach; 
					   } else {?>
		                <li><?php echo Utilities::getLabel('M_you_do_not_have_messages')?></li>
                     <?php } ?>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>

 