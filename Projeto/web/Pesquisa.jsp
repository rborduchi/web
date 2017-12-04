<%-- 
    Document   : Pesquisa
    Created on : 28/10/2017, 15:36:31
    Author     : joaov
--%>
<?xml version="1.0" encoding="UTF-8" ?>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="Java.Postagem"%>
<%@page import="Java.Usuario"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="style.css">
        <title>Notícia</title>
    </head>
    <body>
        <div style="font-family: Open Sans; color: #666666; margin-left: 5%; margin-top: 30px;">
            <div>
                <label for="titulo" style="font-size: 25px;"> Pesquisar notícia</label><br>
                <input type="text" name="titulo" id="titulo" placeholder="Digite o título da notícia" class="text" value="" autocomplete="off"/>
            </div>
        </div>
        <div id="container"></div>
        
        
        <script type="text/javascript" charset="utf-8">
            
            var container = document.querySelector("#container");
            console.log(container);
            document.querySelector("input")
                    .addEventListener("keyup", function () {
                var xmlhttp = new XMLHttpRequest();
                
                xmlhttp.open("GET", "getPesquisa?titulo=" + this.value, true);
                xmlhttp.onreadystatechange = function () {
                    if (xmlhttp.readyState === 4 && xmlhttp.status === 200)
                        container.innerHTML = xmlhttp.responseText;
                };
                xmlhttp.send();
            });
        </script>
    </body>
</html>
