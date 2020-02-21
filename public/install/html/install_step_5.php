<?php 
extract($data); 
$settings_matched = true;
?>
<div class="container">
  <header>
    <div class="row">
      <div class="col-sm-6">
        <h1 class="pull-left">5<small>/5</small></h1>
        <h3><?php echo $heading_step_5; ?><br>
          <small><?php echo $heading_step_5_small; ?></small></h3>
      </div>
      <div class="col-sm-6">
        <div id="logo" class="pull-right hidden-xs"> <img src="<?=CONF_WEBROOT_URL?>public/install/images/logo.png" alt="YoKart" title="YoKart" /> </div>
      </div>
    </div>
  </header>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>  
  <?php if ($success) { ?>
  <div class="alert alert-success"><?php echo $success; ?></div>
  <?php }
  
  if( $install_dir ){	?>
	  <div class="alert alert-danger"><?php echo $text_forget; ?></div>
	  <?php 
  }?>
  <div class="visit">
    <div class="row">
      <div class="col-sm-5 col-sm-offset-1 text-center"> <img src="<?=CONF_WEBROOT_URL?>public/install/images/icon-store.png"> <a target="_blank" class="btn btn-secondary" href="<?=CONF_WEBROOT_URL?>"><?php echo $text_shop; ?></a> </div>
      <div class="col-sm-5 text-center"> <img src="<?=CONF_WEBROOT_URL?>public/install/images/icon-admin.png"> <a class="btn btn-secondary" href="<?=CONF_WEBROOT_URL?>manager" target="_blank"><?php echo $text_login; ?></a> </div>
    </div>
  </div>
  
  
</div>