<?php
class Config
{
	static  $instance = null;
	
	protected $vars;
	
	function __construct()
	{
		$this->vars=array();
	}
	
   	function get($key)
	{
		return isset($this->vars[$key])?$this->vars[$key]:null;
	}
	
	function load($fileName=null)
	{
		if(file_exists($fileName))
		{
			include($fileName);
			$this->vars=$config;
			var_dump($this->vars);
		}
	}
	
	static function getInstance()
	{
		if(!self::$instance)
		{
			self::$instance = new Config();
		}
		return self::$instance;
	}
}