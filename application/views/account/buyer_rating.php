<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div class="body clearfix">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <h3>Buyer's Ratings</h3>
           <?php if ($total_records>0):?>
           

<?php 
		$keyword="";$status="";$date_from="";$date_to="";$unrated="0";$paymentrequired="0";
		if(isset($_GET['keyword']) && $_GET['keyword']!="")
			$keyword=$_GET['keyword'];
		if(isset($_GET['status']) && $_GET['status']!="")
			$status=$_GET['status'];
		if(isset($_GET['date_from']) && $_GET['date_from']!="")
			$date_from=$_GET['date_from'];
		if(isset($_GET['date_to']) && $_GET['date_to']!="")
			$date_to=$_GET['date_to'];
		
		if(isset($_GET['unrated']) && $_GET['unrated']=="1")
			$unrated=$_GET['unrated'];
		if(isset($_GET['paymentrequired']) && $_GET['paymentrequired']=="1")
			$paymentrequired=$_GET['paymentrequired'];
			
?>
<div class="darkgray-form">
            <div class="tabs-form">
              <ul class="tabz">
                <li class="active"><a href="/account/sales">Orders</a></li>
              </ul>
              <div class="tabz-content">
              	<form method="get"  name="frmSearchSalesOrder" id="frmSearchSalesOrder" class="siteForm ondark" rel="search" >
              	
<table width="100%">
<tbody>
	<tr>
		<td> <input type="text" name="keyword"  value="<?=$keyword?>" placeholder="Keyword" title=""></td>
		<td> 
			<select name="status" title="" id="">
				<option value="">Select</option>
				<option value="1" <?php if($status=="1") echo 'selected'; ?> >Payment Pending</option>
				<option value="2" <?php if($status=="2") echo 'selected'; ?> >Payment Confirmed</option>
				<option value="12" <?php if($status=="12") echo 'selected'; ?> >Cash on Delivery</option>
				<option value="13" <?php if($status=="13") echo 'selected'; ?> >Approved</option>
				<option value="4" <?php if($status=="4") echo 'selected'; ?> >In Process</option>
				<option value="5" <?php if($status=="5") echo 'selected'; ?> >Shipped</option>
				<option value="6" <?php if($status=="6") echo 'selected'; ?> >Delivered</option>
				<option value="11" <?php if($status=="11") echo 'selected'; ?> >Return Requested</option>
				<option value="7" <?php if($status=="7") echo 'selected'; ?> >Completed</option>
				<option value="8" <?php if($status=="8") echo 'selected'; ?> >Cancelled</option>
				<option value="9" <?php if($status=="9") echo 'selected'; ?> >Refunded/Completed</option>
			</select>
		</td>
		<td> <input type="text" name="date_from" placeholder="Date From" class="date-pick calendar" readonly="" title="" value="<?=$date_from?>"></td>
		<td> <input type="text" name="date_to" placeholder="Date To" class="date-pick calendar" readonly="" title=""  value="<?=$date_to?>"></td>

		<td><div class="remember"><input type="checkbox" name="unrated" value="1" <?php if($unrated=='1')echo 'checked'; ?> >Unrated <br></div></td>
		<td><div class="remember"><input type="checkbox" name="paymentrequired" value="1"  <?php if($paymentrequired=='1')echo 'checked'; ?> >Payment Required <br></div></td>
		<td> <input type="submit" name="mode" class="btn primary-btn" title="" value="Search"></td>
	</tr>
</tbody>
</table>
			</form>
    </div>
</div>
          
</div>          
          
                     
          <div class="tbl-listing">
            <h4><?php echo sprintf(Utilities::getLabel('L_Items_x_to_y_of_z_total'))?></h4>
            
