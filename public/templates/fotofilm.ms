<script type="text/javascript">

	$(document).ready(function () {
		var url;
		var file;
		var titolo;
		var descrizione;
		var attori;
		var regia;
		var durata;
		var orariStrig;
		var data_inizio, data_fine;
		function orario() {
			this.orari = new Array();
			this.giornoSettimana = "";
			this.day = "";
			this.mounth = "";
			this.year = "";

		}
		var lunedì = "";
		var martedì = "";
		var mercoledì = "";
		var giovedì = "";
		var venerdì = "";
		var sabato = "";
		var domenica = "";
		var arrayOrari;
		var orari;



		$('.datepicker').datepicker();
		event.preventDefault();
		$(".imgfilm").click(function () {
			url = $(this).attr("src");
			titolo = $(this).attr("titolo");

			$("#imagediv").html("<img  src=" + url + "></img>");
			$("#formdiv").css("visibility", "visible");
			$("#labeltitolo").text(titolo);
			$("#filmdiv").toggle("slide");
			$('#buttonhide').show();
			$("#buttonhide").css("visibility", "visible");
			$('#buttonhidemodifica').show();
			$("#buttonhidemodifica").css("visibility", "visible");
			$('#buttonadd').show();
			$("#buttonadd").css("visibility", "visible");
			$("#rightdiv").removeClass('col-sm-6 col-md-4').addClass('col-sm-10 col-md-11');
			$("#centerdiv").removeClass('col-sm-2 col-md-2').addClass('col-sm-1 col-md-1');
			$("#leftdiv").removeClass('col-sm-4 col-md-4').addClass('leftdivbg');
		});

		$('#buttonhide').click(function () {
			$("#buttonhide").hide();
			$("#buttonhide").css("visibility", "hidden");
			$("#buttonhidemodifica").hide();
			$("#buttonhidemodifica").css("visibility", "hidden");
			$("#buttonadd").hide();
			$("#buttonadd").css("visibility", "hidden");
			$("#filmdiv").toggle("slide");
			$("#rightdiv").removeClass('col-sm-10 col-md-11').addClass('col-sm-6 col-md-4');
			$("#centerdiv").removeClass('col-sm-1 col-md-1').addClass('col-sm-2 col-md-2');
			$("#leftdiv").removeClass(' leftdivbg').addClass('col-sm-4 col-md-4');
		});
		//TODO pagina modifica eccccc;
		$('#buttonhidemodifica').click(function () {
			$("#buttonhide").hide();
			$("#buttonhide").css("visibility", "hidden");
			$("#buttonhidemodifica").hide();
			$("#buttonhidemodifica").css("visibility", "hidden");
			$("#buttonadd").hide();
			$("#buttonadd").css("visibility", "hidden");
			$("#filmdiv").toggle("slide");
			$("#rightdiv").removeClass('col-sm-10 col-md-11').addClass('col-sm-6 col-md-4');
			$("#centerdiv").removeClass('col-sm-1 col-md-1').addClass('col-sm-2 col-md-2');
			$("#leftdiv").removeClass(' leftdivbg').addClass('col-sm-4 col-md-4');
		});
		//TODO aggiungi eccc
		$('#buttonadd').click(function () {
			$("#buttonhide").hide();
			$("#buttonhide").css("visibility", "hidden");
			$("#buttonhidemodifica").hide();
			$("#buttonhidemodifica").css("visibility", "hidden");
			$("#buttonadd").hide();
			$("#buttonadd").css("visibility", "hidden");
			$("#filmdiv").toggle("slide");
			$("#rightdiv").removeClass('col-sm-10 col-md-11').addClass('col-sm-6 col-md-4');
			$("#centerdiv").removeClass('col-sm-1 col-md-1').addClass('col-sm-2 col-md-2');
			$("#leftdiv").removeClass(' leftdivbg').addClass('col-sm-4 col-md-4');
		});

		$(".filmdropdown").click(function () {
			$("#imgfilm").fadeIn(3000);
		});

		$("#datafine").change(function () {
			var datainizio = $("#datainizio").datepicker({
				dateFormat: "yyyy-mm-dd"
			}).val();
			var datafine = $("#datafine").datepicker({
				dateFormat: "yyyy-mm-dd"
			}).val();
			var datai = $("#datainizio").datepicker('getDate');
			var dataf = $("#datafine").datepicker('getDate');
		});

		$("form").on("submit", function (event) {
			event.preventDefault();
			descrizione = $("#desc").val();
			attori = $("#attori").val();
			regia = $("#regia").val();
			durata = $("#durata").val();

			orariStrig = JSON.stringify(orari);

			var datainizio = $("#datainizio").datepicker({
				dateFormat: "yyyy-mm-dd"
			}).val();
			var datafine = $("#datafine").datepicker({
				dateFormat: "yyyy-mm-dd"
			}).val();
			data_inizio = $("#datainizio").val();
			data_fine = $("#datafine").val();

			myDateInizio = datainizio.split("/");
			var newDatei = myDateInizio[1] + "," + myDateInizio[0] + "," + myDateInizio[2];
			var newDataInizio = new Date(newDatei).getTime();
			var todaysDate = new Date();
			todaysDate.setHours(0, 0, 0, 0);
			myDateFine = datafine.split("/");
			var newDatef = myDateFine[1] + "," + myDateFine[0] + "," + myDateFine[2];
			var newDataFine = new Date(newDatef).getTime();

			console.log("datainizio" + newDataInizio);
			console.log("datatoday" + todaysDate);
			if (newDataInizio >= todaysDate) {
				$("#datainizio").removeClass("fielderror");

				if (newDataInizio > newDataFine) {
					$("#datainizio").addClass("fielderror");
					$("#datafine").addClass("fielderror");
					$("#myModal").modal();
				} else {
					$("#datainizio").removeClass("fielderror");
					$("#datafine").removeClass("fielderror");

					var dataString = 'titolo=' + titolo + '&url=' + url + '&data_inizio=' + datainizio +
						'&data_fine=' + datafine + '&orari=' + orariStrig;
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


					$.ajax({
						type: "POST",
						dataType: 'script',
						url: "action_image",
						// data: { titolo: titolo, url: url  },
						data: file,
						cache: false,
						success: function (result) {

							console.log(result);

						}
					});
					lunedì = "";
					martedì = "";
					mercoledì = "";
					giovedì = "";
					venerdì = "";
					sabato = "";
					domenica = "";
					$.ajax({
						type: "POST",
						url: "action_admin",
						// data: { titolo: titolo, url: url  },
						data: dataString,
						cache: false,
						success: function (result) {

							console.log(result);
						}
					});
				}
			} else {
				$("#datainizio").addClass("fielderror");
				$("#todaysDateModal").modal();
			}
		});
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
		$("#buttonadd").mouseenter(function () {
			$("#buttonadd").animate({
				width: '200px'
			}, {
					step: function (currentwidth) {
						if (currentwidth > 150) {
							//  $(this).find("#padd").fadeIn();
						}
					}
				});
		});
		$("#buttonadd").mouseleave(function () {
			$("#buttonadd").animate({
				width: '80px'
			}, {
					step: function (currentwidth) {
						if (currentwidth < 150) {
							//  $(this).find("#padd").fadeOut();
						}
					}
				});
		});

		$("#newfilm").click(function () {
			url = $(this).attr("src");
			titolo = $(this).attr("titolo");

			$("#formdiv").css("visibility", "visible");
			$("#labeltitolo").text(titolo);
			$("#filmdiv").toggle("slide");

			$("#buttonhide").css("visibility", "visible");
			$("#buttonhidemodifica").css("visibility", "visible");
			$("#buttonadd").css("visibility", "visible");
			$("#rightdiv").removeClass('col-sm-6 col-md-4').addClass('col-sm-10 col-md-11');
			$("#centerdiv").removeClass('col-sm-2 col-md-2').addClass('col-sm-1 col-md-1');
			$("#leftdiv").removeClass('col-sm-4 col-md-4').addClass(' leftdivbg');
		});
		$("#saveModal").click(function () {
			if ($("#title").val() != "" && $("#input-b9").fileinput() != null) {
				file = $("#input-b9").fileinput();
				file.files[0];
				$("#imagediv").html("<img  src=" + $("data") + "></img>");

				console.log($("#input-b9").fileinput());

				$("#fileModal").modal('toggle');
			} else {
				alert("inserimento non completo");
				console.log($("#title").val());

			}
		});

		$("#input-b9").fileinput({
			showPreview: true,
			showUpload: true,
			uploadAsync: false,
			elErrorContainer: '#kartik-file-errors',
			allowedFileExtensions: ["jpg", "png", "gif"],
			uploadUrl: "action_image",
			uploadExtraData: function () {
				return {
					titolo: $("#title").val(),
				};
			}
		});

		$("#datainizio,#datafine").change(function () {

			if ($("#datainizio").val() && $("#datafine").val()) {
				var datainizio = $("#datainizio").datepicker({
					dateFormat: "yyyy-mm-dd"
				}).val();
				var datafine = $("#datafine").datepicker({
					dateFormat: "yyyy-mm-dd"
				}).val();

				myDateInizio = datainizio.split("/");
				var newDatei = myDateInizio[1] + "," + myDateInizio[0] + "," + myDateInizio[2];

				var newDataInizio = new Date(newDatei).getTime();
				var todaysDate = new Date();
				todaysDate.setHours(0, 0, 0, 0);

				myDateFine = datafine.split("/");
				var newDatef = myDateFine[1] + "," + myDateFine[0] + "," + myDateFine[2];
				var newDataFine = new Date(newDatef).getTime();

				if (newDataInizio >= todaysDate) {
					$("#datainizio").removeClass("fielderror");

					if (newDataInizio > newDataFine) {
						$("#datainizio").addClass("fielderror");
						$("#datafine").addClass("fielderror");
						$("#datafine").blur();
						$("#myModal").modal();
					} else {
						arrayOrari = new Array();
						$("#datainizio").removeClass("fielderror");
						$("#datafine").removeClass("fielderror");
						$("#orariM").empty();
						var day;
						for (var d = new Date(newDatei); d <= new Date(newDatef); d.setDate(d.getDate() + 1)) {
							switch (d.getDay()) {
								case 0:
									day = "Lunedi";
									break;
								case 1:
									day = "Martedi";
									break;
								case 2:
									day = "Mercoledi";
									break;
								case 3:
									day = "Giovedi";
									break;
								case 4:
									day = "Venerdi";
									break;
								case 5:
									day = "Sabato";
									break;
								case 6:
									day = "Domenica";
							}
							var mese = d.getMonth() + 1;
							arrayOrari.push(d.getDate().toString() + mese.toString() + d.getFullYear().toString());
							$("#orariM").append("<div class=\"row \"><div id=\"divData" + d.getDate() + mese + d.getFullYear() + "\" class=\"col-md-3 orario\"><p day=\"" + day + "\" date=\"" + d.getDate() + "\" mounth=\"" + mese + "\" year=\"" + d.getFullYear() + "\">" + day + " " + d.getDate() + "/" + mese + "/" + d.getFullYear() + "</p></div><div class=\"col-md-1\"><a class=\"glyphicon glyphicon-plus-sign spanAdd \"></a></div><div class=\"col-md-8 orariDiv \"></div></div></br>");

						}
						$("#orarimodal").modal({
							backdrop: 'static',
							keyboard: false
						});




					}

				} else {
					$("#datainizio").addClass("fielderror");
					$("#todaysDateModal").modal();
				}
			}
		});

		$(document).on('click', '.spanAdd', function () {

			$(this).parent().parent().find(".orariDiv").append("<div class=\"input-group col-md-3 clockpicker \"  data-autoclose=\"true\"><span class=\"input-group-addon\"><span class=\"glyphicon glyphicon-time\"></span></span><input type=\"text\" class=\"form-control ora\" value=\"21:30\"><span class=\"input-group-addon removeOrario\" style=\"color:red;\"><span class=\"glyphicon glyphicon-remove\"></span></span></div>");
			$(this).parent().parent().find(".orariDiv").css('display', 'inline-flex');
		});

		$(document).on('click', '.clockpicker', function () {
			$(this).clockpicker({
				donetext: 'Done'
			});
		});

		$(document).on('click', '.removeOrario', function () {
			$(this).parent().remove();
		});

		$('#orariClose').click(function () {

		});

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

						// console.log('ora');
						// console.log($(this).find('.ora').val());

					}
				});
				console.log(orarioO);
				if (orarioO.orari.length > 0) {
					orari.push(orarioO);
				}
				// console.log($('#divData' + arrayOrari[i]).find('p').text());//prendere la data 


			}
			$('#orari').empty();
			for (i = 0; i < orari.length; i++) {
				$('#orari').append("<span class=\"spanDay\">" + orari[i].giornoSettimana + " " + orari[i].day + "/" + orari[i].mounth + "/" + orari[i].year + "</span>");

				for (o = 0; o < orari[i].orari.length; o++) {

					$('#orari').append("<span class= \"spanOra\">" + orari[i].orari[o] + "</span>");
				}
				$('#orari').append('</br>');
			}
		});
	});
