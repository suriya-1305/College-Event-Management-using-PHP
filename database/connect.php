<?php
$servername = "localhost";
$username = "root";
$password = FALSE;
$dbname = "ems";
$conn = mysqli_connect($servername, $username, $password, $dbname);
if(!$conn){
	die("Connection failed: ".mysqli_connect_error);
}
?>
