<?php
include ("db_connect.php");

$strquery="DELETE from booking where user_id = '" . $_GET['user_id'] . "' ";


if($results=mysql_query ($strquery))
{
header ('location: admin.php');
}

else {
	echo 'Not deleted';
}
?>
