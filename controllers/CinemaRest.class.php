<?php
use Slim\Http\Request;
use Slim\Http\Response;

class CinemaRest
{
    /**
	 * @desc This method provides the registration html page
	 * @link /getorari
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function getOrari(Request $request, Response $response, $args)
	{
        try{
            $id['id_film']= $_POST["id"];
            $film_orario= new Film_Orario(); 
            $orariToday= $film_orario->select($id);
            echo json_encode(array("var"=>$orariToday));
        }

        catch(Exception $e)
        {
            echo $e->getMessage();
        }
    }

    /**
	 * @desc This method provides the registration html page
	 * @link /update
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
    function update(Request $request, Response $response, $args)
    {
        try {
            $film_data['id']= $_POST["id"];
            $film_data['data_inizio']= $_POST["data_inizio"];
            $film_data['data_fine']= $_POST["data_fine"];
            $film_data['descrizione']= $_POST["descrizione"];
            $scheda_data['id_film']=$_POST["id_film"];
            $scheda_data['attori']= $_POST["attori"];
            $scheda_data['regia']= $_POST["regia"];
            $scheda_data['duarta']= $_POST["durata"];
            $filmorari['id_film'] = $_POST["id"];
            $filmorari_data = $_POST["orari"];
            // $filmorari['id_orario'] = $_POST["id_orario"];


            $film_orario= new Film_Orario(); 
            $film = new Film();
            $scheda = new Scheda();
            $orariToday= $film_orario->delete($filmorari);
            if($filmorari_data!= null)
            {
                foreach($filmorari_data as $value)
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
            $schedaFilm = $scheda->update($scheda_data);
            $filmData = $film->update($film_data); 
        }

        catch(Exception $e)
        {
            echo $e->getMessage();
        }
    }

    /**
	 * @desc This method provides the registration html page
	 * @link /updateOrari
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
    function updateOrari(Request $request, Response $response, $args)
    {
        try {

        }

        catch(Exception $e)
        {
            echo $e->getMessage();
        }
    }
    /**
	 * @desc This method provides the registration html page
	 * @link /getFilm
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function getFilm(Request $request, Response $response, $args)
	{
        try{
            $id['id_film']= $_POST["id"];
            $idFilm['id']=$_POST["id"];
            $film_orario= new Film_Orario(); 
            $film = new Film();
            $scheda = new Scheda();
            $orariToday= $film_orario->select($id);
            $schedaFilm = $scheda->select($id);
            $filmData = $film->select($idFilm); 

            echo json_encode(array("orario"=>$orariToday,"films"=>$filmData,"scheda"=>$schedaFilm));
        }

        catch(Exception $e)
        {
            echo $e->getMessage();
        }
    }



}
