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
	});
</script>
<div style="background-color: rgb(209, 209, 209); border-radius: 10px; box-shadow: 2px 2px 2px 2px grey; margin-top: 70px; margin-bottom: 50px;">
	<p id="filmprog">IN PROGRAMMAZIONE</p>
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
						<!-- <div class="col-xs-7 col-md-9 col-lg-12"> -->
						<!--  -->
						<!-- <p class="film-hours" > -->
						<!-- <br>|{{#ora}} {{ora}} {{/ora}}  -->
						<!-- </p> -->
						<!--  -->
						<!-- </div> -->
						{{/filmorario}}
						<!-- <p class="film-hours" style="margin-left:15px; margin-top:5px;">
						<br>
						<br>{{#durata}}
						<b>DURATA:</b> {{durata}} {{/durata}}
					</p> -->

						<a class="dettaglio" value="{{id}}" class="film-hours" style="margin-left:15px; margin-top:5px;">
							<span class="glyphicon glyphicon-menu-down"></span>

						</a>
						</form>
					</div>
					{{/filmtoday}}
				</div>
			</div>


		</div>
	</div>
	<div class="row">
		{{#filmafter}}
		<h1 id="prossimi">PROSSIMAMENTE</h1>
		<div class="row" id="easyPaginate">
			<div value="{{indice}}" id="film-futuri" class="column">
				<img src="http://localhost/cinema/{{immagine}}" id="film-after-img" value="{{indice}}">
			</div>
			{{/filmafter}}
		</div>
	</div>
	<div id="chisiamo" style="background-color: rgba(209, 209, 209); border-radius: 10px; box-shadow: 2px 2px 2px 2px grey; margin-top: 70px; margin-bottom: 50px; padding: 50px;">
		<h1>CHI SIAMO</h1>
		<div>
			<div class=" text-center " style="min-height: 100px;background-image: url(
		    'http://localhost/cinema/CinemaImages/chisiamobg.png'); padding: 10px 0px 10px; ">
				<!-- <img src="http://localhost/cinema/CinemaImages/chisiamo.png "> -->
			</div>

			<div id="myCarousel " class="carousel slide " data-ride="carousel ">
				<div class="carousel-inner cinema-slider ">
					<div class="item active " style="background-image: url( 'http://127.0.0.1/cinema/CinemaImages/slider/021.jpg'); background-repeat:no-repeat;
		    background-position:center; min-height: 600px; background-size: cover; width:100%; ">
					</div>

					<div class="item " style="background-image: url( 'http://127.0.0.1/cinema/CinemaImages/slider/022.jpg'); background-repeat:no-repeat;
		    background-position:center;background-size: cover; min-height: 600px; width:100%; ">
					</div>
				</div>
			</div>
			<div class="text-center " style="min-height: 100px;background-image: url(
		    'http://localhost/cinema/CinemaImages/chisiamobg.png'); padding: 10px 0px 10px; ">
				<!-- <img src="http://localhost/cinema/CinemaImages/chisiamo.png "> -->
			</div>
		</div>
		<div style=" margin: 50px 30px 50px 30px; clear: both; display: table; ">
			<div style="float: left; width: 15%; ">
				<img src="http://localhost/cinema/CinemaImages/movie-projector.png " style="float: right; max-width: 150px; ">
			</div>
			<div style="float: left; word-wrap: break-word; width: 80%; margin-left: -10px; margin-top: 30px; border: 5px solid
		    black; border-radius: 5px; padding: 10px; ">
				<h4>In sagittis leo non bow wow wow. That's the shizzle tellivizzle, arcu yippiyo away facilisizzle, sem nulla doggy tellivizzle,
					non auctor that's the shizzle felizzle nizzle est. Suspendisse volutpizzle scelerisque augue. Sed egestas crazy izzle
					shizzlin dizzle. Prizzle bling bling things sapizzle. Etizzle aliquizzle, dizzle check it out shizznit accumsan boofron,
					pimpin' sizzle ultricizzle mofo, ac vestibulizzle bling bling nisi mammasay mammasa mamma oo sa amet purus. Maecenas
					funky fresh shizzle my nizzle crocodizzle vel enim. Ma nizzle lobortis. Nulla lectizzle lacus, convallis for sure, aliquizzle
					sit amizzle, pulvinizzle crackalackin, ghetto. Vivamizzle convallizzle. Vestibulum gangster ipsizzle primis in ass rizzle
					luctizzle et gangsta posuere dawg Curae; Bow wow wow eu elizzle eu mammasay mammasa mamma oo sa bibendizzle doggy. Fusce
					est tortor, phat vizzle, semper , commodo ac, fo shizzle mah nizzle fo rizzle, mah home g-dizzle. Etizzle shizznit,
					tortor eget vehicula pot, crunk dang ultricizzle lorizzle, izzle izzle mi urna vitae erat.</h4>
			</div>
		</div>
	</div>
</div>