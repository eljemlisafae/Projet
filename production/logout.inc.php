<?php

if(isset($_POST['submit'])){

	session_unset();
	session_destroy();
	header("Location: index1.html");
	exit();
}
