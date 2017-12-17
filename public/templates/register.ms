<html>
<head>
</head>
<body>
{{#title}}<h3>{{title}}</h3>{{/title}}
<form action="register" method="post">
<input type="text" name="name"></input>
<input type="submit" value="Invia"></input>
</form>
<ul>
	{{#list}}
		<li>{{{list}}}</li>
	{{/list}}
</ul>
</body>
</html>