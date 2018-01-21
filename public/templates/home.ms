<script type="text/javascript">

	$(document).ready(function () {
		$("#myCarousel").on('slid.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#' + valore).css("visibility", "visible");
		});

		$("#myCarousel").on('slide.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#' + valore).css("visibility", "hidden");
		});



	});

</script>
<div class="jumbotron contentjumbo jumbo  clearfix visible-md-block  clearfix visible-lg-block" id="titlejumbo"><p id="filmprog">FILM IN PROGRMMAZIONE</p></div>
<div class="row jumbotron filmjumbo ">
	<div class="col-xs-0 col-md-2 col-lg-2">
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

					<div class="{{active}}" value="{{indice}}">
						<img src="http://localhost/cinema/{{immagine}}" class="imgfilm" value="{{indice}}" >
					</div>

					{{/film}}

					<!-- Left and right controls -->
					<a class="left carousel-control" href="#myCarousel" data-slide="prev">
						<span>X</span>
						<span class="sr-only">Previous</span>
					</a>
					<a class="right carousel-control" href="#myCarousel" data-slide="next">
						<span>X</span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</div>

	</div>
	<div class="col-xs-12 col-md-4 col-lg-5">
			{{#film}}
		<div class="col-xs-12 col-md-12 col-lg-12 jumbotron contentjumbo" id="{{indice}}" style="visibility: {{visible}}">
					<p >{{titolo}}</p>	
		</div>
		{{/film}}
	</div>
</div>

</div>

