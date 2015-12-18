<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Admin</title>
<style type="text/css">
<!--
.style10 {font-size: 17px; font-weight: bold; }
.style11 {font-weight: bold}
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
.style12 {font-size: 16px}
-->
</style>
</head>

<body bgcolor="#003366">
<table width="824" border="0" align="center" bgcolor="#FFFFFF">
  <tr>
    <td colspan="3"><img src="Pics/banner.PNG" alt="k" width="846" height="201" /></td>
  </tr>
  <tr>
    <td colspan="3"><table width="534" border="0" align="center">
      <tr>
        <td width="63"><div align="center" class="style10"><a href="index.php">Home</a></div></td>
        <td width="10"><img src="Pics/a-star.gif" alt="l" width="15" height="15" class="style11" /></td>
        <td width="80"><div align="center" class="style10"><a href="aboutus.php">About Us</a> </div></td>
        <td width="10"><img src="Pics/a-star.gif" width="15" height="15" /></td>
        <td width="74"><div align="center" class="style10"><a href="services.php">Services</a></div></td>
        <td width="10"><img src="Pics/a-star.gif" width="15" height="15" /></td>
        <td width="61"><div align="center" class="style10"><a href="rooms.php">Rooms</a></div></td>
        <td width="10"><img src="Pics/a-star.gif" width="15" height="15" /></td>
        <td width="76"><div align="center" class="style10"><a href="booking.php">Booking</a></div></td>
        <td width="10"><img src="Pics/a-star.gif" width="15" height="15" /></td>
        <td width="84"><div align="center" class="style15 style12"><strong><a href="contact.php">Contact Us</a> </strong></div></td>
      </tr>
    </table>    </td>
  </tr>
  <tr>
    <td height="78" colspan="3"><table width="778" height="76" border="0" align="center">
      <tr>
        <td width="54" height="23"><h4 align="left"><strong>Name</strong></h4></td>
        <td width="103"><h4 align="left"><strong>Others name</strong></h4></td>
        <td width="126"><h4 align="left"><strong>E-mail</strong></h4></td>
        <td width="83"><h4><strong>Country</strong></h4></td>
        <td><h4 align="left"><strong>Adult</strong></h4></td>
        <td><strong>Phone No.</strong></td>
        <td width="34"><h4 align="left"><strong>Id </strong></h4></td>
        <td colspan="2"><h4 align="center"><strong> Option</strong>s</h4></td>
      </tr>
      <?php
include ("db_connect.php");

$strquery="SELECT * from booking";
$results=mysql_query($strquery);
$num=mysql_num_rows($results);

$i=0;
while ($i< $num)

{
$first_name=mysql_result($results,$i,"first_name");
$last_name=mysql_result($results,$i,"last_name");
$email=mysql_result($results,$i,"email");
$country=mysql_result($results,$i,"country");
$adult=mysql_result($results,$i,"adult");
$phone=mysql_result($results,$i,"phone");
$user_id=mysql_result($results,$i,"user_id");

?>
      <tr>
        <td height="21"><?php echo $first_name ; ?></td>
        <td><?php echo $last_name ; ?></td>
        <td><?php echo $email ; ?></td>
        <td><?php echo $country ; ?></td>
        <td width="45"><?php echo $adult ; ?></td>
        <td width="99"><?php echo $phone ; ?></td>
        <td><?php echo $user_id ; ?></td>
        <td width="17">&nbsp;</td>
        <td width="179"><?php echo " <a href='Delete.php?user_id=" . $user_id . "'> Delete </a> "; ?></td>
      </tr>
      <?php

  $i++;
  }
  ?>
      <tr>
        <td height="21">&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="247"><p><a href="logout.php">Logout</a></p></td>
    <td width="324">Thank you for choising SIMON HOTEL !!!</td>
    <td width="267">&nbsp;</td>
  </tr>
  <tr>
    <td colspan="2"><p>Kampala, <?php

echo "today is " . date("l"); 


echo date("j F Y") . "<br>";

echo "The time is " . date("h:i:sa");

?>&nbsp;</p>    </td>
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
    <td colspan="3"><div align="center"><a href="index.php">Home</a> | <a href="aboutus.php">About</a> | <a href="services.php">Services</a> | <a href="rooms.php">Rooms</a> | <a href="booking.php">Booking</a> | <a href="contact.php">Contact Us</a> </div></td>
  </tr>
  <tr>
    <td colspan="3" bgcolor="#CCCCCC"><div align="center">(c) Copyright 2015 Simon Hotel. All rights reserved </div></td>
  </tr>
</table>
</body>
</html>
