<script>
	$(document).ready(function () {
		$('#easyPaginate').easyPaginate({
			paginateElement: 'img',
			elementsPerPage: 5,
			effect: 'fade'
		});

		$("#myCarousel").on('slid.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#' + valore).fadeIn();
			$('#' + valore).css("display", "inherit");
		});

		$("#myCarousel").on('slide.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#' + valore).fadeOut();
			$('#' + valore).css("display", "none");
		});

		$(".dettaglio").click(function () {
			window.location = 'dettaglio?id=' + $(this).attr("value");
		});

		if ($('#easyPaginate').children().length == 0) {
			$('#easyPaginate').parent().empty();
		}

		if ($("#film-futuri") != null) {
			$("#prossimi-film").hide();
			$("#prossimi-film-link").hide();
		}
	});
</script>
<div>
	<div id="in-programmazione">
		<div id="prossimi-film-titolo">
			<h1>IN PROGRAMMAZIONE</h1>
		</div>
		<div class="row jumbotron filmjumbo" id="in-programmazione-jumbotron">
			<div class="col-xs-0 col-md-2 col-lg-2">
			</div>
			<div class="row jumbotron filmjumbo ">
				<div class="col-xs-0 col-md-2 col-lg-1">
				</div>
				<div class="col-xs-12 col-md-4 col-lg-3">
					<div class="col-xs-12 col-md-12 col-lg-12 jumbotron contentjumbo" style="border: 8px dotted yellow;">
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								{{#filmtoday}}
								<li data-target="#myCarousel" data-slide-to="{{indice}}"></li>
								{{/filmtoday}}
							</ol>
							<div class="carousel-inner">
								{{#filmtoday}}
								<div class="{{active}}" value="{{indice}}" id="imageFilmDiv">
									<img src="http://localhost/cinema/{{immagine}}" class="imgfilm" value="{{indice}}">
								</div>
								{{/filmtoday}}
								<a class="left carousel-control" href="#myCarousel" data-slide="prev">
								</a>
								<a class="right carousel-control" href="#myCarousel" data-slide="next">
								</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-xs-12 col-md-4 col-lg-5">
					<div class="col-xs-10 col-md-12 col-lg-12 jumbotron contentjumbo film-details">
						{{#filmtoday}}
						<div id="{{indice}}" style="display: {{visible}}">
							<p class="film-title" align="center">
								{{titolo}}
							</p>
							<br>
							<br> {{#filmorario}}
							<div class="col-xs-3 col-md-3 col-lg-3">
								<p class="film-days">
									{{#giornosettimana}}{{giornosettimana}}{{/giornosettimana}}
								</p>
							</div>
							<div class="col-xs-3 col-md-3 col-lg-3">
								<p>{{#giorno}}{{giorno}}{{/giorno}}</p>
							</div>
							<div class="col-xs-6 col-md-6 col-lg-6">
								<p>{{#ora}}{{ora}}{{/ora}}</p>
							</div>
							{{/filmorario}}

							<a class="dettaglio film-hours" value="{{id}}">
								<span class="glyphicon glyphicon-chevron-right"></span>
								<span class="tooltip-text">Dettaglio</span>
							</a>
							</form>
						</div>
						{{/filmtoday}}
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="prossimi-film">
		<div class="row" id="easyPaginate">
			<div id="prossimi-film-titolo">
				<h1>PROSSIMAMENTE</h1>
			</div> {{#filmafter}}
			<div value="{{indice}}" id="film-futuri" class="column">
				<img src="http://localhost/cinema/{{immagine}}" id="film-after-img" value="{{indice}}">
			</div>
			{{/filmafter}}
		</div>
	</div>
	<div id="chi-siamo">
		<div id="prossimi-film-titolo">
			<h1>CHI SIAMO</h1>
		</div>
		<div>
			<div class=" text-center " style="min-height: 100px;background-image: url(
		    'http://localhost/cinema/CinemaImages/chisiamobg.png'); padding: 10px 0px 10px; ">
			</div>
			<div id="myCarousel " class="carousel slide " data-ride="carousel" data-interval="5000">
				<div class="carousel-inner cinema-slider ">
					<div class="item active " style="background-image: url( '../CinemaImages/SliderCinema/1.jpg'); background-repeat:no-repeat;
		    background-position:center; min-height: 600px; background-size: cover; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/2.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/3.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/4.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/5.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/6.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/7.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/8.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/9.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
					<div class="item " style="background-image: url( '../CinemaImages/SliderCinema/10.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
				</div>
			</div>
			<div class="text-center " style="min-height: 100px;background-image: url(
		    'http://localhost/cinema/CinemaImages/chisiamobg.png'); padding: 10px 0px 10px; ">
			</div>
		</div>
	</div>

	<div id="storia">
		<div id="prossimi-film-titolo">
			<h1>STORIA</h1>
		</div>
		<div id="storia-contenuto">
			<div id="storia-icona">
				<img src="http://localhost/cinema/CinemaImages/movie-projector.png " style="float: right; max-width: 150px; ">
			</div>
			<div id="storia-testo">
				<h3>Il Cinema Accademia è un teatro situato a Pontassieve.

					Già dal 1870 si erano avviate le pratiche relative alla costruzione del teatro, ma solo vent'anni dopo fu
					realizzato con la denominazione di Teatro dell'Accademia Vincenzo da Filicaia. Nel 1929 il locale venne dato in
					gestione al Partito Nazionale Fascista e venne ben presto adibito anche a cinematografo.

					In questa redazione, giunta fino agli anni cinquanta, il teatro presentava una sala presumibilmente ovata, 14
					palchi e un loggione, capaci di ospitare 700 spettatori. Nel 1990 è stato restaurato sia nell'impiantistica che
					nelle decorazioni. Nella nuova redazione ha accentuato il suo ruolo di sala cinematografica, con posti a sedere
					solo in platea, mentre la galleria è stata adattata a cabina di proiezione e di regia.</h3>
			</div>
		</div>
	</div>
</div>