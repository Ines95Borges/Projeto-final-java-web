<!DOCTYPE html>
<html>
    <head>
        <title>Loja</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            *{
                box-sizing: border-box;
            }
            .col-1 {width: 8.33%;}
            .col-2 {width: 16.66%;}
            .col-3 {width: 25%;}
            .col-4 {width: 33.33%;}
            .col-5 {width: 41.66%;}
            .col-6 {width: 50%;}
            .col-7 {width: 58.33%;}
            .col-8 {width: 66.66%;}
            .col-9 {width: 75%;}
            .col-10 {width: 83.33%;}
            .col-11 {width: 91.66%;}
            .col-12 {width: 100%;}
            [class*="col-"] {
                float: left;
                padding: 15px;
            }
            body{
                background-color: #333;
                font-size: 32px;
            }
            nav{
                width: 100%;
                height: 100px;
                display: flex;
                justify-content: space-around;
                align-items: center;
                background-color: aqua;
                opacity: 0.3;
            }
            nav ul li{
                display: inline;
            }
            nav ul li:first-child{
                margin-right: 60px;
            }
            nav ul li a{
                text-decoration: none;
                transition: all 0.3s linear;
            }
            nav ul li a:hover{
                color: #333;
            }
            nav button{
                width: 180px;
                height: 60px;
                font-size: 28px;
                border: 3px solid black;
                border-radius: 30px;
            }
            nav button:hover{
                background-color: aqua;
                cursor: pointer;
            }
            .container{
                margin-top: 40px;
                padding: 30px;
            }
            .row{
                display: block;
            }
            .row::after {
                content: "";
                clear: both;
                display: table;
            }
            .card{
                border: 2px dotted aqua;
                border-radius: 10px;
            }
            .card img{
                width: 100%;
            }
            /* The Modal (background) */
            .modal {
              display: none; /* Hidden by default */
              position: fixed; /* Stay in place */
              z-index: 1; /* Sit on top */
              padding-top: 100px; /* Location of the box */
              left: 0;
              top: 0;
              width: 100%; /* Full width */
              height: 100%; /* Full height */
              overflow: auto; /* Enable scroll if needed */
              background-color: rgb(0,0,0); /* Fallback color */
              background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
              text-align: center;
            }

            /* Modal Content */
            .modal-content {
              background-color: aqua;
              margin: auto;
              padding: 20px;
              border: 3px solid #333;
              border-radius: 20px;
              width: 60%;
            }
            .modal-content button{
                width: 200px;
                height: 50px;
                border: 3px solid black;
                background-color: aqua;
                border-radius: 10px;
                transition: all 0.3s linear;
                font-size: 18px;
                margin-top: 30px;
            }
            .modal-content button:hover{
                background-color: black;
                color: aqua;
                font-weight: bolder;
                font-size: 24px;
            }
            /* The Close Button */
            .close {
              color: #000;
              float: right;
              font-size: 28px;
              font-weight: bold;
            }

            .close:hover,
            .close:focus {
              color: red;
              text-decoration: none;
              cursor: pointer;
            }
        </style>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="loja.html">Loja</a></li>
                </ul>
                <div>
                    <button id="registar">Registar-se</button>
                </div>
            </nav>
        </header>
        
        <main>
            <div class="container">
                <div class="row">
                    <div class="card col-3">
                        <img src="./Imagens/babygrow-azul.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                    <div class="card col-3">
                        <img src="./Imagens/body-penguim.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                    <div class="card col-3">
                        <img src="./Imagens/casaco-crianca.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                    <div class="card col-3">
                        <img src="./Imagens/molde.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                </div>
                <div class="row">
                    <div class="card col-3">
                        <img src="./Imagens/pijama-menina.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                    <div class="card col-3">
                        <img src="./Imagens/pijama.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                    <div class="card col-3">
                        <img src="./Imagens/tshirt-ramones.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                    <div class="card col-3">
                        <img src="./Imagens/vestido-menina-crianca.jpg">
                        <h4>Babygrow</h4>
                        <h5>13.56?</h5>
                    </div>
                </div>
            </div>
        </main>
        
        <!-- Modal -->
        <div id="registarModal" class="modal">

          <!-- Modal conteúdo -->
          <div class="modal-content">
            <span class="close">&times;</span>
            <h3>Faça registo aqui</h3>
            <form action="registar" method="post">
                <div>
                    <div class="row">
                        <label>Nome de utilizador: </label>
                        <input type="text" name="username" required>
                    </div>
                    <div class="row">
                        <label>Palavra-passe: </label>
                        <input type="password" name="password" required>
                    </div>
                </div>
                <button id="btn_registar" type="submit">Registo</button>
            </form>
          </div>

        </div>
        
        <script>
        const entrou = <%=request.getAttribute("entrou")%>
        if(entrou === "entrou") btnRegistar.disabled = true; 
        // Get the modal
        var modal = document.getElementById("registarModal");

        // Get the button that opens the modal
        var btn = document.getElementById("registar");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks the button, open the modal 
        btn.onclick = function() {
          modal.style.display = "block";
        }

        // When the user clicks on <span> (x), close the modal
        span.onclick = function() {
          modal.style.display = "none";
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }
        </script>
    </body>
</html>
