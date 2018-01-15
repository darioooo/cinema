<?php

class Film_Orario extends dbo
{
	private $id_film = "";
	private $id_orario="";
	private $lunedì="";
	private $martedì="";
	private $mercoledì="";
	private $giovedì="";
	private $venerdì="";
	private $sabato="";
	private $domenica="";

	function __construct()
	{
		parent::__construct();
		$this->table="film_orario";
	}
	
	function get_id_film()
	{
		return $this->$id_film;
	}

	function get_id_orario()
	{
		return $this->$id_orario;
	}

	function get_lunedì()
	{
		return $this->$lunedì;
	}

	function get_martedì()
	{
		return $this->$martedì;
	}

	function get_mercoledì()
	{
		return $this->$mercoledì;
	}

	function get_giovedì()
	{
		return $this->$giovedì;
	}

	function get_venerdì()
	{
		return $this->$venerdì;
	}

	function get_sabato()
	{
		return $this->$sabato;
	}

	function get_domenica()
	{
		return $this->$domenica;
	}



	private function set_id_film($mValue)
	{
		$this->id_film=$mValue;
	}

	private function set_id_orario($mValue)
	{
		$this->id_orario=$mValue;
	}

	private function set_lunedì($mValue)
	{
		$this->lunedì=$mValue;
	}


	private function set_martedì($mValue)
	{
		$this->martedì=$mValue;
	}

	private function set_mercoledì($mValue)
	{
		$this->mercoledì=$mValue;
	}

	private function set_giovedì($mValue)
	{
		$this->giovedì=$mValue;
	}

	private function set_sabato($mValue)
	{
		$this->sabato=$mValue;
	}

	private function set_venerdì($mValue)
	{
		$this->venerdì=$mValue;
	}

	private function set_domenica($mValue)
	{
		$this->domenica=$mValue;
	}


}