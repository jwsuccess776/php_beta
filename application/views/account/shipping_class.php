<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<script type="text/javascript" src="<?php echo CONF_WEBROOT_URL; ?>js/LiveEditor/scripts/innovaeditor.js"></script>
<script src="<?php echo CONF_WEBROOT_URL; ?>js/LiveEditor/scripts/common/webfont.js" type="text/javascript"></script>
<?php
  $shipping_rates=$data["product_shipping_rates"];
?>
<style>
    .input-state-name{
        width:225px;
    }
    .input-company-name{
        width:175px;
    }
    .input-processing-time{
        width:175px;
    }
    .input-cost{
        width:95px;
    }
    .input-add-cost{
        width:95px;
    }

</style>
<div class="body clearfix">
      <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
      <div class="fixed-container">
        <div class="dashboard">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
          <div class="data-side">
          	<?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
            <!--<h3>Products Setup</h3>-->
             <div class="box-head">
            	<h3><?php echo Utilities::getLabel('L_Shipping_Class_Setup')?> <a href="<?php echo Utilities::generateUrl('account', 'shipping_class_setup_info')?>" rel="fancy_popup_box"> <i class="svg-icn">
              <svg version="1.1" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 245.334 245.334" xmlns:xlink="http://www.w3.org/1999/xlink" enable-background="new 0 0 245.334 245.334">
                <g>
                  <path d="M122.667,0C55.028,0,0,55.028,0,122.667s55.027,122.667,122.666,122.667s122.667-55.028,122.667-122.667   S190.305,0,122.667,0z M122.667,215.334C71.57,215.334,30,173.764,30,122.667S71.57,30,122.667,30s92.667,41.57,92.667,92.667   S173.763,215.334,122.667,215.334z"/>
                  <rect width="30" x="107.667" y="109.167" height="79"/>
                  <rect width="30" x="107.667" y="57.167" height="29"/>
                </g>
              </svg>
              </i></a>
                </h3>
	            <div class="padding20 fr"> <a href="<?php echo Utilities::generateUrl('account', 'shippingclass_publications')?>" class="btn small ">&laquo;&laquo; <?php echo Utilities::getLabel('L_Back_shipping_class')?></a> </div>
          </div>
          	
            <div class="product_tabs">

			
            <?php
                echo $frm->getFormTag ();
            ?>
            <div>
                	<!--tab 1 start here-->
    		                        <div id="tabs_1" class="tabs_content border_cover">
                                            <table id="tab_general">
                                                <tr>
                                                    <td width="25%">
                                                        <label><?php echo Utilities::getLabel('M_CLASS_NAME')?></label>
                                                        <?php if (Settings::getSetting("CONF_PRODUCT_SKU_MANDATORY")){ ?><span class="spn_must_field">*</span><? } ?></td>
                                                    <td><?php echo Utilities::stripRequiredStar($frm->getFieldHTML('class_name'));?></td>
                                                </tr>
                                                <tr class="type_required">
                                                    <td colspan="2"><h4 class="heading"><?php echo Utilities::getLabel('M_Shipping_Info_Charges')?></h4></td>
                                                </tr>

                                                <tr class="shipping_required">
                                                    <td colspan="2">
                                                        <table id="tab_shipping">
                                                            <thead>
                                                                <tr class="type_required">
                                                                    <td colspan="2" class="nopadding">
                                                                        <table id="shipping" class="tbl-responsive">
                                                                            <thead>
                                    <tr>
                                        <th width="17%"><?php echo Utilities::getLabel('M_Ships_To')?></th>
                                        <th width="17%"><?php echo Utilities::getLabel('M_Shipping_Company')?></th>
                                        <th width="17%"><?php echo Utilities::getLabel('M_Processing_Time')?></th>
                                        <th width="25%"><?php echo Utilities::getLabel('M_Cost')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</th>
                                        <th width="20%"><?php echo Utilities::getLabel('M_Each_Additional_Item')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</th>
                                        <th></th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <?php $shipping_row = 0; ?>
                                    <?php foreach ($shipping_rates as $shipping) { ?>
                                     <input type="hidden" name="product_shipping[<?php echo $shipping_row; ?>][pship_id]" value="<?php echo $shipping['pship_id']; ?>" />
                                    <tr id="shipping-row<?php echo $shipping_row; ?>">
                                        <td>
                                            <span class="cellcaption"><?php echo Utilities::getLabel('M_Ships_To')?></span>
                                            <!--<input type="text" name="product_shipping[<?php /*echo $shipping_row; */?>][country_name]" value="<?php /*echo $shipping["pship_country"]!="-1"?$shipping["country_name"]:"&#8594;Everywhere else"*/?>" placeholder="<?php /*echo Utilities::getLabel('M_Shipping')*/?>" />
                                                <input type="hidden" name="product_shipping[<?php /*echo $shipping_row; */?>][country_id]" value="<?php /*echo $shipping["pship_country"]*/?>" />-->
                                            
                                        <?php
                                        
                                            if($shipping['pship_state']!=='0'){
                                               $process_state_id=$shipping['pship_state'];
                                               $process_type='state';
                                               $process_state_name=$shipping['state_name'];
                                            } else {
                                               $process_state_id=$shipping['pship_city']; 
                                               $process_type='city'; 
                                               $process_state_name=$shipping['city_name'];
                                            }
                                            
                                        ?>

                                            <?php $disable = ''; if($shipping["pship_state"] == '-1'){ $disable = 'disabled'; } ?>
                                            <input <?php echo $disable; ?> type="text" style="width:225px;" name="product_shipping[<?php echo $shipping_row; ?>][state_name]" value="<?php echo $shipping["pship_state"]!="-1"?$process_state_name:"&#8594;Everywhere else"?>" placeholder="<?php echo Utilities::getLabel('M_Shipping')?>" required />

                                            <input type="hidden" name="product_shipping[<?php echo $shipping_row; ?>][state_id]" value="<?php echo $process_state_id//echo $shipping["pship_state"]?>" />
                                            <input type="hidden" name="product_shipping[<?php echo $shipping_row; ?>][type]" value="<?php echo $process_type?>" />
                     
                                        </td>
                                        <td>
                                    <span class="cellcaption"><?php echo Utilities::getLabel('M_Shipping_Company')?></span>
                                    <input type="text"  style="width:175px;" name="product_shipping[<?php echo $shipping_row; ?>][company_name]" value="<?php echo $shipping["scompany_name"]?>" placeholder="<?php echo Utilities::getLabel('M_Company')?>" /><input type="hidden" name="product_shipping[<?php echo $shipping_row; ?>][company_id]" value="<?php echo $shipping["scompany_id"]?>" /></td>
                                        <td>
                                            <span class="cellcaption"><?php echo Utilities::getLabel('M_Processing_Time')?></span>
                                            <input type="text" style="width:175px;" name="product_shipping[<?php echo $shipping_row; ?>][processing_time]" value="<?php echo $shipping["sduration_label"]?>" placeholder="<?php echo Utilities::getLabel('M_Processing_Time')?>" required />
                                            <input type="hidden" name="product_shipping[<?php echo $shipping_row; ?>][processing_time_id]" value="<?php echo $shipping["sduration_id"]?>" /></td>
                                        <td>
                                            <span class="cellcaption"><?php echo Utilities::getLabel('M_Cost')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</span>
                                            <input type="text" style="width:95px;" name="product_shipping[<?php echo $shipping_row; ?>][cost]" value="<?php echo $shipping["pship_charges"]?>" placeholder="<?php echo Utilities::getLabel('M_Cost')?>" required />
                                        </td>
                                        <td>
                                            <span class="cellcaption"><?php echo Utilities::getLabel('M_Each_Additional_Item')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</span>
                                            <input type="text" style="width:95px;" name="product_shipping[<?php echo $shipping_row; ?>][additional_cost]" value="<?php echo $shipping["pship_additional_charges"]?>" placeholder="<?php echo Utilities::getLabel('M_Each_Additional_Item')?>" required />
                                        </td>
                                        <td><?php if($shipping_row > 0){ ?>
                                            <button type="button" onclick="$('#shipping-row<?php echo $shipping_row; ?>').remove();" class="btn red " title="<?php echo Utilities::getLabel('M_Remove')?>"  ><i><img src="<?php echo CONF_WEBROOT_URL?>images/minus-white.png" alt=""/></i></button>
                                            <?php } ?>

                                        <!--<a class="button red medium" onclick="$('#shipping-row<?php echo $shipping_row; ?>').remove();"  title="Remove">Remove</a>--></td>
                                    </tr>
                                    <?php $shipping_row++; ?>
                                    <?php } ?>
									</tbody>
                                    <tfoot>
                                    <tr>
                                    <td colspan="5"></td>
                                    <td ><button type="button" class="btn blue " title="<?php echo Utilities::getLabel('M_Shipping')?>" onclick="addShipping();" ><i><img src="<?php echo CONF_WEBROOT_URL?>images/plus-white.png" alt=""/></i></button></td>
                                    </tr>
                                    </tfoot>
                                    </table></td>
                                            </tr>
                                                    </thead>
                                                </table>
                                                    </td>
                                                </tr>
                                            </table>
                    		        </div>

                               	  <div class="gap"></div>
                                  <div class="product_btn_submit border_cover">
	                                  <?php echo $frm->getFieldHTML('btn_submit');?>
                                  </div>
          	</div>
				<?php echo $frm->getFieldHTML('shippingclass_id');?>
                <?php echo $frm->getFieldHTML('shippingclass_added_by');?>
                <?php echo $frm->getFieldHTML('shippingclass_shop');?>
	            <?php echo $frm->getExternalJS();?>
                </form>
              </div>  
          </div>
        </div>
      </div>
    </div>
