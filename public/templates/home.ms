<script>
	$(document).ready(function () {
		$('#easyPaginate').easyPaginate({
			paginateElement: 'img',
			elementsPerPage: 5,
			effect: 'fade'
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
			{{#filmtoday}}
			<div class="col-xs-10 col-md-12 col-lg-12 jumbotron contentjumbo film-details" id="{{indice}}" style="display: {{visible}}"
			    id="pinzagay">
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
		</div>
	</div>
	{{/filmtoday}}
</div>
<div class="row">
	<h1 id="prossimi">Prossimi film</h1>
	<div class="row" id="easyPaginate">
		{{#filmafter}}
		<div value="{{indice}}" id="film-futuri" class="column">
			<img src="http://localhost/cinema/{{immagine}}" id="film-after-img" value="{{indice}}">
		</div>
		{{/filmafter}}
	</div>
</div>
