<?php

class Film extends dbo
{
	private $id=null;
	protected $titolo="";
	protected $data_inizio="";
	protected $data_fine="";
	protected $visualizzato=false;
	protected $descrizione="";
	protected $immagine="";
	protected $id_scheda="";
	
	
	function __construct()
	{
		parent::__construct();
		$this->table="film";
	}
	
	function get_id()
	{
		return $this->id;
	}
	
	function get_titolo()
	{
		return $this->titolo;
	}
	
	function get_data_inizio()
	{
		return $this->data_inizio;
	}
	
	function get_data_fine()
	{
		return $this->data_fine;
	}
	function get_visualizzato()
	{
		return $this->visualizzato;
	}
	function get_descrizione()
	{
		return $this->descrizione;
	}
	function get_immagine()
	{
		return $this->immagine;
	}
	function get_id_scheda()
	{
		return $this->id_scheda;
	}

	private function setid($mValue)
	{
		$this->id=$mValue;
	}

	private function set_titolo($mValue)
	{
		$this->titolo=$mValue;
	}
	
	private function set_data_inizio($mValue)
	{
		$this->data_inizio=$mValue;
	}

	private function set_data_fine($mValue)
	{
		$this->data_fine=$mValue;
	}

	private function set_visualizzato($mValue)
	{
		$this->visualizzato=$mValue;
	}

	private function set_descrizione($mValue)
	{
		$this->descrizione=$mValue;
	}

	private function set_immagine($mValue)
	{
		$this->immagine=$mValue;
	}

	private function set_id_scheda($mValue)
	{
		$this->id_scheda=$mValue;
	}
	
}