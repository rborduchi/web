<%-- 
    Document   : index
    Created on : 27/10/2017, 20:35:39
    Author     : rafa_
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Java.Postagem"%>

<!DOCTYPE html>
	<html>
	<head>
		<title>globo.com - Absolutamente tudo sobre notícias, esportes e entretenimento</title>
		<link rel="stylesheet" type="text/css" href="style.css">
		<link rel="shortcut icon" href="Imagens\icon.ico">
                <meta charset="utf-8" name="viewport">
	</head>

	<body>
		<div class="container">
			<div class="header">
				<div class="logo"><img src="Imagens\Logo.png"></div>
				<div class="menu">
					<div class="menu2">
						<li class="menu2" style="color: #a80000;"><span>g1</span><img src="Imagens\seta_red.png" class="menu2"></li>
						<li class="menu2" style="color: #3b9c00;"><span>ge</span><img src="Imagens\seta_green.png" class="menu2"></li>
						<li class="menu2" style="color: #ff7f00;"><span>gshow</span><img src="Imagens\seta_orange.png" class="menu2"></li>
						<li class="menu2" style="color: #666666;"><span>tech</span></li>
						<li class="menu2" style="color: #0669de;"><span>vídeos</span><img src="Imagens\seta_blue.png" class="menu2"></li>
					</div>

					<div class="menu3">
						<li class="menu3"><span>ASSINE JÁ</span></li>
						<li class="menu3"><a href="./Login.jsp" style="text-decoration: none; color: #666666;">MINHA CONTA</a></li>
						<li class="menu3"><span>E-MAIL</span><img src="Imagens\seta_gray.png"></li>	
					</div>	

					<div class="menu32">
						<li class="menu32"><span>ASSINE JÁ</span></li>	
					</div>

					<div class="pesq">
						<li class="pesq"><img src="Imagens\pesq.png">
                                                    <form id="formcad" action-charset="utf-8">
                                                        <input type ="text" id="termo" placeholder="Digite a Busca" class="text" >
                                                        <input type="submit" name="button" id="btnbus" class="button" value="Busque">
                                                    </form>                                                
                                                </li>
                                                
                                                <script>
                                                    $(document).ready(function(){
                                                    $("#btnbus").click(function (ev) {
                                                        $.ajax({
                                                            type: "post",
                                                            url: "./Pesquisa.jps",
                                                            data: {
                                                                titulo: $("#termo").val(),
                                                            }
                                                        });
                                                        $(document).ajaxComplete(function () {                                                           
                                                            res.sendRedirect("./Pesquisa.jsp");
                                                        });
                                                        return false;
                                                    });
                                                });
                                                    </script>
					</div>

					<div class="boneco">
						<li class="boneco"><a href= "./jornalista.jsp"><img src="Imagens\boneco.png"></a></li>
					</div>						

				</div>				
			</div> 
			
		
			<div class="esq">
				<div class="titulo">
					<h1 class="titulo">Justiça mantém preso homem que ejaculou em mulher em ônibus</h1>
					<li class="not"><span class="not">Vítima celebra decisão: 'Gratificada porque ele está preso'</span></li>
 					<li class="not"><span class="not">Homem é preso suspeito de estuprar vizinha de 15 anos grávida</span></li>
					
					
				</div>

				

				<div class="not2" style="margin-right: 4%">
					<img src="Imagens\not1.png" class="not2">
					<span class="not2">Joesley entregou 5 gravações com políticos à PGR</span>
					<li class="not21"><span class="not21">PF e MPF aparam aresta</span></li>
				</div>

				<div class="not2" style="margin-right: 4%">
					<img src="Imagens\not2.jpeg" class="not2">
					<span class="not2">Grande incêndio atinge empresa em Caxias do Sul</span>
					<li class="not21"><span class="not21">Fogo toma terras no MT</span></li>
				</div>

				<div class="not2">
					<img src="Imagens\not3.jpeg" class="not2">
					<span class="not2">Família e amigos de PMs mortos protestam no RJ</span>
					<li class="not21"><span class="not21">SC tem mais ataques</span></li>
				</div>

			</div>


				  <%Postagem post =  new Postagem();        
                                  ArrayList<Postagem> postagem = post.Noticias();%> 
				<div class="esporte">
                                    <% for(Postagem cadaPost : postagem){%>
					<div class="sub">
						<img src="<%=request.getContextPath()%>/<%=cadaPost.getArquivo()%>" class="foto"/>						    
					    	<span class="notice" style="color: #3b9c00"><%= cadaPost.getTitulo()%></span> 
                                        
				 	</div>
                                    <%}%>					   					 
				</div>

				<div class="novela">
					<div class="sub">
  						<img src="Imagens\Novela1.jpg" class="foto">					
					    	<span class="notice" style="color: #ff7f00">'Força': Foto de Bibi e Caio vaza na internet</span></h3>
					    		<li class="notice" style="color: #666666"> <span class="subNotice" style="color: #ff7f00">'Ivan dá prazo para Eugênio' Cristóvão</li></span>
					    		<li class="notice" style="color: #666666"> <span class="subNotice" style="color: #ff7f00"> Bibi e Jeiza trocarão tiros</li></span>
					</div>
				
					<div class="sub">
						<img src="Imagens\Novela2.jpg" class="foto" >
					    	<span class="notice" style="color: #ff7f00">'Pega': Dom e Tânia têm noite de amor</span></h3>
					    		<li class="notice" style="color: #666666"> <span class="subNotice" style="color: #ff7f00">'Tânia 'envenenará' Cristóvão</li></span>
					</div>


                                </div>



		</div>
	</body>
</html>
