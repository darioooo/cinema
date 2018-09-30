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
