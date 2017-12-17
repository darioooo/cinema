

  <style type="text/css">
    img {
    	width: 30%;
      text-align: center;
      display: inline;
      padding-top: 10px;
      padding-bottom: 10px


    }
    #scrittadiv{
    	border-radius: 0px;
    	border-top: 0px;    	
    background-color: #392413;
    margin-top: -20px;
    }
    #scritta{
    	width: 60%;
    	border-top: 0px;
    	
    }

    img:hover{
  -webkit-transform:rotate(0deg) ;
}


    h1{
    	 font: italic bold 60px Georgia, serif;
    	 text-shadow: 5px 5px 10px gray;
    } 
    
  </style>
  <script type="text/javascript">
	$(document).ready(function() {
		$('#lib').fadeOut(0);
		$('#lib').fadeIn(3000);
		$('#dante').fadeOut(0);
		$('#librone').fadeOut(0);
		$('#dante').fadeIn(5000);
		$('#librone').fadeIn(5000);

	});

</script>


<div >
	<center>
	<div id='scrittadiv'>
	<img src="http://127.0.0.1/slim/image/scritta.png" id='scritta' >
	</div>
	<div  id="lib">
	<a href="http://127.0.0.1/slim/libri"><img  src="http://127.0.0.1/slim/image/omino.png" ></a>
	</div>


	<!--<a href="http://127.0.0.1/slim/autori"><img src="http://127.0.0.1/slim/image/autori.png" id="dante"></a>-->
	</center>
</div>


