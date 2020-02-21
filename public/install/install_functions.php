<?php
set_time_limit(0);
session_start();
if ($_SERVER['HTTP_HOST']=="localhost"){
	if( !defined('CONF_WEBROOT_URL'))	define('CONF_WEBROOT_URL', dirname(dirname($_SERVER['PHP_SELF'])).'/');
}else{
	if( !defined('CONF_WEBROOT_URL'))	define('CONF_WEBROOT_URL', '/');
}

if( isset($_SERVER['REMOTE_ADDR']) && $_SERVER['REMOTE_ADDR'] == '127.0.0.1' ){
	define('CONF_INSTALLATION_PATH', $_SERVER['DOCUMENT_ROOT'] . CONF_WEBROOT_URL);
}else{
	define('CONF_INSTALLATION_PATH', $_SERVER['DOCUMENT_ROOT'] . CONF_WEBROOT_URL);
}
define('CONF_INSTALL_DB_PATH', CONF_INSTALLATION_PATH.'public/install/database/');
define('CONF_INSTALL_DIR', CONF_INSTALLATION_PATH.'public/install');
define('DIR_YOKART', CONF_INSTALLATION_PATH);
define('DIR_YOKART_PUBLIC', CONF_INSTALLATION_PATH.'public/');
define('PASSWORD_SALT', 'multivendor');

ini_set('display_errors', 1);
error_reporting(E_ALL & ~E_NOTICE & ~E_WARNING & ~E_STRICT & ~E_DEPRECATED);

function loadValidFile($file_name){
	$file = CONF_INSTALL_DIR.'/'.$file_name;
	if (!file_exists($file)) {
		exit('Could not load Installation file: ' . $file);
	}
	require_once($file);
}

function getConnection(){
	$mysqli = @new mysqli(CONF_DB_SERVER, CONF_DB_USER, CONF_DB_PASS, CONF_DB_NAME);
	$mysqli->query("SET SESSION sql_mode = 'NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION'");	
	return $mysqli;
}

function getMysqliVersion(){
	$mysqli = getConnection();
	$result = $mysqli->query('SELECT VERSION() as version;');
	if( $result->num_rows >0 ) {
		$row = $result->fetch_assoc();
		return $row['version'];
	}
	return '';
}

function getSqlMode(){
	$mysqli = getConnection();
	
	$result_sql_mode = $mysqli->query('SELECT @@sql_mode AS sql_mode;');
	if( $result_sql_mode->num_rows >0 ) {
		$row_sql_mode = $result_sql_mode->fetch_assoc();
		return $row_sql_mode['sql_mode'];
	}	
	return '';
}

function getInBytes($value){
	$value = trim($value);
	$last_char = strtolower($value[strlen($value) - 1]);
	switch($last_char){
		case 'g': $value *= 1024;
		case 'm': $value *= 1024;
		case 'k': $value *= 1024;
	}
	return $value;
}

function validate_step3() {

	$error = array();

	$mysql = @new mysqli($_POST['db_hostname'], $_POST['db_username'], html_entity_decode($_POST['db_password'], ENT_QUOTES, 'UTF-8'), $_POST['db_database'], $_POST['db_port']);

	if ($mysql->connect_error) {
		$error['warning'] = $mysql->connect_error;
	} else {
		$mysql->close();
	}
	
	$settings_file = DIR_YOKART_PUBLIC . 'settings.php';
	
	if (!is_writable($settings_file)) {
		$error['warning'] = 'Error: Could not write to settings.php please check you have set the correct permissions on: ' . $settings_file . '!';
	}else{
	
		$output  = '<?php' . "\n";
		$output .= '// DB' . "\n";
		$output .= 'define(\'CONF_WEBROOT_URL\', \'' . addslashes(CONF_WEBROOT_URL) . '\');' . "\n";
		$output .= 'define(\'CONF_DB_SERVER\', \'' . addslashes($_POST['db_hostname']) . '\');' . "\n";
		$output .= 'define(\'CONF_DB_USER\', \'' . addslashes($_POST['db_username']) . '\');' . "\n";
		$output .= 'define(\'CONF_DB_PASS\', \'' . addslashes(html_entity_decode($_POST['db_password'], ENT_QUOTES, 'UTF-8')) . '\');' . "\n";
		$output .= 'define(\'CONF_DB_NAME\', \'' . addslashes($_POST['db_database']) . '\'); ?>';
		$file = fopen($settings_file, 'w');
		fwrite($file, $output);
		fclose($file);
		
	}

	return $error;

}

