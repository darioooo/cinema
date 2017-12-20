<?php
require 'lib/slim/autoload.php';
include "lib/mustache/mustache.php";
error_reporting(E_ALL);
ini_set('display_errors', 'On');
function my_Autoload($class)
{
	include "config/env.php"; // cartelle 
	foreach ($classPath as $p)
	{
		$path = __DIR__.DIRECTORY_SEPARATOR.$p.DIRECTORY_SEPARATOR.$class.".class.php";
		if(file_exists($path))
		{
			include_once($path);
			
			return;
		}
		
		$path = __DIR__.DIRECTORY_SEPARATOR.$p.DIRECTORY_SEPARATOR.$class.".php";
		if(file_exists($path))
		{
			include_once($path);
			return;
		}
	}
}

spl_autoload_register("my_Autoload");
$app = new Application(); // istanzio applicazione.class.php
$app->bootstrap();
$app->handle();