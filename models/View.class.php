<?php
include_once("lib/mustache/mustache.php");

class View
{
	protected $engine;
	protected $data;
	protected $template;
	
	function __construct($template=null,$data=null,$var="content"){
		$this->engine = new Mustache_Engine();
		$this->data=isset($data)?$data:null;
		$this->template=isset($template)?$template:null;
		$path = realpath(__DIR__."/../public/templates/");
		$this->engine->setLoader(new Mustache_Loader_FilesystemLoader($path,array("extension"=>".ms")));
		
	}
	
	function setData($data)
	{
		$this->data=$data;
	}
	
	function getData()
	{
		return $this->data;
	}
	
	function setTemplate($data)
	{
		$this->template=$data;
	}
	
	function getTemplate()
	{
		return $this->template;
	}
	
	function render()
	{
		$tpl_data = isset($this->data)?$this->data:array();
		$tpl = explode(".", $this->template);
		$result = $this->engine->render($tpl[0], $tpl_data);
		return $result;
	}
}