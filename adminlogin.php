<?php
session_start();
include_once 'db_connect.php';

if(isset($_POST['btn-login']))
{
	$email = mysql_real_escape_string($_POST['email']);
	$pin = mysql_real_escape_string($_POST['pin']);
	$res = mysql_query("SELECT * FROM adimn WHERE email='$email'");
	$row = mysql_fetch_array($res);
	
	if($row['pin']==md5($pin))
	{
		$_SESSION['user'] = $row['id'];
		header("Location: admin.php");
	}
	else
	{
		?>
        <script>alert('You are not an admin!!!');</script>
        <?php
	}
	
}
?>
        <style type="text/css">
        .style10 {font-size: 17px; font-weight: bold; }
.style11 {font-weight: bold}
.style12 {font-size: 16px}
        #id table tr td {
	color: #00F;
}
        .style14 {
	font-size: 36px;
	font-family: Arial, Helvetica, sans-serif;
	color: #0000FF;
}
        .style15 {font-weight: bold}
        .style23 {font-size: 24px; color: #000000; }
        .style24 {
	color: #0033FF;
	font-weight: bold;
}
        </style>
        


<title>Admin Login</title><table width="824" border="0" align="center" bgcolor="#FFFFFF">
    <tr>
      <td colspan="3"><img src="Pics/banner.PNG" alt="k" width="846" height="201" /></td>
    </tr>
    <tr>
      <td colspan="3"><p>&nbsp;</p>
      <table width="534" border="0" align="center">
        <tr>
          <td width="63"><div align="center" class="style10"><a href="index.php">Home</a></div></td>
          <td width="10"><img src="Pics/a-star.gif" alt="l" width="15" height="15" class="style11" /></td>
          <td width="80"><div align="center" class="style10"><a href="aboutus.php">About Us</a></div></td>
          <td width="10"><img src="Pics/a-star.gif" alt="d" width="15" height="15" /></td>
          <td width="74"><div align="center" class="style10"><a href="services.php">Services</a></div></td>
          <td width="10"><img src="Pics/a-star.gif" alt="d" width="15" height="15" /></td>
          <td width="61"><div align="center" class="style10"><a href="rooms.php">Rooms</a></div></td>
          <td width="10"><img src="Pics/a-star.gif" alt="d" width="15" height="15" /></td>
          <td width="76"><div align="center" class="style10"><a href="booking.php">Booking</a></div></td>
          <td width="10"><img src="Pics/a-star.gif" alt="d" width="15" height="15" /></td>
          <td width="84"><div align="center" class="style15 style12"><strong><a href="contact.php">Contact Us</a></strong></div></td>
        </tr>
      </table></td>
    </tr>
    <tr >
      <td height="231" colspan="3"><form id action="" method="post"><table width="477" border="0" align="center">
        <tr>
          <td colspan="4"><h3 align="center" class="style14">ADMIN LOGIN REQUIRED! </h3>            </td>
        </tr>
        <tr>
          <td width="202"><div align="right"><span class="style23"> Admin Email*:</span></div></td>
          <td colspan="3"><input type="text" name="email" id="textfield" required="required" placeholder="Your Email"/></td>
        </tr>
        <tr>
          <td><div align="right"><span class="style23">Admin Password*:</span></div></td>
          <td colspan="3"><input type="password" name="pin" id="textfield2" placeholder="Your Password" required/></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td width="49"><div align="right">
            <input type="reset" name="button2" id="button2" value="Reset" />
          </div></td>
          <td width="97"><div align="right">
            <input type="submit" name="btn-login" id="button" value="Login" />
          </div></td>
          <td width="111">&nbsp;</td>
        </tr>
      </table>
      </form></td>
    </tr>
    <tr>
      <td width="247"><p>&nbsp;</p></td>
      <td width="324"><div align="center" class="style24">For Admin use only!!!</div></td>
      <td width="267">&nbsp;</td>
    </tr>
    <tr>
      <td colspan="2"><p>Kampala,
        <?php

echo "today is " . date("l"); 


echo date("j F Y") . "<br>";

echo "The time is " . date("h:i:sa");

?>
        &nbsp;</p></td>
      <td><table width="241" border="0" align="center">
        <tr>
          <td width="44"><a href="http://www.facebook.com"><img src="Pics/facebook.png" alt="trr" width="40" height="30" border="0" /></a></td>
          <td width="44"><a href="http://www.yahoo.com"><img src="Pics/yahoo.jpeg" alt="pp" width="40" height="30" /></a></td>
          <td width="42"><a href="http://www.gmail.com"><img src="Pics/gmail.jpeg" alt="k" width="40" height="30" /></a></td>
          <td width="40"><a href="http://www.tweeter.com"><img src="Pics/tweeter.png" alt="tgf" width="40" height="30" /></a></td>
          <td width="49"><a href="http://www.instagram.com"><img src="Pics/instagram.jpeg" alt="jj" width="40" height="30" /></a></td>
        </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan="3"><div align="center"><a href="index.php">Home</a> | <a href="aboutus.php">About</a> | <a href="services.php">Services</a> | <a href="rooms.php">Rooms</a> | <a href="booking.php">Booking</a> | <a href="contact.php">Contact Us</a></div></td>
    </tr>
    <tr>
      <td colspan="3" bgcolor="#CCCCCC"><div align="center">(c) Copyright 2015 Simon Hotel. All rights reserved </div></td>
    </tr>
</table>
<p>&nbsp;</p>





