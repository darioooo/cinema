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


		$film = new Film();
		$visualizzato['visualizzato']=true;
		$data['film']=$film->select($visualizzato);
		$id_scheda['id_scheda']=$data['film'][0]['id_scheda'];
		$scheda=new Scheda();
		$data['scheda']=$scheda->select($id_scheda);
		// var_dump($data);exit();
		$table = (new HomeView(null,$data));
		$page = new Page();
		$page->addView("content",$table);
		return $response->write($page->render());
	
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
		$data_inizio=$_POST["data_inizio"];
		$data_fine=$_POST["data_fine"];
		$vowels = array(" ","'");
		$titolourl=  str_replace($vowels, '', $titolo);
		// var_dump($titolourl);exit();
		$img = "image/".$titolourl.".jpg";
		file_put_contents($img, file_get_contents($url));
		//$insert_film['']=$img;
		$insert_scheda['attori']=$attori;
		$insert_scheda['regia']=$regia;
		// var_dump($insert_scheda);exit();
		$insert_film['visualizzato']=TRUE;
		$insert_film['immagine']=$img;
		$insert_film['titolo']= $titolo;
		$insert_film['descrizione']=$descrizione;
		var_dump($data_fine);
		var_dump($data_inizio);
		$datai = explode( "/",$data_inizio  );
		$dataf = explode( "/",$data_fine  );
		$newDateInizio = new DateTime();
		$newDateInizio->setDate($datai['2'],$datai['1'],$datai['0']);
		$newDateInizio = date_format($newDateInizio, 'Y/m/d');
		$insert_film['data_inizio']=$newDateInizio;
		// try
		// {
		$newDateFine = new DateTime();
		$newDateFine->setDate($dataf['2'],$dataf['1'],$dataf['0']);
		$newDateFine = date_format($newDateFine, 'Y/m/d');
		// var_dump($newDateFine);exit();
		$insert_film['data_fine']=$newDateFine;
		// }
		// catch(Exception $e )
		// {
		// 	echo $e->getMessage();
		// }
		echo("kjenkvsseseoe inizio     ");
		var_dump($data_fine);
		var_dump($data_inizio);	
		$film = new Film();
		$scheda=new Scheda();	
		$scheda->insert($insert_scheda);

	
		$id=$scheda->get_last_id();
		$insert_film['id_scheda']=$id[0]['id_scheda'];
		$film->unvisible_last_id();
		
		try {
			$film->insert($insert_film);
		}
		catch(Exception $e )
	    {
			echo $e->getMessage();
		}
	}
}