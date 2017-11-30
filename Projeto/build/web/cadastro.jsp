<%-- 
    Document   : cadastro
    Created on : 30/11/2017, 16:42:17
    Author     : rafa_
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Cadastro</title>
        <link rel="stylesheet" type="text/css" href="style_login.css">
        <link rel="shortcut icon" href="Imagens\icon.ico">
    </head>
    <body>
        <div class="fundo">
            <form action="./user" method="post" action-charset="utf-8" class="fundo">
                <div>
                    <label for="lnome"> Nome</label>
                    <input type ="text" name="nome" placeholder="Digite seu nome" class="text" value="">
                </div>
                <div>
                    <label for="llogin"> E-mail</label>
                    <input type ="text" name="login" placeholder="Digite seu e-mail" class="text" value="">
                </div>
                <div>
                    <label for="lsenha"> Senha · 8 a 15 dígitos</label>
                    <input type ="password" name="senha" placeholder="Digite sua senha" class="text" value="">
                </div>
                <input type="submit" name="button" class="button" value="CADASTRAR">
                <label class="text2">Já tem uma conta?</label>
                <a href="./Login.jsp" class="link"  style="text-decoration: none;">ENTRE</a>
            </form>
        </div>     
    </body>
</html>