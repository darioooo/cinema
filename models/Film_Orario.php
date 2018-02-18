<?php
class Film_Orario extends dbo
{
	private $id_orario="";
	private $giorno="";
	private $ora="";
	private $giornosettimana="";
	private $id_film="";
	

	function __construct()
	{
		parent::__construct();
		$this->table="film_orario";
	}
	
	function get_id_orario()
	{
		return $this->$id_orario;
	}

	function get_giorno()
	{
		return $this->$giorno;
	}

	function get_ora()
	{
		return $this->$ora;
	}

	function get_giornosettimana()
	{
		return $this->$giornosettimana;
	}

	function get_id_film()
	{
		return $this->$id_film;
	}

	private function set_giorno($mValue)
	{
		$this->giorno=$mValue;
	}

	private function set_ora($mValue)
	{
		$this->ora=$mValue;
	}

	private function set_giornosettimana($mValue)
	{
		$this->giornosettimana=$mValue;
	}

	private function set_id_film($mValue)
	{
		$this->id_film=$mValue;
	}
}