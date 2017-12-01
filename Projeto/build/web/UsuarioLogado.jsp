<?xml version="1.0" encoding="UTF-8" ?>
<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="Java.Postagem"%>
<%@page import="Java.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Página do Usuário</title>
        <link rel="stylesheet" type="text/css" href="style_login.css">
        <link rel="shortcut icon" href="Imagens\icon.ico">
<<<<<<< HEAD
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

=======
        <script type="text/javascript" src="./jquery-3.2.1.min.js"></script>
>>>>>>> b4a2e5edefde2a3f16fee5552564b0b1cf42365b
    </head>
<body>
    <c:choose>
        
        
        <c:when test="${user eq null}">
            <jsp:forward page="erroLogin.jsp"/>
        </c:when>
        <c:otherwise>

            
            <label>Usuário: ${user.nome}</label>
            <h1>Publicações:</h1>
            <h2 style="margin: auto 500px; font-family: Open Sans; font-weight: bold; color: green">Uploads Esportes </h2>
                    
            <div class="fundo">
                
               
                <form  id="formnot" enctype="multipart/form-data">
                
                <input type="hidden" id="user_id" value="<%=(Integer)session.getAttribute("id")%>">
                
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
                <input type="submit" id="btnnot" name="button" class="button" value="NOVO">
            
</div>
        
            </form>    
        </div>
                    
              <%Postagem post =  new Postagem();        
              ArrayList<Postagem> postagem = post.NoticiaUser((Integer)session.getAttribute("id"));%> 
				<div class="esporte">
                                    <% for(Postagem cadaPost : postagem){%>
					<div class="sub">
                                            <img src="<%=request.getContextPath()%>/<%=cadaPost.getArquivo()%>" width="400" height="400"/><br>						    
                                            <span class="notice" style="color: #3b9c00"><%= cadaPost.getTitulo()%></span><br><br> 
                                        
				 	</div>
                                    <%}%>					   					 
				</div>        

        </c:otherwise>
        
    </c:choose>
            
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

<script type="text/javascript">
function func(){
    $(document).ready(function(){
        $("#btnnot").click(function(){        
            $.post("Up", $("#formnot").serialize(), function(data, status, xhr) {
            alert(data);
            });
        });
    });
}
</script>

    </body>
</html>
