<script type="text/javascript">

	$(document).ready(function () {

		var url;
		var titolo;
		var descrizione;
		var attori;
		var regia;
		var data_inizio, data_fine;
		var lunedì="";
		var martedì="";
		var mercoledì="";
		var giovedì="";
		var venerdì="";
		var sabato="";
		var domenica="";

		$('.datepicker').datepicker();
		event.preventDefault();
		$(".imgfilm").click(function () {
			url = $(this).attr("src");
			titolo = $(this).attr("titolo");

			$("#imagediv").html("<img  src=" + url + "></img>");
			$("#formdiv").css("visibility", "visible");
			$("#labeltitolo").text(titolo);
			$("#filmdiv").toggle("slide");
			
			
					$("#buttonhide").css("visibility", "visible");
					$("#rightdiv").removeClass('col-sm-6 col-md-4').addClass('col-sm-10 col-md-11');
					$("#centerdiv").removeClass('col-sm-2 col-md-2').addClass('col-sm-1 col-md-1');
					$("#leftdiv").removeClass('col-sm-4 col-md-4').addClass(' leftdivbg');
				

		});
		
		$('#buttonhide').click(function () {
			
			$("#buttonhide").css("visibility", "hidden");
			$("#filmdiv").toggle("slide");
			$("#rightdiv").removeClass('col-sm-10 col-md-11').addClass('col-sm-6 col-md-4');
			$("#centerdiv").removeClass('col-sm-1 col-md-1').addClass('col-sm-2 col-md-2');
			$("#leftdiv").removeClass(' leftdivbg').addClass('col-sm-4 col-md-4');
		});
		$(".filmdropdown").click(function () {
			$("#imgfilm").fadeIn(3000);
		});

		$("#datafine").change(function () {
			var datainizio = $("#datainizio").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
			var datafine = $("#datafine").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
			var datai = $("#datainizio").datepicker('getDate');
			var dataf = $("#datafine").datepicker('getDate');
			if (datainizio < datafine) {
				console.log("ciaooo");
			}
		});

		$("form").on("submit", function (event) {
			event.preventDefault();
			descrizione = $("#desc").val();
			attori = $("#attori").val();
			regia = $("#regia").val();

			$(".lunedì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					lunedì += $(this).val() + "/";
				}
			});
			
			$(".martedì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					martedì += $(this).val() + "/";
				}
			});

			$(".mercoledì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					mercoledì += $(this).val() + "/";
				}
			});

			$(".venerdì").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					venerdì += $(this).val() + "/";
				}
			});

			$(".sabato").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					sabato += $(this).val() + "/";
				}
			});

			$(".domenica").each(function () {
				var ischecked = $(this).is(":checked");
				if (ischecked) {
					domenica += $(this).val() + "/";
				}
			});
			alert(venerdì);
			var datainizio = $("#datainizio").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
			var datafine = $("#datafine").datepicker({ dateFormat: "yyyy-mm-dd" }).val();
			console.log(datainizio);
			data_inizio = $("#datainizio").val();
			data_fine = $("#datafine").val();

			if (data_inizio > data_fine) {
				$("#datainizio").addClass("fielderror");
				$("#datafine").addClass("fielderror");
				$("#myModal").modal();
			}

			else {
				$("#datainizio").removeClass("fielderror");
				$("#datafine").removeClass("fielderror");
			
				var dataString = 'titolo=' + titolo + '&url=' + url  + '&data_inizio=' + datainizio
					+ '&data_fine=' + datafine + '&lunedì=' + lunedì+ '&martedì=' + martedì + '&mercoledì=' 
					+ mercoledì + '&venerdì=' +venerdì + '&sabato=' + sabato + '&domenica=' + domenica;
					if (descrizione!= null)
					{
					var dataString=dataString+'&descrizione='+ descrizione;
					}
					if(attori!= null)
					{ 
						var dataString=dataString + '&attori=' + attori ;
					}
					if(regia!=null)
					{
						var dataString=dataString+ '&regia=' + regia;
					}
					lunedì="";
					martedì="";
					mercoledì="";
					giovedì="";
					venerdì="";
					sabato="";
					domenica="";	
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
		});
	});

</script>

<div id="block" >
	<div class="btn-group-vertical inlinea col-sm-4 col-md-4" id="leftdiv">

		<input type="button" style="visibility: hidden" id="buttonhide"></input>
		<div class="btn-group-vertical inlinea  " id="filmdiv" style="background-color: black">
			<button class="btn btn-danger " type="button" id="newfilm"  >INSERISCI NUOVO FILM</button>
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
						<label for="comment">venerdì</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control venerdì" value="17.00" rows="1" >17.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control venerdì" value="17.30" rows="1" >17.30</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control venerdì" value="21.00" rows="1" >21.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control venerdì" value="21.30" rows="1" >21.30</label>
					</div>		
					
					<div id="sabato">
						<label for="comment">sabato</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control sabato" value="17.00" rows="1" >17.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control sabato" value="17.30" rows="1" >17.30</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control sabato" value="21.00" rows="1" >21.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control sabato" value="21.30" rows="1" >21.30</label>
					</div>
					
					<div id="domenica">
						<label for="comment">domenica</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control domenica" value="17.00" rows="1" >17.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control domenica" value="17.30" rows="1" >17.30</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control domenica" value="21.00" rows="1" >21.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control domenica" value="21.30" rows="1" >21.30</label>
					</div>

					<div id="lunedì">
						<label for="comment">lunedì</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control lunedì" value="17.00" rows="1" >17.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control lunedì" value="17.30" rows="1" >17.30</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control lunedì" value="21.00" rows="1" >21.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control lunedì" value="21.30" rows="1" >21.30</label>
					</div>

					<div id="martedì">
						<label for="comment">martedì</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control martedì" value="17.00" rows="1" >17.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control martedì" value="17.30" rows="1" >17.30</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control martedì" value="21.00" rows="1" >21.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control martedì" value="21.30" rows="1" >21.30</label>
					</div>

					<div id="mercoledì">
						<label for="comment">mercoledì</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control mercoledì" value="17.00" rows="1" >17.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control mercoledì" value="17.30" rows="1" >17.30</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control mercoledì" value="21.00" rows="1" >21.00</label>
						<label class="radio-inline"><input type="checkbox" id="datafine" class="form-control mercoledì" value="21.30" rows="1" >21.30</label>
					</div>
				</div>
					<label for="comment">durata</label>
					<textarea id="durata" class="form-control" rows="1" > </textarea>

					<label for="comment">attori</label>
					<textarea id="attori" class="form-control" rows="3" > </textarea>

					<label for="comment">regia</label>
					<textarea id="regia" class="form-control" rows="3" > </textarea>

					<label for="comment">descrizione</label>
					<textarea type="textarea" id="desc" class="form-control" rows="5" > </textarea>

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