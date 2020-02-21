<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div class="data-side">
    <div class="box-head">
        <h4><?php echo Utilities::getLabel('L_Place_Your_Request')?></h4>
    </div>
    <span id="ajax_message"></span>
    <div class="wrapform">
	    <?php echo $frmBrandRequest->getFormHtml(); ?>
   	</div>
</div>
<script type="text/javascript">

</script>  