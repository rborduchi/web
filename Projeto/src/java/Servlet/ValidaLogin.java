package Servlet;

import Java.*;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



@WebServlet(urlPatterns = {"/validalogin"})
public class ValidaLogin extends HttpServlet
{
    private static final long serialVersionUID = 7633293501883840556L;
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        HttpSession sess = req.getSession();
        
        Usuario user = null;
        
        String email = req.getParameter("login");
        String senha = req.getParameter("senha");
        
        if(email.trim().equals("") || senha.trim().equals(""))
        {
            PrintWriter out = res.getWriter();
            
            out.println("<!doctype html>");
            out.println("   <html>");
            out.println("        <head>");
            out.println("                   <title>Cadastro</title>");
            out.println("                   <link rel=\"stylesheet\" type=\"text/css\" href=\"style_login.css\">");
            out.println("	<link rel=\"shortcut icon\" href=\"Imagens\\icon.ico\">");
            out.println("                </head>");
            out.println("        <body>");
            out.println("<label>Preencha todos os campos!</label>");
            out.println("<a href=\"./Login.jsp\" style=\"text-decoration: none;\">TENTE NOVAMENTE</a>"); 
            out.println("        </body>");
            out.println("</html>");
        }
        else{
            try {
                UsuarioDAO udao = new UsuarioDAO();
                user = udao.getUser(email, senha);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(ValidaLogin.class.getName()).log(Level.SEVERE, null, ex);
            }
        
            if(user == null){
                sess.invalidate();
                res.sendRedirect("ErroLogin.jsp");
            }
            else{
            req.getSession().setAttribute("user", user);
            req.getSession().setAttribute("id", user.getId());
            res.sendRedirect("./UsuarioLogado.jsp");
            //req.getRequestDispatcher("UsuarioLogado.jsp").forward(req, res);
        }
        }       
    }

}