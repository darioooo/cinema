<?php
use Slim\Http\Request;
use Slim\Http\Response;

class FeedRssController
{
	
	function FeedRss()
	{
		 $xml=("http://www.filmscoop.it/feed/alcinema.asp");

		 $xmlDoc = new DOMDocument();
			$xmlDoc->load($xml);


		 $x=$xmlDoc->getElementsByTagName('item');

		 for ($a=0; $a < 35; $a++) { 
		 
		$titolo =$x->item($a)->getElementsByTagName('title')->item(0)->childNodes->item(0)->nodeValue;
		$image = $x->item($a)->getElementsByTagName('description')->item(0)->childNodes->item(0)->nodeValue;
		$regex = '/\b(https?|ftp|file):\/\/[-A-Z0-9+&@#\/%?=~_|$!:,.;]*[A-Z0-9+&@#\/%=~_|$]/i';
		preg_match_all($regex, $image, $matches);
		
		for ($i=0; $i <2 ; $i++) { 

	
		$path=parse_url($matches[0][$i], PHP_URL_PATH);
		if (strpos($path, '.jpg')!= false) {
			$data['film'][$a] = array('url' =>$matches[0][$i] ,'titolo'=>$titolo ,'id'=>$a);
		
			
		
			//$data['film']['titolo'][$a]=$titolo;

			//$data['imageurl']=$matches[0][$i];
			//$data['titolo']=$titolo;
		//  echo "<img src='".$matches[0][$i]."'></img>";
		}


		

		}
		  
		}

		return $data; 

	}

	

	
	

}