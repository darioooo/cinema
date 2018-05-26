<script>
	$(document).ready(function () {

		$(".dettaglio").click(function () {

			window.location = 'dettaglio?id=' + $(this).attr("value");
		});
	});
</script>


<div class="row filmjumbo container-fluid" style="padding-top: 70px;">
	{{#allfilms}}
	<div class=" col-xs-12 col-md-4 col-lg-3 ">
		<div class="col-xs-12 col-md-12 col-lg-12 jumbotron contentjumbo ">
			<div class="carousel-inner ">
				<div id="imageFilmDiv ">
					<img src="http://localhost/cinema/{{immagine}}" style="min-width:100%; " class="imgfilm ">
				</div>
			</div>
		</div>
	</div>

	<div class="col-xs-12 col-md-4 col-lg-5 " style="word-wrap:break-word; ">
		<div class="col-xs-10 col-md-12 col-lg-12 ">
			<p class=" " align="center ">
				{{titolo}}
			</p>
		</div>
	</div>
	{{/allfilms}}
</div>