<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div id="paymenttab" class="relative_div">
    <?php
        if (isset($order_payment_financials) && $order_payment_financials["order_payment_gateway_charge"] <= 0)
        {
            ?><div class="inactive_div"></div><?php } ?>
    <div class="payment_methods_list">	
        <ul class="resp-tabs-list" id="payment_methods_tab">
            <?php
                $tab_pos = FALSE;
                $_mydb = Syspage::getdb();

                foreach ($payment_methods as $sn => $val)
                {
                    if ($val['pmethod_id'] != Settings::getSetting("CONF_COD_PAYMENT_METHOD") || Settings::getSetting("CONF_ENABLE_COD_PAYMENTS"))
                    {
                        $custom_method_ids = array(
                            '9999', '9997'
                        );

//                        if ($sn == 0)
//                            $tabctive = $val["pmethod_id"];

                        if ($tab_pos == FALSE)
                        {
                            $rs = $_mydb->query("SELECT * FROM tbl_buyer_payment_options where tbpo_shop_id = '" . $_GET['shop'] . "' AND tbpo_method_name='" . $val['pmethod_code'] . "' AND tbpo_status = '1' limit 1");
                            $row = $_mydb->fetch_all($rs);
                            if (count($row) > 0)
                            {
                                $tabctive = $val["pmethod_id"];
                                $tab_pos = TRUE;
                            }
                        }


                        if (isset($_SESSION['shopping_cart']["payment_method"]) && $_SESSION['shopping_cart']["payment_method"] > 0)
                            $tabctive = $_SESSION['shopping_cart']["payment_method"];

                        if (in_array($val['pmethod_id'], $custom_method_ids))
                        {
                            $rs = $_mydb->query("SELECT * FROM tbl_buyer_payment_options where tbpo_shop_id = '" . $_GET['shop'] . "' AND tbpo_method_name='" . $val['pmethod_code'] . "' AND tbpo_status = '1' limit 1");
                            $row = $_mydb->fetch_all($rs);
                            if (count($row) > 0)
                            {
                                ?>
                                <li class="<?php echo (($tabctive == $val['pmethod_id']) ? 'resp-tab-active' : ''); ?>" data-filter="<?php echo $val["pmethod_id"] ?>"><a href="<?php echo Utilities::generateUrl("cart", 'payment_tab', array($order_info["order_id"], $val["pmethod_id"])); ?>"><i><img src="<?php echo Utilities::generateUrl('image', 'payment_icon', array($val["pmethod_icon"])); ?>" width="22"  alt=""/></i><span><?php echo $val["pmethod_name"] ?></span></a></li>	
                                <?php
                            }
                        }
                        else
                        {
                            ?>	
                            <li class="<?php echo (($tabctive == $val['pmethod_id']) ? 'resp-tab-active' : ''); ?>" data-filter="<?php echo $val["pmethod_id"] ?>"><a href="<?php echo Utilities::generateUrl("cart", 'payment_tab', array($order_info["order_id"], $val["pmethod_id"])); ?>"><i><img src="<?php echo Utilities::generateUrl('image', 'payment_icon', array($val["pmethod_icon"])); ?>" width="22"  alt=""/></i><span><?php echo $val["pmethod_name"] ?></span></a></li>
                            <?php
                        }
                    }
                } // for ends
                /* 						
                  $tabctive=9999;
                  $_mydb = Syspage::getdb();
                  $rs =$_mydb ->query("SELECT * FROM tbl_buyer_payment_options where tbpo_shop_id = '".$_GET['shop']."' AND tbpo_status = '1' limit 1");
                  $row = $_mydb->fetch_all($rs);
                  if(count($row)>0)
                  {
                  ?>
                  <li data-filter="9999">
                  <a>
                  <i><img src="/image/subscriptionpayment_icon/PayFast-logo.png" width="22"  alt=""/></i>
                  <span>PayFast</span>
                  </a>
                  </li>

                  <?php
                  } */
            ?>
        </ul>
    </div>
    <div class="resp-tabs-container">
        <div id="personalTabId" class="tabs-cn-area resp-tab-content">
            <div class="amount-desc">
                <ul>
                    <li class="total"><?php echo Utilities::getLabel('M_Net_Payable') ?>
                        <span class="figure">
<?php echo Utilities::displayMoneyFormat($order_payment_financials["order_payment_gateway_charge"]) ?>
                        </span>
                    </li>
                </ul>
<?php
    if ($payment_ready)
    {
        ?>
                        <?php $my_order_referance = $my_order_details['order_reference']; ?>

                        <table style="font-size: 12px;">
                            <tr>
                                <!--	
                                                <td style="width: 100px;vertical-align: text-bottom;position: relative;">
                                                        <img src="/images/bank_logo/sellsa_eft.png" />
                                                </td>
                                                <td style="position: relative;padding-left: 20px;padding-bottom: 20px;">
                                                        <p><span style="color: #ff0000;font-weight: 600">Please Note :</span> This option will display the banking details you need to make an EFT payment.</p>
                                                </td>
                                -->		
                            </tr>
                        </table>
                        <div id="tabs-container"></div>

        <?php
    }
    else
    {
        ?>
                        <div class="alert alert-danger"><?php echo Utilities::getLabel('L_WARNING_ORDER_INVALID') ?></div>
                    <?php } ?>

            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var containerId = '#tabs-container';
    var tabsId = '#payment_methods_tab';
    $(document).ready(function () {
        if ($(tabsId + ' LI.resp-tab-active A').length > 0) {
            loadTab($(tabsId + ' LI.resp-tab-active A'));
        }
        $(tabsId + ' A').click(function () {
            if ($(this).parent().hasClass('resp-tab-active')) {
                return false;
            }
            $(tabsId + ' LI.resp-tab-active').removeClass('resp-tab-active');
            $(this).parent().addClass('resp-tab-active');

            loadTab($(this));

            /*  if($(this).parent().data('filter') != 9999 )
             {
             loadTab($(this));
             }else
             {
             
             
             $('#tabs-container').html(str);
             }*/
            return false;

        });
    });
    function loadTab(tabObj) {
        //HideJsSystemMessage();
        if (!tabObj || !tabObj.length) {
            return;
        }
        showCssElementLoading($(containerId));
        $(containerId).fadeOut('fast');
        //alert(tabObj.attr('href'));
        //return false;

        callAjax(tabObj.attr('href'), '', function (t) {
            var ans = parseJsonData(t);
            $(containerId).html(ans.html)
            $(containerId).fadeIn('fast');
            if (ans.msg != "") {
                ShowJsSystemMessage(ans.msg);
                setTimeout(function () {
                    HideJsSystemMessage();
                }, 8000);
                reloadCheckoutSideBar();
                loadPaymentSummary();
            }
        });

        /*var href=tabObj.attr('href');*/
        /*$(containerId).load(tabObj.attr('href'), function(){
         $(containerId).fadeIn('fast');
         });*/
    }



</script>    