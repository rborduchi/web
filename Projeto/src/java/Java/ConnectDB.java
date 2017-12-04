/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Java;

import Java.*;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author rafa_
 */
public class ConnectDB {
    public static Connection conn = null;
    public static PreparedStatement p = null;
    public static ResultSet r = null;
    public static final String driver = "org.postgresql.Driver";
    public static final String url = "jdbc:postgresql://localhost:5432/globo";
    public static final String usarname = "postgres";
    public static final String password = "1573"; 
    public static final int tipo = r.TYPE_SCROLL_SENSITIVE;
    public static final int concorrencia = r.CONCUR_UPDATABLE;
    
    public void add(Usuario user) throws ClassNotFoundException, SQLException{
        String query = "INSERT INTO usuario (user_nome, user_email, user_senha) VALUES (?, ?, ?)";
        Class.forName(driver);
        conn = DriverManager.getConnection(url, usarname, password);
        p = conn.prepareStatement(query, tipo, concorrencia);
        p.setString(1, user.getNome());
        p.setString(2, user.getEmail());
        p.setString(3, user.getSenha());
        r = p.executeQuery();
        conn.close();
    }
    
  }
