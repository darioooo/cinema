<script src="../js/controlloDate.js"></script>
<script>
	var id;
	var dey;
	var indiceEliminazione;



	$(document).ready(function () {
		var data_inizio;
		var data_fine;
		var durata;
		var attori;
		var regia;
		var descrizione;
		var classToModify;
		var getOrari = new Array();
		var idArray = new Array();

		function orario() {
			this.orari = new Array();
			this.giornoSettimana = "";
			this.day = "";
			this.mounth = "";
			this.year = "";
		}

		var count = 0;

		function film() {
			this.titolo = "";
			this.durata = "";
			this.regia = "";
			this.attori = "";
			this.immagine = "";
			this.descrizione = "";
			this.data_inizio = "";
			this.data_fine = "";
			this.orari = new orario();
		}


		// viasualizza generico js 
		$('.bottone-visualizza').click(function () {
			var id = $(this).attr('idFilm');
			var filmo = getFilmByid(id);
			// titolo , immagine , data-inizio , data-fine , descrizione , attori
			$('#view-modal #titolo').html(filmo.titolo);
			$("#view-modal #data-inizio").html(filmo.data_inizio);
			$("#view-modal #data-fine").html(filmo.data_fine);
			$('#view-modal #immagine').attr("src", "../" + filmo.immagine);
			$('#view-modal #descrizione').html(filmo.descrizione);
			$('#view-modal #attori').html(filmo.attori);
			$("#view-modal").modal();
		});

		function getFilmByid(id) {
			var filmi;
			$.ajax({
				type: "POST",
				url: "getFilm",
				dataType: "JSON",
				async: false,
				data: 'id=' + id,
				cache: false,
				success: function (result) {

					var filmLocal = new film();
					filmLocal.titolo = result.films[0].titolo;
					filmLocal.durata = result.scheda[0].durata;
					filmLocal.regia = result.scheda[0].regia;
					filmLocal.durata = result.scheda[0].attori;
					filmLocal.immagine = result.films[0].immagine;
					filmLocal.descrizione = result.films[0].descrizione;
					filmLocal.data_inizio = result.films[0].data_inizio;
					filmLocal.data_fine = result.films[0].data_fine;
					var ora = new orario();

					// cast 

					result.orario.forEach(element => {
						// console.log(element.id_orario);
						getOrari.length = 0;
						console.log("Hambaramendu: " + element.ora + element.giorno + element.giornosettimana);
						var trimmedOrari = $.trim(element.ora);
						var splittedOrari = trimmedOrari.split(/ +/);
						giorno = element.giorno;
						giornoSettimana = element.giornosettimana;
						ora.giornoSettimana = giornoSettimana;
						ora.day = element.giorno;

						splittedOrari.forEach(x => {
							ora.orari.push(x);
						});
						var html =
							"<div class=\" row \" style=\" dislpay:inline-flex\"><div class=\" col-md-4 pgiorni\" giornosettimana = \"" +
							element.giornosettimana + "\" giorno = \"" +
							element.giorno + "\"><p>" +
							element.giorno +
							" " +
							element.giornosettimana +
							"</p></div><div class=\"input-group col-md-8 clockpicker \" style=\"float: left; display: inline-flex;\" data-autoclose=\"true\">";
						getOrari.forEach(x => {
							html = html +
								"<div class=\"input-group col-md-3 clockpicker \"  data-autoclose=\"true\"><span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-time\"></span></span><input type=\"text\" class=\"form-control orariDiv ora\" value= " +
								x +
								" ><span class=\"input-group-addon removeOrario\" style=\"color:red;\"><span class=\"glyphicon glyphicon-remove\"></span></span></div>";
						});
						html = html + "</div></br></div>";
						$('.insertorari').append(html);
					});
					console.log(ora);
					console.log(filmLocal);
					filmLocal.orari = ora;
					filmi = filmLocal;

				},
				error: function (result) {

				}
			});
			return filmi;
		}

		$('.bottone-elimina').click(function () {
			id = $(this).attr('idFilm');
			dey = "tomorrow";
			var filmo = getFilmByid(id);
			$("#delete-modal #titolo").html(filmo.titolo);
			$('#delete-modal #immagine').attr("src", "../" + filmo.immagine);
			$("#delete-modal").modal();
			$("#delete-modal").find("div.modal-footer").empty();
			$("#delete-modal").find("div.modal-footer").append(
				"<button class=\"eliminazione-definitiva btn-danger\" value=\"{{indice}}\">Elminina</button><button type=\"button\" data-dismiss=\"modal\" class=\"btn-success\">Annulla</button>"
			);
		});



		$(document).on('click', '.eliminazione-definitiva', function () {
			$.ajax({
				type: "POST",
				url: "delete",
				dataType: "html",
				data: 'id=' + id,
				cache: false,
				success: function (result) {
					$('#row-' + id).remove();
					$('.eliminazione-definitiva').parent().parent().find("img").remove();
					$('.eliminazione-definitiva').parent().parent().find("h3").empty();
					$('.eliminazione-definitiva').parent().parent().find("h3").text("Elimiazione avvenuta con successo!!");
					$('.eliminazione-definitiva').parent().parent().find("h3").append(
						"<br><br><span class='glyphicon glyphicon-ok' style='font-size: 50px; color: green;'></span>");
					$('.delete-footer').find('button').remove();
					$('.delete-footer').append('<button class="btn-success" data-dismiss="modal">OK</button>');
					setTimeout(function () {
						$("#delete-modal").modal("toggle");
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
					$('.delete-footer').find('button').remove();
					$('.delete-footer').append('<button class="btn-success" data-dismiss="modal">OK</button>');
					setTimeout(function () {
						$("#delete-modal").modal("toggle");
					},
						3000);
				}
			});
		});

		$('.oradiDiv').change(function () {
			$.ajax({
				type: "POST",
				url: "updateorari",
			});
		});
		$(".bottone-modifica").click(function () {
			id = $(this).attr('idFilm');
			var filmo = getFilmByid(id);
			$('#modify-modal #titolo').html(filmo.titolo);
			$("#modify-modal #data_inizio").val(filmo.data_inizio);
			$("#modify-modal #data_fine").val(filmo.data_fine);
			$('#modify-modal #immagine').attr("src", "../" + filmo.immagine);
			$('#modify-modal #descrizione').val(filmo.descrizione);
			$('#modify-modal #attori').val(filmo.attori);

			$("#modify-modal").modal();
			$(".close-modify-modal").click(function () {
				("#modify-modal").modal("toggle");
			});
		});

		$(".success-modify-modal").click(function () {
			data_inizio = $(classToModify + ".datainizio").val();
			data_fine = $(classToModify + ".datafine").val();
			descrizione = $(classToModify + ".descrizione").val();
			attori = $(classToModify + ".attori").val();
			regia = $(classToModify + ".regia").val();
			durata = $(classToModify + ".durata").val();

			if (id != null) {
				var dataString = dataString + '&id=' + id;
			}
			if (data_inizio != null) {
				var dataString = dataString + '&data_inizio=' + data_inizio;
			}
			if (data_fine != null) {
				var dataString = dataString + '&data_fine=' + data_fine;
			}

			if (descrizione != null) {
				var dataString = dataString + '&descrizione=' + descrizione;
			}
			if (attori != null) {
				var dataString = dataString + '&attori=' + attori;
			}
			if (regia != null) {
				var dataString = dataString + '&regia=' + regia;
			}
			if (durata != null) {
				var dataString = dataString + '&durata=' + durata;
			}

			var orarioO = new Array();

			$(".insertorari").children().each(function () {
				var orariol = new orario();
				var giornosettimana = $(this).find(".pgiorni").attr("giornosettimana");
				var giorno = $(this).find(".pgiorni").attr("giorno");
				orariol['day'] = giorno;
				orariol['giornosettimana'] = giornosettimana;

				$(this).parent().find('.orariDiv').children().children().each(function () {
					console.log($(this).find('.ora').val());
					orariol['orari'].push($(this).find('.ora').val());
				});
				orarioO.push(orariol);
			});

			console.log(orarioO);
			// if (orarioO.orari.length > 0) {
			// 	orari.push(orarioO);
			// }

			var orariString = JSON.stringify(orarioO);
			dataString = dataString + "&orari = " + orariString;

			$.ajax({
				type: "POST",
				url: "update",
				data: dataString,
				cache: false,
				success: function (result) {
					console.log(result);
				}
			});
		});

		//inizio js menù
		$("#buttonhide").mouseenter(function () {
			$(this).animate({
				width: '200px'
			}, {
					step: function (currentwidth) {
						if (currentwidth > 150) {
							$(this).find("#phide").fadeIn();
							$(this).find("#phide").css("transition-duration", "0.3s");
						}
					}
				});
		});

		$("#buttonhide").mouseleave(function () {
			$(this).animate({
				width: '80px'
			}, {
					step: function (currentwidth) {
						if (currentwidth < 150) {
							$(this).find("#phide").fadeOut(3);
							$(this).find("#phide").css("transition-duration", "0s");
						}
					}
				});

		});
		$("#buttonhidemodifica").mouseenter(function () {
			$("#buttonhidemodifica").animate({
				width: '200px'
			}, {
					step: function (currentwidth) {
						if (currentwidth > 150) {
							$(this).find("#pmodifica").fadeIn();
							$(this).find("#pmodifica").css("transition-duration", "0.3s");
						}
					}
				});
		});
		$("#buttonhidemodifica").mouseleave(function () {
			$("#buttonhidemodifica").animate({
				width: '80px'
			}, {
					step: function (currentwidth) {
						if (currentwidth < 150) {
							$(this).find("#pmodifica").fadeOut(3);
							$(this).find("#pmodifica").css("transition-duration", "0s");
						}
					}
				});
		});

		$(".datepicker").datepicker({
			dateFormat: "yyyy-mm-dd"
		});

		$(document).on('click', '.spanAdd', function () {
			$(this).parent().parent().find(".orariDiv").append(
				"<div class=\"input-group col-md-3 clockpicker \"  data-autoclose=\"true\"><span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-time\"></span></span><input type=\"text\" class=\"form-control ora\" value=\"21:30\"><span class=\"input-group-addon removeOrario\" style=\"color:red;\"><span class=\"glyphicon glyphicon-remove\"></span></span></div>"
			);
			$(this).parent().parent().find(".orariDiv").css('display', 'inline-flex');
		});

		$(document).on('click', '.clockpicker', function () {
			$(this).clockpicker({
				donetext: 'Done',
				placement: 'top'
			});
		});

		$(document).on('click', '.removeOrario', function () {
			$(this).parent().remove();
		});

		$('#orariClose').click(function () { });
		// ----------------------------------------------------inserimento film
		$('#orariConfirm').click(function () {
			console.log(arrayOrari);
			orari = new Array();
			for (i = 0; i < arrayOrari.length; i++) {
				var orarioO = new orario();
				orarioO.day = $('#divData' + arrayOrari[i]).find('p').attr("date");
				orarioO.giornoSettimana = $('#divData' + arrayOrari[i]).find('p').attr("day");
				orarioO.mounth = $('#divData' + arrayOrari[i]).find('p').attr("mounth");
				orarioO.year = $('#divData' + arrayOrari[i]).find('p').attr("year");
				$('#divData' + arrayOrari[i]).find('p');
				$('#divData' + arrayOrari[i]).parent().find('.orariDiv').val();
				$('#divData' + arrayOrari[i]).parent().find('.orariDiv').children().each(function () {

					if ($(this).is('.clockpicker')) {
						orarioO.orari.push($(this).find('.ora').val());
					}
				});
				console.log(orarioO);
				if (orarioO.orari.length > 0) {
					orari.push(orarioO);
				}
			}
			$('.insertorari').empty();
			for (i = 0; i < orari.length; i++) {
				var html =
					"<div class=\" row \" style=\" dislpay:inline-flex\"><div class=\" col-md-4\"><p class=\"pgiorni \" giornosettimana=" +
					orari[i].giornoSettimana + " giorno=" + orari[i].day + " mounth=" + orari[i].mounth + " year=" + orari[i].year +
					" >" + orari[i].giornoSettimana +
					" " + orari[i].day + "/" + orari[i]
						.mounth +
					"/" + orari[i].year +
					"</p></div><div class=\"input-group col-md-8 clockpicker \" style=\"float: left; display: inline-flex;\" data-autoclose=\"true\">";

				for (o = 0; o < orari[i].orari.length; o++) {
					html = html +
						"<div class=\"input-group col-md-3 clockpicker \"  data-autoclose=\"true\"><span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-time\"></span></span><input type=\"text\" class=\"form-control ora\" value= " +
						orari[i].orari[o] +
						" ><span class=\"input-group-addon removeOrario\" style=\"color:red;\"><span class=\"glyphicon glyphicon-remove\"></span></span></div>";
				};
				html = html + "</div></br></div>";
				$('.insertorari').append(html);
			}



		});
	});
</script>
<div style="padding-top: 70px;">
	<div class="col-sm-1 col-md-1">
		<div class="btn-group-vertical   inlinea leftdivbg">

			<a href="../index.php/modifica" class="btn " style="visibility: visible; text-align: center; padding-top: 13px" id="buttonhidemodifica">
				<span id="pmodifica" style="color:white; display:none; transition-duration: 0.3s;">MODIFICA </span>
				<span id="spanmodifica" class="glyphicon glyphicon-cog" style="color:white"></span>
			</a>
			<a href="../index.php/admin" class="btn " style="visibility: visible; text-align: center; padding-top: 13px;" id="buttonhide">
				<span id="phide" style="color:white; display:none; transition-duration: 0.3s;">FILM </span>
				<span id="spanhide" class="glyphicon glyphicon-facetime-video" style="color:white"></span>
			</a>
		</div>
	</div>

	<div class="col-sm-1 col-md-1" id="centerdiv">
	</div>
	<div class="col-sm-9 col-md-9" id="modifyContent">
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
		<div class="row" style="border-bottom: 1px solid maroon; padding-bottom: 10px; margin-top: 10px;" id="row-{{id}}">
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
				<button class="bottone-visualizza" value="{{indice}}" idFilm={{id}}>Visualizza</button>
			</div>
			<div class="col-md-1">
				<button class="bottone-modifica" value="{{indice}}" idFilm={{id}}>Modifica</button>
			</div>
			<div class="col-md-1">
				<button class="bottone-elimina" id="today{{indice}}" idFilm="{{id}}" value="{{indice}}">Elimina</button>
			</div>
		</div>
		{{/filmtoday}}
		<h1>Film di domani</h1>
		<div class="row" style="margin-top: 50px;" id-film-row="{{id}}">
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
		<div class="row" style="border-bottom: 1px solid maroon; padding-bottom: 10px; margin-top: 10px;" id="row-{{id}}">
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
				<button class="bottone-visualizza" value="{{indice}}" idFilm={{id}}>Visualizza</button>
			</div>
			<div class="col-md-1">
				<button class="bottone-modifica" value="{{indice}}" idFilm={{id}}>Modifica</button>
			</div>
			<div class="col-md-1">
				<button idFilm="{{id}}" id="tomorrow{{indice}}" class="bottone-elimina" value="{{indice}}">Elimina</button>
			</div>
		</div>
		{{/filmafter}}
	</div>

	<!--  modal per la visualizzazione creato in maniera generica id = titolo , immagine , data-inizio , data-fine , descrizione , attori  -->
	<div id="view-modal" class="modal fade" style "height: 700px;">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="titolo"></h4>
				</div>
				<div class="modal-body" style="height: 400px;">
					<div class="col-md-4">
						<img id="immagine" style="width:250px">
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
							<p id="data-inizio"></p>
							<p id="data-fine"></p>
							<p style="word-wrap:break-word;" id="descrizione"></p>
							<p style="word-wrap:break-word;" id="attori"></p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="delete-modal" class="modal fade">
		<div class="modal-dialog modal-md">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="titolo"></h4>
				</div>
				<div class="modal-body" style="height: 300px; text-align: center;">
					<img src="" id="immagine" style="height: 200px">
					<h3>Continuare con l'eliminazione?</h3>
				</div>
				<div class="modal-footer delete-footer" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
				</div>
			</div>
		</div>
	</div>

	<div id="modify-modal" class="modal fade next_films_modify">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title" id="titolo"></h4>
				</div>
				<div class="modal-body" style="height: 600px; text-align: center;">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3">
								<img src="" id="immagine" style="height: 200px; float: left;">
							</div>
							<div class="col-md-9">
								<div class="form-group">
									<label for="comment">Data inizio</label>
									<input class="datepicker form-control datainizio" value="" id="data_inizio" data-date-format="yyyy-mm-dd" rows="1" style="margin-bottom: 5px;"
									 required>
									<label for="comment">Data fine</label>
									<input class="datepicker form-control datafine" value="" id="data_fine" data-date-format="yyyy-mm-dd" rows="1" style="margin-bottom: 5px;"
									 required>
									<label for="comment">Durata</label>
									<input type="text" value="" id="duarata" class="form-control durata" rows="1" required>
								</div>
							</div>
						</div>
						<div class="row">
							<label for="comment">Regia</label>
							<input type="text" value="" id="regia" class="form-control regia" rows="1" required>
							<br>
							<label for="comment">Attori</label>
							<input type="text" value="" id="attori" class="form-control attori" valoreiniziale="{{attori}}" rows="1" required>
							<br>
							<label for="comment">Descrizione</label>
							<textarea value="" id="descrizione" class="form-control descrizione" rows="5" required></textarea>
						</div>
						<br>
						<div class="row insertorari" style="overflow: scroll; height: 120px;">
						</div>
					</div>
				</div>
				<div class="modal-footer" style="background-color: rgba(128, 0, 0, 0.7); text-align: center;">
					<button class="btn btn-success success-modify-modal">Modifica</button>
					<button class="btn btn-danger close-modify-modal" data-dismiss="modal">Annulla</button>
				</div>
			</div>
		</div>
	</div>


	<div id="orarimodal" class="modal fade ">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7);">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Selezionare Orari</h4>
				</div>
				<div class="modal-body" id="orariM">
				</div>
				<div class="modal-footer">
					<button type="button" id="orariClose" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" id="orariConfirm" class="btn btn-success" data-dismiss="modal">Confirm</button>
				</div>
			</div>
		</div>
	</div>


	<!-- modal per il controlllo delle date -->
	<div id="myModal" class="modal fade">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7);">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">ERRORE SULLE DATE!</h4>
				</div>
				<div class="modal-body">
					<p>La data di fine del film non può essere prima della data di inizio!</p>
				</div>
			</div>
		</div>
	</div>

</div>