<script type="text/javascript">
$(document).ready(function(){
    var shipping_row = <?php echo $shipping_row; ?>;
    if(shipping_row == '')
    {
        addShipping_new();
    }
		$(document).trigger('classChange');
		$('.tooltip').tooltipster();
	});
</script>    
   
<script type="text/javascript">

$( document ).ready(function() {
	var elem=$(".shipping_required");
    if(elem.value=='0')
    {
		 $('#prod_requires_shipping').find('option[value=0]').attr('selected','selected');
	    elem.find('input').attr('disabled', true);
		elem.find("td,th").css('color','#ccc');
		elem.find('input').css('background-color', '#ccc');
		elem.find('button').addClass('disabled');
	}
});

<?php
	if($_prod_id=="0")
	{
?>
$( document ).ready(function() {
    $('#prod_requires_shipping').find('option[value=0]').attr('selected','selected');
    $("#prod_requires_shipping").trigger("change");
});

<?php		
	}
?> 

$("#prod_requires_shipping").bind("change", function() { 
	var elem=$(".shipping_required");
	if (this.value==1){		
		elem.find('input').attr('disabled', false);
		elem.find("td,th").css('color','');
		elem.find('input').css('background-color', '');
		elem.find('button').removeClass('disabled');
	}
	else{
		elem.find('input').attr('disabled', true);
		elem.find("td,th").css('color','#ccc');
		elem.find('input').css('background-color', '#ccc');
		elem.find('button').addClass('disabled');
	}
});
$("#prod_requires_shipping").trigger("change");


