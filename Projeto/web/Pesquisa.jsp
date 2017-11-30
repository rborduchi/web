<%-- 
    Document   : Pesquisa
    Created on : 28/10/2017, 15:36:31
    Author     : joaov
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Java.Postagem"%>
<%@page import="Java.Postagem"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pesquise aqui!</title>
    </head>
    <body>
        <form>
            <h3>Digite aqui:<input type="text" name="pesquisa"><input type="submit" value="Pesquisar"></h3>
        </form>
        
        
	<%Postagem post =  new Postagem();        
        ArrayList<Postagem> postagem = post.Pesquisa("noticia");%> 
	<div class="esporte">
            <% for(Postagem cadaPost : postagem){%>
                <div class="sub">
                    <img src="<%=request.getContextPath()%>/<%=cadaPost.getArquivo()%>" class="foto"/>						    
                    <span class="notice" style="color: #3b9c00"><%= cadaPost.getTitulo()%></span> 
                                        
		</div>
            <%}%>					   					 
	</div>
    </body>
</html>
