<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div class="data-side">
    <div class="box-head">
        <h4><?php echo Utilities::getLabel('L_Create_Your_Own_Product_Tag')?></h4>
    </div>
    <span id="ajax_message"></span>
    <div class="wrapform">
	    <?php echo $frmProductTag->getFormHtml(); ?>
   	</div>
</div>
<script type="text/javascript">

</script>  