</script>

<div id="block">

	<div class="btn-group-vertical inlinea col-sm-4 col-md-4" id="leftdiv">
		<button type="button" class="btn " style="visibility: hidden; text-align: center;" id="buttonadd" data-toggle="modal" data-target="#fileModal">
			<span id="padd" class="glyphicon glyphicon-plus" style="color:white;"></span>
		</button>
		<button type="button" class="btn " style="visibility: hidden; text-align: center;" id="buttonhide">
			<span id="phide" style="color:white; display:none; transition-duration: 0.3s; ">FILM </span>
			<span id="spanhide" class="glyphicon glyphicon-chevron-right" style="color:white"></span>
		</button>
		<a href="http://localhost/cinema/index.php/modifica">
			<button type="button" class="btn " style="visibility: hidden; text-align: center;" id="buttonhidemodifica">
				<span id="pmodifica" style="color:white; display:none; transition-duration: 0.3s;">MODIFICA </span>
				<span id="spanmodifica" class="glyphicon glyphicon-chevron-right" style="color:white"></span>
			</button>
		</a>
		<div class="btn-group-vertical inlinea  " id="filmdiv" style="background-color: black">
			<button class="btn btn-danger " type="button" id="newfilm" data-toggle="modal" data-target="#fileModal">
				<span class="glyphicon glyphicon-plus" style="color:black; ">INSERISCI NUOVO FILM</span>
			</button>
			{{#film}}

			<button class="btn btn-danger filmdropdown" type="button" data-toggle="collapse" data-target="#{{id}}">{{titolo}}</button>

			<div id="{{id}}" class="collapse">

				<div class="well" style="background-color: black;     margin-bottom: 0px">
					<p style="text-align:center; color:white"> {{titolo}}</p>
				</div>

				<img src="{{url}}" class="imgfilm" titolo="{{titolo}}" style="min-width: 433px"></img>

			</div>

			{{/film}}
		</div>
	</div>
	<div class="col-sm-2 col-md-2" id="centerdiv">
	</div>
	<div id="rightdiv" class="col-sm-6 col-md-4" style="text-align: center;">
		<div id="imagediv">
		</div>
		<div id="formdiv" style="visibility: hidden">
			<form>
				<div class="form-group">
					<label id="labeltitolo"></label>
				</div>
				<div class="form-group" id="myForm">

					<label for="comment">data inizio</label>
					<input id="datainizio" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" required>

					<label for="comment">data fine</label>
					<input id="datafine" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" required>
					<div id="orari" style="text-align: left;">

					</div>
					<label for="comment">durata</label>
					<textarea id="durata" class="form-control" rows="1"> </textarea>

					<label for="comment">attori</label>
					<textarea id="attori" class="form-control" rows="3"> </textarea>

					<label for="comment">regia</label>
					<textarea id="regia" class="form-control" rows="3"> </textarea>

					<label for="comment">descrizione</label>
					<textarea type="textarea" id="desc" class="form-control" rows="5"> </textarea>

				</div>
				<button class="btn btn-default" id="Submit">Submit</button>
			</form>

			<div class="modal fade" id="fileModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
							<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="file-loading">
								<input id="input-b9" type="file" class="file" name="image" multiple type="file" required>
							</div>
							<div>
								<label for="comment form-control">TITOLO</label>
								<input id="title" type="text" class="form-control" required></input>
							</div>
							<div id="kartik-file-errors"></div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary" data-dismiss="modal" id="closeModal">Close</button>
							<button type="button" class="btn btn-primary" title="Your custom upload logic" id="saveModal">Save</button>
						</div>
					</div>
				</div>
			</div>

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
			<div id="todaysDateModal" class="modal fade">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header" style="background-color: rgba(128, 0, 0, 0.7);">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">ERRORE SULLE DATE!</h4>
						</div>
						<div class="modal-body">
							<p>La data di inizio del film non può essere prima della data di oggi!</p>
						</div>
					</div>
				</div>
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