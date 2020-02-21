<?php defined('SYSTEM_INIT') or die('Invalid Usage'); ?>
<div class="body clearfix">
    <?php include CONF_THEME_PATH . $controller.'/_partial/account_subheader.php'; ?>
    <div class="fixed-container">
      <div class="dashboard">
        <?php include CONF_THEME_PATH . $controller.'/_partial/account_leftpanel.php'; ?>
        <div class="data-side">
          <?php include CONF_THEME_PATH . $controller.'/_partial/account_tabs.php'; ?>
          <h3>Message to buyer</h3>
         
           

 
<div style="padding: 30px">
               
               	
 <?php
 $mydb=Syspage::getdb();
 
 $query="select * from tbl_users where user_id ='$buyer_id' limit 1";
 $rs=$mydb->query($query);
 $user_details=$mydb->fetch_all($rs);
 
 
 ?>             	


<form method="post" class="siteForm" >

	<table width="100%" border="0" cellspacing="10" cellpadding="10"><tbody>

<tr>
	<td width="25%" valign="top" align="left"><label>To</label></td>
	<td><b><?=$user_details[0]['user_username']?></b> </td>
</tr>


<tr>
	<td width="25%" valign="top" align="left"><label>Order Invoice Number</label></td>
	<td><b><?=$invoice_id?><b></b></b></td>
</tr>


<tr>
	<td width="25%" valign="top" align="left"><label>Subject</label><span class="spn_must_field">*</span></td>
	<td><input type="text" name="thread_subject" id="message_subject" value="" title="Subject"></td>
</tr>

<tr>
	<td width="25%" valign="top" align="left"><label>Your Message</label><span class="spn_must_field">*</span></td>
	<td><textarea name="message_text" title="Your Message"></textarea></td>
</tr>

<tr>
	<td width="25%" valign="top" align="left"></td>
	<td><input type="submit" name="btn_submit" id="btn_submit" title="" value="Send"></td>
</tr>

</tbody></table>
 
	
</form>

           
          
</div>          
          
                    
         
          
		 
          
        </div>
        
      </div>
    </div>
  </div>




 
 