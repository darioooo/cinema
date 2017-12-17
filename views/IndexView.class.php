<?php
class IndexView extends View
{
	function __construct($template=null,$data=null,$var="content")
	{
		parent::__construct("page.ms",$data,$var);
		
	}
}