<?php
use Slim\Http\Request;
use Slim\Http\Response;

class CinemaAuth
{

    /**
	 * @desc This method provides the registration html page
	 * @link /auth
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function autentication(Request $request, Response $response, $args)
	{

        			
	
		try{

			
			$table =(new AuthView(null,null));
			return $response->write($table->render());
			
		}
		catch(Exception $e )
		{
			echo $e->getMessage();
		}	
	}


	 /**
	 * @desc This method provides the registration html page
	 * @link /auth
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function recuperoCredenziali(Request $request, Response $response, $args)
	{

        			
	
		try{
	
			
			$table =(new RecuperoView(null,null));
			return $response->write($table->render());
			
		}
		catch(Exception $e )
		{
			echo $e->getMessage();
		}	
	}


	 /**
	 * @desc This method provides the registration html page
	 * @link /mail
	 * @method GET
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */

	function mail(Request $request, Response $response, $args)
	{

		try{
			
		$data['mail']=$_POST['mail'];
		$user = new User();
		$check=$user->select($data);
		

		 if(!empty($check))
		 {
			$password= generatePassword(5);
			$user= $check[0]['name'];
			$message = '
		<html>
			<head>
				<title>Benvenuto</title>
			</head>
			<body>
				<h1>Ciao : '.$user.'</h1>
				<p>USERNAME:'.$user.'</p>
				</br>
				<p>PASSWORD:'.$password.'</p>
			</body>
		</html>
	';

	
				$ret['status'] = 'success';
				$ret['message'] = 'This was successful';
			$ret['mail'] = mail($data['mail'], Password, $message	);
		  }
		  else
		  {
			
			$ret['status'] = 'error';
			$ret['message'] = 'This failed';
			
		 }
		
		// echo json_encode($response);
		// echo $crpUser;
		 return json_encode($ret);
		}
		catch(Exception $e )
		{
			echo $e->getMessage();
		}	
	}
        
        
    

    
    /**
	 * @desc This method provides the registration html page
	 * @link /autenticazione
	 * @method POST
	 * @param Request $request
	 * @param Response $response
	 * @param array $args
	 * @return \Slim\Http\Response
	 */
	function verifica(Request $request, Response $response, $args)
	{

		
			try{
        session_start();	
		$user = $_POST["username"];
		$pass = $_POST["password"];
		
	
        			
		$crpUser = $user;
		$crpPass = md5($pass);
		$data['name']= $crpUser;
		$data['password']=$crpPass;
		$user = new User();
		$check=$user->select($data);

		if(!empty($check))
		{
			
			$_SESSION['user']=$user;
			$ret['status'] = 'success';
			$ret['message'] = 'This was successful';
			
			

		}
		else
		{
			session_unset();
			$ret['status'] = 'error';
			$ret['message'] = 'This failed';
			
		}
		
		// echo json_encode($response);
		// echo $crpUser;
		 return json_encode($ret);
		 session_destroy();
		
		
		}
		catch(Exception $e )
		{
			echo $e->getMessage();
		}	
	}


	
function generatePassword ( $length = 8 )
{

  $password = '';

  $possibleChars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_?*+&%!#@><°-:,/'; 
    
  $i = 0; 
    
  while ($i < $length) { 

    $char = substr($possibleChars, mt_rand(0, strlen($possibleChars)-1), 1);
        
    if (!strstr($password, $char)) { 
      $password .= $char;
      $i++;
    }

  }

  return $password;

}
        
    


}
