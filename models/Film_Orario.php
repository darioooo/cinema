<?php

class Film_Orario extends dbo
{
	private $id_film = "";
	private $id_orario="";

	function __construct()
	{
		parent::__construct();
		$this->table="film_orario";
	}
	
	function get_id_film()
	{
		return $this->id_film;
	}

	function get_id_orario()
	{
		return $this->id_orario;
	}

	private function set_id_film($mValue)
	{
		$this->id_film=$mValue;
	}

	private function set_id_orario($mValue)
	{
		$this->id_orario=$mValue;
	}

}