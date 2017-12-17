
		<script type="text/javascript">
		$(document).ready(function(){
			if($('#lib').attr("value") == "1")
			{
				
				$('#lib').attr("href", '#' );
			}
		});

		</script>

		<style type="text/css">
			#titolo{
				text-align: center;
			}
			#aut{ background-color: white; 
				opacity: 0.8;
			}
			button{
				width: 100%;

			}

			</style>
		<div id='aut' class='container-fluid'>
		{{#autori}}
		<h1 id='titolo'>{{nome}}</h1>
		<br>
		<p>cognome: {{cognome}}</p>	
		<br>
		<p>nazionalità: {{naz}}</p>
		<br>
		{{/autori}}
		<p>libri</p>
		<ol>
		{{#libro}}
		{{#0}}
		<li>
		<a href="http://127.0.0.1/slim/libri/{{id_lib}}" id='lib' value="{{err}}">{{titolo}}</a>
		<br>
		</li>
		{{/0}}
		{{/libro}}
		</ol>

		</div>
		<div>
		<button type='button' class='btn btn-primary' onclick="location.href='http://127.0.0.1/slim/autori'"> torna agli autori</button>
		<button type='button' class='btn btn-primary' onclick="location.href='http://127.0.0.1/slim/autori'"> dai un occhio alla lista dei libri</button>
		</div>