function encryptPassword($pass){
	return md5(PASSWORD_SALT . $pass . PASSWORD_SALT);
}

function validate_step4($data){

		$mysqli = getConnection();
		
		$file = CONF_INSTALL_DB_PATH . 'yokart_v7_installer_blank.sql';
		if (!file_exists($file)) {
			exit('Could not load sql file: ' . $file);
		}
	
		$allLines = file($file); 
	
		$query = $mysqli->query('SET foreign_key_checks = 0');	        
		preg_match_all("/\nCREATE TABLE(.*?)\`(.*?)\`/si", "\n".file_get_contents($file), $target_tables); 

		
		foreach ($target_tables[2] as $table){
				$mysqli->query('DROP TABLE IF EXISTS '.$table);
		}         
		$query = $mysqli->query('SET foreign_key_checks = 1');
		$mysqli->query("SET NAMES 'utf8'");
		$templine = '';	/* Temporary variable, used to store current query	*/
			foreach ($allLines as $line)	{	/* Loop through each line	*/
				if (substr($line, 0, 2) != '--' && $line != '') {
						$templine .= $line;/* (if it is not a comment..) Add this line to the current segment */
							if (substr(trim($line), -1, 1) == ';') {	/* If it has a semicolon at the end, it's the end of the query	*/
								$mysqli->query($templine) or print('Error performing query \'<strong>' . $templine . '\': ' . $mysqli->error . '<br /><br />');  
								$templine = '';/* Reset temp variable to empty */
						}
					}
				}
		
		$mysqli->query("SET CHARACTER SET utf8");
		$mysqli->query("DELETE FROM `tbl_admin` WHERE admin_id = '1'");
		$mysqli->query("INSERT INTO `tbl_admin` SET admin_id = '1', admin_username = '" . $mysqli->real_escape_string($data['username']) . "', admin_password = '" . $mysqli->real_escape_string(encryptPassword($data['password'])) . "', admin_full_name = '" . $mysqli->real_escape_string($data['name']) . "', admin_email = '" . $mysqli->real_escape_string($data['email']) . "', admin_is_super_admin = '1'");
		$mysqli->query("DELETE FROM `tbl_configurations` WHERE `conf_var` = 'CONF_ADMIN_EMAIL'");
		$mysqli->query("INSERT INTO `tbl_configurations` SET  `conf_var` = 'CONF_ADMIN_EMAIL', conf_val = '" . $mysqli->real_escape_string($data['store_email']) . "'");
		$mysqli->query("DELETE FROM `tbl_configurations` WHERE `conf_var` = 'CONF_WEBSITE_NAME'");
		$mysqli->query("INSERT INTO `tbl_configurations` SET  `conf_var` = 'CONF_WEBSITE_NAME', conf_val = '" . $mysqli->real_escape_string($data['store_name']) . "'");
		$mysqli->query("UPDATE `tbl_products` SET `prod_stock` = '10', prod_view_count='0', prod_sold_count='0' ");
		
		$_SESSION['success'] = 'Installation completed';

}

