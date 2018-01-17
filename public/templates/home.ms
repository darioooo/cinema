<script type="text/javascript">

	$(document).ready(function () {
		$("#myCarousel").on('slid.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#'+valore).css("visibility", "visible");
		});

		$("#myCarousel").on('slide.bs.carousel', function () {
			var valore = $($('#myCarousel .item.active').html()).attr('value');
			$('#'+valore).css("visibility", "hidden");
		});
	});

</script>

<div class="row jumbotron filmjumbo">
		<div class="col-xs-0 col-md-2 col-lg-2">
		</div>
		<div class="col-xs-12 col-md-4 col-lg-4">
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
									<img src="http://localhost/cinema/{{immagine}}" class="imgfilm" value="{{indice}}" style="width:100%;" >
								</div>
					
								{{/film}}
					
								 <!-- Left and right controls -->
								 <a class="left carousel-control" href="#myCarousel" data-slide="prev">
										<span class="glyphicon glyphicon-chevron-left"></span>
										<span class="sr-only">Previous</span>
									  </a>
									  <a class="right carousel-control" href="#myCarousel" data-slide="next">
										<span class="glyphicon glyphicon-chevron-right"></span>
										<span class="sr-only">Next</span>
									  </a>
							</div>
						</div>
			</div>
			
		</div>
		<div class="col-xs-12 col-md-4 col-lg-4">
				<div class="col-xs-12 col-md-12 col-lg-12 jumbotron contentjumbo">
					{{#film}}
					<p id="{{indice}}" style="visibility: {{visible}}">{{titolo}}</p>
					{{/film}}
				</div>
		</div>
		</div>
	
	</div>

