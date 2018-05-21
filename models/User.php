<?php
class User extends dbo
{
	private $id_user="";
	private $name="";
	private $password="";
	private $mail="";
	

	function __construct()
	{
		parent::__construct();
		$this->table="user";
	}
	
	function get_id_user()
	{
		return $this->$id_user;
	}

	function get_name()
	{
		return $this->$name;
	}

	function get_password()
	{
		return $this->$password;
	}

	function get_mail()
	{
		return $this->$mail;
	}

	
	private function set_name($mValue)
	{
		$this->name=$mValue;
	}

	private function set_password($mValue)
	{
		$this->password=$mValue;
	}

	private function set_mail($mValue)
	{
		$this->mail=$mValue;
	}

	private function set_id_user($mValue)
	{
		$this->id_user=$mValue;
	}
}