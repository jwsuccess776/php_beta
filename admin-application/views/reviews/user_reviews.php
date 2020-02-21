<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?> 
<div id="body">
	<!--left panel start here-->
	<?php include Utilities::getViewsPartialPath().'left.php'; ?>   
	<!--left panel end here-->
	
	<!--right panel start here-->
	<?php include Utilities::getViewsPartialPath().'right.php'; ?>   
	<!--right panel end here-->
	<!--main panel start here-->
	<div class="page">
		<?php echo html_entity_decode($breadcrumb); ?>
		<div class="fixed_container">
			<div class="row">
				<div class="col-sm-12">
					<section class="section searchform_filter">
						<div class="sectionhead">
							<h4>Search User Reviews</h4> 			
						</div>
						
						
<?php
	$keyword=$_GET['keyword'];
	$date_from=$_GET['date_from'];
	$date_to=$_GET['date_to'];
	$reviewed_by=$_GET['reviewed_by'];
	$status=$_GET['status'];
	$mode=$_GET['mode'];
?>						

<div class="sectionbody space togglewrap" style="">
							
<form method="GET" action="" name="frmReviewSearch" id="frmReviewSearch" onsubmit="searchReviews(this); return false;" class="web_form last_td_nowrap">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table_form_vertical">
		<tbody>
			<tr>
				<td>Product<br><input type="text" name="keyword" id="keyword" value="" class="small" title="keyword" value="<?=$keyword?>"></td>
				<td>Reviewed By<br><input type="text" name="reviewed_by" id="reviewed_by" value="" class="small" title="Reviewed By" value="<?=$reviewed_by?>"></td>
			</tr>
			<tr>
				<td>Status<br>
					<select name="status" class="small" title="Status" id="">
						<option value="">All</option>
						<option value="1">Enabled</option>
						<option value="0">Disabled</option>
					</select>
				</td>
				<td>Date From<br>
					<input type="text" name="date_from" id="date_from" value="" readonly="true" class="small dateTimeFld" title="Date From">
					<img src="/images/cal_icon.png" alt="Calendar" id="cal_trigger_date_from" align="absmiddle" style="cursor: pointer;" class="iconcalender">
					<script type="text/javascript">
						Calendar.setup(
							{
							inputField : "date_from", 
							ifFormat : "%Y-%m-%d",
							button : "cal_trigger_date_from" 
							}
							);
					</script>
				</td>
				<td>Date To<br>
				<input type="text" name="date_to" id="date_to" value="" readonly="true" class="small dateTimeFld" title="Date To">
				<img src="/images/cal_icon.png" alt="Calendar" id="cal_trigger_date_to" align="absmiddle" style="cursor: pointer;" class="iconcalender">
				<script type="text/javascript">
				Calendar.setup(
					{
					inputField : "date_to", 
					ifFormat : "%Y-%m-%d",
					button : "cal_trigger_date_to" 
					}
					);
				</script>
			</td>
		</tr>
		<tr>
			<td><br>
				
				<input type="submit" name="mode" id="mode" value="Search">
				<input type="reset" value="Clear Search">
					
			</td>
		</tr>
	</tbody>
</table>
</form> 					

</div>
			
									
					</section>
					<section class="section"> 
                        <div class="sectionhead"><h4>Manage - User Reviews</h4>
							
						</div>
						<div class="sectionbody" id="reviews-list">
							
<style>
	.rating_img{
		width: 30px;
		height: 30px;
	}
</style>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
    <tbody>
    <tr>
        <th width="20%">Invoice No</th>
        <th width="20%">User</th>
        <th width="20%">Product</th>
        <th width="10%">Reviewed By</th>
        <th width="10%">Rating</th>
        <th width="10%">Feedback</th>
        <th width="10%">Date</th>
        <th width="10%">Status</th>
        <th>Action</th>    
    </tr>
<?php

$cnt=0;
$subquery="";

if($keyword!="")
{
	$subquery .= " and ( t2.opr_name like '%".$keyword."%'  )" ;
}

