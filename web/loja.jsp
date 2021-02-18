
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page language="java" contentType="text/html" pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Loja</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./styles.css"/>
        <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous"/>
        <script src="./cartScript.js" defer></script>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="loja.jsp">Loja</a></li>
                    <li id="shopping-icon">
                        <i class="fas fa-shopping-basket"></i>
                        <div id="cart-items">0</div>
                    </li>
                </ul>
                <div>
                    <button id="registar">Registar-se</button>
                </div>
                
            </nav>
        </header>
        
        <main>          
           <%   Connection Conexao;
            Class.forName("com.mysql.jdbc.Driver");

            Conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/javaweb_pf", "root", "");;

            try {

                PreparedStatement ps = Conexao.prepareStatement("Select nome, precoVenda, foto from produtos");

                ResultSet rs = ps.executeQuery();
                
                %>
                <div class="container-store">
                <%
                while (rs.next()) {

                    String nome = rs.getString(1);
                    float preco = rs.getFloat(2);
                    String foto = rs.getString(3);
                %>
                  <div class="card col-3">
                        <div class="add-to-cart">
                            <img src="<%=foto%>">
                            <button class="add-to-cart-button">Adicionar ao carrinho</button>
                        </div>
                        <h4><%=nome%></h4>
                        <h5><%=preco%></h5>
                    </div> 
                  <%
                }
                %>
                </div>
                <%                 

            } catch (SQLException e) {
                System.out.println("Erro na conexão à base de dados" + e);
            }


        %>
            
            <div class="cart">
                <div class="cart-head">
                    <span id="close-cart">&times;</span>
                    <h4>Carrinho de compras</h4>
                </div>
                <div id="products-cart-container">
                    
                </div>
                <p class="total">Total: <span id="cart-total">0</span></p>
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
