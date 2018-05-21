<!DOCTYPE html>
<html>

<head>
  <link rel="stylesheet" href="http://127.0.0.1/cinema/css/bootstrap-3.3.5/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/css/bootstrap-datepicker.min.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/css/stile.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/fileinput/css/fileinput.min.css">
  <link rel="stylesheet" href="http://127.0.0.1/cinema/lib/clockpicker-gh-pages/src/clockpicker.css">

  <script src="http://127.0.0.1/cinema/js/jquery-2.2.2.js"></script>
  <script src="http://127.0.0.1/cinema/css/bootstrap-3.3.5/dist/js/bootstrap.min.js"></script>
  <script src="http://127.0.0.1/cinema/js/bootstrap-datepicker.min.js"></script>
  <script src="http://127.0.0.1/cinema/js/bootstrap-datepicker.it.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/plugins/piexif.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/plugins/sortable.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/plugins/purify.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/fileinput.min.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/themes/fa/theme.js"></script>
  <script src="http://127.0.0.1/cinema/fileinput/js/locales/it.js"></script>
  <script src="http://127.0.0.1/cinema/easyPaginateJQuery/lib/jquery.easyPaginate.js"></script>
  <script src="http://127.0.0.1/cinema/lib/clockpicker-gh-pages/src/clockpicker.js"></script>

  <title>Cinema Accademia</title>
</head>

<body>
  <div id="tot">
    <div class="container-fluid initial-div">
      <div id=" logoCenter " class=" text-center">
        <img src="../CinemaImages/CINEMA.png " id="initial-img">
      </div>
      <a href="#maincontainer">
        <span class="glyphicon glyphicon-download" id="arrow-down-to-div">
        </span>
      </a>
    </div>
    <nav class="navbar" style="background-color: rgba(128, 0, 0, 0.95);">
      <div class="container-fluid ">
        <div class="navbar-header ">
          <button type="button " class="navbar-toggle collapsed " data-toggle="collapse " data-target="#navbar3 ">
            <span class="sr-only ">Toggle navigation</span>
            <span class="icon-bar "></span>
            <span class="icon-bar "></span>
            <span class="icon-bar "></span>
          </button>
          <a class="navbar-brand " href="# ">
            <img id="logo " src="../CinemaImages/CINEMA.png " alt="CinemaAccademia ">
          </a>
        </div>
        <div class="collapse navbar-collapse ">
          <ul class="nav navbar-nav nav-links" style="display: inline-block;">
            <li>
              <a href="# " class="links ">CineLandia</a>
            </li>
            <li>
              <a href="# " class="links ">Contatti</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="container-fluid" id="maincontainer">
      {{{content}}}
    </div>
    <footer class="footer ">
      <h5>Via Montanelli 33, 50065 Pontassieve FI - Tel. 0558368252</h5>
    </footer>
  </div>
  <script>
    $(document).ready(function () {
      $(window).scroll(function () {
        var nav = $('.navbar');
        var top = $(window).height();
        if ($(window).scrollTop() >= top) {
          nav.addClass('navbar-fixed-top');
        } else {
          nav.removeClass('navbar-fixed-top');
        }
      });
      document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
          e.preventDefault();

          document.querySelector(this.getAttribute('href')).scrollIntoView({
            behavior: 'smooth'
          });
        });
      });
    })
  </script>
</body>

</html>