if($date_from!="" && $date_to=="")
{
	$subquery .= " and ( date(t1.tor_date_time) >= '".$date_from."'  )" ;
}elseif($date_from!="" && $date_to!="")
{
	$subquery .= " and ( date(t1.tor_date_time) between '".$date_from."' and  '".$date_to."'  )" ;
}		

		$mydb = Syspage::getdb();
		
		$res=$mydb->query("select * from tbl_order_rating t1, tbl_order_products t2 where t1.tor_order_id = t2.opr_order_id and t2.opr_id = t1.tor_opr_id $subquery  order by t1.tor_date_time desc ");
		$records=$mydb->fetch_all($res);
		
		if(count($records)>0)
		{
			
			foreach($records as $rows)
			{ 
			
			/*echo "<pre>";
			print_r($rows);
			echo "</pre>";*/
			
				$sellerRs=$mydb->query("select * from tbl_users where user_id = '".$rows['tor_seller_id']."' limit 1 ");
				$sellerRows=$mydb->fetch_all($sellerRs);
				
				$buyerRs=$mydb->query("select * from tbl_users where user_id = '".$rows['tor_buyer_id']."' limit 1 ");
				$buyerRows=$mydb->fetch_all($buyerRs);
$flag=true;
				
//if($reviewed_by!="" &&  strpos($buyerRows[0]['user_name'], $reviewed_by) !== false )
if($reviewed_by!="" &&  $buyerRows[0]['user_name']!= $reviewed_by )
{
	$flag=false;				
}

if( $status !="" && $sellerRows[0]['user_status'] != $status)
	$flag=false;				
	
	if($flag)
	{
		$cnt++;	
?>
				 <tr>
			    	<td><?=$rows['opr_order_invoice_number']?></td>
			    	<td>
		<strong>N</strong>: <?php echo $sellerRows[0]["user_name"]?><br/><strong>U</strong>: <?php echo $sellerRows[0]["user_username"]?><br/><strong>E</strong>: <?php echo $sellerRows[0]["user_email"]?>
					</td>
					
					<td><?php echo $rows["opr_name"]?></td>
					<td><?php echo $buyerRows[0]["user_name"]?></td>

			    	<td><?php 
			    if($rows['tor_rating']=='0')
			    	echo '<img class="rating_img" src="/images/nutral.png" />';
			    elseif($rows['tor_rating']=='1')
			    	echo '<img class="rating_img" src="/images/happy-xxl.png" />';
			    elseif($rows['tor_rating']=='-1')
			    	echo '<img class="rating_img" src="/images/unhappy.png" />';
			    	
			    	 ?></td>
			    	<td><?=$rows['tor_feedback']?></td>
			    	<td><?php echo Utilities::formatDate($rows['tor_date_time']); ?></td>
			    	<td>
<?php if($rows['tor_status']=='1') echo '<span class="label label-success">Enabled</span>'; 
	  else echo '<span class="label label-danger">Disabled</span>'; ?>			    		
			    	</td>
			    	<td nowrap="nowrap">
<ul class="actions">			    	
<?php 
		if($rows['tor_status']=='1')
		{
?>
            	<li><a href="/manager/reviews/user_reviews/update/0/<?=$rows['tor_id']?>" title="Click to Disable" class="toggleswitch enabled"><i class="ion-checkmark-circled icon"></i></a></li>			
<?php			
		}
	  	else{
?>
				<li><a href="/manager/reviews/user_reviews/update/1/<?=$rows['tor_id']?>" title="Click to Enable" class="toggleswitch disabled"><i class="ion-checkmark-circled icon"></i></a></li>
<?php			
		}
?>		
	  		 <li><a title="View User average rating" target="_blank" href="/manager/reviews/view_user_reviews/<?=$rows['tor_id']?>"><i class="ion-eye icon"></i></a></li>
	  		</ul>
			    	</td>
			    	 
			    </tr>
<?php				
	}
		}
	}
	
	if($cnt==0)
	{
?>
		 <tr>
		 	<td colspan="9">
	<div class="space-lft-right">    
    	<div class="alert alert-danger">
                <span>No record found for your search</span>
        </div>
    </div>
		 	</td>
		 </tr>
<?php		
	}
	
?>    
   
    </tbody>
</table>
        							
						</div>								
					</section>
				</div>
			</div>
		</div>
	</div>          
	<!--main panel end here-->
</div>
<!--body end here--> 		