<?php if(count($order_rows)>0){ ?>            
            <table>
              <tbody>
                <tr>
                 <th width="20%">Invoice No</th>
                  <th width="25%"><?php echo Utilities::getLabel('L_Name')?></th>
                  <th width="10%"><?php echo Utilities::getLabel('L_Brand')?></th>
                  <th width="15%"><?php echo Utilities::getLabel('L_Date')?></th>
                  <th width="10%"><?php echo Utilities::getLabel('L_Price')?></th>
                  <th>Rating Status</th>
                  <th width="20%"><?php echo Utilities::getLabel('L_Action')?></th>
                </tr>
                <?php $cnt=0;  foreach ($order_rows as $sn=>$row){
				/* 
                echo "<pre>"; 
                print_r($row);
                echo "</pre>"; 
                */
  
 $flag=true; 
       
$mydb=Syspage::getdb();
$query="select * from tbl_order_rating where tor_order_id = '".$row['order_id']."' and tor_seller_id = '".$_user_id."' and tor_buyer_id = '".$row['order_user_id']."' and tor_opr_id = '".$row['opr_id']."' limit 1";
//echo $query;
$rs=$mydb->query($query);
$rating=$mydb->fetch_all($rs);

//print_r($rating);


// status

$query="select * from tbl_orders_status_history where opr_id = '".$row['opr_id']."' order by date_added desc limit 1";
//echo $query;
$StatusRs=$mydb->query($query);
$statusArry=$mydb->fetch_all($StatusRs);

if($status!="" && $statusArry[0]['orders_status_id']!=$status)
	$flag= false;


// status
$rateCount = count($rating[0]);

 
if($unrated=='1' && $rateCount >= 1)
	$flag=false;
elseif($paymentrequired =='1' && $statusArry[0]['orders_status_id']=='1')
{
	if($unrated=='1' && $rateCount >= 1 )
		$flag=false;
		
	$now = time(); // or your date as well
	$your_date = strtotime($row['order_date_added']);
	$datediff = $now - $your_date;

	$diff= floor($datediff / (60 * 60 * 24));
	if($diff < 7)
		$flag=false;

}else
if($paymentrequired =='1' && $statusArry[0]['orders_status_id']!='1')
 	$flag=false;
 
 	


	
//echo $row['order_date_added'];
 
	if($flag)
	{ $cnt++;
	
	/*echo "<pre>";
	print_r($row);
	echo "</pre>";*/


	               
                ?>
                <tr>
               	  <td><?=$row['opr_order_invoice_number']?></td>
                  <td width="30%"><span class="cellcaption"><?php echo Utilities::getLabel('L_Name')?></span><?php echo trim($row["opr_name"])?> </td>
				  <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Brand')?></span><?php echo Utilities::displayNotApplicable($row["opr_brand"]) ?></td>
 	              <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Date')?></span><?php echo Utilities::formatDate($row["order_date_added"]) ?></td>
                  <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Price')?></span><?php echo $currencyObj->format($row["opr_net_charged"],$row["order_currency_code"],$row["order_currency_value"]) ?></td>
                 
                  <td>
<?php
	 
		if($rateCount>=1)
		{
			if($rating[0]['tor_rating']=='-1')
				echo '<img src="/images/unhappy.png" width="30" height="30">';
			elseif($rating[0]['tor_rating']=='1')
				echo '<img src="/images/happy-xxl.png" width="30" height="30">';
			elseif($rating[0]['tor_rating']=='0')
				echo '<img src="/images/nutral.png" width="30" height="30">';
		}
		else	echo '<label class="label label-danger">Unrated</lable>';
?>                  
                  </td>
                  
                  <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Action')?></span><a class="actions" href="<?php echo Utilities::generateUrl('account', 'sales_view_order', array($row['opr_id']))?>" title="<?php echo Utilities::getLabel('L_View_Order')?>"><img src="<?php echo CONF_WEBROOT_URL?>images/retina/view.svg" alt=""/></a> 


<?php if($rateCount==0){ ?>
<!-- add new rating start-->
                  <a class="actions rateYourOrder " data-order_user_id="<?=$row['order_user_id']?>"  data-order_id="<?=$row['order_id']?>"  data-order_product_id="<?=$row['opr_id']?>" data-toggle="modal" data-target="#myModal" title="Rate"><img src="<?php echo CONF_WEBROOT_URL?>images/retina/list.svg" alt=""/></a>
<!-- add new rating end-->
<?php }else { ?>
<!-- update rating start-->
                  <a class="actions rateYourOrderUpdate " data-rate_id="<?=$rating[0]['tor_id']?>"  title="Update Rating"><img src="<?php echo CONF_WEBROOT_URL?>images/retina/list.svg" alt=""/></a>
<!-- add new rating end-->	
<?php } ?>                  
                  
                  </td>
               
				
				  </tr>
<?php 
	
	}// flag
}//foreach
			if($cnt==0)
			{
?>
				<tr>
					<td colspan="6">
						<div class="space-lft-right">    
    	<div class="alert alert-info">
                <p>No order found for your search</p>
              </div>
    </div>
					</td>
				</tr>
<?php				
			}
?>


              </tbody>
            </table>
<?php }else{
?>
	<div class="space-lft-right">    
    	<div class="alert alert-info">
                <p>No order found for your search</p>
              </div>
    </div>
    
<?php	
}?>           
          </div>
          <?php else:?>
          	
          	<div class="space-lft-right">    
            	<div class="alert alert-info">
                        <p><?php echo Utilities::getLabel('L_You_have_not_received_any_order')?></p>
                      </div>
            </div>
		 <?php endif;?>
          
        </div>
        
      </div>
    </div>
  </div>







