<?php

defined('SYSTEM_INIT') or die('Invalid Usage');
$content=empty($data) ? '' : $data[0]['epage_content'];
$content = str_replace('{SITEROOT}', CONF_WEBROOT_URL, $content);
echo str_replace("images/",CONF_WEBROOT_URL."images/",Utilities::renderHtml($content, false))
?>


