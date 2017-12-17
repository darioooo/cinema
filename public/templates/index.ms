 <!DOCTYPE html>
 <html>
 <head>

 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="http://127.0.0.1/slim/css/bootstrap3.3.5/bootstrap.min.css">


<!-- jQuery library -->


<!-- jQuery library -->
<script src="http://127.0.0.1/slim/js/jquery-1.11.0.min.js"></script>

<script src="http://127.0.0.1/slim/jquery-ui/jquery-ui.min.js"></script>

<script src="http://127.0.0.1/slim/jquery-ui/jquery-ui.min.css"></script>

<!-- Latest compiled JavaScript -->
<script src="http://127.0.0.1/slim/js/bootstrap3.3.5/bootstrap.min.js"></script>

<link href="http://127.0.0.1/slim/jtable/themes/metro/blue/jtable.min.css" rel="stylesheet" type="text/css" />

<!-- Include jTable script file. -->
<script type="text/javascript" src="http://127.0.0.1/slim/jtable/jquery.jtable.js" ></script>

<script type="text/javascript" src="http://127.0.0.1/slim/validation/dist/jquery.validate.js"></script>



<style type="text/css">
  
  body{
    background-image: url('http://127.0.0.1/slim/image/sfondo.jpg');
  }

.navbar-brand {
  padding: 0px;
}
.navbar-brand>img {
  height: 100%;
  padding: 3px;
  padding-left: 20px;
  width: auto;
}
#imgadd {
  
  width: 35px;
  height: 10%;
 
  padding-top:5px;

}
#add {
  height: 100%;
  padding: 3px;
  padding-top: 0%;
  padding-bottom: 0%;
  padding-right:20px;
  width: auto;
}

    img:hover{
  -webkit-transform:rotate(-20deg) scale(1.2,1.2);
}

</style>




 	<title>Libreria</title>
 </head>
 <body>

 <nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="http://127.0.0.1/slim/index"><img src="http://127.0.0.1/slim/image/logo w.png" class="navbar-brand "></a>

    </div>
    <ul class="nav navbar-nav ">
         <li><a href="http://127.0.0.1/slim/autori">Autori</a></li>
          <li><a href="http://127.0.0.1/slim/libri">Libri</a></li>

    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a  class="navbar-nav " href="http://127.0.0.1/slim/add" id="add"><img src="http://127.0.0.1/slim/image/add.png" id='imgadd'></a></li>
    </ul>
  
  </div>

</nav>

{{{content}}}

 </body>
 </html>
 