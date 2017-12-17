<?php
use Slim\App;

class Application extends Slim\App
{
	function __construct()
	{
		parent::__construct();
		
	}
	
	function bootstrap()
	{
		include __DIR__.'/../data/routes.data.inc';
	}
	
	function handle()
	{
		$this->run();
	}
}