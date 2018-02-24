<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="http://127.0.0.1/cinema/css/bootstrap3.3.5/bootstrap.min.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/css/bootstrap-datepicker.min.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/css/stile.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/fileinput/css/fileinput.min.css">

  <script src="http://127.0.0.1/cinema/js/jquery-2.2.2.js"></script>
  <script src="http://127.0.0.1/cinema/js/bootstrap3.3.5/bootstrap.min.js"></script>
  <script src="http://127.0.0.1/cinema/js/bootstrap-datepicker.min.js"></script>
  <script src="http://127.0.0.1/cinema/js/bootstrap-datepicker.it.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/plugins/piexif.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/plugins/sortable.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/plugins/purify.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/fileinput.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/themes/fa/theme.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/locales/it.js"></script>
  <script src="http://127.0.0.1/cinema/easyPaginateJQuery/lib/jquery.easyPaginate.js"></script>

  <title>Cinema Accademia</title>
</head>

<body>
  <div id="tot">
    <nav class="navbar navbar-inverse navbar-fixed-top barranav">
      <div class="container-fluid">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar3">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">
            <img id="logo" src="../CinemaImages/CINEMA.png" alt="CinemaAccademia">
          </a>
        </div>
        <div class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li>
              <a href="#" class="links">CineLandia</a>
            </li>
            <li>
              <a href="#" class="links">Contatti</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <div class="container-fluid" id="maincontainer">
      {{{content}}}
    </div>

    <footer class="footer">
      <h5>Via Montanelli 33, 50065 Pontassieve FI - Tel. 0558368252</h5>
    </footer>
  </div>
</body>
</html>