
<script type="text/javascript">
	$(document).ready(function(){

		$("img").click(function(){

			 var a=$(this).attr("src");
       $("#rightdiv").html("<img src="+ a +"></img>");});

	});
</script>

<div ip="block">
<div  class="btn-group-vertical inlinea" id="leftdiv">

{{#film}}

<button class="btn btn-danger " type="button" data-toggle="collapse" data-target="#{{id}}">{{titolo}}</button>


<div id="{{id}}" class="collapse">

	<img src="{{url}}" id="imgfilm" class="img immage" style="min-width: 200px"></img>
	<div class="well" style="background-color: black">
	<p style="padding-left: 200px ; color:white" >      {{titolo}}</p>
		
	</div>

</div>

{{/film}}
</div>
<div id="rightdiv" style="display: inline-flex;">

	
</div>
</div>