$("#prod_track_inventory").bind("change", function() {
var elem=$(this).parent().parent().next("tr");
if (this.value==1){	
	elem.find('input').attr('disabled', false);
	elem.find("td").css('color','');
	elem.find('input').css('background-color', '');
}
else{
	elem.find('input').attr('disabled', true);
	elem.find("td").css('color','#ccc');
	elem.find('input').css('background-color', '#ccc');
	
}
});
$("#prod_track_inventory").trigger("change");
$("#prod_ship_free").bind("change", function() {
	var elem=$(this).parent().parent().next("tr");
	if ($(this).is(":checked")){
			//elem.find('input').attr('disabled', true);
			/*elem.find("td").css('color','#ccc');
			elem.find('input').css('background-color', '#ccc');
			elem.find('button').addClass('disabled');*/
	}else{
			//elem.find('input').attr('disabled', false);
			/*elem.find("td").css('color','');
			elem.find('input').css('background-color', '');
			elem.find('button').removeClass('disabled');*/
	}
});
$("#prod_ship_free").trigger("change");


$("#prod_type").bind("change", function() {
	var elem=$(".type_required");
	if (this.value==1){
		elem.show();		
		//ProductfrmValidator_requirements['prod_length'] = {"required":true};
		//ProductfrmValidator_requirements['prod_width'] = {"required":true};
		//ProductfrmValidator_requirements['prod_height'] = {"required":true};
		//ProductfrmValidator_requirements['prod_weight'] = {"required":true};
		elem.find('input').attr('disabled', false);
		
	}else{
		elem.hide();
		elem.find('input').attr('disabled', true);
		//ProductfrmValidator_requirements['prod_length'] = {"required":false};
		//ProductfrmValidator_requirements['prod_width'] = {"required":false};
		//ProductfrmValidator_requirements['prod_height'] = {"required":false};
		//ProductfrmValidator_requirements['prod_weight'] = {"required":false};
	}
	ProductfrmValidator.resetFields();
});
$("#prod_type").trigger("change");

</script>

