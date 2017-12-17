
		<style type="text/css">
			#titolo{
				text-align: center;
			}
			#lib{
				background-color: white;
				opacity: 0.8;
			}
			button{
				width: 100%;

			}


		</style>
		<div id='lib' class='container-fluid'>
		{{#libro}}
		<div id='titolo'>
		<h1>{{titolo}}</h1>
		</div>
		<br>
		<p>isbn: {{isbn}}</p>	
		<br>
		<p>casa editrice: {{casa_edit}}</p>
		<br>
	
		<p>RIASSUNTO: {{abstract}}</p>
		
		{{/libro}}
		<p>AUTORI</p>
		<ol>
			{{#autore}}
			{{#0}}
			<li>{{nome}} {{cognome}}</li>
			{{/0}}
			{{/autore}}
		</ol>
		</div>
	
		<div>
		<button type='button' class='btn btn-primary'  onclick="location.href='http://127.0.0.1/slim/libri'"> torna a i libri</button>
		<button type='button' class='btn btn-primary' onclick="location.href='http://127.0.0.1/slim/autori'"> dai un occhio alla lita degli autori</button>
		</div>