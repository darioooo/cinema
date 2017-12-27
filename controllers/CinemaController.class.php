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
	$data=$feed->FeedRss();

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
	 * @method 
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function save_film(Request $request, Response $response, $args)
	{
		
		$url =$_POST["url"];
		$attori =$_POST["attori"];
		$regia =$_POST["regia"];
		$descrizione =$_POST["descrizione"];
		$titolo =$_POST["titolo"];
		$titolourl=  trim ($titolo ," ");

		$img = "image/".$titolourl.".jpg";
		file_put_contents($img, file_get_contents($url));
		//$insert_film['']=$img;
		$insert_scheda['attori']=$attori;
		$insert_scheda['regia']=$regia;
		$insert_film['visualizzato']=TRUE;
		$insert_film['immagine']=$img;
		$insert_film['titolo']= $titolo;
		$insert_film['descrizione']=$descrizione;
		$film = new Film();
		$scheda=new Scheda();
		$scheda->insert($insert_scheda);
		$id=$scheda->get_last_id();
		$insert_film['id_scheda']=$id[0]['id_scheda'];
		//var_dump($insert_film);exit();
		$film->unvisible_last_id();
		
		try{
		$film->insert($insert_film);
		}
		catch(Exception $e )
	    {
			echo $e->getMessage();
		}	



		
	}

	

	
	

}