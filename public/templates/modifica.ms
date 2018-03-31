<script>
	$(document).ready(function () {
		//parte riguardante i film di oggi

		$('.bottone-visualizza-today').click(function () {
			var indice = $(this).val();
			$("#view-modal-today" + indice).modal();
		});

		$('.bottone-elimina-today').click(function () {
			var id = $(this).attr('idFilm');
			var idFilm = 'id=' + id;
			var indiceEliminazione = $(this).val();
			$("#delete-modal-today" + indiceEliminazione).modal();
			$("#delete-modal-today" + indiceEliminazione).find("div.modal-footer").empty();
			$("#delete-modal-today" + indiceEliminazione).find("div.modal-footer").append(
				"<button class=\"eliminazione-definitiva btn-danger\" value=\"{{indice}}\">Elminina</button><button type=\"button\" data-dismiss=\"modal\" class=\"btn-success\">Annulla</button>"
			);
			$('.eliminazione-definitiva').click(function () {
				$.ajax({
					type: "POST",
					url: "delete",
					dataType: "html",
					data: 'id=' + id,
					cache: false,
					success: function (result) {
						$('#' + indiceEliminazione).parent().parent().remove();
						$('.eliminazione-definitiva').parent().parent().find("img").remove();
						$('.eliminazione-definitiva').parent().parent().find("h3").empty();
						$('.eliminazione-definitiva').parent().parent().find("h3").text("Elimiazione avvenuta con successo!!");
						$('.eliminazione-definitiva').parent().parent().find("h3").append(
							"<br><br><span class='glyphicon glyphicon-ok' style='font-size: 50px; color: green;'></span>");
						$('.modal-footer').find('button').remove();
						$('.modal-footer').append('<button class="btn-success" data-dismiss="modal">OK</button>');
						setTimeout(function () {
								$("#delete-modal-today" + indiceEliminazione).modal("toggle");
							},
							3000);
					},
					error: function (result) {
						$('.eliminazione-definitiva').parent().parent().find("img").remove();
						$('.eliminazione-definitiva').parent().parent().find("h3").empty();
						$('.eliminazione-definitiva').parent().parent().find("h3").text(
							"Elimiazione non avvenuta si prega di riprovare");
						$('.eliminazione-definitiva').parent().parent().find("h3").append(
							"<br><br><span class='glyphicon glyphicon-remove' style='font-size: 50px; color: red;'></span>");
						$('.modal-footer').find('button').remove();
						$('.modal-footer').append('<button class="btn-success" data-dismiss="modal">OK</button>');
						setTimeout(function () {
								$("#delete-modal-today" + indiceEliminazione).modal("toggle");
							},
							3000);
					}
				});
			});
		});

		$(".bottone-modifica-oggi").click(function () {
			var indice = $(this).val();
			$("#modify-modal-today" + indice).modal();
		})

		//parte riguardante i film prossimi

		$('.bottone-visualizza').click(function () {
			var indice = $(this).val();
			$("#view-modal" + indice).modal();
		});

		$('.bottone-elimina').click(function () {
			var id = $(this).attr('idFilm');
			var idFilm = 'id=' + id;
			var indiceEliminazione = $(this).val();
			$("#delete-modal" + indiceEliminazione).modal();
			$("#delete-modal" + indiceEliminazione).find("div.modal-footer").empty();
			$("#delete-modal" + indiceEliminazione).find("div.modal-footer").append(
				"<button class=\"eliminazione-definitiva btn-danger\" value=\"{{indice}}\">Elminina</button><button type=\"button\" data-dismiss=\"modal\" class=\"btn-success\">Annulla</button>"
			);
			$('.eliminazione-definitiva').click(function () {
				$.ajax({
					type: "POST",
					url: "delete",
					dataType: "html",
					data: 'id=' + id,
					cache: false,
					success: function (result) {
						$('#' + indiceEliminazione).parent().parent().remove();
						$('.eliminazione-definitiva').parent().parent().find("img").remove();
						$('.eliminazione-definitiva').parent().parent().find("h3").empty();
						$('.eliminazione-definitiva').parent().parent().find("h3").text("Elimiazione avvenuta con successo!!");
						$('.eliminazione-definitiva').parent().parent().find("h3").append(
							"<br><br><span class='glyphicon glyphicon-ok' style='font-size: 50px; color: green;'></span>");
						$('.modal-footer').find('button').remove();
						$('.modal-footer').append('<button class="btn-success" data-dismiss="modal">OK</button>');
						setTimeout(function () {
								$("#delete-modal" + indiceEliminazione).modal("toggle");
							},
							3000);
					},
					error: function (result) {
						$('.eliminazione-definitiva').parent().parent().find("img").remove();
						$('.eliminazione-definitiva').parent().parent().find("h3").empty();
						$('.eliminazione-definitiva').parent().parent().find("h3").text(
							"Elimiazione non avvenuta si prega di riprovare");
						$('.eliminazione-definitiva').parent().parent().find("h3").append(
							"<br><br><span class='glyphicon glyphicon-remove' style='font-size: 50px; color: red;'></span>");
						$('.modal-footer').find('button').remove();
						$('.modal-footer').append('<button class="btn-success" data-dismiss="modal">OK</button>');
						setTimeout(function () {
								$("#delete-modal" + indiceEliminazione).modal("toggle");
							},
							3000);
					}
				});
			});
		});

		$('.datepicker').datepicker();
		event.preventDefault();
	});
