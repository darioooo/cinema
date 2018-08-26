<script src="../js/jquery-2.2.2.js"></script>

<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
    body {
        background-color: darkgrey;
        padding-top: 70px;
        padding-bottom: 70px;
        font-family: 'Ubuntu', sans-serif;
    }

    form {
        width: 500px;
        margin: 0 auto;
        background-color: rgb(209, 209, 209);
        border-radius: 10px;
        box-shadow: 2px 2px 2px 2px grey;
        margin-top: 70px;
        padding: 15px;
        text-align: center;
    }

    input[type=text],
    input[type=password] {
        width: 100%;
        padding: 12px 20px;
        margin: 8px 0;
        display: inline-block;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    button {
        background-color: rgb(128, 0, 0);
        color: white;
        padding: 14px 20px;
        margin: 8px 0;
        border: none;
        border-radius: 3px;
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

    @media screen and (max-width: 300px) {
        span.psw {
            display: block;
            float: none;
        }
        .cancelbtn {
            width: 100%;
        }
    }

    #forgot-psw {
        text-decoration: unset;
        color: black;
        font-size: 20px;
        font-weight: 500;
        transition: font-size 2s, color 2s;
    }

    #forgot-psw:hover {
        font-size: 30px;
        color: rgb(128, 0, 0);
    }
</style>
<script>
    $(document).ready(function () {
        $('#submit').click(function () {
            var username = $('#name').val();
            var password = $('#psw').val();
            console.log(username);
            // alert(username);
            $.ajax({
                type: "POST",
                url: "autenticazione",
                data: "username=" + username + "&password=" + password,
                cache: false,
                success: function (result) {

                    var obj = JSON.parse(result);
                    // alert(obj["status"]);
                    switch (obj["status"]) {
                        case "error":
                            // alert("username o password errate");
                            break;
                        case "success":
                            window.location.assign(
                                "http://127.0.0.1/cinema/index.php/admin");
                            break;
                        default:
                            console.log("MACHECAZZ!!!");
                            text = "I have never heard of that fruit...";
                    }
                },
                error: function (xhr, ajaxOptions, thrownError) {
                    // alert(xhr.status);
                    // alert(thrownError);
                }
            });
        });
    });
</script>

<div>
    <div class="imgcontainer">
        <img src="../CinemaImages/CINEMA.png" alt="Avatar" class="avatar">
    </div>
    <form>
        <div class="container">
            <input type="text" placeholder="Enter Username" name="uname" id="name" required>
            <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
            <label for="psw">
                <a href="http://127.0.0.1/cinema/index.php/recupero" id="forgot-psw">Password Dimenticata?</b>
            </label>
            <button id="submit">Login</button>
        </div>
    </form>
</div>