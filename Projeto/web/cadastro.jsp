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
        <link rel="stylesheet" type="text/css" href="style.css">
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
                    <label for="lcep"> CEP</label>
                    <input type ="text" name="cep" id="cep" placeholder="Digite seu CEP" class="text" value="" onblur="buscaCep()">
                </div>
                <div>
                    <input type ="text" name="cidade" id="cidade" placeholder="Cidade" class="text" value="">
                </div>
                <div>
                    <input type ="text" name="uf" id="uf" placeholder="Estado" class="text" value="">
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
                            cep: $("#cep").val(),
                            cidade: $("#cidade").val(),
                            uf: $("#uf").val(),
                            senha: $("#senha").val()
                        }
                    });
                    $(document).ajaxComplete(function () {
                        setTimeout(function () {
                            $(".gif").css("display", "none");
                        }, 1000);
                        alert("Usuário "+$("#nome").val()+" cadastrado com sucesso!");
                        $("#nome").val(decodeURIComponent(""));
                        $("#login").val(decodeURIComponent(""));
                        $("#cep").val(decodeURIComponent(""));
                        $("#cidade").val(decodeURIComponent(""));
                        $("#uf").val(decodeURIComponent(""));
                        $("#senha").val(decodeURIComponent(""));
                        $("#cidade").prop( "disabled", false);
                        $("#uf").prop( "disabled", false);
                    });
                    return false;
                });
            });
            
            function buscaCep() {
                if ($.trim($("#cep").val()) != "") {
                    $.getJSON("http://cep.republicavirtual.com.br/web_cep.php?cep=" + $("#cep").val()
                              + "&formato=json", function (data) {
                        console.log(data);
                        if (data["resultado"]) {
                            $("#cidade").val(decodeURIComponent(data["cidade"]));
                            $("#uf").val(decodeURIComponent(data["uf"]));
                            $("#cidade").prop( "disabled", true );
                            $("#uf").prop( "disabled", true );
                            
                        }
                    });
                }
            }
            
        </script>
        
    </body>
</html>