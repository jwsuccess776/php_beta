<?php
    defined('SYSTEM_INIT') or die('Invalid Usage');
    $amount = $payment_amount;
?>

<?php
    $action = 'https://paynow.sagepay.co.za/site/paynow.aspx';
    $m1 = '697d1eea-f98b-48fb-afb9-15c7e24abcc6';
    $m4 = $order_id_db = $order_info['id'];
    $p2 = $order_id_unique = $order_info['invoice'];
    $p3 = $desc_of_goods = 'description';
    $m5 = 'Product';
    $p4 = $amount;
    $return_url = 'user/sagepay/payment';
    $notify_url = 'user/sagepay/notify';
    $cancel_url = 'user/sagepay/cancel';
?>
<div class="payment-page">
    <div class="cc-payment">
        <div class="logo-payment"><img src="<?php echo Utilities::generateUrl('image', 'site_logo', array(Settings::getSetting("CONF_FRONT_LOGO"), 'THUMB'), CONF_WEBROOT_URL) ?>" alt=""/></div>
        <div class="reff total-pay">
            <p class="fl"><?= Utilities::getLabel('L_Payable_Amount') ?>:  <strong><?php echo $amount ?></strong> </p>
            <p class="fr"><?= Utilities::getLabel('L_Order_Invoice') ?>: <strong><?php echo Utilities::displayNotApplicable($order_info["invoice"]) ?></strong> </p>

        </div>
        <div class="payment-from">
            <?php
                if (!isset($error))
                {
                    ?>
                    <form action="<?php echo $action; ?>" method="post" name="frmSAGEPAY">
                        <input type="hidden" name="m1" value="<?php echo $m1; ?>" />
                        <input type="hidden" name="m2" value="24ade73c-98cf-47b3-99be-cc7b867b3080" />
                        <input type="hidden" name="p2" value="<?php echo $p2; ?>" />
                        <input type="hidden" name="p3" value="<?php echo $p3; ?>" />
                        <input type="hidden" name="p4" value="<?php echo $p4; ?>" />
                        <input type="hidden" name="m4" value="<?php echo $m4; ?>" />
                        <input type="hidden" name="m5" value="<?php echo $m5; ?>" />
                        <input type="hidden" name="m10" value="<?php echo 'route=payment/paynow/callback'; ?>" />
                        <input type="hidden" name="return_url" value="<?php echo $return_url; ?>" />
                        <input type="hidden" name="notify_url" value="<?php echo $notify_url; ?>" />
                        <input type="hidden" name="cancel_url" value="<?php echo $cancel_url; ?>" />
                        <p> We are redirecting you to payment page...</p>

                    </form>
                    <?php
                }
                else
                {
                    ?>
                    <div class="alert alert-danger">
                        <?php echo $error ?>
                        <div>
                        </div>
                    </div>
                    <?php
                }
            ?>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        setTimeout(function () {
            $('form[name="frmSAGEPAY"]').submit();
        }, 5000);
    });
</script>	