<script type="text/javascript"><!--
    var shipping_row = <?php echo $shipping_row; ?>;

    function addShipping_new() {
        if (($("#prod_requires_shipping").val()==0)) return;

        /////////////////////////////////////////////////////////
        html  = '<tr id="shipping-row' + shipping_row + '">';
        html += '  <td><input type="text" style="width:225px;" name="product_shipping[' + shipping_row + '][state_name]" value=" Everywhere Else" disabled /><input type="hidden" name="product_shipping[' + shipping_row + '][state_id]" value="-1" /><input type="hidden" name="product_shipping[' + shipping_row + '][type]" value="state" /></td>';
        html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Shipping_Company')?></span><input type="text" style="width:175px;" name="product_shipping[' + shipping_row + '][company_name]" value="" placeholder="<?php echo Utilities::getLabel('M_Shipping_Company')?>" required /><input type="hidden" name="product_shipping[' + shipping_row + '][company_id]" value="" /></td>';
        html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Processing_Time')?></span><input type="text" style="width:175px;" name="product_shipping[' + shipping_row + '][processing_time]" value="" placeholder="<?php echo Utilities::getLabel('M_Processing_Time')?>" required /><input type="hidden" name="product_shipping[' + shipping_row + '][processing_time_id]" value="" /></td>';
        html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Cost')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</span>';
        html += '<input type="text" name="product_shipping[' + shipping_row + '][cost]" style="width:95px;" value="" placeholder="<?php echo Utilities::getLabel('M_Cost')?>" required />';
        html += '</td>';
        html += '<td><span class="cellcaption"><?php echo Utilities::getLabel('M_Each_Additional_Item')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</span>';
        html += '<input type="text" name="product_shipping[' + shipping_row + '][additional_cost]" style="width:95px;" value="" placeholder="<?php echo Utilities::getLabel('M_Each_Additional_Item')?>" required />';
        html += '</td>';
        html += '</tr>';

        /////////////////////////////////////////////////////////

        $('#shipping tbody').append(html);
        shippingautocomplete(shipping_row);
        shipping_row++;
    }

function addShipping() {
	if (($("#prod_requires_shipping").val()==0)) return;

    html  = '<tr id="shipping-row' + shipping_row + '">';
	html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Ships_To')?></span><input type="text" name="product_shipping[' + shipping_row + '][state_name]" value="" placeholder="<?php echo Utilities::getLabel('M_Ships_To')?>" required /><input type="hidden" name="product_shipping[' + shipping_row + '][state_id]" value="" /><input type="hidden" name="product_shipping[' + shipping_row + '][type]" value="" /></td>';
	html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Shipping_Company')?></span><input type="text" name="product_shipping[' + shipping_row + '][company_name]" value="" placeholder="<?php echo Utilities::getLabel('M_Shipping_Company')?>" required /><input type="hidden" name="product_shipping[' + shipping_row + '][company_id]" value="" /></td>';
	html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Processing_Time')?></span><input type="text" name="product_shipping[' + shipping_row + '][processing_time]" value="" placeholder="<?php echo Utilities::getLabel('M_Processing_Time')?>" required /><input type="hidden" name="product_shipping[' + shipping_row + '][processing_time_id]" value="" /></td>';
	html += '  <td><span class="cellcaption"><?php echo Utilities::getLabel('M_Cost')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</span>';
	html += '<input type="text" name="product_shipping[' + shipping_row + '][cost]" value="" placeholder="<?php echo Utilities::getLabel('M_Cost')?>" required />';
	html += '</td>';
	html += '<td><span class="cellcaption"><?php echo Utilities::getLabel('M_Each_Additional_Item')?> [<?php echo CONF_CURRENCY_SYMBOL?>]</span>';
	html += '<input type="text" name="product_shipping[' + shipping_row + '][additional_cost]" value="" placeholder="<?php echo Utilities::getLabel('M_Each_Additional_Item')?>" required />';
	html += '</td>';
	//html += '  <td><a class="button medium red" onclick="$(\'#shipping-row' + shipping_row + '\').remove();" title="Remove" >Remove</a></td>';
	html += '  <td><button type="button" class="btn red" title="<?php echo Utilities::getLabel('M_Remove')?>" onclick="$(\'#shipping-row' + shipping_row + '\').remove();" ><i><img src="'+webroot+'images/minus-white.png" alt=""/></i></button></td>';
    html += '</tr>';
	$('#shipping tbody').append(html);
	shippingautocomplete(shipping_row);
	shipping_row++;
}

