/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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

@WebServlet(urlPatterns = {"/user"})
public class AddUser extends HttpServlet
{
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
    {
        
            PrintWriter out = res.getWriter();
            
            String nome = req.getParameter("nome");
            String email = req.getParameter("login");
            String senha = req.getParameter("senha");
            
            Usuario user = new Usuario();
            
            user.setNome(nome);
            user.setEmail(email);
            user.setSenha(senha);
            
            UsuarioDAO udao = new UsuarioDAO();
            
            out.println("<!doctype html>");
            out.println("   <html>");
            out.println("        <head>");
            out.println("                   <title>Cadastro</title>");
            out.println("                   <link rel=\"stylesheet\" type=\"text/css\" href=\"style_login.css\">");
            out.println("	<link rel=\"shortcut icon\" href=\"Imagens\\icon.ico\">");
            out.println("                </head>");
            out.println("        <body>");
            
            if(udao.addUser(user) == 1){
                out.println("<label>Preencha todos os campos!</label>");
                out.println("<a href=\"./cadastro\" style=\"text-decoration: none;\">TENTE NOVAMENTE</a>");               
            }
            else if(udao.addUser(user) == 2){
                out.println("<label>E-mail "+email+" já cadastrado!</label");
            }
            else{
                out.println("<label>Usuário "+nome+" cadastrado com sucesso!</label");
                
            }
            
            out.println("        </body>");
            out.println("</html>");
        
    }

}