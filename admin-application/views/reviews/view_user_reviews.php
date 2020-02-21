<?php defined('SYSTEM_INIT') or die('Invalid Usage');  global $review_status;?> 
<div id="body">
	<!--left panel start here-->
	<?php include Utilities::getViewsPartialPath().'left.php'; ?>   
	<!--left panel end here-->
	
	<!--right panel start here-->
	<?php include Utilities::getViewsPartialPath().'right.php'; ?>   
	<!--right panel end here-->
	<!--main panel start here-->
	<style>
	.rating_img{
		width: 30px;
		height: 30px;
	}
</style>
	<div class="page">
		<?php echo html_entity_decode($breadcrumb); ?>
		<div class="fixed_container">
			<div class="row">
				<div class="col-sm-12">
					<section class="section">
					<div class="sectionhead"><h4>User Review </h4> 
	                        <ul class="actions">
                                <li class="droplink">
                                    <a href="javascript:void(0);"><i class="ion-android-more-vertical icon"></i></a>
                                    <div class="dropwrap">
                                        <ul class="linksvertical">
                                        	<li><a href="<?php echo Utilities::generateUrl('reviews','user_reviews'); ?>">Back to User's Reviews</a></li>
                                            
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                            
                        </div>
					<div class="sectionbody">
					
<?php
		$mydb = Syspage::getdb();
		$res=$mydb->query("select * from tbl_order_rating where tor_id = '".$seller_id."'  limit 1");
		$rows=$mydb->fetch_all($res);
		if(count($rows)>0)
		{
			/*echo '<pre>';
			print_r($rows);
			echo '</pre>';*/
			$sellerRs=$mydb->query("select * from tbl_users where user_id = '".$rows[0]['tor_seller_id']."' limit 1 ");
			$sellerRows=$mydb->fetch_all($sellerRs);
				
			$buyerRs=$mydb->query("select * from tbl_users where user_id = '".$rows[0]['tor_buyer_id']."' limit 1 ");
			$buyerRows=$mydb->fetch_all($buyerRs);
?>
					
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_listing">
	<tbody>
		<tr>
			<td width="15%" valign="top"><strong>User</strong></td>
			<td><strong>N</strong>: <?php echo $sellerRows[0]["user_name"]?><br/><strong>U</strong>: <?php echo $sellerRows[0]["user_username"]?><br/><strong>E</strong>: <?php echo $sellerRows[0]["user_email"]?></td>
		</tr>
		<tr>
			<td width="15%" valign="top"><strong>Reviewed By</strong></td>
			<td><?php echo $buyerRows[0]["user_name"]?></td>
		</tr>
		<tr>
			<td width="15%" valign="top"><strong>Review Rating</strong></td>
			<td><?php 
			    if($rows[0]['tor_rating']=='0')
			    	echo '<img class="rating_img" src="/images/nutral.png" />';
			    elseif($rows[0]['tor_rating']=='1')
			    	echo '<img class="rating_img" src="/images/happy-xxl.png" />';
			    elseif($rows[0]['tor_rating']=='-1')
			    	echo '<img class="rating_img" src="/images/unhappy.png" />';
			    	
			   	?>
			</td>
		</tr>
		
		<tr>
			<td width="15%" valign="top"><strong>Feedback</strong></td>
			<td><?php echo $rows[0]["tor_feedback"]?></td>
		</tr>
		
		<tr>
			<td><strong>Status</strong></td>
			<td>
<?php if($sellerRows[0]['user_status']=='1') echo '<span class="label label-success">Active</span>'; 
	  else echo '<span class="label label-danger">Blocked</span>'; ?>			    		
			</td>
		</tr>
		 
	</tbody>
</table>
					

<?php			
		}else{
			Message::addErrorMessage('Your browser made invalid request, Please try again');	
			Utilities::redirectUser(Utilities::generateUrl('reviews', 'user_reviews'));
		}
?>					
					</div>				
              	 </section>
				</div>
			</div>
		</div>
	</div>          
	<!--main panel end here-->
</div>
<!--body end here-->
</div>		
