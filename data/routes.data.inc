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
$this->map(['GET'],"/libri/{id:[\d]+}","LibreriaController:get");