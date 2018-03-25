<script>
	$(document).ready(function () {
		$('.bottone-visualizza').click(function () {
			var indice = $(this).val();
			$("#myModal" + indice).modal();
		});

		$('.bottone-elimina').click(function () {
			$(this).parent().parent().remove();

		});

	});
</script>

<div class="col-xs-0 col-md-1 col-lg-1">
</div>
<div class="col-xs-12 col-md-10 col-lg-10">


	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-4" style="word-wrap:break-word;">
			<p>TITOLO</p>
		</div>
		<div class="col-md-2">
			<p>DATA INIZIO</p>
		</div>
		<div class="col-md-2">
			<p>DATA FINE</p>
		</div>
		<div class="col-md-1">
			<p>Visualizza</p>
		</div>
		<div class="col-md-1">
			<p>Modifica</p>
		</div>
		<div class="col-md-1">
			<p>Elimina</p>
		</div>
	</div>
	{{#filmtoday}}
	<div class="row" style="border-bottom: 1px solid maroon; padding-bottom: 10px; margin-top: 10px;">
		<div class="col-md-1">
			<img src="http://localhost/cinema/{{immagine}}" value="{{indice}}" style="width:50px">
		</div>
		<div class="col-md-4" style="word-wrap:break-word;">
			<p>{{titolo}}</p>
		</div>
		<div class="col-md-2">
			<p>{{titolo}}</p>
		</div>
		<div class="col-md-2">
			<p>{{titolo}}</p>
		</div>
		<div class="col-md-1">
			<button>Visualizza</button>
		</div>
		<div class="col-md-1">
			<button>Modifica</button>
		</div>
		<div class="col-md-1">
			<button  class="bottone-elimina">Elimina</button>
		</div>
	</div>
	{{/filmtoday}}

	<div class="row">
		<div class="col-md-1">
		</div>
		<div class="col-md-4" style="word-wrap:break-word;">
			<p>TITOLO</p>
		</div>
		<div class="col-md-2">
			<p>DATA INIZIO</p>
		</div>
		<div class="col-md-2">
			<p>DATA FINE</p>
		</div>
		<div class="col-md-1">
			<p>Visualizza</p>
		</div>
		<div class="col-md-1">
			<p>Modifica</p>
		</div>
		<div class="col-md-1">
			<p>Elimina</p>
		</div>
	</div>
	{{#filmafter}}
	<div class="row" style="border-bottom: 1px solid maroon; padding-bottom: 10px; margin-top: 10px;">
		<div class="col-md-1">
			<img src="http://localhost/cinema/{{immagine}}" value="{{indice}}" style="width:50px">
		</div>
		<div class="col-md-4" style="word-wrap:break-word;">
			<p>{{titolo}}</p>
		</div>
		<div class="col-md-2">
			<p>{{titolo}}</p>
		</div>
		<div class="col-md-2">
			<p>{{titolo}}</p>
		</div>
		<div class="col-md-1">
			<button class="bottone-visualizza" value="{{indice}}">Visualizza</button>
		</div>
		<div class="col-md-1">
			<button>Modifica</button>
		</div>
		<div class="col-md-1">
			<button id_film="{{id}}" id_scheda="{{id_scheda}}" class="bottone-elimina">Elimina</button>
		</div>
	</div>
	{{/filmafter}}
</div>
<div class="col-xs-0 col-md-1 col-lg-1">
</div>

{{#filmafter}}
<div id="myModal{{indice}}" class="modal fade" style "height: 700px;">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">{{titolo}}</h4>
			</div>
			<div class="modal-body" style="height: 400px;">
				<div class="col-md-4">
					<img src="http://localhost/cinema/{{immagine}}" value="{{indice}}" style="width:250px">
				</div>
				<div class="col-md-8">
					<p>{{data_inizio}}</p>
					<p>{{data_fine}}</p>
					<p style="word-wrap:break-word;">{{descrizione}}</p>
				</div>
			</div>
		</div>
	</div>
</div>
{{/filmafter}}