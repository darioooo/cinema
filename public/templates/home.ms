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