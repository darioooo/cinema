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
		$film_orario= new Film_Orario();
		
	
		for($i=0;$i<count($data['film']);$i++)
		{
			
		$sc=$scheda->select($data['film'][$i]['id_scheda']);
		$orari= $film_orario->select($data['film'][$i]['id_film_orario']);
		$data['film'][$i]['regia']=$sc[$i]['regia']; 
		$data['film'][$i]['attori']=$sc[$i]['attori'];
		$data['film'][$i]['durata']=$sc[$i]['durata'];  
		$data['film'][$i]['genere']=$sc[$i]['genere']; 
		$data['film'][$i]['pese']=$sc[$i]['pese']; 
		$data['film'][$i]['id_scheda']=$sc[$i]['id_scheda'];
		$data['film'][$i]['indice']=$i;
		$data['film'][$i]['lunedi']=$orari[$i]['lunedi'];
		$data['film'][$i]['martedi']=$orari[$i]['martedi'];
		$data['film'][$i]['mercoledi']=$orari[$i]['mercoledi'];
		$data['film'][$i]['giovedi']=$orari[$i]['giovedi'];
		$data['film'][$i]['venerdi']=$orari[$i]['venerdi'];
		$data['film'][$i]['sabato']=$orari[$i]['sabato'];
		$data['film'][$i]['domenica']=$orari[$i]['domenica'];
		  var_dump($data);
		if($i==0)
		{
		$data['film'][$i]['active']='item active';
		$data['film'][$i]['visible']='visible';
		}
		else
		{
			$data['film'][$i]['active']='item';	
			$data['film'][$i]['visible']='hidden';
		} 
		}
		try{
		//   var_dump($data);exit();
		$table = (new HomeView(null,$data));
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
		$data=explode("/",$data_inizio);
		$dataf=explode("/",$data_fine);
		// $data_i=$data['2']."/".$data['1']."/".$data['0'];
		// $data_f=$dataf['2']."/".$dataf['1']."/".$dataf['0'];
		try
		{
		$data_i = new DateTime($data['2'].'-'.$data['1'].'-'.$data['0']);
		$data_f = new DateTime($dataf['2'].'-'.$dataf['1'].'-'.$dataf['0']);
		$datainizio = date_format($data_i, 'Y/m/d');
		$datafine = date_format($data_f, 'Y/m/d');
		// $interval= DateInterval::createFromDateString('1 day');
		// $period= new DatePeriod($data_i ,$interval ,$data_f);
		
		}	
		catch(Exception $e)
{
	echo $e->getMessage();
}
		for($i=$data_i; $i<$data_f; $i->modify('+1 day'))
		{	
			$timeTemp=strtotime(date_format($i,'Y/m/d'));
			
			if(date("w",$timeTemp)==1)
			{
			$orari[date("w",$timeTemp)]["ora"]=$_POST["lunedì"];
			$orari[date("w",$timeTemp)]["giornosettimana"]="lunedì";
			$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			var_dump($orari);

			}
			if(date("w",$timeTemp)==2)
			{
				$orari[date("w",$timeTemp)]["ora"]=$_POST["martedì"];
				$orari[date("w",$timeTemp)]["giornosettimana"]="martedì";
				$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			}
			if(date("w",$timeTemp)==3)
			{
				$orari[date("w",$timeTemp)]["ora"]=$_POST["mercoledì"];
				$orari[date("w",$timeTemp)]["giornosettimana"]="mercoledì";
				$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			}
			if(date("w",$timeTemp)==4)
			{
				$orari[date("w",$timeTemp)]["ora"]="";
				$orari[date("w",$timeTemp)]["giornosettimana"]="giovedì";
				$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			}
			if(date("w",$timeTemp)==5)
			{
				$orari[date("w",$timeTemp)]["ora"]=$_POST["venerdì"];
				$orari[date("w",$timeTemp)]["giornosettimana"]="venerdì";
				$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			}
			if(date("w",$timeTemp)==6)
			{
				$orari[date("w",$timeTemp)]["ora"]=$_POST["sabato"];
				$orari[date("w",$timeTemp)]["giornosettimana"]="sabato";
				$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			}
			if(date("w",$timeTemp)==7)
			{
				$orari[date("w",$timeTemp)]["ora"]=$_POST["domenica"];
				$orari[date("w",$timeTemp)]["giornosettimana"]="domenica";
				$orari[date("w",$timeTemp)]["giorno"]=date_format($i,'Y/m/d');
			}
		}
	
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
		// echo("kjenkvsseseoe inizio     ");
		var_dump($data_fine);
		var_dump($data_inizio);	
		$film = new Film();
		$scheda=new Scheda();	
		$film_orario= new Film_Orario();
		// var_dump($orari);exit();
	
		$scheda->insert($insert_scheda);
		
		$id=$scheda->get_last_id("id_scheda");
		
		
		$insert_film['id_scheda']=$id[0]['id_scheda'];

		// $film->unvisible_last_id();
		
		try {
			$film->insert($insert_film);
			$id_film=$film->get_last_id("id");
			var_dump($id_film);
			
			if($orari!= null)
		{
			foreach($orari as $value)
			{
				if($value["ora"]!="")
				{
				$orarioDbo["ora"]=$value["ora"];
				$orarioDbo["giorno"]=$value["giorno"];
				$orarioDbo["giornosettimana"]=str_replace("ì","i",$value["giornosettimana"]);
				$orarioDbo["id_film"]=$id_film[0]['id'];
				$film_orario->insert($orarioDbo);
				}
			}
		}
		}
		catch(Exception $e)
	    {
			echo $e->getMessage();
		}
	}

	/**
	 * @desc This method provides the registration html page
	 * @link /save_new_image
	 * @method 
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function save_new_image(Request $request, Response $response, $args)
	{	

		$sourcePath = $_FILES["file"]["tmp_name"];
		var_dump($sourcePath);
		$targetPath = "image/".$_FILES['file']['name'];
		var_dump($targetPath);

try 
{	
	move_uploaded_file($sourcePath,$targetPath) ;
}
catch(Exception $e)
{
	echo $e->getMessage();
}

		
		
		

		
		
	}


}