 

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
              
              
              
              
              
              
              
              <div class="gap"></div>
              <div class="tbl-dashboard">
                <div class="tbl-left">
                  <div class="box-head">
                	<h3>Payment Options</h3>
              	  </div>
                  
                  <div class="latest-order">
                    <table class="tbl-normal">
                      <tbody>
                        <tr>
                          <th>Options</th>
                          <th>Details</th>
                          <th width="22%">Status</th>
                          <th width="22%"><?php echo Utilities::getLabel('L_Action')?></th>
                        </tr>
                        <tr>
                          <td>
                          	<img src="http://aonfireandsafety.co.za/wp-content/uploads/2015/12/payfast.png" width="100px">
                          </td>
                          <td>
Accepting payments using Payfast will give your customers added ways to pay (debit card, credit card, bitcoin etc.) which may increase your sales.<br/>
It is highly recommended to provide buyers the advantage of paying through Payfast.<br/>
<strong style="color:#ff0000">PLEASE NOTE:</strong> All transactions through payfast will incur an additional 4.5% payment processing fee of the total order amount.

                          </td>
                          <td>
<?php
	if($status=='0')
	{
?>
		<label class="label label-danger">Inactive</label>
<?php		
	}elseif($status=='1')
	{
?>
		<label class="label label-success">Active</label>
<?php		
	}
?>                          	
                          </td>
                          <td>
                          	

<?php
	if($status=='0')
	{
?>
		<a class="btn btn-success" href="<?=Utilities::generateUrl('account','buyer_payment_options')?>?val=1"> <i class="fa fa-user"></i> Active</a>
<?php		
	}elseif($status=='1')
	{
?>
		<a class="btn btn-danger" href="<?=Utilities::generateUrl('account','buyer_payment_options')?>?val=0"> <i class="fa fa-user"></i> Inactive</a>
<?php		
	}
?> 

                          	
                          </td>
                        </tr>
                        
                        <tr>
                        	 <td>
                          		<img src="https://sidpayment.com/wp-content/uploads/2017/03/sid-instant-eft-logo2x.png" width="100px">
                          	 </td>
                          	 <td>
Sid is an Instant Eft payment gateway that offers affordable rates, therefore to help reduce the payment processing fees for stores, Sell-SA has made SID the standard of payment processing .<br/>
<strong style="color: #ff0000">PLEASE NOTE:</strong> All transactions through SID will incur and additional 2% payment processing fee of the total order amount.

                          	 </td>
                          	 <td><label class="label label-success">Active</label></td>
                          	 <td></td>
                        </tr>
                      </tbody>
                    </table>
                  </div>
                  
                  
                  
                  <div class="gap"></div>
                </div>
                
              </div>
            </div>
        </div>
      </div>
    </div>
  </div>