</script>

<div class="col-xs-0 col-md-1 col-lg-1">
</div>
<div class="col-xs-12 col-md-10 col-lg-10">
	<h1>Film di oggi</h1>
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
			<p>{{data_inizio}}</p>
		</div>
		<div class="col-md-2">
			<p>{{data_fine}}</p>
		</div>
		<div class="col-md-1">
			<button class="bottone-visualizza-today" value="{{indice}}">Visualizza</button>
		</div>
		<div class="col-md-1">
			<button class="bottone-modifica-oggi" value="{{indice}}">Modifica</button>
		</div>
		<div class="col-md-1">
			<button class="bottone-elimina-today" id="{{indice}}" idFilm="{{id}}" value="{{indice}}">Elimina</button>
		</div>
	</div>
	{{/filmtoday}}
	<h1>Film di domani</h1>
	<div class="row" style="margin-top: 50px;">
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
			<p>{{data_inizio}}</p>
		</div>
		<div class="col-md-2">
			<p>{{data_fine}}</p>
		</div>
		<div class="col-md-1">
			<button class="bottone-visualizza" value="{{indice}}">Visualizza</button>
		</div>
		<div class="col-md-1">
			<button>Modifica</button>
		</div>
		<div class="col-md-1">
			<button idFilm="{{id}}" id="{{indice}}" class="bottone-elimina" value="{{indice}}">Elimina</button>
		</div>
	</div>
	{{/filmafter}}
</div>
<div class="col-xs-0 col-md-1 col-lg-1">
</div>

{{#filmafter}}
<div id="view-modal{{indice}}" class="modal fade" style "height: 700px;">
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
					<div class="col-md-4">
						<p>
							<b>Data inizio</b>
						</p>
						<p>
							<b>Data fine</b>
						</p>
						<p>
							<b>Descrizione</b>
						</p>
					</div>
					<div class="col-md-8">
						<p>{{data_inizio}}</p>
						<p>{{data_fine}}</p>
						<p style="word-wrap:break-word;">{{descrizione}}</p>
						<p style="word-wrap:break-word;">{{attori}}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="delete-modal{{indice}}" class="modal fade">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">{{titolo}}</h4>
			</div>
			<div class="modal-body" style="height: 300px; text-align: center;">
				<img src="http://localhost/cinema/{{immagine}}" style="height: 200px">
				<h3>Continuare con l'eliminazione?</h3>
			</div>
			<div class="modal-footer" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">

			</div>
		</div>
	</div>
</div>
{{/filmafter}} {{#filmtoday}}
<div id="view-modal-today{{indice}}" class="modal fade" style "height: 700px;">
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
					<div class="col-md-4">
						<p>
							<b>Data inizio</b>
						</p>
						<p>
							<b>Data fine</b>
						</p>
						<p>
							<b>Descrizione</b>
						</p>
					</div>
					<div class="col-md-8">
						<p>{{data_inizio}}</p>
						<p>{{data_fine}}</p>
						<p style="word-wrap:break-word;">{{descrizione}}</p>
						<p>{{attori}}</p>
						<p>{{regia}}</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="delete-modal-today{{indice}}" class="modal fade">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">{{titolo}}</h4>
			</div>
			<div class="modal-body" style="height: 300px; text-align: center;">
				<img src="http://localhost/cinema/{{immagine}}" style="height: 200px">
				<h3>Continuare con l'eliminazione?</h3>
			</div>
			<div class="modal-footer" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">

			</div>
		</div>
	</div>
</div>


<div id="modify-modal-today{{indice}}" class="modal fade">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">{{titolo}}</h4>
			</div>
			<div class="modal-body" style="height: 450px; text-align: center;">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-3">
							<img src="http://localhost/cinema/{{immagine}}" style="height: 200px; float: left;">
						</div>
						<div class="col-md-9">
							<div class="form-group">
								<label for="comment">Data inizio</label>
								<input id="datainizio" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" style="margin-bottom: 5px;"
								    required>
								<label for="comment">Data fine</label>
								<input id="datafine" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" style="margin-bottom: 5px;"
								    required>
								<label for="comment">Durata</label>
								<input type="text" value="{{durata}}" class="form-control" rows="1" required>
							</div>
						</div>
					</div>
					<div class="row">
						<label for="comment">Regia</label>
						<input type="text" value="{{regia}}" class="form-control" rows="1" required>
						<br>
						<label for="comment">Attori</label>
						<input type="text" value="{{attori}}" class="form-control" rows="1" required>
						<br>
						<label for="comment">Descrizione</label>
						<input type="text" value="{{descrizione}}" class="form-control" rows="1" required>
					</div>
				</div>
			</div>
			<div class="modal-footer" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">

			</div>
		</div>
	</div>
</div>
{{/filmtoday}}