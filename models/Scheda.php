<?php


class Scheda extends dbo
{
	
	private $regia = "";
	private $attori = "";
	private $durata = "";
	private $genere = "";
	private $paese = "";
	private $id_scheda = null;

	function __construct()
	{
		parent::__construct();
		$this->table="scheda";
	}
	
	function get_id_scheda()
	{
		return $this->id_orario;
	}

		function get_regia()
	{
		return $this->regia;
	}

		function get_attori()
	{
		return $this->attori;
	}

		function get_durata()
	{
		return $this->durata;
	}

		function get_genere()
	{
		return $this->genere;
	}
		function get_paese()
	{
		return $this->paese;
	}

	private function set_regia($mValue)

	{
		$this->regia=$mValue;
	}

	private function set_attori($mValue)

	{
		$this->attori=$mValue;
	}

	private function set_durata($mValue)

	{
		$this->durata=$mValue;
	}

	private function set_genere($mValue)

	{
		$this->genere=$mValue;
	}

	private function set_paese($mValue)

	{
		$this->paese=$mValue;
	}







}