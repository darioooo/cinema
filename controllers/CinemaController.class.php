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


	/**
	 * @desc This method provides the registration html page
	 * @link /admin
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function admin(Request $request, Response $response, $args)
	{

try{

	$feed = new FeedRssController();
	$data=$feed->FeedRssController();

		$table = (new FeedRssView(null,$data));
		$page = new Page();
		$page->addView("content",$table);
		return $response->write($page->render());
	
	}
	catch(Exception $e )
	{
		echo $e->getMessage();
	}	
	}



/**
	 * @desc This method provides the registration html page
	 * @link /save_film
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function save_film(Request $request, Response $response, $args)
	{
		
		$url =$_POST["url"];
		$titolo =$_POST["titolo"];
		$titolourl=  trim ($titolo ," ");

		$img = "/image/".$titolourl.".jpg";
		

		file_put_contents($img, file_get_contents($url));

		




		
	}

	

	
	

}