function shippingautocomplete(shipping_row) {
	
	$('input[name=\'product_shipping[' + shipping_row + '][country_name]\']').focusout(function() {
		    setTimeout(function(){ $('.suggestions').hide(); }, 500);
	});

    $('input[name=\'product_shipping[' + shipping_row + '][state_name]\']').focusout(function() {
        setTimeout(function(){ $('.suggestions').hide(); }, 500);
    });
	
	$('input[name=\'product_shipping[' + shipping_row + '][company_name]\']').focusout(function() {
		    setTimeout(function(){ $('.suggestions').hide(); }, 500);
	});
	
	$('input[name=\'product_shipping[' + shipping_row + '][processing_time]\']').focusout(function() {
		    setTimeout(function(){ $('.suggestions').hide(); }, 500);
	});

	$('input[name=\'product_shipping[' + shipping_row + '][country_name]\']').devbridgeAutocomplete({

			 minChars:0,
			 //autoSelectFirst:true,
			 lookup: function (query, done) {
				$.ajax({
				url: generateUrl('common', 'countries_autocomplete'),
				data: {keyword: encodeURIComponent(query) },
				dataType: 'json',
				type: 'post',
				success: function(json) { 
						json.suggestions.unshift({
							data: -1,
							value: '<?php echo Utilities::getLabel('L_Everywhere_Else')?>'
						});
						done(json);
					}
				});
			
	    	 },
			 triggerSelectOnValidInput: true,
	    	 onSelect: function (suggestion) {
				$('input[name=\'product_shipping[' + shipping_row + '][country_name]\']').val(suggestion.value);
				$('input[name=\'product_shipping[' + shipping_row + '][country_id]\']').val(suggestion.data);
    	 }
	});

	$('input[name=\'product_shipping[' + shipping_row + '][state_name]\']').devbridgeAutocomplete({

			 minChars:0,
			 //autoSelectFirst:true,
			 lookup: function (query, done) {
				$.ajax({
				url: generateUrl('common', 'state_autocomplete'),
				data: {keyword: encodeURIComponent(query) },
				dataType: 'json',
				type: 'post',
				success: function(json) {
						json.suggestions.unshift({
							data: -1,
                            value: '<?php echo Utilities::getLabel('L_Everywhere_Else')?>'
						});
						done(json);
					}
				});

	    	 },
			 triggerSelectOnValidInput: true,
	    	 onSelect: function (suggestion) {
				$('input[name=\'product_shipping[' + shipping_row + '][state_name]\']').val(suggestion.label);
				$('input[name=\'product_shipping[' + shipping_row + '][state_id]\']').val(suggestion.data);
                                $('input[name=\'product_shipping[' + shipping_row + '][type]\']').val(suggestion.type);

    	 }
	});
	
	$('input[name=\'product_shipping[' + shipping_row + '][company_name]\']').devbridgeAutocomplete({
			 minChars:0,
			 //autoSelectFirst:true,	
			 lookup: function (query, done) {
				$.ajax({
				url: generateUrl('common', 'shipping_autocomplete'),
				data: {keyword: encodeURIComponent(query) },
				dataType: 'json',
				type: 'post',
				success: function(json) { 
						done(json);
					}
				});
			
	    	 },
			 triggerSelectOnValidInput: true,
	    	 onSelect: function (suggestion) {
				$('input[name=\'product_shipping[' + shipping_row + '][company_name]\']').val(suggestion.value);
				$('input[name=\'product_shipping[' + shipping_row + '][company_id]\']').val(suggestion.data);
    	 }
	});
	
	$('input[name=\'product_shipping[' + shipping_row + '][processing_time]\']').devbridgeAutocomplete({
			 minChars:0,
			 //autoSelectFirst:true,	
			 lookup: function (query, done) {
				$.ajax({
				url: generateUrl('common', 'shippingduration_autocomplete'),
				data: {keyword: encodeURIComponent(query) },
				dataType: 'json',
				type: 'post',
				success: function(json) { 
						done(json);
					}
				});
			
	    	 },
			 triggerSelectOnValidInput: true,
	    	 onSelect: function (suggestion) {
				$('input[name=\'product_shipping[' + shipping_row + '][processing_time]\']').val(suggestion.value);
				$('input[name=\'product_shipping[' + shipping_row + '][processing_time_id]\']').val(suggestion.data);
    	 }
	});
	
	
	
}

$('#shipping tbody tr').each(function(index, element) {
	shippingautocomplete(index);
});
</script> 

