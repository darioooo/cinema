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
		$data['filmtoday']=$film->get_FilmTodayDataCourrent();
		$data['filmafter']=$film->get_FilmAfterDataCourrent();
		// $id_scheda['id_scheda']=$data['film'][0]['id_scheda'];
		$scheda=new Scheda();
		$film_orario= new Film_Orario(); 
		if($data['filmtoday']!= null)
		{
			for($i=0;$i<count($data['filmtoday']);$i++)
			{
				$id['id_film']=$data['filmtoday'][$i]['id'];
				$sc=$scheda->select($id);
				$orariToday= $film_orario->select($id);
				
				$data['filmtoday'][$i]['regia']=$sc[0]['regia']; 
				$data['filmtoday'][$i]['attori']=$sc[0]['attori'];
				$data['filmtoday'][$i]['durata']=$sc[0]['durata'];  
				$data['filmtoday'][$i]['genere']=$sc[0]['genere']; 
				$data['filmtoday'][$i]['pese']=$sc[0]['pese']; 
				$data['filmtoday'][$i]['indice']=$i;
				$data['filmtoday'][$i]['close']=$i;
				
				foreach($orariToday as $k=>$v)
				{
					$data['filmtoday'][$i]['filmorario'][$k]['ora']=$v['ora'];
					$data['filmtoday'][$i]['filmorario'][$k]['giornosettimana']=$v['giornosettimana'];
					$data['filmtoday'][$i]['filmorario'][$k]['giorno']=$v['giorno'];
				}
				if($i==0)
				{
					$data['filmtoday'][$i]['active']='item active';
					$data['filmtoday'][$i]['visible']='inline';
				}
				else
				{
					$data['filmtoday'][$i]['active']='item';	
					$data['filmtoday'][$i]['visible']='none';
				} 
			}
		}
		if($data['filmafter']!= null)
		{
			for($i=0;$i<count($data['filmafter']);$i++)
			{
				$sc=$scheda->select($data['filmafter'][$i]['id']);
				$orariAfter= $film_orario->select($data['filmafter'][$i]['id']);
				$data['filmafter'][$i]['regia']=$sc[0]['regia']; 
				$data['filmafter'][$i]['attori']=$sc[0]['attori'];
				$data['filmafter'][$i]['durata']=$sc[0]['durata'];  
				$data['filmafter'][$i]['genere']=$sc[0]['genere']; 
				$data['filmafter'][$i]['pese']=$sc[0]['pese']; 
				$data['filmafter'][$i]['indice']=$i;
				$data['filmafter'][$i]['ora']=$orariAfter[$i]['ora'];
				$data['filmafter'][$i]['giornosettimana']=$orariAfter[$i]['giornosettimana'];
				$data['filmafter'][$i]['giorno']=$orariAfter[$i]['giorno'];
			}
		}
		try{
			if($data['filmtoday']== null)
			{
				$data['filmtoday']['immagine']= "image/SystemImage/closed.png";
				$data['filmtoday']['active']='item active';
				$data['filmtoday']['visible']='inline';
			}
			$table = (new HomeView(null,$data));
			$page = new Page("indexHome.ms");
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
		session_start();
		try{
			if(isset($_SESSION['user']))      // if there is no valid session
			{
				$feed = new FeedRssController();
				$data=$feed->FeedRss();
				$table = (new FeedRssView(null,$data));
				$page = new Page();
				$page->addView("content",$table);
				return $response->write($page->render());
			}
			else
			{
				header("Location: ../index.php/auth");
				exit();
			}
		}
		catch(Exception $e )
		{
			echo $e->getMessage();
		}	
		session_destroy();
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
		session_start();
		if(isset($_SESSION['user']))      // if there is no valid session
			{
		$film = new Film();
		$visualizzato['visualizzato']=true;
		$data['filmtoday']=$film->get_FilmTodayDataCourrent();
		$data['filmafter']=$film->get_FilmAfterDataCourrent();
		// $id_scheda['id_scheda']=$data['film'][0]['id_scheda'];
		$scheda=new Scheda();
		$film_orario= new Film_Orario();
		if($data['filmtoday']!= null)
		{
			for($i=0;$i < count($data['filmtoday']);$i++)
			{
				$id['id_film'] = $data['filmtoday'][$i]['id'];
				$sc=$scheda->select($id);
				$orariToday= $film_orario->select($id);
				$data['filmtoday'][$i]['regia']=$sc[0]['regia']; 
				$data['filmtoday'][$i]['attori']=$sc[0]['attori'];
				$data['filmtoday'][$i]['durata']=$sc[0]['durata'];  
				$data['filmtoday'][$i]['genere']=$sc[0]['genere']; 
				$data['filmtoday'][$i]['pese']=$sc[0]['pese']; 
				$data['filmtoday'][$i]['indice']=$i;
				foreach($orariToday as $k=>$v)
				{
					$data['filmtoday'][$i]['filmorario'][$k]['giornosettimana']=$v['giornosettimana'];
					$data['filmtoday'][$i]['filmorario'][$k]['giorno']=$v['giorno'];

					$mioOrario =$v['ora'];
					$trimmedMioOrario = trim($mioOrario);

					$orarioExplode = explode(" ", $mioOrario);
					var_dump($orarioExplode[0].'*'.$orarioExplode[1].'*'.$orarioExplode[2].$data['filmtoday'][$i]['filmorario'][$k]['id_orario']=$v['id_orario']);

					foreach($orarioExplode as $item )
					{
						$data['filmtoday'][$i]['filmorario']['orari'][$k]['ora']=$item;
					}
				}
				if($i==0)
				{
					$data['filmtoday'][$i]['active']='item active';
					$data['filmtoday'][$i]['visible']='inline';
				}
				else
				{
					$data['filmtoday'][$i]['active']='item';	
					$data['filmtoday'][$i]['visible']='none';
				}
			}
		}

		if($data['filmafter']!=null)
		{		
			for($i=0;$i < count($data['filmafter']);$i++)
			{
				$id['id_film'] = $data['filmafter'][$i]['id'];
				$sc=$scheda->select($id);
				$orariAfter= $film_orario->select($id);
				$data['filmafter'][$i]['regia']=$sc[0]['regia']; 
				$data['filmafter'][$i]['genere']=$sc[0]['genere']; 
				$data['filmafter'][$i]['attori']=$sc[0]['attori'];
				$data['filmafter'][$i]['durata']=$sc[0]['durata'];  
				$data['filmafter'][$i]['pese']=$sc[0]['pese']; 
				$data['filmafter'][$i]['indice']=$i;
				foreach($orariAfter as $k=>$v)
				{
					$data['filmafter'][$i]['filmorario'][$k]['ora']=$v['ora'];
					$data['filmafter'][$i]['filmorario'][$k]['giornosettimana']=$v['giornosettimana'];
					$data['filmafter'][$i]['filmorario'][$k]['giorno']=$v['giorno'];
				}
			}
		}
		try{
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
		else
			{
				header("Location: ../index.php/auth");
				exit();
			}
			session_destroy();
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
		$durata = $_POST["durata"];
		$descrizione =$_POST["descrizione"];
		$titolo =$_POST["titolo"];
		$data_inizio=$_POST["data_inizio"];
		$data_fine=$_POST["data_fine"];
		$orari=$_POST["orari"];
	
		$data=explode("/",$data_inizio);
		$dataf=explode("/",$data_fine);
	
		try
		{
			$data_i = new DateTime($data['2'].'-'.$data['1'].'-'.$data['0']);
			$data_f = new DateTime($dataf['2'].'-'.$dataf['1'].'-'.$dataf['0']);
			$datainizio = date_format($data_i, 'Y/m/d');
			$datafine = date_format($data_f, 'Y/m/d');
		}	
		catch(Exception $e)
		{
			echo $e->getMessage();
		}
		$seralizedOrari= json_decode($orari);
		$vowels = array(" ","'");
		$titolourl=  str_replace($vowels, '', $titolo);
		$img = "image/".$titolourl.".jpg";

		if($url!="null")
		{
			file_put_contents($img, file_get_contents($url));
		}
		$insert_scheda['attori']=$attori;
		$insert_scheda['regia']=$regia;
		$insert_film['visualizzato']=TRUE;
		$insert_film['immagine']=$img;
		$insert_film['titolo']= $titolo;
		$insert_film['descrizione']=$descrizione;
		$insert_scheda['durata']=$durata;
	
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
	
		$film = new Film();
		$scheda=new Scheda();	
		$film_orario= new Film_Orario();
	
		$film->insert($insert_film);
		
		$id=$film->get_last_id("id");
		
		$insert_scheda['id_film']=$id[0]['id'];
		
		try {
			$scheda->insert($insert_scheda);
			$orarioDbo["ora"]="";
			
			 if($seralizedOrari!= null)
			 {
			 	foreach($seralizedOrari as $value)
			 	{
					foreach($value->orari as $a)
					{
						$orarioDbo["ora"]=$orarioDbo["ora"] ." ".$a;
					}

					$orarioDbo["giorno"]=$value->year.'/'.$value->mounth.'/'.$value->day;
					$orarioDbo["giornosettimana"]=$value->giornoSettimana;
					$orarioDbo["id_film"]=$id[0]['id'];
					$film_orario->insert($orarioDbo);
					$orarioDbo["ora"]="";
			 	}
			}
			var_dump($orarioDbo);exit();
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
		// var_dump($_FILES);exit();
		// $info = pathinfo($_FILES['file']);
		//  $ext = $info['extension']; // get the extension of the file
		//  $newname = "perfil.".$ext; 

		// $target = 'image/'.$newname;

		var_dump($_FILES);
		
		var_dump($_POST);
		move_uploaded_file( $_FILES['file_data']['tmp_name'], 'image/'.$_POST['title'].'.jpg');


		// $targetPath = "image/".$_FILES['file']['name'];
		// //var_dump($targetPath);

		// try 
		// {	
		// 	move_uploaded_file($sourcePath,$targetPath) ;
		// }
		// catch(Exception $e)
		// {
		// 	echo $e->getMessage();
		// }	
	}

	function Cinelandia(Request $request, Response $response, $args)
	{
		try{
			$feed = new FeedRssController();
			$data=$feed->FeedRss();
			$table = (new CinelandiaView(null,$data));
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
	 * @link /deleteById
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function deleteById(Request $request, Response $response, $args)
	{
		try{
		$id['id'] =$_POST["id"];
		$film = new Film ();
		$film->delete($id);
		}
		catch(Exception $e )
		{
			echo $e->getMessage();
		}	
	}

	/**
	 * @desc This method provides the registration html page
	 * @link /dettaglio/{id:[\d]+}
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */

	function DettaglioFilm(Request $request, Response $response, $args)
	{
		try
		{
		$id['id_film'] = $_GET["id"];
		$id_film['id'] = $id['id_film'];
		$film = new Film();
		// $id_scheda['id_scheda']=$data['film'][0]['id_scheda'];
		$scheda=new Scheda();
		$film_orario= new Film_Orario(); 

		$data['filmdetails'] = $film->select($id_film);
		if($data['filmdetails']!= null)
		{
			for($i=0;$i<count($data['filmdetails']);$i++)
			{
				$sc=$scheda->select($id);
				$orariToday= $film_orario->select($id);
				
				
				$data['filmdetails'][$i]['regia']=$sc[0]['regia']; 
				$data['filmdetails'][$i]['attori']=$sc[0]['attori'];
				$data['filmdetails'][$i]['durata']=$sc[0]['durata'];  
				$data['filmdetails'][$i]['genere']=$sc[0]['genere']; 
				$data['filmdetails'][$i]['pese']=$sc[0]['pese']; 
				$data['filmdetails'][$i]['indice']=$i;
				$data['filmdetails'][$i]['close']=$i;
				
				foreach($orariToday as $k=>$v)
				{
					$data['filmdetails'][$i]['filmorario'][$k]['ora']=$v['ora'];
					$data['filmdetails'][$i]['filmorario'][$k]['giornosettimana']=$v['giornosettimana'];
					$data['filmdetails'][$i]['filmorario'][$k]['giorno']=$v['giorno'];
				}
				if($i==0)
				{
					$data['filmdetails'][$i]['active']='item active';
					$data['filmdetails'][$i]['visible']='inline';
				}
				else
				{
					$data['filmdetails'][$i]['active']='item';	
					$data['filmdetails'][$i]['visible']='none';
				} 
			}
		}
	}
	catch(Exception $e )
	{
		echo $e->getMessage();
	}	
		try{
			// var_dump($data);exit();
			$table = (new DettaglioView(null,$data));
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