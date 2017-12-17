<?php
class Page extends View
{
	function __construct($template="int.ms",$data=[],$var="content")
	{
		parent::__construct($template,$data,$var);	
	}
	function render()
	{
		foreach ($this->data as $key => $value) {
			# code...
			$html="";
			
				foreach ($value as $view) {
					if(is_a($view,"View"))
					{
					$html.=$view->render();
					}
					else 
					{
						$html.=$viev;
					}
				}
			$this->data[$key]=$html;
		}
		return parent::render();
	}

	function addView($key,View $view)
	{
		$this->data[$key][]=$view;
	}
}