<?php global $status_arr;
defined('SYSTEM_INIT') or die('Invalid Usage');
if ($records || is_array($records)) {
    echo createHiddenFormFromPost('paginateForm', '', array(), array());
}
?>
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="table">
    <tr>
        <th>ID</th>
        <th>Buyer Details</th>
        <th>Vendor Details</th>
        <th>Request Details</th>
        <th>Amount</th>
        <th>Date</th>
        <th>Status</th>
        <?php if ($canviewcancellationrequests === true) {
            echo '<th>Action</th>';
        } ?>
    </tr>
    <?php
    if (!$records || !is_array($records)) {
        echo "<tr><td colspan=4>No Record Found</td></tr>";
    } else {
        ?>
        <?php
        $i = $start_record;
        foreach ($records as $record) {
				$request_from = "";
				if($record["vendor_id"]==$record['cancellation_request_user_id']) { 
						$request_from = "Vendor";
					} else {
						$request_from = "Buyer";
				 } 
            ?>
            <tr>
                <td nowrap="nowrap">#C<?php echo str_pad($record["cancellation_request_id"],5,'0',STR_PAD_LEFT);?></td>
                <td nowrap="nowrap"><strong>N</strong>: <?php echo $record["user_name"]?><br/><strong>U</strong>: <?php echo $record["user_username"]?><br/><strong>E</strong>: <?php echo $record["user_email"]?><br/><strong>P</strong>: <?php echo $record["user_phone"]?></td>
                <td nowrap="nowrap"><strong>N</strong>: <?php echo $record["opr_shop_owner_name"]?><br/><strong>U</strong>: <?php echo $record["opr_shop_owner_username"]?><br/><strong>E</strong>: <?php echo $record["opr_shop_owner_email"]?><br/><strong>P</strong>: <?php echo $record["opr_shop_owner_phone"]?></td>
                <td><strong>Order:</strong> <?php echo trim($record["opr_order_invoice_number"])?><br/><strong>Status:</strong> <?php echo trim($record["orders_status_name"])?><br/>
				<?php if($record["vendor_id"]!=$record['cancellation_request_user_id']) { ?>
					<strong>Reason:</strong> <?php echo trim($record["cancelreason_title"])?><br/>
				<?php } ?>
				<strong>Comments</strong>: <span class="short"><?php echo nl2br($record["cancellation_request_message"]); ?></span><br/><strong>Requested By:</strong>: <span class="short"><?php echo ($request_from); ?></span></td>
                <td nowrap="nowrap"><?php echo $currencyObj->format($record["opr_net_charged"],isset($record['order_currency_code'])?$record['order_currency_code']:'',isset($record['order_currency_value'])?$record['order_currency_value']:'') ?></td>
                <td nowrap="nowrap"><?php echo Utilities::formatDate($record["cancellation_request_date"])?></td>
                <td><?php echo $status_arr[$record["cancellation_request_status"]] ; 
							if($record["vendor_id"]==$record['cancellation_request_user_id']) 
							{ 
								echo  "<br/><br/><strong>Comments: </strong>";
								if ($record['cancellation_request_status']==3)
								{
									if($record['cancellation_charge_type']=="charged_for_processing_fee_and_commission")
									{
										echo "Charged for processing fee and commission";
									}
									else if($record['cancellation_charge_type']=="chargeed_for_processing_fee_only")
									{
										echo "Charged for processing fee only";
									}
								}
								else if($record['cancellation_request_status']==2)
								{
									echo $record['cancellation_request_decline_reason'];
								}
							}
				?></td>
                <?php if ($canviewcancellationrequests === true) { ?>
                   <td nowrap="nowrap">
                        <?php
						if ($record['cancellation_request_status']==0){
							if($record["vendor_id"]==$record['cancellation_request_user_id']) { 
									echo '<ul class = "actions">
									<li><a href="javascript:void(0);" title="Approve" class="toggleswitch enabled" ><i onclick="ToggleForm(\'approval_form_' . $record['cancellation_request_id'] . '\');" class="ion-checkmark-circled icon"></i></a></li>
									<li><a href="javascript:void(0);" title="Decline" class="toggleswitch disabled" ><i onclick="ToggleForm(\'decline_form_' . $record['cancellation_request_id'] . '\');" class="ion-close-circled icon"></i></a></li>
									
									</ul>';
								} 
								else 
								{
									echo '<ul class = "actions">
									<li><a href="javascript:void(0);" title="Approve" class="toggleswitch enabled" ><i onclick="UpdateRequestStatus(' . $record['cancellation_request_id'] . ', $(this),\'approve\');" class="ion-checkmark-circled icon"></i></a></li>
									<li><a href="javascript:void(0);" title="Decline" class="toggleswitch disabled" ><i onclick="UpdateRequestStatus(' . $record['cancellation_request_id'] . ', $(this),\'decline\');" class="ion-close-circled icon"></i></a></li>
									</ul>';
								} 
                       	 	/*echo '<ul class = "actions">
               					<li><a href="javascript:void(0);" title="Approve" class="toggleswitch enabled" ><i onclick="UpdateRequestStatus(' . $record['cancellation_request_id'] . ', $(this),\'approve\');" class="ion-checkmark-circled icon"></i></a></li>
								<li><a href="javascript:void(0);" title="Decline" class="toggleswitch disabled" ><i onclick="UpdateRequestStatus(' . $record['cancellation_request_id'] . ', $(this),\'decline\');" class="ion-close-circled icon"></i></a></li>
								*/
						
						if($record["vendor_id"]==$record['cancellation_request_user_id']) 
						{ 
				?>
							<div style="margin-left:-150px; margin-top:20px;display:none" id="approval_form_<?php echo $record['cancellation_request_id']; ?>">
							<form method="post" onsubmit="<?php echo 'UpdateSellerRequestStatus(' . $record['cancellation_request_id'] . ', $(this),\'approve\',\'commission_option_' . $record['cancellation_request_id'] . '\');'?>" style="width:100%" class="web_form">
									<select name="commission_option_<?php echo $record['cancellation_request_id']; ?>" id="commission_option_<?php echo $record['cancellation_request_id']; ?>">
										<option value="charged_for_processing_fee_and_commission">Charge Processing and Commission</option>
										<option value="chargeed_for_processing_fee_only">Charge Processing fee only</option>
										<option value="not_charged_vendor">Do not charge vendor</option>
									</select>
									<br/>
									<input type="submit" name="btn_submit" id="btn_submit">
							</form>
							</div>
							<div style="margin-left:-150px; margin-top:20px;;display:none" id="decline_form_<?php echo $record['cancellation_request_id']; ?>">
							<form method="post" onsubmit="<?php echo 'UpdateSellerRequestStatus(' . $record['cancellation_request_id'] . ', $(this),\'decline\',\'cancellation_reason_' . $record['cancellation_request_id'] . '\');'?>"  style="width:100%" class="web_form">
									<textarea placeholder="Reason" name="cancellation_reason_<?php echo $record['cancellation_request_id']; ?>" id="cancellation_reason_<?php echo $record['cancellation_request_id']; ?>"></textarea>
									<br/>
									<input type="submit" name="btn_submit" id="btn_submit">
							</form>
							</div>
				<?php
						}
						}
                    }
                    ?></td>
            </tr>
            <?php
            $i++;
        }
        ?>
    </table>
    <div class="gap"></div>
    <?php 
    if ($pages > 1) {
        $vars = array('page' => $page, 'pages' => $pages, 'start_record' => $start_record, 'end_record' => $end_record, 'total_records' => $total_records);
        echo Utilities::renderView(Utilities::getViewsPartialPath().'backend-pagination.php', $vars);
    }
}
?>
<script>
$(document).ready(function() {
    // Configure/customize these variables.
    var showChar = 100;  // How many characters are shown by default
    var ellipsestext = "...";
    var moretext = "Show More";
    var lesstext = "Show Less";
    
    $('.short').each(function() {
        var content = $(this).html();
        if(content.length > showChar) { 
            var c = content.substr(0, showChar);
            var h = content.substr(showChar, content.length - showChar);
            var html = c + '<span class="moreellipses">' + ellipsestext+ '&nbsp;</span><span class="morecontent"><span>' + h + '</span>&nbsp;&nbsp;<a href="" class="morelink">' + moretext + '</a></span>';
            $(this).html(html);			
        }
 
    });
	
	
	$(".morelink").click(function(){
        if($(this).hasClass("less")) {
            $(this).removeClass("less");
            $(this).html(moretext);
        } else {
            $(this).addClass("less");
            $(this).html(lesstext);
        }
        $(this).parent().prev().toggle();
        $(this).prev().toggle();
        return false;
    });
	$(".morelink").trigger( "click" );
    
});
</script>
