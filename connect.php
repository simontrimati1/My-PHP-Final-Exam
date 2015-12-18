<?php

include_once 'db_connect.php';

if(isset($_POST['btn-Book']))
{
	$first_name = mysql_real_escape_string($_POST['first_name']);
	$last_name = mysql_real_escape_string($_POST['last_name']);
	$prefix = mysql_real_escape_string($_POST['prefix']);
	$country = mysql_real_escape_string($_POST['country']);
	$phone = mysql_real_escape_string($_POST['phone']);
	$email = mysql_real_escape_string($_POST['email']);
	$checkin = mysql_real_escape_string($_POST['checkin']);
	$checkout = mysql_real_escape_string($_POST['checkout']);
	$adult = mysql_real_escape_string($_POST['adult']);
	$children = mysql_real_escape_string($_POST['children']);
	$room = mysql_real_escape_string($_POST['room']);
	$request = mysql_real_escape_string($_POST['request']);
	$verification= mysql_real_escape_string($_POST['verification']);
	
	
	if(mysql_query("INSERT INTO booking(user_id,first_name,last_name,prefix,country,phone,email,checkin,checkout,adult,children,room,request,verification) VALUES('$user_id','$first_name','$last_name','$prefix','$country','$phone','$email','$checkin','$checkout','$adult','$children','$room','$request','$verification')"))
	{
		?> 
         <script>alert('Congratulation your booking has been successfull proceded   .');</script>
		<?php 
    }
	else {
		?> 
         <script>alert('Sorry !!! Check Well your details information well .');</script>
		<?php 
		}
}	
?>
</body>
</html>