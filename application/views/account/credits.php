<?php defined('SYSTEM_INIT') or die('Invalid Usage'); global $txn_status_arr; ?>
<div class="body clearfix">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <h3><?php echo Utilities::getLabel('L_My_Wallet')?></h3>
          
          <div>
            <div class="mycredits space-lft-right">
                <div class="box">
                  <div class="crr-blnc"><?php echo Utilities::getLabel('L_Current_Balance')?>: <strong><?php echo Utilities::displayMoneyFormat($user_details["totUserBalance"])?></strong> </div>
                  <a class="btn primary-btn" href="<?php echo Utilities::generateUrl('account','request_withdrawal')?>">Request Withdraw<!--<?php echo Utilities::getLabel('L_Request_Withdrawal')?>--></a> </div>
                <div class="box last">
	                <?php echo str_replace("<br>",'',$walletfrm->getFormHtml()); ?>
    	         </div>
	         </div>
          <div class="gap"></div>
          <div class="clearfix"></div>
 




<!-- wallet transactions -->
 <?php if (count($my_credits1)>0){ ?>
          <div class="darkgray-form clearfix">
            <div class="left-txt">Wallet Orders
            	<!--<?php echo sprintf(Utilities::getLabel('L_Items_x_to_y_of_z_total'),$start_record,$end_record,$total_records)?>-->
            		
            </div>
          </div>
          <div class="tbl-listing">
            <table>
              <tbody>
                <tr>
                  <th width="14%"><?php echo Utilities::getLabel('L_ID')?></th>
                  <th width="14%"><?php echo Utilities::getLabel('L_Date')?></th>
                  <th width="14%">Referance Number</th>
                  <th width="10%">Amount</th>
                  <th width="10%"><?php echo Utilities::getLabel('L_Status')?></th>
                </tr>
                <?php foreach ($my_credits1 as $key=>$val):
                
              //  if($val['rwr_payment_status']=='Pending')
                {
                	//echo '<pre>';
                	//print_r($val);
                 ?>
            <tr>
                <td><?php echo $val["rwr_invoice_number"];?></td>
                <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Date')?></span><?php echo Utilities::formatDate($val["rwr_date"])?></td>
                
                <td><?php echo ($val["rwr_referance_no"])?></td>
                
                
                 <td class="cellitem"><span class="cellcaption"><?php echo Utilities::getLabel('L_Balance')?></span><span class="nowrap"><?php echo Utilities::displayMoneyFormat($val["rwr_amount"])?></span></td>
                 
                  
                <td class="cellitem">
                
                <span class="cellcaption"><?php echo Utilities::getLabel('L_Status')?></span>
<?php
		echo $val['rwr_payment_status'];
	if($val['rwr_payment_status']=='Pending')
	{
		
?>
		<br/><a href="/sidinstant_pay/charge_for_wallet/<?=$val["rwr_id"]?>">Pay Now</a>
<?php		
	}	
		
?>                
                <!--<span class="txtHightlight <?php if ($val["utxn_status"]==1):?>green<?php else:?>yellow<?php endif;?>">
                <?php echo $txn_status_arr[$val["utxn_status"]]?></span>-->
                
                </td>
            </tr>
				<?php } endforeach;?>
             </tbody>
            </table>
          </div>
          <?php } else{ ?>
           	<div class="space-lft-right">    
           		<div class="alert alert-info">
	                  <?php echo Utilities::getLabel('L_You_not_have_any_wallet_record')?>
    	        </div>
            </div>    
<?php } ?>
          
<!-- wallet transactions -->          
          
          
          
          







