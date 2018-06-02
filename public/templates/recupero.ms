<script src="http://127.0.0.1/cinema/js/jquery-2.2.2.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	body {
		background-color: rgb(209, 209, 209);
		padding-top: 70px;
		padding-bottom: 70px;
		font-family: 'Ubuntu', sans-serif;
	}



	form {

		border: 3px solid #f1f1f1;
	}

	input[type=text],
	input[type=email] {
		width: 100%;
		padding: 12px 20px;
		margin: 8px 0;
		display: inline-block;
		border: 1px solid #ccc;
		box-sizing: border-box;
	}

	button {
		background-color: #4CAF50;
		color: white;
		padding: 14px 20px;
		margin: 8px 0;
		border: none;
		cursor: pointer;
		width: 100%;
	}

	button:hover {
		opacity: 0.8;
	}

	.cancelbtn {
		width: auto;
		padding: 10px 18px;
		background-color: #f44336;
	}

	.imgcontainer {
		text-align: center;
		margin: 24px 0 12px 0;
	}

	img.avatar {
		width: 40%;

	}

	.container {
		padding: 16px;
	}

	span.psw {
		float: right;
		padding-top: 16px;
	}

	/* Change styles for span and cancel button on extra small screens */

	@media screen and (max-width: 300px) {
		span.psw {
			display: block;
			float: none;
		}
		.cancelbtn {
			width: 100%;
		}
	}
</style>
<script>
	$(document).ready(function () {
		$('#submit').click(function () {
			var mail = $('#mail').val();


			$.ajax({
				type: "POST",
				url: "mail",
				data: "mail=" + mail,
				cache: false,
				success: function (result) {

					var obj = JSON.parse(result);
					alert(obj["mail"]);
					switch (obj["status"]) {
						case "error":
							alert("username o password errate");
							break;
						case "success":
							alert("username o password errate");
							break;
						default:
							alert(result);
					}


					//window.location.assign("http://127.0.0.1/cinema/index.php/admin");

				},
				error: function (xhr, ajaxOptions, thrownError) {
					alert(xhr.status);
					alert(thrownError);
				}
			});

		});
	});

</script>

<div>

	<form>
		<div class="imgcontainer">
			<img src="../CinemaImages/CINEMA.png" alt="Avatar" class="avatar">
		</div>

		<div class="container">
			<label for="uname">
				<b>email</b>
			</label>
			<input type="text" placeholder="Enter Email" id="mail" required>


			<button id="submit">Login</button>

		</div>


	</form>

</div>