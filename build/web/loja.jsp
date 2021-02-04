<!DOCTYPE html>
<html>
    <head>
        <title>Loja</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./styles.css"/>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="loja.jsp">Loja</a></li>
                </ul>
                <div>
                    <button id="registar">Registar-se</button>
                </div>
            </nav>
        </header>
        
        <main>
            <div class="container-store">
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
        </script>
        <script src="./modal.js"></script>
    </body>
</html>
