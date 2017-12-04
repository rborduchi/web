<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix ="c"%>
<%@page import="java.util.ArrayList"%> 
<%@page import="Java.Postagem"%>
<%@page import="Java.Usuario"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Página do Usuário</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="shortcut icon" href="Imagens\icon.ico">
    </head>
<body>
    <c:choose>
        
        
        <c:when test="${user eq null}">
            <jsp:forward page="erroLogin.jsp"/>
        </c:when>
        <c:otherwise>

            
            <label>Usuário: ${user.nome}</label>
            <h1 style="margin-left: 5%;">Publicações:</h1>
            <h2 style="margin: auto 500px; font-weight: bold; color: green;">Uploads Esportes </h2>
                    
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
                                            <img src="<%=request.getContextPath()%>/<%=cadaPost.getArquivo()%>"/><br>						    
                                            <span class="notice" style="color: #3b9c00"><%= cadaPost.getTitulo()%></span><br><br> 
                                        
				 	</div>
                                    <%}%>					   					 
				</div>        

        </c:otherwise>
        
    </c:choose>
    </body>
</html>
