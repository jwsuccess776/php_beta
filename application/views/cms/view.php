<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<? if ($hide_header_footer) include CONF_THEME_PATH . 'payment-header.php'; ?>
<?php if ($hide_header_footer) {
	global $tpl_for_js_css;
	$pathinfo = pathinfo($tpl_for_js_css);
	echo  '<script type="text/javascript" language="javascript" src="' . Utilities::generateUrl('pagejsandcss', 'js', array($pathinfo['dirname'],'cms/view'), $use_root_url, false) . '&sid=' . time() . '"></script>' . "\n";
 }?>
 
 
<?php if($page_id=='17'){ ?>

<div> <div class="body clearfix">
    <div class="pageBar">
      <div class="fixed-container">
        <h1 class="pageTitle"><?php echo Utilities::getLabel('L_Sitemap')?></h1>
      </div>
    </div>
    <div class="innerContainer">
      <div class="greyarea">
        <div class="fixed-container">
          <div class="sitemapcontainer">
          
 <h3><?php echo Utilities::getLabel('L_Stores')?></h3>
            <div class="boxpanel">
              <div class="top">
                <ul class="linksfloated stores">
                  <li><?php echo Utilities::getLabel('L_Browse_Alphabetically')?>:</li>
                   <li><a lang="custom_div_2" href="/browse-all-stores/cms/view/<?=$page_id?>" class="<?php if (''==$start_letter): echo 'linkselect'; endif; ?>" >ALL</a></li>
                   
                  <?php foreach($letters as $key=>$val):?>
                  <li><a lang="custom_div_2" href="/browse-all-stores/cms/view/<?=$page_id?>/<?=$val?>" class="<?php if ($val==$start_letter): echo 'linkselect'; endif; ?>" ><?php echo $val?></a></li>
                  <?php endforeach;?>
                </ul>
              </div>
              <div class="midd ajax_sitemap scroll" id="custom_div_2" data-href="<?php echo Utilities::generateUrl('shops','ajax_sitemap_shops',array(1,$start_letter))?>" >	
              
 
 
      	<? if (count($shops)>0) { ?>
		<ul class="blackbullets">
		  <?php  foreach($shops as $key=>$val):?>	
		  	<li><a href="<?php echo Utilities::generateUrl('shops','view',array($val["shop_id"]))?>"><?php echo $val["shop_name"]?></a></li>
		  <?php  endforeach;?>
		</ul>
		<div class="clear"></div>
		<?php  if ($page<$pages):?>
		<div class="aligncenter">
    		<a href="<?php echo Utilities::generateUrl('shops','ajax_sitemap_shops',array($page+1,$letter))?>" class="loadmore btn"><?php echo Utilities::getLabel('L_Load_More')?></a>
		</div>
	<?php  else:?>    
		<a href="#" class=""></a>
	<?php  endif;?>
   	<? } else {?> 
    		<div class="alert alert-info">
            	<?php echo Utilities::getLabel('L_Unable_to_find_any_record')?>
            </div>
    <? }?>
    
    
    <script type="text/javascript">
$(document).ready(function(){
		$('.scroll').jscroll({
	    	autoTrigger: false,
			loadingHtml: '<div class="center-display"><img src="<?php echo CONF_WEBROOT_URL?>images/loader.jpg" alt="<?php echo Utilities::getLabel('L_Loading')?>" /></div>',
		});
	})
</script>
              
              </div>
            </div>
            
    </div>
        </div>
      </div>
    </div>
  </div>
 </div>
            
<?php }else{ ?> 
<div>
    <div class="body clearfix">
      <div class="pageBar">
        <div class="fixed-container">
          <h1 class="pageTitle"><?php echo $row['page_title'];?></h1>
        </div>
      </div>
      <div class="fixed-container">
        <div class="cmsContainer">
			<?php 
				$body=preg_replace('#(href|src)="([^:"]*)("|(?:(?:%20|\s|\+)[^"]*"))#','$1="http://'.$_SERVER['HTTP_HOST'].CONF_WEBROOT_URL.'$2$3',html_entity_decode($row["page_content"]));
				echo Utilities::renderHtml($body,true);
			?>
        </div>
      </div>
    </div>
  </div>
<?php } ?>  