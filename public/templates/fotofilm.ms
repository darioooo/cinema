<script type="text/javascript">

	$(document).ready(function () {
		var url;
		var titolo;
		var descrizione;
		var attori;
		var regia;
		var data_inizio, data_fine;

		$('.datepicker').datepicker();
		event.preventDefault();
		$(".filmdropdown").click(function(){
			$("#imgfilm").fadeIn(3000);
		});

		$("img").click(function () {
			url = $(this).attr("src");
			titolo = $(this).attr("titolo");
			$("#imagediv").html("<img  src=" + url + "></img>");
			$(".formdiv").css("visibility", "visible");
			$("#labeltitolo").text(titolo);
			$("#filmdiv").hide('1000');
			$("#buttonhide").css("visibility", "show");

		});

		$("#datafine").change(function (){
			
			var datainizio = $("#datainizio").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
			var datafine = $("#datafine").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
			var datai=$("#datainizio").datepicker('getDate');
			var dataf=$("#datafine").datepicker('getDate');
			if(datainizio < datafine)
				{
					console.log("ciaooo");

				}
			

		});
		
			$("form").on("submit", function (event) {
				event.preventDefault();
				descrizione = $("#desc").val();
				attori = $("#attori").val();
				regia = $("#regia").val();
				var datainizio = $("#datainizio").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
				var datafine = $("#datafine").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
				 console.log(datainizio);
				data_inizio = $("#datainizio").val();
				data_fine = $("#datafine").val();

		$("form").on("submit", function (event) {
			event.preventDefault();
			descrizione = $("#desc").val();
			attori = $("#attori").val();
			regia = $("#regia").val();
			data_inizio = $("#datainizio").val();
			data_fine = $("#datafine").val();

				else {
					$("#datainizio").removeClass("fielderror");
					$("#datafine").removeClass("fielderror");
					var dataString = 'titolo=' + titolo + '&url=' + url + '&descrizione=' 
					+ descrizione + '&attori=' + attori + '&regia=' + regia + '&data_inizio=' + datainizio
					+ '&data_fine=' + datafine;
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


</script>

<div id="block" class="container-fluid">
	<div class="btn-group-vertical inlinea col-sm-4" id="leftdiv">
		
			<span id="buttonhide" class="glyphicon glyphicon-align-justify" aria-hidden="false" style="visibility: hidden"></span>
			<div class="btn-group-vertical inlinea  " id="filmdiv">
		
		{{#film}}
		<button class="btn btn-danger filmdropdown" type="button" data-toggle="collapse" data-target="#{{id}}">{{titolo}}</button>

		<div id="{{id}}" class="collapse">
			<img src="{{url}}" id="imgfilm" class="img immage" titolo="{{titolo}}" style="min-width: 200px"></img>
			<div class="well" style="background-color: black">
				<p style="padding-left: 200px ; color: white"> {{titolo}}</p>
			</div>
		</div>
		{{/film}}
		</div>
	</div>
	<div id="rightdiv" class="col-sm-6" style="text-align: center;">
		<div id="imagediv">
		</div>
		<div class="formdiv" style="visibility: hidden;">
			<form>
				<div class="form-group">
					<label id="labeltitolo"></label>
				</div>
				<div class="form-group" id="myForm">
					<label for="comment">data inizio</label>
					<input id="datainizio" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" required>
					<label for="comment">data fine</label>
					<input id="datafine" class="datepicker form-control " data-date-format="dd/mm/yyyy" rows="1" required>
					<label for="comment">durata</label>
					<textarea id="durata" class="form-control" rows="1" required> </textarea>
					<label for="comment">attori</label>
					<textarea id="attori" class="form-control" rows="3" required> </textarea>
					<label for="comment">regia</label>
					<textarea id="regia" class="form-control" rows="3" required> </textarea>
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