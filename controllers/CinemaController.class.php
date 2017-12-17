<?php
use Slim\Http\Request;
use Slim\Http\Response;

class CinemaController
{
	/**
	 * @desc This method provides the registration html page
	 * @link /home
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function home(Request $request, Response $response, $args)
	{
		
		$data['libro']= $libri-> select();
		foreach ($data['libro'] as $k => $value) {
		
	
				$id = $lib_aut->select(array("id_lib"=>$value['id_lib']),'id_aut');
			
	
		

		if (is_null($id)) {
			
		}
		else
		{
			foreach ($id as $i => $a) {
			
			$data['libro'][intval($k)]['autore'][intval($i)]=$autore->select($a);
			
			}
		}
	}

	
	

}