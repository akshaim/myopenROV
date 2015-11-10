<?php
session_start();
include "control.html";

$action = $_GET['GO'];
$key = "";

switch ($action)
{
	case "camON":
		if ($_SESSION['connected'] != 1)
		{
			shell_exec("./camera.sh");
			$_SESSION['connected'] = 1;
			sleep(2);
		}
		break;
	case "ON":
		if ($_SESSION['connected'] != 1)
		{
			shell_exec("./arduino-connect.sh");
			$_SESSION['connected'] = 1;
			sleep(2);
		}
		break;
	case "OFF":
		if ($_SESSION['connected'] == 1)
		{
			shell_exec("./arduino-disconnect.sh");
			$_SESSION['connected'] = 0;
		}
		break;

	case "FORWARD":
		$key = "w";
		break;
	case "BACKWARD":
		$key = "s";
		break;
	case "LEFT":
		$key = "a";
		break;
	case "RIGHT":
		$key = "d";
		break;
	case "RELEASE":
		$key = "x";
		break;

	case "SLOWER":
		$key = "q";
		break;
	case "FASTER":
		$key = "e";
		break;
}

if (!empty($key))
{
	system("/bin/bash arduino-bridge.sh " . $key);
}