<!-- user transactions -->
          
 <?php // starts here ?>          
          
          <?php if (count($my_credits)>0){?>
          <div class="darkgray-form clearfix">
            <div class="left-txt"> User Transactions <!--<?php echo sprintf(Utilities::getLabel('L_Items_x_to_y_of_z_total'),$start_record,$end_record,$total_records)?>--></div>
          </div>
          <div class="tbl-listing">
            <table>
              <tbody>
                <tr>
                  <th width="14%"><?php echo Utilities::getLabel('L_ID')?></th>
                  <th width="14%"><?php echo Utilities::getLabel('L_Date')?></th>
                  <th width="10%"><?php echo Utilities::getLabel('L_Credit')?></th>
                  <th width="10%"><?php echo Utilities::getLabel('L_Debit')?></th>
                  <th width="12%"><?php echo Utilities::getLabel('L_Balance')?></th>
                  <th width="46%"><?php echo Utilities::getLabel('L_Description')?></th>
                  <th width="10%"><?php echo Utilities::getLabel('L_Status')?></th>
                </tr>
                <?php foreach ($my_credits as $key=>$val): $txn=new Transactions($val["utxn_id"]);?>
            <tr>
                <td><span class="cellcaption"><?php echo Utilities::getLabel('L_ID')?></span><?php echo $val["formatted_transaction_number"];?></td>
                <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Date')?></span><?php echo Utilities::formatDate($val["utxn_date"])?></td>
                <td><span class="cellcaption"><?php echo Utilities::getLabel('L_Credit')?></span><span class="nowrap"><?php echo Utilities::displayMoneyFormat($val["utxn_credit"])?></span></td>
                <td class="cellitem"><span class="cellcaption"><?php echo Utilities::getLabel('L_Debit')?></span><span class="nowrap"><?php echo Utilities::displayMoneyFormat($val["utxn_debit"])?></span></td>
                <td class="cellitem"><span class="cellcaption"><?php echo Utilities::getLabel('L_Balance')?></span><span class="nowrap"><?php echo Utilities::displayMoneyFormat($val["balance"])?></span></td>
                <td class="cellitem"><span class="cellcaption"><?php echo Utilities::getLabel('L_Description')?></span><?php echo Utilities::renderHtml($val["formatted_comments"]);?></td>
                <td class="cellitem">
                
                <span class="cellcaption"><?php echo Utilities::getLabel('L_Status')?></span>
<?php
		if($val["utxn_status"]==1)
			echo 'Completed';
		elseif($val["utxn_status"]==2)
			echo 'Partially Paid';
		elseif($val["utxn_status"]==3)
			echo 'Cancelled';
		elseif($val["utxn_status"]==0)
			echo 'Pending';
?>                
                <!--<span class="txtHightlight <?php if ($val["utxn_status"]==1):?>green<?php else:?>yellow<?php endif;?>">
                <?php echo $txn_status_arr[$val["utxn_status"]]?></span>-->
                
                </td>
            </tr>
				<?php endforeach;?>
             </tbody>
            </table>
            <?php if ($pages>1):?>
            <div class="pager">
              <ul>
              <?php echo getPageString('<li><a href="javascript:void(0)" onclick="listPages(xxpagexx);">xxpagexx</a></li>', $pages, $page,'<li class="active"><a  href="javascript:void(0)">xxpagexx</a></li>', '<li>...</li>');?>
              </ul>
            </div>
            <?php endif;?>
          </div>
          <?php } else{ ?>
           	<div class="space-lft-right">    
           		<div class="alert alert-info">
	                  <?php echo Utilities::getLabel('L_You_not_have_any_wallet_record')?>
    	        </div>
            </div>    
          <?php } ?>
          
  <?php // ends here ?>        


<!-- user transactions -->
          
          
          
                    
        </div>
        
      </div>
    </div>
  </div>
  
  
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" id="openConfirmPopUp" style="display: none"></button>
  
  <script>
  	$( "#btnConfirmPopup" ).click(function( event ) {
  		
  		var walletAmt = Number($('#walletAmt').val());
  		if(walletAmt=="")
  		{
  			alert('Invalid Amount. Enter Value Between 1 & 10000');
		}
  		else if(walletAmt <=0)
  		{
  			alert('Invalid Amount. Enter Value Between 1 & 10000');
		}
		else if(walletAmt > 10000){
			alert('Invalid Amount. Enter Value Between 1 & 10000');
		}
		else{
			//$('#openConfirmPopUp').click();	
			$('#btn_Add_Money_to_Wallet').click();
		}
  		
	});
  </script>
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

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Confirm wallet order</h4>
      </div>
      <div class="modal-body">
        <p>Payment to be made by Direct Eft transfer, once you click "confirm" your order will be placed and you will be provided with payment details.</p>
      </div>
      <div class="modal-footer">
        <button type="button" id="btnWalletConfirm" class="btn btn-success" data-dismiss="modal">Confirm</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
      </div>
    </div>

  </div>
</div>



<script>

/*	$( "#btnWalletConfirm" ).click(function( event ) {
  		$('#btn_Add_Money_to_Wallet').click();
	});
 *
	
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
  