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
        <script type="text/javascript" src="./jquery.min.js"></script>
=======
<<<<<<< HEAD
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

=======
        <script type="text/javascript" src="./jquery-3.2.1.min.js"></script>
>>>>>>> b4a2e5edefde2a3f16fee5552564b0b1cf42365b
>>>>>>> 23fc9c5231f3a95b5a7e0ca04bd3e973e6e5adf2
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
               
                <form action="./Up" method = "post" enctype="multipart/form-data">
                    <input type="hidden" name="user_id" value="<%=(Integer)session.getAttribute("id")%>">
                    <div>
                        <label for="ltitulo"> Título</label>
                        <input type ="text" name="titulo" placeholder="Digite o título" class="text" >
                    </div>
                    <div>
                        <label for="cat"> Categoria</label>
                        <input type ="text" name="categoria" placeholder="Digite a categoria" class="text" >
                    </div>
                    <div>
                        <label for="arquivo"> Imagem</label>
                        <input type ="file" name="file">
                    </div>
                    <input type="submit" name="button" class="button" value="NOVO">

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
    </body>
</html>
