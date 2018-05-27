<?php
$this->get("/",function($request,$response,$args)
{
	return $response->write("sjbdsfbsdbfsdbzkd");
});

$this->get("/user/{titolo}",function($request,$response,$args)
{
	return $response->write("Hello World ".$args['titolo']);
});



$this->map(['GET'],"/home","CinemaController:home");

$this->map(['GET'],"/modifica","CinemaController:modifica_admin");

$this->map(['GET'],"/admin","CinemaController:admin");

$this->map(['GET'],"/cinelandia","CinemaController:Cinelandia");




$this->map(['POST'],"/action_admin","CinemaController:save_film");


$this->map(['POST'],"/action_image","CinemaController:save_new_image");


$this->map(['POST'],"/delete","CinemaController:deleteById");

$this->map(['GET'],"/dettaglio","CinemaController:DettaglioFilm");

$this->map(['GET'],"/auth","CinemaAuth:autentication");

$this->map(['GET'],"/recupero","CinemaAuth:recuperoCredenziali");

$this->map(['POST'],"/autenticazione","CinemaAuth:verifica");

$this->map(['POST'],"/mail","CinemaAuth:mail");

