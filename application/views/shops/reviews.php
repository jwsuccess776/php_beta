<?php defined('SYSTEM_INIT') or die('Invalid Usage'); 
$shop_vendor_location = ((strlen($shop['shop_owner_state_name']) > 0)?$shop['shop_owner_state_name']:'').((strlen($shop['shop_owner_country_name']) > 0)?', '.$shop['shop_owner_country_name']:'');
?>
<div>
    <div class="body clearfix">
      <div class="profile-head clearfix">
        <div class="fixed-container">
          <div class="fl">
            <div class="about-me">
              <div class="avatar"><img src="<?php echo Utilities::generateUrl('image','user',array($shop["shop_owner_profile_image"],'SMALL'))?>" alt="<?php echo $shop["shop_owner_username"]?>"/></div>
              <div class="name"><?php echo $shop["shop_owner_username"]?> <span><?php echo Utilities::displayNotApplicable($shop_vendor_location)?></span></div>
            </div>
          </div>
          <div class="fr">
            <div class="items-list">
              <ul>
                <li><a href="<?php echo Utilities::generateUrl('shops','view',array($shop["shop_id"]))?>"><span><?php echo $shop["totProducts"]?></span><?php echo Utilities::getLabel('M_Total_Items')?></a></li>
                <li><a href="<?php echo Utilities::generateUrl('shops','reviews',array($shop["shop_id"]))?>"><span><?php echo $shop["totReviews"]?></span><?php echo Utilities::getLabel('M_Total_Reviews')?></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="fixed-container">
        <div class="shop-header" >
          <div class="img"><img src="<?php echo Utilities::generateUrl('image','shop_banner',array($shop["shop_banner"],'LARGE'))?>" width="1200" height="361" alt="<?php echo $shop["shop_name"]?>"/></div>
          <div class="shop-left">
            <div class="brand-icon">
              <div class="brand-wrap"><img src="<?php echo Utilities::generateUrl('image','shop_logo',array($shop["shop_logo"],'THUMB'))?>" width="97" height="97" alt="<?php echo $shop["shop_name"]?>"/></div>
            </div>
            <div class="brand-name"><?php echo $shop["shop_name"]?> <span>(<?php echo Utilities::getLabel('M_Opened_on')?> <?php echo Utilities::formatDate($shop["shop_date"])?>)</span></div>
           	<?php  if (Settings::getSetting("CONF_ALLOW_REVIEWS")):?>
              <div class="rating">
                <ul class="rating">
                  <?php for($j=1;$j<=5;$j++){ ?>	
                  <li class="<?php echo $j<=round($shop["shop_rating"])?"active":"in-active" ?>"> 
                    <svg xml:space="preserve" enable-background="new 0 0 70 70" viewBox="0 0 70 70" height="18px" width="18px" y="0px" x="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg" id="Layer_1" version="1.1">
                    <g>
                      <path d="M51,42l5.6,24.6L35,53.6l-21.6,13L19,42L0,25.4l25.1-2.2L35,0l9.9,23.2L70,25.4L51,42z M51,42" 
                      fill="<?php echo $j<=round($shop["shop_rating"])?"#ff3a59":"#474747" ?>" />
                    </g>
                    </svg> </li>
                  <?php } ?>  
                </ul>
                <p><?php echo $shop["shop_rating"] ?> <?php echo Utilities::getLabel('M_out_of')?> 5</p>
              </div>
              <?php  endif; ?>
          </div>
          <div class="shop-right">
            <div class="links-row">
             <a id="shop_<?php echo $shop["shop_id"]?>" class="btn primary-btn favShop <? if ($shop["favorite"]): echo 'active'; endif;?>"><i><img src="<?php echo CONF_WEBROOT_URL?>images/heart-white.png"  alt="<?php echo Utilities::getLabel('M_Favorite_Shop')?>"/></i><?php echo Utilities::getLabel('M_Favorite_Shop')?></a> <a href="<?php echo Utilities::generateUrl('shops','send_message',array($shop["shop_id"]))?>" class="btn secondary-btn"><i><img src="<?php echo CONF_WEBROOT_URL?>images/email-white.png"   alt="<?php echo Utilities::getLabel('M_Send_Message')?>"/></i><?php echo Utilities::getLabel('M_Send_Message')?></a> </div>
          </div>
          <div class="social-list">
            <ul>
                <span title="ShareThis" class='st_sharethis_large' displayText='ShareThis'></span>
                <span title="Facebook" class='st_facebook_large' displayText='Facebook'></span>
                <span title="Tweet" class='st_twitter_large' displayText='Tweet'></span>
                <span title="Pinterest" class='st_pinterest_large' displayText='Pinterest'></span>
                <span title="WhatsApp" class='st_whatsapp_large' displayText='WhatsApp'></span>
                <span title="Email" class='st_email_large' displayText='Email'></span>
            </ul>
          </div>
          <div class="short-links">
            <ul >
              	
                <li> <a href="<?php echo Utilities::generateUrl('shops', 'report',array($shop["shop_id"]))?>"> <?php echo Utilities::getLabel('L_Report_this_shop')?></a> </li>
                <li> <a href="<?php echo Utilities::generateUrl('shops','policies',array($shop["shop_id"]))?>"> <?php echo Utilities::getLabel('M_Policies')?> </a> </li>
            </ul>
          </div>
        </div>
        <div class="shop-page">
           <? if ($shop['shop_description']!="") {?>  
			<div class="description"><div class="more"><?php echo nl2br($shop['shop_description'])?></div></div>
           <? } ?>
           	
          <div class="left_section"> 	
          	<?php include CONF_THEME_PATH . 'shop_leftpanel.php'; ?>
          </div>
         
          <div class="right-panel">

