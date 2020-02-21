<?php defined('SYSTEM_INIT') or die('Invalid Usage'); global $payment_status_arr;?> 
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
						<h4>Search Wallet Orders</h4> 			
					</div>
					
					<div class="sectionbody space togglewrap" style="display:none;">
						<?php echo $frmPost->getFormHtml(); ?>
					</div>
				</section>
				
					
					<section class="section">
                        <div class="sectionhead"><h4>Wallet Orders</h4>
						<ul class="actions">
                                <li class="droplink">
                                    <a href="javascript:void(0);"><i class="ion-android-more-vertical icon"></i></a>
                                    <div class="dropwrap">
                                        <ul class="linksvertical">
                                            <li><a href="<?php echo Utilities::generateUrl('subscriptionorders'); ?>">Back to Subscriptions</a></li>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
						</div>
						<div class="sectionbody"> 
						<div class="box_content clearfix toggle_container">
						<table class="table">
							<tr>
								<th>Invoice Number</th>
                                <th>Buyer</th>
								<th>Referance No</th>
								<th>Amount</th>
								<th>Payment Status</th>
								<th>Action</th>
							</tr>
							
<?php
		if(count($records)>0)
		{ 
			foreach($records as $row)
			{ 
?>	
	<tr>
					<td><?=$row['rwr_invoice_number']?></td>
					<td>
					
					 <strong>U</strong>: <?=$row["user_name"] ?><br/>
                    <strong>E</strong>: <a href="mailto:<?=$row["user_email"]?>"><?=$row["user_email"] ?></a><br/>
                    <strong>P</strong>: <?=!empty($row["user_phone"]) ? $row["user_phone"] : 'NA' ?>
                     
                    
                    </td>
					<td><?=$row['rwr_referance_no']?></td>
					<td><?=$row['rwr_amount']?></td>
					<td>
						
						<?php 
						
							$rwr_payment_status=$row['rwr_payment_status'];
							
							if($rwr_payment_status=='Pending')
								echo '<span class="label label-warning">'.$rwr_payment_status.'</span>';
							elseif($rwr_payment_status=='Paid')
								echo '<span class="label label-success">'.$rwr_payment_status.'</span>';
							elseif($rwr_payment_status=='Partially Paid')
								echo '<span class="label label-info">'.$rwr_payment_status.'</span>';
							elseif($rwr_payment_status=='Cancelled')
								echo '<span class="label label-danger">'.$rwr_payment_status.'</span>';
						?>
							
					</td>
					
					<td>

<?php if($rwr_payment_status=='Pending' || $rwr_payment_status=='Cancelled') { ?>					
					<form  method="POST">
						<input type="hidden" name="rwr_id" id="rwr_id" value=<?=$row['rwr_id']?> />
						<input type="hidden" name="rwr_member_id" id="rwr_member_id" value=<?=$row['rwr_member_id']?> />
						
						<select data-id="<?=$row['rwr_id']?>" class="changePaymentStatus" onchange="changePaymentStatus(this,'<?=$row['rwr_id']?>')" name="rwr_payment_status" id="rwr_payment_status" required="" style="padding: 3px 10px">
							<option value="">Select Payment Status</option>
							<option value="Pending">Pending</option>
							<option value="Paid">Paid</option>
							<option value="Partially Paid">Partially Paid</option>
							<option value="Cancelled">Cancelled</option>
						</select>
						
						<span id="walletUpdate<?=$row['rwr_id']?>"></span>
						<input type="submit" name="btn_update"	class="btn btn-success btn-sm" style="border: none;padding:5px 10px"  />
					</form>
<?php } ?>					
					</td>
	</tr>					
<?php				
			}
		}
?>							
								
								
						
							 
							
						</table>		  
						</div>
						</div>	
					</section>
					 
					 
					 
				</div>
			</div>
		</div>
	</div>          
	<!--main panel end here-->
</div>
<!--body end here-->
<script>

	function changePaymentStatus(val,id)
	{
		val=(val.value);
		var html="";
		if(val=='Partially Paid')
		{
			html='<input placeholder="Amount" name="amount" type="number" required="" style="padding: 3px 10px;max-width: 100px" />';		
		}
		
		$('#walletUpdate'+id).html(html);
	}
	 
</script>

</div>	

