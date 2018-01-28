<?php
class Film_Orario extends dbo
{
	private $id_orario="";
	private $lunedi="";
	private $martedi="";
	private $mercoledi="";
	private $giovedi="";
	private $venerdi="";
	private $sabato="";
	private $domenica="";

	function __construct()
	{
		parent::__construct();
		$this->table="film_orario";
	}
	
	function get_id_orario()
	{
		return $this->$id_orario;
	}

	function get_lunedi()
	{
		return $this->$lunedi;
	}

	function get_martedi()
	{
		return $this->$martedi;
	}

	function get_mercoledi()
	{
		return $this->$mercoledi;
	}

	function get_giovedi()
	{
		return $this->$giovedi;
	}

	function get_venerdi()
	{
		return $this->$venerdi;
	}

	function get_sabato()
	{
		return $this->$sabato;
	}

	function get_domenica()
	{
		return $this->$domenica;
	}

	private function set_lunedi($mValue)
	{
		$this->lunedi=$mValue;
	}

	private function set_martedi($mValue)
	{
		$this->martedi=$mValue;
	}

	private function set_mercoledi($mValue)
	{
		$this->mercoledi=$mValue;
	}

	private function set_giovedi($mValue)
	{
		$this->giovedi=$mValue;
	}

	private function set_sabato($mValue)
	{
		$this->sabato=$mValue;
	}

	private function set_venerdi($mValue)
	{
		$this->venerdi=$mValue;
	}

	private function set_domenica($mValue)
	{
		$this->domenica=$mValue;
	}
}