<?php
class HomeView extends View
{
	function __construct($template=null,$data=null,$var="content")
	{
		parent::__construct("home.ms",$data,$var);
		
	}
}
