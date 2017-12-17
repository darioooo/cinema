<?php

class Orario extends dbo

{
	private $ora = "";
	private $id_orario = null;

	function __construct()
	{
		parent::__construct();
		$this->table="orario";
	}
	
	function get_id_orario()
	{
		return $this->id_orario;
	}

	function get_ora()
	{
		return $this->ora;
	}
	private function set_id_orario($mValue)
	{
		$this->id_orario=$mValue;
	}

	private function set_ora($mValue)
	{
		$this->ora=$mValue;
	}

}