<script>
	$('.rateYourOrder').click(function(){
		$('#rate_order_id').val($(this).data('order_id'));	
		$('#rate_buyer_id').val($(this).data('order_user_id'));	
		$('#rate_order_product_id').val($(this).data('order_product_id'));	
		$('#rating_mode').val('add');	
		
		$("#rating_p").prop("checked", false);
		$("#rating_0").prop("checked", false);
		$("#rating_n").prop("checked", false);
		$("#feedback").val("");
	});
	
	
	
	$('.rateYourOrderUpdate').click(function(){
		$('#rating_mode').val('update');	
		var tor_id = $(this).data('rate_id');
	$.ajax({
		type:'POST',
		data: 'tor_id='+ tor_id,
		datatype:'json',
		url: "buyer_rating_details",
		success:function(data){
			var obj = jQuery.parseJSON(data);
			if(obj.status=='success')
			{
				$('#tor_id').val(obj.tor_id);
				if(obj.tor_rating=='1')
					$("#rating_p").prop("checked", true);
				else if(obj.tor_rating=='0')
					$("#rating_0").prop("checked", true);
				else if(obj.tor_rating=='-1')
					$("#rating_n").prop("checked", true);
				
				$('#feedback').val(obj.tor_feedback);
				$('#myModal').modal('toggle');
			}else 
			{
				alert('Your browser made invalid request, Please try again');
			}
		}
	});
			
	});
</script>

