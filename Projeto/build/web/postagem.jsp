<?xml version="1.0" encoding="UTF-8" ?>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Página do Usuário</title>
        <link rel="stylesheet" type="text/css" href="style_login.css">
        <link rel="shortcut icon" href="Imagens\icon.ico">
        <script type="text/javascript" src="./jquery.min.js"></script>
    </head>
<body>
            
            <h2 style="margin: auto 500px; font-family: Open Sans; font-weight: bold; color: green">Uploads Esportes </h2>
                    
            <div class="fundo">
                
               
        <form id="formnot" class="fundo" content-type="multipart/form-data">
                
            <div>
                <label for="ltitulo"> Título</label>
                <input type ="text" id="titulo" placeholder="Digite o título" class="text" >
            </div>
            <div>
                <label for="cat"> Categoria</label>
                <input type ="text" id="categoria" placeholder="Digite a categoria" class="text" >
            </div>
            <div>
                <label for="arquivo"> Imagem</label>
                <input type ="file" id="file">
            </div>
            <input type="submit" name="button" id="btnnot" class="button" value="NOVO">
        </form> 
</div>
            
<%--<script>
	var form = document.getElementById("formnot");
	form.onsubmit = function(e){
		e.preventDefault();
		var formdata = new FormData(form);
		var xhr =  new XMLHttpRequest();
		xhr.open("POST","Up",true);
		xhr.send(formdata);
		console.log(xhr.responseText);
		form.reset();
	};
</script>--%>

<script>
        $(document).ready(function(){
        $("#btnnot").click(function (ev) {
            $(".gif").css("display", "block");
            $.ajax({
                type: "post",
                url: "./Up",
                data: {
                    user_id: 1,
                    titulo: $("#titulo").val(),
                    categoria: $("#categoria").val(),
                    file: $("#file").val()
                }
            });
            $(document).ajaxComplete(function () {
                setTimeout(function () {
                    $(".gif").css("display", "none");
                }, 2000);
            });
            return false;
        });
    });
        </script>

    </body>
</html>