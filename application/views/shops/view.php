<?php defined('SYSTEM_INIT') or die('Invalid Usage'); 
$shop_vendor_location = ((strlen($shop['shop_owner_state_name']) > 0)?$shop['shop_owner_state_name']:'').((strlen($shop['shop_owner_country_name']) > 0)?', '.$shop['shop_owner_country_name']:'');?>
<?php global $arr_sort_products_options; global $prod_condition; ?>
<?php 
	$min_start = @$get['min']?$get['min']:$price_range['min_price'];
	$max_start = @$get['max']?$get['max']:$price_range['max_price']; 
	
if (isset($get['sort']) && array_key_exists($get['sort'], $arr_sort_products_options)) {
    $sort_selection = $get['sort'];
} else {
    $sort_selection = 'feat';
}

if (isset($get['shop_keyword'])) {
    $shop_keyword = $get['shop_keyword'];
} else {
    $shop_keyword = '';
}

?>
<?php echo Utilities::renderHtml($primarySearchForm);?>
<form name="search_filters" id="search-filters"/>
<input type="hidden" name="min" value="<?php echo $get['min']?>" data-index="0" class="price_range" id="price_range_lower" />
<input type="hidden" name="max" value="<?php echo $get['max']?>" data-index="1" class="price_range" id="price_range_upper"/>
<input type="hidden" name="shop_keyword" value="<?php echo $shop_keyword ?>" id="shop_keyword">
<input type="hidden" name="pg" id="pg" value="<?php echo $get['pg'] ?>"/>
<div>
    <div class="body clearfix">
      <div class="profile-head clearfix">
        <div class="fixed-container">
<?php 
	/*echo '<pre>';
	print_r($shop);
	echo '</pre>';*/
	
// 	$mydb=Syspage::getdb();
// 	$getstate_query="select * from tbl_users where user_id = '".$shop['shop_user_id']."' limit 1 ";
// 	$state_rs=$mydb->query($getstate_query);
// 	$state_names=$mydb->fetch_all($state_rs);
	/*echo '<pre>';
	print_r($state_names);
	echo '</pre>';*/
	
	$mydb=Syspage::getdb();
	$getstate_query="select tbl_users.*,tbl_cities.city_name from tbl_users "
                . "left join tbl_cities ON tbl_users.user_city=tbl_cities.city_id "
                . "where user_id = '".$shop['shop_user_id']."' limit 1 ";
	$state_rs=$mydb->query($getstate_query);
	$state_names=$mydb->fetch_all($state_rs);

	
