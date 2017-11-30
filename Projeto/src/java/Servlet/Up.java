package Servlet;

import Java.Postagem;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig
@WebServlet(name = "Up", urlPatterns = {"/Up"})
public class Up extends HttpServlet {

@Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        Postagem postagem = new Postagem();
        Part ArqUser = request.getPart("file");
        Boolean ok = true;
        
        Random random = new Random();
        
        String ArquivoAntigo = Paths.get(ArqUser.getSubmittedFileName()).getFileName().toString();
        if(!ArquivoAntigo.equals("")){
            String NomeArquivo = "/Imagens/files" + random.nextInt() + ArquivoAntigo.substring(ArquivoAntigo.lastIndexOf("."));
            InputStream conteudo = ArqUser.getInputStream();
            String imagens= request.getServletContext().getRealPath("");
            
            File arquivo = new File(imagens, NomeArquivo);
                    
            try(InputStream input = conteudo){
                Files.copy(input, arquivo.toPath());
                postagem.setTitulo(request.getParameter("titulo"));
                postagem.setCategoria(request.getParameter("categoria"));
                postagem.setUser_id(Integer.parseInt(request.getParameter("user_id")));
                postagem.setArquivo(NomeArquivo);
                ok = postagem.inserir();
                if (ok){
                    response.sendRedirect("./UsuarioLogado.jsp");   
                }
            } catch (SQLException ex) {
                    Logger.getLogger(Up.class.getName()).log(Level.SEVERE, null, ex);
            }
        }else{
            try {
                postagem.setTitulo(request.getParameter("titulo"));
                postagem.setCategoria(request.getParameter("categoria"));
                postagem.setUser_id(Integer.parseInt(request.getParameter("user_id")));
                postagem.setArquivo("");
                ok = postagem.inserir();
                if (ok)
                    response.sendRedirect("./UsuarioLogado.jsp");
            } catch (SQLException ex) {
                 Logger.getLogger(Up.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}
