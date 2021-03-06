<script type="text/javascript">
	$(document).ready(function () {
		var url;
		var file;
		var titolo;
		var descrizione;
		var attori;
		var regia;
		var data_inizio, data_fine;
		var lunedì = "";
		var martedì = "";
		var mercoledì = "";
		var giovedì = "";
		var venerdì = "";
		var sabato = "";
		var domenica = "";

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

			$(".lunedì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					lunedì += $(this).val() + " | ";
				}
			});

			$(".martedì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					martedì += $(this).val() + " | ";
				}
			});

			$(".mercoledì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					mercoledì += $(this).val() + " | ";
				}
			});

			$(".venerdì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					venerdì += $(this).val() + " | ";
				}
			});

			$(".sabato").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					sabato += $(this).val() + " | ";
				}
			});

			$(".domenica").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					domenica += $(this).val() + " | ";
				}
			});
			alert(venerdì);
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
						'&data_fine=' + datafine + '&lunedì=' + lunedì + '&martedì=' + martedì + '&mercoledì=' +
						mercoledì + '&venerdì=' + venerdì + '&sabato=' + sabato + '&domenica=' + domenica;
					if (descrizione != null) {
						var dataString = dataString + '&descrizione=' + descrizione;
					}
					if (attori != null) {
						var dataString = dataString + '&attori=' + attori;
					}
					if (regia != null) {
						var dataString = dataString + '&regia=' + regia;
					}

					$.ajax({
						type: "POST",
						dataType: 'script',
						url: "action_image",
						// data: { titolo: titolo, url: url  },
						data: file,
						cache: false,
						success: function (result) {
							alert(result);
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
							alert(result);
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
					<div id="orari">
						<div id="venerdì">
							<div class="col-md-5" id="times">
								<h4 id="timesLabels" for="comment">VENERDÌ</h4>
							</div>
							<div class="col-md-7" id="checkboxes">
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control venerdì" value="17.00" rows="1">17.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control venerdì" value="17.30" rows="1">17.30</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control venerdì" value="21.00" rows="1">21.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control venerdì" value="21.30" rows="1">21.30</label>
							</div>
						</div>

						<div id="sabato">
							<div class="col-md-5" id="times">
								<h4 id="timesLabels" for="comment">SABATO</h4>
							</div>
							<div class="col-md-7" id="checkboxes">
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control sabato" value="17.00" rows="1">17.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control sabato" value="17.30" rows="1">17.30</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control sabato" value="21.00" rows="1">21.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control sabato" value="21.30" rows="1">21.30</label>
							</div>
						</div>

						<div id="domenica">
							<div class="col-md-5" id="times">
								<h4 id="timesLabels" for="comment">DOMENICA</h4>
							</div>
							<div class="col-md-7" id="checkboxes">
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control domenica" value="17.00" rows="1">17.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control domenica" value="17.30" rows="1">17.30</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control domenica" value="21.00" rows="1">21.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control domenica" value="21.30" rows="1">21.30</label>
							</div>
						</div>

						<div id="lunedì">
							<div class="col-md-5" id="times">
								<h4 id="timesLabels" for="comment">LUNEDÌ</h4>
							</div>
							<div class="col-md-7" id="checkboxes">
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control lunedì" value="17.00" rows="1">17.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control lunedì" value="17.30" rows="1">17.30</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control lunedì" value="21.00" rows="1">21.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control lunedì" value="21.30" rows="1">21.30</label>
							</div>
						</div>

						<div id="martedì">
							<div class="col-md-5" id="times">
								<h4 id="timesLabels" for="comment">MARTEDÌ</h4>
							</div>
							<div class="col-md-7" id="checkboxes">
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control martedì" value="17.00" rows="1">17.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control martedì" value="17.30" rows="1">17.30</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control martedì" value="21.00" rows="1">21.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control martedì" value="21.30" rows="1">21.30</label>
							</div>
						</div>

						<div id="mercoledì">
							<div class="col-md-5" id="times">
								<h4 id="timesLabels" for="comment">MERCOLEDÌ</h4>
							</div>
							<div class="col-md-7" id="checkboxes">
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control mercoledì" value="17.00" rows="1">17.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control mercoledì" value="17.30" rows="1">17.30</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control mercoledì" value="21.00" rows="1">21.00</label>
								<label class="radio-inline">
									<input type="checkbox" id="datafineCheckbox" class="form-control mercoledì" value="21.30" rows="1">21.30</label>
							</div>
						</div>
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