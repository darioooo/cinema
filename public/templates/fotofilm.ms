<script type="text/javascript">
	$(document).ready(function () {
		$('.datepicker').datepicker();
		var url;
		var titolo;
		var descrizione;
		var attori;
		var regia;

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

			});
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
		});

	}
			});
		});
	});
</script>

<div ip="block" class="container-fluid">
	<div class="btn-group-vertical inlinea col-sm-4" id="leftdiv">

		{{#film}}

		<button class="btn btn-danger " type="button" data-toggle="collapse" data-target="#{{id}}">{{titolo}}</button>


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

					<div id="formdiv" style="visibility: hidden">
						<form>
							<div class="form-group">
								<label id="labeltitolo"></label>

							</div>
							<div class="form-group" id="myForm">

								<label for="comment">data inizio</label>
								<input class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1">


								<label for="comment">data fine</label>
								<input class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1">

								<label for="comment">durata</label>
								<textarea id="durata" class="form-control" rows="1"> </textarea>

								<label for="comment">attori</label>
								<textarea id="attori" class="form-control" rows="3"> </textarea>

								<label for="comment">regia</label>
								<textarea id="regia" class="form-control" rows="3"> </textarea>

								<label for="comment">descrizione</label>
								<textarea id="desc" class="form-control" rows="5"> </textarea>

							</div>
							<div class="checkbox">

							</div>
							<button class="btn btn-default" id="Submit">Submit</button>
						</form>
					</div>
				</div>
		</div>