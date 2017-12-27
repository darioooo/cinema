<div class="row jumbotron filmjumbo">
	<div class="col-xs-0 col-md-2 col-lg-2">

	</div>
	<div class="col-xs-12 col-md-4 col-lg-4">
		<div class="col-xs-12 col-md-11 col-lg-11 jumbotron contentjumbo">
			{{#film}}
			<img src="http://localhost/cinema/{{immagine}}" id="imgfilm" style="width:100%;" /> {{/film}}
		</div>
		<div class="col-xs-0 col-md-0 col-lg-0">
		</div>
	</div>
	<div class="col-xs-0 col-md-6 col-lg-6 clearfix visible-md-block visible-lg-block jumbotron contentjumbo">
		{{#film}} {{#titolo}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Nome: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{titolo}}</p>
			</div>
		</div>
		{{/titolo}} {{#descrizione}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Descrizione: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{descrizione}}</p>
			</div>
		</div>
		{{/descrizione}} {{/film}} {{#scheda}} {{#regia}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Regia: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{regia}}</p>
			</div>
		</div>
		{{/regia}} {{#attori}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Attori: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{attori}}</p>
			</div>
		</div>
		{{/attori}} {{#durata}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Durata: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{durata}}</p>
			</div>
		</div>
		{{/durata}} {{#genere}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Genere: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{genere}}</p>
			</div>
		</div>
		{{/genere}} {{#paese}}
		<div class="row">
			<div class="col-xs-3 col-md-3 col-lg-3">
				<p style="font-weight: bold;">Paese: </p>
			</div>
			<div class="col-xs-9 col-md-9 col-lg-9">
				<p style="word-wrap: break-word;">{{paese}}</p>
			</div>
		</div>
		{{/paese}} {{/scheda}}
	</div>
	<div class="row">
		<div class="col-xs-0 col-md-4 col-lg-4">
		</div>

		<div class="col-xs-12 col-md-4 col-lg-4 clearfix visible-sm-block ">
			<div class="col-xs-1 col-md-1 col-lg-1">
			</div>
			<div class="col-xs-10 col-md-10 col-lg-10 jumbotron contentjumbo">
				{{#film}} {{#titolo}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Nome: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{titolo}}</p>
					</div>
				</div>
				{{/titolo}} {{#descrizione}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Descrizione: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{descrizione}}</p>
					</div>
				</div>
				{{/descrizione}} {{/film}} {{#scheda}} {{#regia}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Regia: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{regia}}</p>
					</div>
				</div>
				{{/regia}} {{#attori}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Attori: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{attori}}</p>
					</div>
				</div>
				{{/attori}} {{#durata}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Durata: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{durata}}</p>
					</div>
				</div>
				{{/durata}} {{#genere}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Genere: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{genere}}</p>
					</div>
				</div>
				{{/genere}} {{#paese}}
				<div class="row">
					<div class="col-xs-3 col-md-3 col-lg-3">
						<p style="font-weight: bold;">Paese: </p>
					</div>
					<div class="col-xs-9 col-md-9 col-lg-9">
						<p style="word-wrap: break-word;">{{paese}}</p>
					</div>
				</div>
				{{/paese}} {{/scheda}}
			</div>
			<div class="col-xs-1 col-md-1 col-lg-1">
			</div>
		</div>
		<div class="col-xs-0 col-md-4 col-lg-4">
		</div>
	</div>