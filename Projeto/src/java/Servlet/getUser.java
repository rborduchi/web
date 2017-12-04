/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Java.Usuario;
import Java.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author rafa_
 */
@WebServlet(name = "getUser", urlPatterns = {"/getUser"})
public class getUser extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    public Connection getConnection(){
        Connection conn = null;
        PreparedStatement p = null;
        ResultSet r = null;
        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://localhost:5432/globo";
        String usarname = "postgres";
        String password = "1573";
        
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, usarname, password);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
       
        return conn;        
    }

    public void doGet (HttpServletRequest req, HttpServletResponse res)
            throws IOException {
        res.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = res.getWriter();
        String busca = req.getParameter("nome");
        
        Connection conn = this.getConnection();
        
        PreparedStatement p = null;
        ResultSet r = null; 
        
        try{
            String query = "SELECT * FROM usuario WHERE user_nome LIKE ?";
            
            p = conn.prepareStatement(query);
            p.setString(1, "%" + busca + "%");
            r = p.executeQuery();
            
            while (r.next())
                writer.println("<li class=\"not\" style=\" margin-left: 5%;\"><span class=\"not\" id=\"container\" style=\"font-weight: normal; color: #666666;\">" +r.getString("user_nome") + "</span></li>");

        }catch (SQLException e){
            e.printStackTrace();
        }
        finally{
            if (r != null ) {
                try { r.close(); } catch (SQLException e) { ; }
                r = null;
            }
            if (p != null ) {
                try { p.close(); } catch (SQLException e) { ; }
                p = null;
            }
            if (conn != null ) {
                try { conn.close(); } catch (SQLException e) { ; }
                conn = null;
            }
        }
    }
}