?>          
          <div class="fl">
            <div class="about-me">
              <div class="avatar"><img src="<?php echo Utilities::generateUrl('image','user',array($shop["shop_owner_profile_image"],'SMALL'))?>" alt="<?php echo $shop["shop_owner"]?>"/></div>
              <div class="name" style="text-transform: capitalize;"><?php echo $shop["shop_name"];//$shop["shop_owner"]?> 
              <span><?php echo empty($state_names[0]["city_name"])?'':$state_names[0]['city_name'].', '.$shop["shop_owner_state_name"]?></span>
              <!--<span><?php //echo $state_names[0]["user_city_town"].', '.$shop["shop_owner_state_name"]?></span>-->
              <!--<span><?php echo $shop["shop_city"].', '.$shop["shop_owner_state_name"]?></span>-->
              <!--<span><?php echo Utilities::displayNotApplicable($shop_vendor_location)?></span>-->
              </div>
            </div>
          </div>
          <div class="fr">
            <div class="items-list">
              <ul>
                <li><a href="<?php echo Utilities::generateUrl('shops','view',array($shop["shop_id"]))?>"><span><?php echo $shop["totProducts"]?></span><?php echo Utilities::getLabel('M_Total_Items')?></a></li>
                <li><a href="<?php echo Utilities::generateUrl('shops','reviews',array($shop["shop_id"]))?>"><span><?php echo $shop["totReviews"]?></span><?php echo Utilities::getLabel('M_Total_Reviews')?></a></li>
              </ul>
            </div>
          </div>
        </div>
      </div>
      
      <div class="fixed-container">
          <?php
          switch ($shop['shop_template']){
              case 1:
              default:
                  include('layouts/layout-1.php');
                  break;
              case 2:
                  include('layouts/layout-2.php');
                  break;
              case 3:
                  include('layouts/layout-3.php');
                  break;
              case 4:
                  include('layouts/layout-4.php');
                  break;
              case 5:
                  include('layouts/layout-5.php');
                  break;
          }
          ?>
        <div class="shop-page">
        	
           <? if ($shop['shop_description']!="") {?>  
			<div class="description"><div class="more"><?php echo nl2br($shop['shop_description'])?></div></div>
           <? } ?>
            
      	
       	  <?php include CONF_THEME_PATH . 'shop_leftpanel.php'; ?>
          
          <div class="right-panel">
          	<?php if ($category_info["category_name"]) { ?>
            <div class="shopbreadcrumb">
                <div class="fixed-container">
                	<ul>
		                <li><a href="<?php echo Utilities::getSiteUrl(); ?>"><?php echo Utilities::getLabel('L_Home')?></a></li>
        		        <li><a href="<?php echo Utilities::generateUrl('shops','view',array($shop["shop_id"]))?>"><?php echo $shop["shop_name"]?></a></li>
                		<?php  foreach($category_structure as $catKey=>$catVal): ?>
			                <li><a href="<?php echo Utilities::generateUrl('shops','view',array($shop["shop_id"],$catVal["category_id"]))?>"><?php echo $catVal["category_name"]?></a></li>
            		    <?php  endforeach;?>
		                <li><?php echo $category_info["category_name"]?></li>
        	        </ul>
                </div>
            </div>
            <?php } ?>
                   <div class="pageBar">                    	
                       
                        	<?php if ($total_records>0):?>
                            <div class="showing-total-shop"><?php echo sprintf(Utilities::getLabel('L_Items_x_to_y_of_z_total'), $start_record, $end_record, $total_records) ?></div>
                			<?php endif;?>
                			
							<div class="filters">
                                <ul>
                                    <?php foreach ($arr_sort_products_options as $sortKey => $sortVal): ?>
                                        <li><a class="sort <?php echo(($sort_selection == $sortKey) ? 'selected_link' : ''); ?>"
                                               href="#" id="<?php echo $sortKey ?>"><?php echo $sortVal ?></a></li>
                                    <?php endforeach; ?>
                                </ul>
                            </div>
                        
        			</div>
        			<div class="mobile-element">
                        <div class="mobile-filter">
                            <ul>
								<!--
                                <li><a href="#" class="click_trigger" id="ct_4"><i
                                                class="icn-filter"> </i><?php echo Utilities::getLabel('L_Filters') ?>
                                    </a></li>
								-->
                                <li><a href="#" class="click_trigger" id="ct_6"><i
                                                class="icn-sort"></i><?php echo Utilities::getLabel('L_Sort') ?></a>
                                    <div class="toggle-list" id="list_ct_6">
                                        <ul>
                                            <?php foreach ($arr_sort_products_options as $sortKey => $sortVal): ?>
                                                <li>
                                                    <a class="sort <?php echo(($sort_selection == $sortKey) ? 'selected_link' : ''); ?>"
                                                       href="#" id="<?php echo $sortKey ?>"><?php echo $sortVal ?></a>
                                                </li>
                                            <?php endforeach; ?>
                                        </ul>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>            
            <div class="shop-list clearfix">
	                <span id="products-list"></span>
            </div>
			<?php if ($pages > 1): ?>
			<div class="pager products-list-pager">
				<ul>
					<?php echo getPageString('<li><a href="javascript:void(0)" onclick="listPaging(xxpagexx);">xxpagexx</a></li>', $pages, $page, '<li class="active"><a  href="javascript:void(0)">xxpagexx</a></li>', '<li>...</li>'); ?>
				</ul>
			</div>
			<?php endif; ?>
			</div>
        </div>
      </div>
    </div>
  </div>
  
<!--wrapper end here-->
<script type="text/javascript">var switchTo5x=true;</script>
<?php if (Settings::getSetting("CONF_USE_SSL")) { ?>
    <script type="text/javascript" src="https://ws.sharethis.com/button/buttons.js"></script>
<?php } else { ?>
    <script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<?php } ?>
<!--<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>-->
<script type="text/javascript">stLight.options({publisher: "c1ac1329-15e5-4379-aa5c-30b5671f7265", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
</form>