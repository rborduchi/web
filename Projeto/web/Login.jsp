<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Login</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="shortcut icon" href="Imagens\icon.ico">
    </head>
    <body>
        <div class="fundo">
            <form action="validaLogin.do" method="post" class="fundo">
            <div>
                <label for="login"> E-mail</label>
                <input type ="text" name="login" placeholder="Digite seu e-mail" class="text" value="">
            </div>
            <div>
                <label for="senha"> Senha</label>
                <input type ="password" name="senha" placeholder="Digite sua senha" class="text" value="">
            </div>
            <input type="submit" name="button" class="button" value="ENTRAR">
            <label class="text2">Não tem conta?</label>
            <a href="./cadastro.jsp" class="link"  style="text-decoration: none;">CADASTRE-SE</a>
        </div>        
    </body>
</html>