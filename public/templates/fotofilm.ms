
<script type="text/javascript">
	$(document).ready(function(){
		var url;
		var titolo;

		$("img").click(function(){
			 url=$(this).attr("src");
			 titolo =$(this).attr("titolo");
			 
       $("#imagediv").html("<img  src="+ url +"></img>");
       $("#formdiv").css("visibility","show");
       $("#labeltitolo").text(titolo);
   });
	$("#Submit").click(function(){
		
		 var dataString = 'titolo='+ titolo + '&url='+ url ;
		$.ajax({
		  type: "POST",
		  url: "action_admin",
		 // data: { titolo: titolo, url: url  },
		  data: dataString,
			cache: false,
			success: function(result){
			alert(result);
		
					}
					});
				});

			});
</script>

<div ip="block" class="container-fluid">
<div  class="btn-group-vertical inlinea col-sm-4" id="leftdiv">

{{#film}}

<button class="btn btn-danger " type="button" data-toggle="collapse" data-target="#{{id}}">{{titolo}}</button>


<div id="{{id}}" class="collapse">

	<img src="{{url}}" id="imgfilm" class="img immage" titolo="{{titolo}}" style="min-width: 200px"></img>
	<div class="well" style="background-color: black">
	<p style="padding-left: 200px ; color:white" >      {{titolo}}</p>
		
	</div>

</div>

{{/film}}
</div>
<div id="rightdiv" class="col-sm-6" style="text-align: center;">
<div id="imagediv">
	
</div>

<div id="formdiv" style="visibility: hidden">
<form >
  <div class="form-group">
    <label id="labeltitolo" ></label>
    
  </div>
  <div class="form-group">
    <label for="comment">descrizione</label>
    <textarea class="form-control" rows="5"> </textarea>
  </div>
  <div class="checkbox">
    
  </div> 
  <button class="btn btn-default" id="Submit">Submit</button>
</form>
</div>	
</div>
</div>