<!-- modal start --> 
 
 <style>
 #myAccount, .header{
 	z-index:999 !important;
 }
 
 	[role="button"] {
  cursor: pointer;
}
.modal-open {
  overflow: hidden;
}
.modal {
  display: none;
  overflow: hidden;
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1050;
  -webkit-overflow-scrolling: touch;
  outline: 0;
}
.modal.fade .modal-dialog {
  -webkit-transform: translate(0, -25%);
  -ms-transform: translate(0, -25%);
  -o-transform: translate(0, -25%);
  transform: translate(0, -25%);
  -webkit-transition: -webkit-transform 0.3s ease-out;
  -o-transition: -o-transform 0.3s ease-out;
  transition: transform 0.3s ease-out;
}
.modal.in .modal-dialog {
  -webkit-transform: translate(0, 0);
  -ms-transform: translate(0, 0);
  -o-transform: translate(0, 0);
  transform: translate(0, 0);
}
.modal-open .modal {
  overflow-x: hidden;
  overflow-y: auto;
}
.modal-dialog {
  position: relative;
  width: auto;
  margin: 10px;
}
.modal-content {
  position: relative;
  background-color: #ffffff;
  border: 1px solid #999999;
  border: 1px solid rgba(0, 0, 0, 0.2);
  border-radius: 0px;
  -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
  -webkit-background-clip: padding-box;
          background-clip: padding-box;
  outline: 0;
}
.modal-backdrop {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 1040;
  background-color: #000000;
}
.modal-backdrop.fade {
  opacity: 0;
  filter: alpha(opacity=0);
}
.modal-backdrop.in {
  opacity: 0.5;
  filter: alpha(opacity=50);
}
.modal-header {
  padding: 15px;
  border-bottom: 1px solid #e5e5e5;
  min-height: 16.42857143px;
}
.modal-header .close {
  margin-top: -2px;
}
.modal-title {
  margin: 0;
  line-height: 1.42857143;
}
.modal-body {
  position: relative;
  padding: 15px;
}
.modal-footer {
  padding: 15px;
  text-align: right;
  border-top: 1px solid #e5e5e5;
}
.modal-footer .btn + .btn {
  margin-left: 5px;
  margin-bottom: 0;
}
.modal-footer .btn-group .btn + .btn {
  margin-left: -1px;
}
.modal-footer .btn-block + .btn-block {
  margin-left: 0;
}
.modal-scrollbar-measure {
  position: absolute;
  top: -9999px;
  width: 50px;
  height: 50px;
  overflow: scroll;
}
.close {
  float: right;
  font-size: 21px;
  font-weight: bold;
  line-height: 1;
  color: #000;
  text-shadow: 0 1px 0 #fff;
  filter: alpha(opacity=20);
  opacity: .2;
}
button.close {
  -webkit-appearance: none;
  padding: 0;
  cursor: pointer;
  background: transparent;
  border: 0;
}
.close:hover, .close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
  filter: alpha(opacity=50);
  opacity: .5;
}
@media (min-width: 768px) {
  .modal-dialog {
    width: 600px;
    margin: 30px auto;
  }
  .modal-content {
    -webkit-box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.5);
  }
  .modal-sm {
    width: 300px;
  }
}
@media (min-width: 992px) {
  .modal-lg {
    width: 900px;
  }
}

.clearfix:after,
.modal-footer:after {
  clear: both;
}
.hide {
  display: none !important;
}
.show {
  display: block !important;
}
.invisible {
  visibility: hidden;
}
.text-hide {
  font: 0/0 a;
  color: transparent;
  text-shadow: none;
  background-color: transparent;
  border: 0;
}
.hidden {
  display: none !important;
}
.affix {
  position: fixed;
}

 </style> 
  <!-- Trigger the modal with a button -->


<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog" style="z-index: 99999">
  <div class="modal-dialog">
  
  
<form class="form-horizontal" method="POST">
<input type="hidden" name="rating_mode" id="rating_mode" value="add" />
<input type="hidden" name="rate_order_id" id="rate_order_id" />
<input type="hidden" name="rate_seller_id" id="rate_seller_id" value="<?=$_user_id?>" />
<input type="hidden" name="rate_buyer_id" id="rate_buyer_id"  />
<input type="hidden" name="rate_order_product_id" id="rate_order_product_id"  />
<input type="hidden" name="tor_id" id="tor_id"  />

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Rate Your Order</h4>
      </div>
      <div class="modal-body">
      
      
      
  <div class="form-group">
    <label class="control-label col-sm-3" for="email"><strong>Ratings:</strong></label>
    <div class="col-sm-3"><input type="radio" name="rating" id="rating_p" value="1" required=""/> <span>+1 Positive</span></div>
    <div class="col-sm-3"><input type="radio" name="rating" id="rating_0"  value="0" required=""/> <span>0 Neutral</span></div>
    <div class="col-sm-3"><input type="radio" name="rating" id="rating_n"  value="-1" required=""/> <span>-1 negative</span></div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-3" for="pwd"><strong>Feedback:</strong></label>
    <div class="col-sm-9"> 
    	<textarea name="feedback" id="feedback" class="form-control" required=""></textarea>
    </div>
  </div>
  
    </div>
      <div class="modal-footer">
        <input type="submit" id="btnConfirmRate" name="btnConfirmRate" class="btn btn-success"  value="Rate" />
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
    </div>

