<?php defined('SYSTEM_INIT') or die('Invalid Usage'); global $duration_freq_arr;  



$unlimitedCount=99999;



if(!empty($packages) && is_array($packages)) {

	

foreach($packages as $package){

	 

$class ='';

if(end($packages) == $package)

{

	//$class ='three';

}

elseif($packages[0]!== $package)

{

	$class ='two';

}



//echo "<pre>";

//print_r($package);

//echo "</pre>";

?>

<div class="box <?=$class;?>">

  <div class="box-inner">

	<div class="name"><?=$package['merchantpack_name']?> <span><?=Utilities::getLabel('M_Starting_At_Only');?> </span></div>

	<div class="valid">

<?php if($package['merchantpack_id']==1){ ?>	

			

			<span>FREE</span> 

			

<?php } else { ?>

	<?php if(!empty($package['startsAt'])){ ?>

	<sup><?=SubscriptionHelper::getCurrencySymbol();?></sup><span><?=$package['startsAt']['merchantsubpack_actual_price']?></span> / <?=SubscriptionHelper::getFormattedInterval($package['startsAt']['merchantsubpack_subs_frequency']);?> !

	<?php } else {

	?>

	<span><?=Utilities::getLabel('M_NA');?></span>

	<?php

	} ?>

<?php } ?>	

	</div>

	

	

	<div class="trial">

	  <ul>

		<li><span><?php if($package['merchantpack_max_products']>=$unlimitedCount) echo ' Unlimited '; else echo $package['merchantpack_max_products']; ?></span> <?=Utilities::getLabel('M_Active_Products');?></li>

		

		<li><span><?php if($package['merchantpack_images_per_product']>=$unlimitedCount) echo ' Unlimited '; else echo $package['merchantpack_images_per_product']; ?></span> <?=Utilities::getLabel('M_Images_Per_Product');?></li>

		

		<li><?=$package['merchantpack_commission_text'] ?></li>

<?php if($package['merchantpack_id']==1){ ?>			

		<li><a class="btn primary-btn small" href="/user/fees">View Rates</a></li>
		<!-- <li><a class="btn primary-btn small" href="/standard-commission-rates/cms/view/16">View Rates</a></li> -->

<?php } ?>		 

	  </ul>

	</div>

    

    

	<? if(!$is_front_user_logged )

	{

	?>

	

	<a href="javascript:void(0);" class="btn primary-btn large" onclick="subscription.buy('<?=$package['merchantpack_id']?>' , true);"><?=Utilities::getLabel('M_Free_Trial');?></a> 

	<div class="trial"><ul><li><span><?php echo $package['merchantpack_free_trial_days'];?> <?=Utilities::getLabel('M_Days');?></span></li></ul></div>   

	

	<?

	}else if($includeFreePackage){

	?>





<?php // uncomment this when activate dont need if already subscribe uncomment till line no 76 - 90 



  if($package['merchantpack_id']==1){  



?>  

	<a href="javascript:void(0);" class="btn primary-btn large" onclick="subscription.buy('<?=$package['merchantpack_id']?>' , true);" >Activate</a>

<?php

		/*$mycon = Syspage::getdb();

		$myquery="select * from tbl_subscription_merchant_package_orders where mporder_user_id = $_user_id and mporder_merchantpack_id = 1 limit 1";

		$statusCheck=$mycon->query($myquery);

		$stat=$mycon->fetch_all($statusCheck);

		

		//echo '<div style="display:none"><pre>';

		//print_r($stat);

		//echo '</pre></div> ';

		//exit;

		if(count($stat)<=0)

		{

?>

			<a href="javascript:void(0);" class="btn primary-btn large" onclick="subscription.buy('<?=$package['merchantpack_id']?>' , true);" >Activate</a>

<?php			

		}*/

?>



		



			

<?php }

else{ /* ?>

<a href="javascript:void(0);" class="btn primary-btn large" onclick="subscription.buy('<?=$package['merchantpack_id']?>' , true);" ><?=Utilities::getLabel('M_Free_Trial');?></a>

		<div class="trial"><ul><li><span><?php echo $package['merchantpack_free_trial_days'];?> <?=Utilities::getLabel('M_Days');?></span></li></ul></div>

<?php	

*/}

		 

	}  ?>

	

	

	</div>

	



<?php if($package['merchantpack_id']!=1){ ?>		

	

  <div class="after-box">

	   

	<h3><?php if ($active_subscription['mporder_merchantpack_id']==$package['merchantpack_id']) {echo Utilities::getLabel('M_Currently_Active');}else{ echo Utilities::getLabel('M_SELECT_YOUR_PACKAGE');}?></h3>

	



	<ul>

	<?  if(!empty($package['sub_packages']) && is_array($package['sub_packages'])) :

		foreach($package['sub_packages'] as $id => $subPack):

			$checked = '';

			if( isset($chosenPlan) && $id == $chosenPlan)

			{

				$checked = 'checked';

			}

		

	?>

	  <li>

		<label class="radio">

		  <input type="radio" class="rdbSubscribe" name="package_<?=$package['merchantpack_id']?>" value="<?=$id?>"  <?=$checked?> >

		  <i class="input-helper"></i> <?=$subPack?> </label>

	  </li>

	<?

	endforeach;

	else :

?>

<li>

	<label class="radio"> 

	<i class="input-helper"></i> <?='NA'?> </label>

</li>

	<?

	endif;

	?>

	</ul>

	<? if(is_null($isSupplier))

	{

	?>

		<a class="btn primary-btn large signUp" href="<?=Utilities::generateUrl('user' , 'account' );?>" ><?=Utilities::getLabel('M_Sign_Up');?></a>

	<?

	}

	else if($includeFreePackage){

	?>

		<a class="btn primary-btn large" href="javascript:void(0)" onclick="subscription.buy('<?=$package['merchantpack_id']?>');" ><?=Utilities::getLabel('M_Subscribe_Now');?></a>

	<?

	}else{?>

	<a class="btn primary-btn large" href="javascript:void(0)" onclick="subscription.buy('<?=$package['merchantpack_id']?>');" ><?=Utilities::getLabel('M_Change_Plan');?></a>

	<?php } ?>

	

	

	 </div>

<?php } ?>



</div>

<?

} // foreach

} //if

?>

<script>

/* to choose only one plan at a time */

$('.rdbSubscribe:radio').change(function(){

	$('.rdbSubscribe:radio').not(this).prop('checked' , false) ; 

});

</script>