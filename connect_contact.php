<?php

include_once 'db_connect.php';

if(isset($_POST['btn-Send']))
{
	$names = mysql_real_escape_string($_POST['names']);
	$email = mysql_real_escape_string($_POST['email']);
	$subject = mysql_real_escape_string($_POST['subject']);
	$message = mysql_real_escape_string($_POST['message']);
	
	if(mysql_query("INSERT INTO contact_tbl(user_id,names,email,subject,message) VALUES('$users_id','$names','$email','$subject','$message')"))
	{
		?> 
         <script>alert('Thanks for your help!!!!!!!!!!!!!.');</script>
         
		<?php 
    }
	else {
		?> 
         <script>alert('Sorry !!! Check Well your details information well .');</script>
		<?php 
		}
}	
?>