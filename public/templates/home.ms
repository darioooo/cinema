<div class="container-fluid">
	<div id="myCarousel" class="carousel slide" data-slide="carousel">
		<ol class="carousel-indicators">
{{#film}}
			<li data-target="#myCarousel" data-slide-to="{{indice}}"></li>
		{{/film}}
		</ol>
		<div class="carousel-inner">
			{{#film}}

			<div class="{{active}}">
				<img src="http://localhost/cinema/{{immagine}}" alt="Los Angeles">
			</div>

			{{/film}}
		</div>
	</div>
</div>