<?php

		$past_month_total_product =0;
		$past_three_month_total_product =0;
		$till_date_total_product =0;
		
	//	echo '<pre>';
		//print_r($shop['shop_id']);
		//exit;
		
		// Past Month
		$query="select * from tbl_prod_reviews t1, tbl_products t2 where t2.prod_shop = '".$shop['shop_id']."' and t2.prod_id = t1.review_prod_id and YEAR(reviewed_on) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
AND MONTH(reviewed_on) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) and t1.review_status = '1' ";
		$mydb = Syspage::getdb();
		$rs= $mydb->query($query);
		$past_month_ratings=$mydb->fetch_all($rs);
		$past_month_total_product=count($past_month_ratings);
		
		// past 3 month
		$query="select * from tbl_prod_reviews t1, tbl_products t2 where t2.prod_shop = '".$shop['shop_id']."' and t2.prod_id = t1.review_prod_id and YEAR(reviewed_on) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH)
AND MONTH(reviewed_on) = MONTH(CURRENT_DATE - INTERVAL 3 MONTH)  and t1.review_status = '1' ";
		//echo $query;
		$mydb = Syspage::getdb();
		$rs= $mydb->query($query);
		$past_three_month_ratings=$mydb->fetch_all($rs);
		$past_three_month_total_product=count($past_three_month_ratings);
		
		
		
		// till date reviews
		$query="select * from tbl_prod_reviews t1, tbl_products t2 where t2.prod_shop = '".$shop['shop_id']."' and t2.prod_id = t1.review_prod_id  and t1.review_status = '1' ";
		//echo $query;
		$mydb = Syspage::getdb();
		$rs= $mydb->query($query);
		$till_date_ratings=$mydb->fetch_all($rs);
		$till_date_total_product=count($till_date_ratings);
		
		
		
		//echo $past_month_total_product;
		 
		//print_r($all_ratings);
		//exit; 
		
?>          	
          	<h3>Buyer Rating</h3>
          	
          	<table class="table table-striped">
          		<tr>
          			<th></th>
          			<th style="text-align: center" >Item Sold</th>
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
	 	
	 	if($tdr['review_rating']>=4)
	 		$positive++;
	 	elseif($tdr['review_rating']>=2)
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
     $neutral=0;     				
     $positive=0;     				
     $negative=0;     				
	 foreach($past_three_month_ratings as $tdr)
	 {
	 	
	 	if($tdr['review_rating']>=4)
	 		$positive++;
	 	elseif($tdr['review_rating']>=2)
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
	 	
	 	if($tdr['review_rating']>=4)
	 		$positive++;
	 	elseif($tdr['review_rating']>=2)
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
          	
          	<h3><?php echo sprintf(Utilities::getLabel('L_Shop_Reviews'),$shop["shop_name"])?></h3>
	          <section class="allreviews">
              	<?php echo Utilities::renderHtml($frmSearch);?>	
                <?php if ($shop["totReviews"]>0) {?>
                <span id="reviews-list"></span>
                <?php } else {?>
            	    <div class="alert alert-info">
		            	<?php echo Utilities::getLabel('L_This_shop_has_not_received_review')?>
	        	    </div>
                <?php }?>
              </section>
          </div>
        </div>
      </div>
    </div>
  </div>
  
<!--wrapper end here-->
<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "c1ac1329-15e5-4379-aa5c-30b5671f7265", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>