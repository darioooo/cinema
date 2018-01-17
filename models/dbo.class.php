<?php

class dbo
{
	protected $table;
	protected $db;
	
	function __construct()
	{
		$this->db = new Database();
	}
	
	function setTable($table)
	{
		$this->table = $table;
	}
	
	/**
	$data array associativo coppie chiave valore
	*/
	function insert($data)
	{
		//"INSERT into <table> (col1,col2,col3...) values ('v1','v2','v3'....)";
		$cols = array_keys($data);
		$values = array_values($data);
		$fields = "(".implode(",",$cols).")";
		$binds = "('".implode("','",$values)."')";
		$sql = "INSERT INTO ".$this->table." ".$fields." VALUES ".$binds;
//   var_dump($sql);exit();
		try
	{
		return $this->db->query($sql);
	}
	catch(Exception $e)
	{
		echo $e->getMessage();
	}
		
	}
	
	function update($data,$where)
	{
		foreach ($data as $k=>$v)
			$fields[] = "`".$k."`='".$v."'";
		$sql = "UPDATE ".$this->table." SET ".implode(",",$fields);
		$cond = "WHERE ";
		foreach($where as $k=>$v)
			$conds[] = "`".$k."`='".$v."'";
		$cond .= implode(" AND ",$conds);
		$sql.=" ".$cond;
	
		return $this->db->query($sql);
		
	}
	
	function select($where=null, $field="*")
	{
		if(is_array($where))
		{
			
			foreach($where as $k=>$v)
				$condition[] = $this->table.".".$k."='".$v."'";
			
			$where = implode(" AND ", $condition);
		}
		if($where)
			$where = "where ".$where;
		
		if(is_array($field))
		{
			foreach($field as $v)
				$column[] = $this->table.".".$v;
			
			$field = implode(", ", $column);
		}
		
		$sql = "select ".$field." from ".$this->table." ".$where;
		return $this->db->query($sql);
	}
	
	/**
	@param $data è array associativo con attributi e valori da settare
	*/
	function copy($data)
	{
		//Verifica che $data sia un array
		if(is_array($data))
		{
			//Loop sui valori di $data, $k è una chiave, $v + il valore 
			foreach ($data as $k=>$v)
			{
				//Metodo set per impostare il valore della proprietà $k
				$setter = "set".$k;
				//Test di esistenza del metodo $setter nella classe Cliente
				if(method_exists($this,$setter))
					//Invocazione sull'oggetto istanza di Cliente ($this)
					// del metodo $setter, con argomenti di chiamata in array($v)
					call_user_func_array(array($this,$setter),array($v));
					}
		
	}
}

	function joinselect($id1,$middle=null,$tab2,$id2)
	{

		if(is_null($middle))
		{
			
		$sql= "select". ' * from ' . $this->table.' where '.$this->table.'.'.$id1.' = '.$tab2.'.'.$id2;
		}
		else
			$sql= 'select * from ' . $this->table.','.$middle.','.$tab2.' where '.$this->table.'.'.$id1.' = '.$middle.'.'.$id1.' and '.$middle.'.'.$id2.' = '.$tab2.'.'.$id2;
		
		return $this->db->query($sql);
	}


	function count()
	 {
	 	$sql= 'select count(*) as n_righe from '.$this->table;
	 	
	 	//var_dump($this->db->query($sql));exit();
	 	return $this->db->query($sql);
	 }

	 function last($id)
	 {
	 	$sql= 'select '.$id.' from '.$this->table.' order by '.$id.' desc limit 1';
	 	return $this->db->query($sql);
	 }

	 function delete($id)
	 {
	 	
	 	$cols = array_keys($id);

		$values = array_values($id);
		$sql = "DELETE FROM ".$this->table." WHERE ".$cols['0']."=".$values['0'];
	
				
		try {
			return $this->db->query($sql);
			
		} catch (Exception $e) {

			echo $e->getMessage();
			
		}
		
	

	 }

	 function unvisible_last_id()
	 {


	 	$sql = 'UPDATE '.$this->table.' SET visualizzato = FALSE  WHERE id ORDER by id DESC LIMIT 1';
	 	try {
			return $this->db->query($sql);
			
		} catch (Exception $e) {

			echo $e->getMessage();
			
		}
	 }

	 	 function get_last_id($id_name)
	 {


		 $sql = 'SELECT '.$id_name.' FROM '.$this->table.' WHERE '. $id_name.' ORDER by '. $id_name.' DESC LIMIT 1';
		//   var_dump($sql);exit();
	 	try {
			return $this->db->query($sql);
			
		} catch (Exception $e) {

			echo $e->getMessage();
			
		}
	 }
	 
	 function get_FilmDataCourrent()
	 {
		 $sql = 'SELECT * FROM  '.$this->table.' WHERE  CURDATE() >= data_inizio and CURDATE() < data_fine ';
		 try {
			return $this->db->query($sql);
			
		} catch (Exception $e) {

			echo $e->getMessage();
			
		}
		
		}



}
