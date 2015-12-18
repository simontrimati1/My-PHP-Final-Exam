<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Booking Page</title>
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
    <td height="433" colspan="3"><form id="form1" name="form1" method="post" action="connect.php"><table width="634" border="0" align="center">
        <tr>
          <td colspan="8"><div align="center">
            <h3>Fill the form below to book a certain Room</h3>
          </div></td>
          </tr>
        <tr>
        <td width="211">First Name *:</td>
        <td colspan="7">
          <label for="textfield"></label>
          <input type="text" name="first_name" id="textfield" placeholder="Your first name" required/>        </td>
      </tr>
      <tr>
        <td>Last Name *:</td>
        <td colspan="7"><input type="text" name="last_name" id="textfield2" placeholder="Your last name" required/></td>
      </tr>
      <tr>
        <td>Prefix *:</td>
        <td colspan="7">
          <label for="select"></label>
          <select name="prefix" id="select">
            <option>Prefix</option>
			<option>Mr.</option>
            <option>Mrs</option>
            <option>Miss</option>
            <option>Ms</option>
            <option>Doctor</option>
            <option>Others</option>
          </select>        </td>
      </tr>
      <tr>
        <td>Country *:</td>
        <td colspan="7"><input type="text" name="country" id="textfield3" placeholder="Your country" required/></td>
      </tr>
      <tr>
        <td>Phone Number:</td>
        <td colspan="7"><input type="text" name="phone" id="textfield4" placeholder="Your phone number" required/></td>
      </tr>
      <tr>
        <td>Email Address *:</td>
        <td colspan="7"><input type="email" name="email" id="textfield5" placeholder="Your email address" required/></td>
      </tr>
      <tr>
        <td>Check In *:</td>
        <td colspan="7"><input type="text" name="checkin" id="textfield6" placeholder="Check in date" required/></td>
      </tr>
      <tr>
        <td>Check Out *:</td>
        <td colspan="7"><input type="text" name="checkout" id="textfield7" placeholder="Check out date" required//></td>
      </tr>
      <tr>
        <td>Adults</td>
        <td colspan="7"><select name="adult" id="select2">
          <option>Adults</option>
		  <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
        </select></td>
      </tr>
      <tr>
        <td>Children</td>
        <td colspan="7"><select name="children" id="select3">
          <option>Children</option>
		  <option>1</option>
          <option>2</option>
          <option>3</option>
          <option>4</option>
          <option>5</option>
          <option>6</option>
          <option>7</option>
          <option>8</option>
        </select></td>
      </tr>
      <tr>
        <td>Room Type</td>
        <td colspan="7"><select name="room" id="select4">
          <option>Room Type</option>
		  <option>Executive Deluxe</option>
          <option>Executive Suite</option>
          <option>Executive twin</option>
          <option>Apartment</option>
        </select></td>
      </tr>
      <tr>
        <td>Special Request</td>
        <td colspan="7">
          <label for="textarea"></label>
          <textarea name="request" id="textarea" cols="45" rows="5" placeholder="Please type your special requests here (Note that it is optional)"></textarea></td>
      </tr>
      <tr>
        <td>Human Verification</td>
        <td width="72"><div align="center"><img src="booking_1222296277.png" alt="captcha"/></div></td>
        <td colspan="6"><input type="text" name="verification" id="textfield8" placeholder="Type the verification code" required/></td>
      </tr>
      <tr>
        <td height="26">&nbsp;</td>
        <td><a href="adminlogin.php">Manager</a></td>
        <td width="113"><div align="right"></div>       </td>
        <td width="48"><input type="reset" name="Reset" id="button2" value="Reset" /></td>
        <td width="43"><input type="submit" name="btn-Book" id="button" value="Book" /></td>
        <td width="68"><div align="left"></div></td>
        <td width="1">&nbsp;</td>
        <td width="44">&nbsp;</td>
      </tr>
    </table>
    </form></td>
  </tr>
  <tr>
    <td width="247"><p>&nbsp;</p></td>
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