</form>

  </div>
</div>



<script>
 
	/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*!
 * Generated using the Bootstrap Customizer (http://getbootstrap.com/customize/?id=4cc52633a8e49b1aac11)
 * Config saved to config.json and https://gist.github.com/4cc52633a8e49b1aac11
 */

if (typeof jQuery === 'undefined') {
  throw new Error('Bootstrap\'s JavaScript requires jQuery')
}
+function ($) {
  'use strict';
  var version = $.fn.jquery.split(' ')[0].split('.')
  if ((version[0] < 2 && version[1] < 9) || (version[0] == 1 && version[1] == 9 && version[2] < 1)) {
    throw new Error('Bootstrap\'s JavaScript requires jQuery version 1.9.1 or higher')
  }
}(jQuery);

/* ========================================================================
 * Bootstrap: modal.js v3.3.4
 * http://getbootstrap.com/javascript/#modals
 * ========================================================================
 * Copyright 2011-2015 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */


+function ($) {
  'use strict';

  // MODAL CLASS DEFINITION
  // ======================

  var Modal = function (element, options) {
    this.options             = options
    this.$body               = $(document.body)
    this.$element            = $(element)
    this.$dialog             = this.$element.find('.modal-dialog')
    this.$backdrop           = null
    this.isShown             = null
    this.originalBodyPad     = null
    this.scrollbarWidth      = 0
    this.ignoreBackdropClick = false

    if (this.options.remote) {
      this.$element
        .find('.modal-content')
        .load(this.options.remote, $.proxy(function () {
          this.$element.trigger('loaded.bs.modal')
        }, this))
    }
  }

  Modal.VERSION  = '3.3.4'

  Modal.TRANSITION_DURATION = 300
  Modal.BACKDROP_TRANSITION_DURATION = 150

  Modal.DEFAULTS = {
    backdrop: true,
    keyboard: true,
    show: true
  }

  Modal.prototype.toggle = function (_relatedTarget) {
    return this.isShown ? this.hide() : this.show(_relatedTarget)
  }

  Modal.prototype.show = function (_relatedTarget) {
    var that = this
    var e    = $.Event('show.bs.modal', { relatedTarget: _relatedTarget })

    this.$element.trigger(e)

    if (this.isShown || e.isDefaultPrevented()) return

    this.isShown = true

    this.checkScrollbar()
    this.setScrollbar()
    this.$body.addClass('modal-open')

    this.escape()
    this.resize()

    this.$element.on('click.dismiss.bs.modal', '[data-dismiss="modal"]', $.proxy(this.hide, this))

    this.$dialog.on('mousedown.dismiss.bs.modal', function () {
      that.$element.one('mouseup.dismiss.bs.modal', function (e) {
        if ($(e.target).is(that.$element)) that.ignoreBackdropClick = true
      })
    })

    this.backdrop(function () {
      var transition = $.support.transition && that.$element.hasClass('fade')

      if (!that.$element.parent().length) {
        that.$element.appendTo(that.$body) // don't move modals dom position
      }

      that.$element
        .show()
        .scrollTop(0)

      that.adjustDialog()

      if (transition) {
        that.$element[0].offsetWidth // force reflow
      }

      that.$element
        .addClass('in')
        .attr('aria-hidden', false)

      that.enforceFocus()

      var e = $.Event('shown.bs.modal', { relatedTarget: _relatedTarget })

      transition ?
        that.$dialog // wait for modal to slide in
          .one('bsTransitionEnd', function () {
            that.$element.trigger('focus').trigger(e)
          })
          .emulateTransitionEnd(Modal.TRANSITION_DURATION) :
        that.$element.trigger('focus').trigger(e)
    })
  }

  Modal.prototype.hide = function (e) {
    if (e) e.preventDefault()

    e = $.Event('hide.bs.modal')

    this.$element.trigger(e)

    if (!this.isShown || e.isDefaultPrevented()) return

    this.isShown = false

    this.escape()
    this.resize()

    $(document).off('focusin.bs.modal')

    this.$element
      .removeClass('in')
      .attr('aria-hidden', true)
      .off('click.dismiss.bs.modal')
      .off('mouseup.dismiss.bs.modal')

    this.$dialog.off('mousedown.dismiss.bs.modal')

    $.support.transition && this.$element.hasClass('fade') ?
      this.$element
        .one('bsTransitionEnd', $.proxy(this.hideModal, this))
        .emulateTransitionEnd(Modal.TRANSITION_DURATION) :
      this.hideModal()
  }

  Modal.prototype.enforceFocus = function () {
    $(document)
      .off('focusin.bs.modal') // guard against infinite focus loop
      .on('focusin.bs.modal', $.proxy(function (e) {
        if (this.$element[0] !== e.target && !this.$element.has(e.target).length) {
          this.$element.trigger('focus')
        }
      }, this))
  }

  Modal.prototype.escape = function () {
    if (this.isShown && this.options.keyboard) {
      this.$element.on('keydown.dismiss.bs.modal', $.proxy(function (e) {
        e.which == 27 && this.hide()
      }, this))
    } else if (!this.isShown) {
      this.$element.off('keydown.dismiss.bs.modal')
    }
  }

  Modal.prototype.resize = function () {
    if (this.isShown) {
      $(window).on('resize.bs.modal', $.proxy(this.handleUpdate, this))
    } else {
      $(window).off('resize.bs.modal')
    }
  }

  Modal.prototype.hideModal = function () {
    var that = this
    this.$element.hide()
    this.backdrop(function () {
      that.$body.removeClass('modal-open')
      that.resetAdjustments()
      that.resetScrollbar()
      that.$element.trigger('hidden.bs.modal')
    })
  }

  Modal.prototype.removeBackdrop = function () {
    this.$backdrop && this.$backdrop.remove()
    this.$backdrop = null
  }

  Modal.prototype.backdrop = function (callback) {
    var that = this
    var animate = this.$element.hasClass('fade') ? 'fade' : ''

    if (this.isShown && this.options.backdrop) {
      var doAnimate = $.support.transition && animate

      this.$backdrop = $('<div class="modal-backdrop ' + animate + '" />')
        .appendTo(this.$body)

      this.$element.on('click.dismiss.bs.modal', $.proxy(function (e) {
        if (this.ignoreBackdropClick) {
          this.ignoreBackdropClick = false
          return
        }
        if (e.target !== e.currentTarget) return
        this.options.backdrop == 'static'
          ? this.$element[0].focus()
          : this.hide()
      }, this))

      if (doAnimate) this.$backdrop[0].offsetWidth // force reflow

      this.$backdrop.addClass('in')

      if (!callback) return

      doAnimate ?
        this.$backdrop
          .one('bsTransitionEnd', callback)
          .emulateTransitionEnd(Modal.BACKDROP_TRANSITION_DURATION) :
        callback()

    } else if (!this.isShown && this.$backdrop) {
      this.$backdrop.removeClass('in')

      var callbackRemove = function () {
        that.removeBackdrop()
        callback && callback()
      }
      $.support.transition && this.$element.hasClass('fade') ?
        this.$backdrop
          .one('bsTransitionEnd', callbackRemove)
          .emulateTransitionEnd(Modal.BACKDROP_TRANSITION_DURATION) :
        callbackRemove()

    } else if (callback) {
      callback()
    }
  }

  // these following methods are used to handle overflowing modals

  Modal.prototype.handleUpdate = function () {
    this.adjustDialog()
  }

  Modal.prototype.adjustDialog = function () {
    var modalIsOverflowing = this.$element[0].scrollHeight > document.documentElement.clientHeight

    this.$element.css({
      paddingLeft:  !this.bodyIsOverflowing && modalIsOverflowing ? this.scrollbarWidth : '',
      paddingRight: this.bodyIsOverflowing && !modalIsOverflowing ? this.scrollbarWidth : ''
    })
  }

  Modal.prototype.resetAdjustments = function () {
    this.$element.css({
      paddingLeft: '',
      paddingRight: ''
    })
  }

  Modal.prototype.checkScrollbar = function () {
    var fullWindowWidth = window.innerWidth
    if (!fullWindowWidth) { // workaround for missing window.innerWidth in IE8
      var documentElementRect = document.documentElement.getBoundingClientRect()
      fullWindowWidth = documentElementRect.right - Math.abs(documentElementRect.left)
    }
    this.bodyIsOverflowing = document.body.clientWidth < fullWindowWidth
    this.scrollbarWidth = this.measureScrollbar()
  }

  Modal.prototype.setScrollbar = function () {
    var bodyPad = parseInt((this.$body.css('padding-right') || 0), 10)
    this.originalBodyPad = document.body.style.paddingRight || ''
    if (this.bodyIsOverflowing) this.$body.css('padding-right', bodyPad + this.scrollbarWidth)
  }

  Modal.prototype.resetScrollbar = function () {
    this.$body.css('padding-right', this.originalBodyPad)
  }

  Modal.prototype.measureScrollbar = function () { // thx walsh
    var scrollDiv = document.createElement('div')
    scrollDiv.className = 'modal-scrollbar-measure'
    this.$body.append(scrollDiv)
    var scrollbarWidth = scrollDiv.offsetWidth - scrollDiv.clientWidth
    this.$body[0].removeChild(scrollDiv)
    return scrollbarWidth
  }


  // MODAL PLUGIN DEFINITION
  // =======================

  function Plugin(option, _relatedTarget) {
    return this.each(function () {
      var $this   = $(this)
      var data    = $this.data('bs.modal')
      var options = $.extend({}, Modal.DEFAULTS, $this.data(), typeof option == 'object' && option)

      if (!data) $this.data('bs.modal', (data = new Modal(this, options)))
      if (typeof option == 'string') data[option](_relatedTarget)
      else if (options.show) data.show(_relatedTarget)
    })
  }

  var old = $.fn.modal

  $.fn.modal             = Plugin
  $.fn.modal.Constructor = Modal


  // MODAL NO CONFLICT
  // =================

  $.fn.modal.noConflict = function () {
    $.fn.modal = old
    return this
  }


  // MODAL DATA-API
  // ==============

  $(document).on('click.bs.modal.data-api', '[data-toggle="modal"]', function (e) {
    var $this   = $(this)
    var href    = $this.attr('href')
    var $target = $($this.attr('data-target') || (href && href.replace(/.*(?=#[^\s]+$)/, ''))) // strip for ie7
    var option  = $target.data('bs.modal') ? 'toggle' : $.extend({ remote: !/#/.test(href) && href }, $target.data(), $this.data())

    if ($this.is('a')) e.preventDefault()

    $target.one('show.bs.modal', function (showEvent) {
      if (showEvent.isDefaultPrevented()) return // only register focus restorer if modal will actually get shown
      $target.one('hidden.bs.modal', function () {
        $this.is(':visible') && $this.trigger('focus')
      })
    })
    Plugin.call($target, option, this)
  })

}(jQuery);
</script>


<!-- modal end --> 




