<script>
</script>
<div class="row ">
	<div class="col-xs-0 col-md-2 col-lg-2">
	</div>
	<div class="row  ">
		<div class="col-xs-0 col-md-2 col-lg-1">
		</div>
		<div class="col-xs-12 col-md-4 col-lg-3">
			<div class="col-xs-12 col-md-12 col-lg-12 ">
				<div class="btn-group" role="group">
					<!-- <p>oggi</p> -->
					{{#filmtoday}}
					<button class="btn btn-danger filmdropdown" type="button" data-toggle="collapse" data-target="#{{id}}">
						<img src="http://localhost/cinema/{{immagine}}" value="{{indice}}">
					</button>
					<div id="{{id}}" class="collapse">

						<button type="button" class="btn btn-warning">Warning</button>
						<button type="button" class="btn btn-danger">Danger</button>
					</div>
					{{/filmtoday}}
				</div>
				<div class="btn-group" role="group">
					<!-- <p>prossimamente</p> -->
					{{#filmafter}}
					<button class="btn btn-danger filmdropdown" type="button" data-toggle="collapse" data-target="#{{id}}">
						<img src="http://localhost/cinema/{{immagine}}" class="img-rounded" value="{{indice}}">
					</button>

					<div id="{{id}}" class="collapse">
						<button type="button" class="btn btn-secondary"></button>
					</div>
					{{/filmafter}}
				</div>
			</div>
		</div>
		<div class="col-xs-12 col-md-4 col-lg-5">
		</div>
	</div>
</div>