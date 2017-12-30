<script type="text/javascript">

	$(document).ready(function () {

		var url;
		var titolo;
		var descrizione;
		var attori;
		var regia;
		var datainizio, datafine;

		$('.datepicker').datepicker();
		event.preventDefault();
		$("img").click(function () {
			url = $(this).attr("src");
			titolo = $(this).attr("titolo");

			$("#imagediv").html("<img  src=" + url + "></img>");
			$("#formdiv").css("visibility", "show");
			$("#labeltitolo").text(titolo);
		});
		$("#Submit").click(function () {



			$("form").on("submit", function (event) {
				event.preventDefault();
				console.log($(this).serialize());
				console.log(event);
				descrizione = $("#desc").val();
				attori = $("#attori").val();
				regia = $("#regia").val();

				datainizio = $("#datainizio").val();
				datafine = $("#datafine").val();

				if (datainizio > datafine) {
					$("#datainizio").addClass("fielderror");
					$("#datafine").addClass("fielderror");
					$("#myModal").modal();
				}

				else {
					var dataString = 'titolo=' + titolo + '&url=' + url + '&descrizione=' + descrizione + '&attori=' + attori + '&regia=' + regia;
					$.ajax({
						type: "POST",
						url: "action_admin",
						// data: { titolo: titolo, url: url  },
						data: dataString,
						cache: false,
						success: function (result) {
							alert(result);
						}
					});
				}
			});

		});
	});

</script>

<div id="block" class="container-fluid">
	<div class="btn-group-vertical inlinea col-sm-4" id="leftdiv">
		{{#film}}

		<button class="btn btn-danger filmdropdown" type="button" data-toggle="collapse" data-target="#{{id}}">{{titolo}}</button>

		<div id="{{id}}" class="collapse">
			<img src="{{url}}" id="imgfilm" class="img immage" titolo="{{titolo}}" style="min-width: 200px"></img>
			<div class="well" style="background-color: black">
				<p style="padding-left: 200px ; color:white"> {{titolo}}</p>
			</div>
		</div>
		{{/film}}
	</div>
	<div id="rightdiv" class="col-sm-6" style="text-align: center;">
		<div id="imagediv">
		</div>
		<div id="formdiv" style="visibility: hidden">
			<form>
				<div class="form-group">
					<label id="labeltitolo"></label>
				</div>
				<div class="form-group" id="myForm">

					<label for="comment">data inizio</label>
					<input id="datainizio" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" required />

					<label for="comment">data fine</label>
					<input id="datafine" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" required />

					<label for="comment">durata</label>
					<input type="number" id="durata" class="form-control" rows="1" required />

					<label for="comment">attori</label>
					<input type="text" id="attori" class="form-control" rows="3" required />

					<label for="comment">regia</label>
					<input type="text" id="regia" class="form-control" rows="3" required />

					<label for="comment">descrizione</label>
					<textarea type="textarea" id="desc" class="form-control" rows="5" required> </textarea>
				</div>
				<div class="checkbox">

				</div>
				<button class="btn btn-default" id="Submit">Submit</button>
			</form>
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
	</div>
</div>