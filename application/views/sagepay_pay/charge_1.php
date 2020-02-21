<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>

<?php
    $action = 'https://paynow.sagepay.co.za/site/paynow.aspx';
    $m1 = '697d1eea-f98b-48fb-afb9-15c7e24abcc6';
    $m4 = $order_id_db = mt_rand(10, 100);
    $p2 = $order_id_unique = mt_rand(10, 100);
    $p3 = $desc_of_goods = 'description';
    $m5 = 'product';
    $p4 = $amount = '222';
    $return_url = 'user/sagepay/payment';
    $notify_url = 'user/sagepay/notify';
    $cancel_url = 'user/sagepay/cancel';
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
    <div class="buttons">
        <div class="pull-right">
            <input type="submit" value="Confirm" class="btn btn-primary" />
        </div>
    </div>
</form>

<script type="text/javascript">
    console
    $(function () {
//        setTimeout(function () {
//            $('form[name="frmSAGEPAY"]').submit();
//        }, 5000);
    })
</script>	