<?php
class LibreriaView extends View
{
	function __construct($template=null,$data=null,$var="content")
	{
		parent::__construct("tabella_lib.ms",$data,$var);
		
	}
}