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
        <script type="text/javascript" src="./jquery.min.js"></script>
    </head>
    <body>
        <div class="fundo">
            <form id="formcad" action-charset="utf-8" class="fundo">
                <div>
                    <label for="lnome"> Nome</label>
                    <input type ="text" name="nome" id="nome" placeholder="Digite seu nome" class="text" value="">
                </div>
                <div>
                    <label for="llogin"> E-mail</label>
                    <input type ="text" name="login" id="login" placeholder="Digite seu e-mail" class="text" value="">
                </div>
                <div>
                    <label for="lsenha"> Senha · 8 a 15 dígitos</label>
                    <input type ="password" name="senha" id="senha" placeholder="Digite sua senha" class="text" value="">
                </div>
                <input type="submit" name="button" id="btncad" class="button" value="CADASTRAR">
                <img class="gif" src="Imagens/loading.gif">
                <label class="text2">Já tem uma conta?</label>
                <a href="./Login.jsp" class="link"  style="text-decoration: none;">ENTRE</a>
            </form>
        </div>
        
        <script>
        $(document).ready(function(){
        $("#btncad").click(function (ev) {
            $(".gif").css("display", "block");
            $.ajax({
                type: "post",
                url: "./user",
                data: {
                    nome: $("#nome").val(),
                    login: $("#login").val(),
                    senha: $("#senha").val()
                }
            });
            $(document).ajaxComplete(function () {
                setTimeout(function () {
                    $(".gif").css("display", "none");
                }, 2000);
                res.sendRedirect("./UsuarioLogado.jsp");
            });
            return false;
        });
    });
        </script>
        
    </body>
</html>