<script type="text/javascript">
	$(document).ready(function () {
		$("#myCarousel").on('slid.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#' + valore).fadeIn();
			$('#' + valore).css("visibility", "visible");
		});

		$("#myCarousel").on('slide.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#' + valore).fadeOut();
			$('#' + valore).css("visibility", "hidden");
		});
	});
</script>

<p id="filmprog">FILM IN PROGRAMMAZIONE</p>
<div class="row jumbotron filmjumbo">
	<div class="col-xs-0 col-md-2 col-lg-2">
	</div>
	<div class="row jumbotron filmjumbo ">
		<div class="col-xs-0 col-md-2 col-lg-1">
		</div>
		<div class="col-xs-12 col-md-4 col-lg-3">
			<div class="col-xs-12 col-md-12 col-lg-12 jumbotron contentjumbo">
				<div id="myCarousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						{{#film}}
						<li data-target="#myCarousel" data-slide-to="{{indice}}"></li>
						{{/film}}
					</ol>
					<div class="carousel-inner">
						{{#film}}

						<div class="{{active}}" value="{{indice}}" id="imageFilmDiv">
							<img src="http://localhost/cinema/{{immagine}}" class="imgfilm" value="{{indice}}">
						</div>

						{{/film}}

						<!-- Left and right controls -->
						<a class="left carousel-control" href="#myCarousel" data-slide="prev">
							<span>
								<img class="carouselChevrons left" src="http://localhost/cinema/CinemaImages/leftChevron.png" />
							</span>
							<span class="sr-only">Previous</span>
						</a>
						<a class="right carousel-control" href="#myCarousel" data-slide="next">
							<span>
								<img class="carouselChevrons right" src="http://localhost/cinema/CinemaImages/rightChevron.png" />
							</span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-4 col-lg-5">
			{{#film}}
			<div class="col-xs-10 col-md-12 col-lg-12 jumbotron contentjumbo film-details" id="{{indice}}" style="visibility: {{visible}}">
				<p class="film-title" align="center">
					{{titolo}}
				</p>
				<div class="col-xs-5 col-md-3 col-lg-3">
					<p id="scheda_film" class="film-days">
						<br>
						<b>Lunedì</b>
						<br>
						<b>Martedì</b>
						<br>
						<b>Mercoledì</b>
						<br>
						<b>Venerdì</b>
						<br>
						<b>Sabato</b>
						<br>
						<b>Domenica</b>
					</p>
				</div>
				<div class="col-xs-7 col-md-9 col-lg-9">
					<p class="film-hours">{{#lunedi}}
						<br> | {{lunedi}} {{/lunedi}} {{#martedi}}
						<br> | {{martedi}} {{/martedi}} {{#mercoledi}}
						<br> | {{mercoledi}} {{/mercoledi}} {{#venerdi}}
						<br> | {{venerdi}} {{/venerdi}} {{#sabato}}
						<br> | {{sabato}} {{/sabato}} {{#domenica}}
						<br> | {{domenica}} {{/domenica}}
					</p>
				</div>
			</div>
			{{/film}}
		</div>
	</div>
</div>