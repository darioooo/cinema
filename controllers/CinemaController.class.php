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
		/* try{
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
		catch(Exception $e) {
			echo $e -> getMessage();
		} */
	
		$film = new Film();
		$visualizzato['visualizzato']=true;
		$data['film']=$film->get_FilmDataCourrent();
		// $id_scheda['id_scheda']=$data['film'][0]['id_scheda'];
		$scheda=new Scheda();
		
		for($i=0;$i<count($data['film']);$i++)
		{
			$sc=$scheda->select($data['film'][$i]['id_scheda']);
			$data['film'][$i]['regia']=$sc[$i]['regia']; 
			$data['film'][$i]['attori']=$sc[$i]['attori'];
			$data['film'][$i]['durata']=$sc[$i]['durata'];  
			$data['film'][$i]['genere']=$sc[$i]['genere']; 
			$data['film'][$i]['pese']=$sc[$i]['pese']; 
			$data['film'][$i]['id_scheda']=$sc[$i]['id_scheda'];
			$data['film'][$i]['indice']=$i;
			//  var_dump($i);
			if($i==0)
			{
				$data['film'][$i]['active']='item active';
			}
			else
			{
				$data['film'][$i]['active']='item';	
			} 
		}
		//   var_dump($data);exit();
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
	 * @link /modifica_admin
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */

	function modifica_admin(Request $request, Response $response, $args)
	{
		try{
			$film = new Film();
			$visualizzato['visualizzato']=true;
			$data['film']=$film->select($visualizzato);
			// $id_scheda['id_scheda']=$data['film'][0]['id_scheda'];
			$scheda=new Scheda();
			
		
			for($i=0;$i<count($data['film']);$i++)
			{
			$sc=$scheda->select($data['film'][$i]['id_scheda']);
			$data['film'][$i]['regia']=$sc[$i]['regia']; 
			$data['film'][$i]['attori']=$sc[$i]['attori'];
			$data['film'][$i]['durata']=$sc[$i]['durata'];  
			$data['film'][$i]['genere']=$sc[$i]['genere']; 
			$data['film'][$i]['pese']=$sc[$i]['pese']; 
			$data['film'][$i]['id_scheda']=$sc[$i]['id_scheda'];
			$data['film'][$i]['indice']=$i;
			//  var_dump($i);
			if($i==0)
			{
			$data['film'][$i]['active']='item active';
			}
			else
			{
				$data['film'][$i]['active']='item';	
			} 
			}

			$modifica= (new ModificaAdminView(null,$data));
			$page = new Page();
			$page->addView("content",$modifica);
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
		
		$orari["lunedi"]=$_POST["lunedì"];
		$orari["martedi"]=$_POST["martedì"];
		$orari["mercoledi"]=$_POST["mercoledì"];
		$orari["giovedi"]="";
		$orari["venerdi"]=$_POST["venerdì"];
		$orari["sabato"]=$_POST["sabato"];
		$orari["domenica"]=$_POST["domenica"];
		

		$vowels = array(" ","'");
		$titolourl=  str_replace($vowels, '', $titolo);
		$img = "image/".$titolourl.".jpg";
		file_put_contents($img, file_get_contents($url));
		$insert_scheda['attori']=$attori;
		$insert_scheda['regia']=$regia;
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
		$newDateFine = new DateTime();
		$newDateFine->setDate($dataf['2'],$dataf['1'],$dataf['0']);
		$newDateFine = date_format($newDateFine, 'Y/m/d');
		$insert_film['data_fine']=$newDateFine;
		echo("kjenkvsseseoe inizio     ");
		var_dump($data_fine);
		var_dump($data_inizio);	
		$film = new Film();
		$scheda=new Scheda();	
		$film_orario= new Film_Orario();

		$film_orario->insert($orari);
		$scheda->insert($insert_scheda);
		
		$id=$scheda->get_last_id("id_scheda");
		 $id_orari=$film_orario->get_last_id("id_orario");
		
		$insert_film['id_scheda']=$id[0]['id_scheda'];
		  $insert_film['id_film_orario']=$id_orari[0]['id_orario'];
		// $film->unvisible_last_id();
		
		try {
			$film->insert($insert_film);
		}
		catch(Exception $e)
	    {
			echo $e->getMessage();
		}
	}
}