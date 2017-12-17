



<style type="text/css">
	#btnstart{
		 background-color: Transparent;
		   background-repeat:no-repeat;
            border: none;
            cursor:pointer;
            overflow: hidden;
     text-align: center;
	}
	table{
		background-color: white;
		opacity: 0.8;
	}
		#myInput {
    background-image: url('/css/searchicon.png'); /* Add a search icon to input */
    background-position: 10px 12px; /* Position the search icon */
    background-repeat: no-repeat; /* Do not repeat the icon image */
    width: 100%; /* Full-width */
    font-size: 16px; /* Increase font-size */
    padding: 12px 20px 12px 40px; /* Add some padding */
    border: 1px solid #ddd; /* Add a grey border */
    margin-bottom: 12px; /* Add some space below the input */
}


</style>
<script type="text/javascript">
function myFunction() {
  // Declare variables 
  var input, filter, table, tr, td, i;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    } 
  }
}
</script>
<center>
<img src="http://127.0.0.1/slim/image/logo b.png">
</center>
<div class='container-fluid' id='tab_lib' value=''>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for names..">

<table class="table table-condensed table-hover table-striped">
	<thead>
		<tr class="header"><th>Titolo</th><th>isbn</th><th>Casa editrice</th><th>autore</th><th>azioni</th>
		{{#libro}}
		<tr>
			<td data-column-id="{{titolo}}">{{titolo}}</td>
			<td data-column-id="{{isbn}}">{{isbn}}</td>
			<td data-column-id="{{casa_edit}}">{{casa_edit}}</td>
			<td >
			<button type="button" class="btn btn-primary" data-toggle="collapse" data-target="#{{titolo}}">autori</button>
			
			  <div id="{{titolo}}" class="collapse">
			 <ol class="list-group">
			  {{#autore}}
			  {{#0}}
			  <li class="list-group-item"><a class='list-group active' href="http://127.0.0.1/slim/autori/{{id_aut}}">{{nome}} {{cognome}}</a></li>
			  {{/0}}
    		{{/autore}}
    		</ol>
    		</div>
			</td>
			<td data-column-id="{{id_lib}}"><a href='libri/{{id_lib}}' class="btn btn-primary">leggi</a></td>
			<td data-column-id="{{id_lib}}"><a href='update/{{id_lib}}' class="btn btn-primary">modifica</a></td>
			<td data-column-id="{{id_lib}}"><a href='delete/{{id_lib}}'><img src="http://127.0.0.1/slim/image/cestino.png" class="navbar-brand"></a></td>
		</tr>
		{{/libro}}
		</thead>
		</table>
		
</div>