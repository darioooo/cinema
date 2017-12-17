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

try{


		$table = (new HomeView(null,null));
		$page = new Page();
		$page->addView("content",$table);
		return $response->write($page->render());
	
	}
	catch(Exception $e )
	{
		echo $e->getMessage();
	}	
	}

	
	

}