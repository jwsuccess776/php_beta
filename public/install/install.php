<?php
require_once('install/install_functions.php');

$step = (isset($_REQUEST['step']) && $_REQUEST['step'] != '') ? $_REQUEST['step'] : '';

switch($step){
  case '2':
		loadValidFile('install_step_2.php');
		break;
  case '3':
		loadValidFile('install_step_3.php');
	  break;
  case '4':
		loadValidFile('install_step_4.php');  
	  break;
  case '5':
		loadValidFile('install_step_5.php');  
	  break;
  default:
		loadValidFile('install_step.php');    
}	
?>