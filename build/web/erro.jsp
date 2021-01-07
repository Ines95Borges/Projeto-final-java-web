<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Erro</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            *{
                box-sizing: border-box;
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
        </style>
    </head>
    <body>
        <header>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="loja.html">Loja</a></li>
                </ul>
            </nav>
        </header>
        <main>
            <h2>Ocorreu um erro. Tente outra vez!</h2>
        </main>
    </body>
</html>