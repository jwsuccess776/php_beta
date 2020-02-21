<?php
require_once(DIR_YOKART_PUBLIC . 'settings.php');
validateStep(5);
$data = array();
$data['heading_step_5'] = 'Installation Complete';
$data['heading_step_5_small'] = 'Ready to start selling!';
$data['text_congratulation'] = 'Congratulations! You have successfully installed YoKart.';
$data['text_forget'] = 'Don\'t forget to delete your "Install" directory!';
$data['text_shop'] = 'Visit Website';
$data['text_login'] = 'Access Your Admin Area';
if (isset($_SESSION['success'])) {
	rmInstallFiles();
	$data['success'] = $_SESSION['success'];
	unset($_SESSION['success']);
	unset($_SESSION['step']);
} else {
	$data['success'] = '';
}
	
$error = update_htaccess();

if (isset($error['warning'])) {
	$data['error_warning'] = $error['warning'];
}

$title = 'Yokart | Installation Complete';

$data['install_dir'] = (is_dir(CONF_INSTALL_DIR))?true:false;

require_once('install/html/header.php');
require_once('install/html/install_step_5.php');
require_once('install/html/footer.php');
?>