function update_htaccess(){

	$htaccess_content = "";
	$error['warning'] = "";
	
	$web_address = str_replace("www.","",$_SERVER['HTTP_HOST']);
	$address_prefix = $htaccess_with_address_prefix = '';
	$protocol = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off' || $_SERVER['SERVER_PORT'] == 443) ? "https://" : "http://";			
	
	if( strpos($_SERVER['HTTP_HOST'], "www.") === 0	){
	
		$address_prefix = 'www.';		
		$htaccess_with_address_prefix .= 'RewriteCond %{HTTP_HOST} ^'.$web_address.' [NC]' . "\n";
		$htaccess_with_address_prefix .= 'RewriteRule ^(.*)$ '.$protocol.$address_prefix.$web_address.'/$1 [L,R=301,NC]' . "\n";
		
	}
	
	
	$htaccess_content .= 'RewriteEngine on' . "\n";
	
	$htaccess_content .= $htaccess_with_address_prefix;

	$htaccess_content .= 'RewriteRule ^sitemap/list_([0-9]+).xml$ user-uploads/sitemap/list_$1.xml [L]' . "\n";			
	$htaccess_content .= 'RewriteRule ^sitemap.xml$ user-uploads/sitemap.xml [L]' . "\n";			
	$htaccess_content .= '<IfModule mod_expires.c>
ExpiresActive On
ExpiresByType image/jpg "access 1 year"
ExpiresByType image/jpeg "access 1 year"
ExpiresByType image/gif "access 1 year"
ExpiresByType image/png "access 1 year"
ExpiresByType image/svg+xml "access 1 month"
ExpiresByType text/css "access 1 month"
ExpiresByType application/pdf "access 1 month"
ExpiresByType text/x-javascript "access 1 month"
ExpiresByType application/x-shockwave-flash "access 1 month"
ExpiresByType image/x-icon "access 1 year"
ExpiresDefault "access 2 days"
</IfModule>' . "\n";	
	$htaccess_content .= '<IfModule mod_rewrite.c>
RewriteEngine on
RewriteRule ^(scripts|user-uploads/text-editor|user-uploads/sitemap.xml|user-uploads/sitemap) - [L]
RewriteRule    ^$ public/    [L]
RewriteRule    (.*) public/$1    [L]
</IfModule>';
	
	$htaccess_file_name = DIR_YOKART . '.htaccess';
	if (!file_exists($htaccess_file_name)) {
		$error['warning'] .= nl2br('Error: Could not found .htaccess file on : ' . DIR_YOKART.'<br/>Please create new file .htaccess and add the following lines in: ' . $htaccess_file_name.' ! Otherwise System Will not work properly. <br/><br/>'.htmlentities($htaccess_content)) ;
		return $error;
	}else{		
		
		if( filesize($htaccess_file_name) < 1 ){
		
			if (!is_writable(DIR_YOKART . '.htaccess')) {
				$error['warning'] .= nl2br('Error: Could not write to ' . DIR_YOKART . '.htaccess <br/>Please add following lines in: ' . $htaccess_file_name . ' ! Otherwise System Will not work properly. <br/><br/>'.htmlentities($htaccess_content));
				return $error;
			}else{		
				$htaccess_file = fopen($htaccess_file_name, 'w');
				fwrite($htaccess_file, $htaccess_content);
				fclose($htaccess_file);
			}
		}else{

			$searchfor = 'scripts|user-uploads';
			// get the file contents, assuming the file to be readable (and exist)
			$contents = file_get_contents($htaccess_file_name);
			// escape special characters in the query
			$pattern = preg_quote($searchfor, '/');
			// finalise the regular expression, matching the whole line
			$pattern = "/^.*$pattern.*\$/m";
			// search, and store all matching occurences in $matches
			if(!preg_match_all($pattern, $contents, $matches)){
				$error['warning'] .= nl2br('Error: .htaccess file may be containing some existing data. So Could not write to .htaccess Please add following lines in: ' . $htaccess_file_name . ' ! Otherwise System Will not work properly. <br/><br/>'.htmlentities($htaccess_content));
				return $error;
			}
		}
	}
}


function set_step($step=1){
	$_SESSION['step'] = $step;
}

function get_step(){
	if( isset($_SESSION['step'])){
		return $_SESSION['step'];
	}
	return 1;
}

function validateStep($step = 1){

	if( get_step() != $step){
		header('Location: ?step='.get_step());
		die();
	}
}

function rmInstallFiles(){
	$files = array(
					'install_step.php',
					'install_step_2.php',
					'install_step_3.php',
					'install_step_4.php'
					);

	foreach($files as $key=>$val){
		unlink(CONF_INSTALL_DIR.'/'.$val);	
		unlink(CONF_INSTALL_DIR.'/html/'.$val);	
	}
	

}

function apacheGetModules(){
	if (function_exists('apache_get_modules')) {
		$apacheGetModules = apache_get_modules();
	}else {
		$apacheGetModules = array();
	}
	return $apacheGetModules;
}
?>