<script>
	$(document).ready(function () {
		$(".dettaglio").click(function () {
			window.location = 'dettaglio?id=' + $(this).attr("value");
		});

		$("#return").click(function () {
			window.location = "../";
		});
	});
</script>

<div class="detail-div" style="background-color: rgb(209, 209, 209); border-radius: 10px; box-shadow: 2px 2px 2px 2px grey; margin-top: 70px; margin-bottom: 50px;">
	<div class="row filmjumbo container-fluid" style="padding-top: 70px; padding-bottom: 50px;">
		{{#filmdetails}}
		<div class=" col-xs-12 col-md-4 col-lg-4 detail-image" style="margin-bottom: 10px;">
			<div class=" col-xs-12 col-md-12 col-lg-12 jumbotron contentjumbo " style="border: 8px yellow dotted">
				<div id="imageFilmDiv ">
					<img src="../{{immagine}} " class="imgfilm-dettaglio">
				</div>
			</div>
		</div>

		<div class="col-xs-12 col-md-8 col-lg-8">
			<div class="col-xs-1 col-md-0 col-lg-0"></div>
			<div class="col-xs-10 col-md-12 col-lg-12" id="jumbotron-details-content" style="background-color: rgb(209, 209, 209);
			border-radius: 10px;
			border: 2px solid darkgrey;
			padding: 15px;">
				<div class="row" style="background-color: rgba(128, 0, 0, 0.9);
				border-radius: 10px;
				text-align: center;
				height: 70px;
				margin-bottom: 50px;
				width: fit-content;
				margin: 0px auto;
				margin-bottom: 20px;
				padding: 10px 10px;
				font-size: 30px;
				color: rgb(209, 209, 209);">
					<p>{{titolo}}</p>
				</div>
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3 ">
						<b>
							<p style="float:right;">Data inizio</p>
						</b>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<p>{{data_inizio}}</p>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-3 col-md-3 col-lg-3 ">
						<b>
							<p style="float:right;">Data fine</p>
						</b>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<p>{{data_fine}}</p>
					</div>
				</div>

				<div class="row ">
					<div class="col-xs-3 col-md-3 col-lg-3 ">
						<b>
							<p style="float:right;">Orari</p>
						</b>
					</div>
					{{#filmorario}}
					<div class="col-xs-3 col-md-3 col-lg-3 ">
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<div class="col-xs-4 col-md-3 col-lg-3">
							<b style="color: rgb(128, 0, 0);">
								<p>{{giornosettimana}}</p>
							</b>
						</div>
						<div class="col-xs-4 col-md-3 col-lg-3">
							<p>{{giorno}}</p>
						</div>
						<div class="col-xs-4 col-md-3 col-lg-3">
							<p>{{ora}}</p>
						</div>
						<!-- <p>{{giornosettimana}} - {{giorno}} - {{ora}}</p> -->
					</div>
					{{/filmorario}}
				</div>

				<div class="row " style="word-wrap: break-word;">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<b>
							<p style="float:right;">Descrizione</p>
						</b>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<p>{{descrizione}}</p>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-3 col-md-3 col-lg-3 ">
						<b>
							<p style="float:right;">Attori</p>
						</b>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<p>{{attori}}</p>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-3 col-md-3 col-lg-3 ">
						<b>
							<p style="float:right;">Regia</p>
						</b>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<p>{{regia}}</p>
					</div>
				</div>
				<div class="row ">
					<div class="col-xs-3 col-md-3 col-lg-3 ">
						<b>
							<p style="float:right;">Durata</p>
						</b>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9 ">
						<p>{{durata}} min</p>
					</div>
				</div>
			</div>
			<div class="col-xs-1 col-md-0 col-lg-0"></div>
		</div>
		{{/filmdetails}}
		<button id="return" class="btn btn-default"><span class="glyphicon glyphicon-arrow-left"></span></button>
	</div>
</div>