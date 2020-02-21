<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>

<?php
	
		
		/*echo "<pre>";
			print_r($payment_methods);
			print_r($recharge_info);
			print_r($_SESSION);
			print_r($_REQUEST);
		echo "</pre>"*/
?>

<div class="payment-page">
  <div class="wallet-payment">
    <div class="logo-payment"><img src="<?php echo Utilities::generateUrl('image', 'site_logo',array(Settings::getSetting("CONF_FRONT_LOGO"), 'THUMB'), CONF_WEBROOT_URL)?>" alt=""/></div>
    <div class="reff total-pay">
      <p class="fl"><?php echo Utilities::getLabel('L_Payable_Amount')?>: <strong><?php echo Utilities::displayMoneyFormat($recharge_info['rwr_amount'])?></strong> </p>
      <p class="fr"><?php echo Utilities::getLabel('L_Txn_Invoice')?>: <strong><?php echo Utilities::displayNotApplicable($recharge_info["rwr_invoice_number"])?></strong> </p>
      
    </div>
    <div class="payment-from">
    	<section id="payment" class="checkout-panel clearfix active">
             
            <div class="box-content">
              <div id="walletpaymenttab">
                <ul class="resp-tabs-list" id="payment_methods_tab">
                	<?php foreach($payment_methods as $sn=>$val){?>	
                		<li class="<?php echo (($sn==0)?'resp-tab-active':''); ?>" data-filter="<?php echo $val["ppcpmethod_id"]?>"><a href="<?php echo Utilities::generateUrl("wallet_pay",'payment_tab',array($recharge_info["rwr_id"],$val["ppcpmethod_id"]));?>"><i><img src="<?php echo Utilities::generateUrl('image','ppcpayment_icon',array($val["ppcpmethod_icon"]));?>" width="22"  alt=""/></i><span><?php echo $val["ppcpmethod_name"]?></span></a></li>
    	          <?php } ?>
                </ul>
                <div class="resp-tabs-container">
                  <div id="personalTabId" class="tabs-cn-area resp-tab-content">
	                  <div class="amount-desc">
                        <ul>
                          <li class="total"><?php echo Utilities::getLabel('M_Net_Payable')?> <span class="figure"><?php echo Utilities::displayMoneyFormat($recharge_info['rwr_amount'])?></span></li>
                        </ul>
                      





<div id="tabs-container" style="display: block;"><div class="payment-table-cell">
  <p><strong>Pay using SID Instant Payment:</strong></p><br>
  <p>SID is South Africa’s original, and most secure Instant EFT solution.

For more details please visit</p><br>
  	  <div id="validationsummary_frmPaymentTabForm"></div><form method="post" action="/sidinstant_pay/wallet_charge/<?=$recharge_id?>" name="frmPaymentTabForm" id="frmPaymentTabForm" class="siteForm"><table width="100%"><tbody><tr>
<td colspan="2"><input type="submit" name="btn_submit" id="button-confirm" class="btn primary-btn" title="" value="CONFIRM PAYMENT"></td>
</tr></tbody></table><input type="hidden" name="order" value="<?=$recharge_id?>" title=""></form>
 
</div>


	                
	                  
<!-- EFT payment Start here -->
<?php
		if($val["ppcpmethod_id"]=='2')
		{
?>


<?php $my_order_referance = $recharge_info['rwr_referance_no']; ?>

<table style="font-size: 12px;">
	 
	
	
	
	
	 <tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/absa.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> <?=$my_order_referance?>	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/capitec.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> <?=$my_order_referance?>	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
 	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/fnb.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> <?=$my_order_referance?>	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/investec.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> <?=$my_order_referance?>	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>

	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/nedbank.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> <?=$my_order_referance?>	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>

	<tr>
		<td style="width: 100px;vertical-align: text-bottom;position: relative;">
		<!--	<img src="http://www.bidorbuy.co.za/images/ui/bobe.sprites_payment_d9b21511470d470f360f54dff1c3cedd.png" style="position: absolute;clip: rect(0, 100px, 50px, 0);" />-->
			<img src="/images/bank_logo/rmb.png" />
		</td>
		<td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
			<p>Pay using direct bank transfer (EFT) from any South African bank. Sell-SA will confirm the payment and notify the seller. This option will display our banking details.</p>
			<p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
			<strong>Order Referance No : </strong> <?=$my_order_referance?>	<br/>
			<strong>Bank Name : </strong> xyz bank 	<br/>
			<strong>Account No: </strong> 1234567890 	<br/>
		</td>
	</tr>
	
	 
</table>
                  
   
          
     <a href="<?php echo Utilities::generateUrl("account",'credits',array());?>" class="btn primary-btn">Ok</a>
     
          
<?php			
		}
?>






<!-- EFT payment Start end -->

	                    </div>
                </div>
                </div>
              </div>
            </div>
          </section>
    </div>
  </div>
</div>
<script type="text/javascript">
var containerId = '#tabs-container';
var tabsId = '#payment_methods_tab';
$(document).ready(function(){
     if($(tabsId + ' LI.resp-tab-active A').length > 0){ 
         loadTab($(tabsId + ' LI.resp-tab-active A'));
     }
     $(tabsId + ' A').click(function(){ 
          if($(this).parent().hasClass('resp-tab-active')){ return false; }
          $(tabsId + ' LI.resp-tab-active').removeClass('resp-tab-active');
          $(this).parent().addClass('resp-tab-active');
          loadTab($(this));
          return false;
     
	 });
});
function loadTab(tabObj){
     if(!tabObj || !tabObj.length){ return; }
     showCssElementLoading($(containerId));
     $(containerId).fadeOut('fast');
     $(containerId).load(tabObj.attr('href'), function(){
          $(containerId).fadeIn('fast');
     });
}
</script>    
</body>
</head>