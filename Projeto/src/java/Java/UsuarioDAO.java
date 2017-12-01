package Java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

public class UsuarioDAO {
    
    public Connection getConnection(){
        Connection conn = null;
        PreparedStatement p = null;
        ResultSet r = null;
        String driver = "org.postgresql.Driver";
        String url = "jdbc:postgresql://localhost:5432/globo";
        String usarname = "postgres";
        String password = "jvfmef";
        
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
    
    public Usuario getUser(String email, String senha) throws ClassNotFoundException, SQLException{
        Connection conn = this.getConnection();
        
        PreparedStatement p = null;
        ResultSet r = null; 
        
        try{
            String query = "SELECT user_id, user_nome FROM usuario WHERE user_email = ? AND user_senha = ?";
            
            p = conn.prepareStatement(query);
            p.setString(1, email);
            p.setString(2, senha);

            r = p.executeQuery();

            if(r.next()){
                Usuario user = new Usuario();
                user.setId(r.getInt("user_id"));
                user.setEmail(email);
                user.setSenha(senha); 
                user.setNome(r.getString("user_nome"));

                return user;
            }
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
        return null;
        
    }

    public int addUser(Usuario user){
        Connection conn = this.getConnection();
        
        PreparedStatement p = null;
        ResultSet r = null;
        
        try{
            String query = "SELECT user_email FROM usuario WHERE user_email = ?";
            
            p = conn.prepareStatement(query);
            p.setString(1, user.getEmail());

            r = p.executeQuery();

            if(user.getNome().trim().equals("") || user.getEmail().trim().equals("") || user.getSenha().trim().equals("")){
                return 1;
                }
            else if(r.next()){
                return 2;
            }
            else{
                try {
                query = "INSERT INTO usuario (user_nome, user_email, user_senha) VALUES (?, ?, ?)";
                p = conn.prepareStatement(query);
                p.setString(1, user.getNome());
                p.setString(2, user.getEmail());
                p.setString(3, user.getSenha());
            
                r = p.executeQuery();
            
            } catch (SQLException ex) {
                Logger.getLogger(UsuarioDAO.class.getName()).log(Level.SEVERE, null, ex);
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
        }catch (SQLException e){
            e.printStackTrace();
        }       
        return 3;
    }
}
