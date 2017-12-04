package Java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Postagem {
    private int id;
    private String titulo;
    private String categoria;
    private String arquivo;
    private int user_id;

    
    public Postagem(){
        
    }
    public Postagem(int id, String titulo, String categoria, String arquivo, int user_id){
        this.id = id;
        this.titulo = titulo;
        this.categoria  = categoria;
        this.arquivo = arquivo;
        this.user_id = user_id;
    }
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
    
    public boolean inserir() throws SQLException{
        boolean ok = false;
            Connection conn = getConnection();
            PreparedStatement p = null;
                        
            String query = "insert into noticia(titulo, categoria,  arquivo, user_id)  values (?,?,?,?)";
            p = conn.prepareStatement(query);            
            p.setString(1, this.getTitulo());           
            p.setString(2, this.getCategoria());
            p.setString(3, this.getArquivo());            
            p.setInt(4, this.getUser_id()); 
            p.execute();
            ok = true;
            p.close();
            conn.close();

        return ok;
    }
      public ArrayList<Postagem> Noticias() throws SQLException{
        ArrayList<Postagem> obj;
        try (Connection conn = this.getConnection()) {
            PreparedStatement p = null;
            ResultSet r = null;
            obj = new ArrayList();
            
            String query = ("select * from noticia;");
            p = conn.prepareStatement(query);
            r = p.executeQuery();
            while(r.next()){
                obj.add(new Postagem(r.getInt("not_id"),r.getString("titulo"),r.getString("categoria"), r.getString("arquivo"), r.getInt("user_id")));
            }
            p.close();
        }        
        return obj;        
    }
    
            
    public ArrayList<Postagem> NoticiaUser(int codigo) throws SQLException{
        ArrayList<Postagem> obj;
        try (Connection conn = this.getConnection()) {
            PreparedStatement p = null;
            ResultSet r = null;
            obj = new ArrayList();
            
            String query = ("select * from noticia where user_id = ?");

            p = conn.prepareStatement(query);
            p.setInt(1, codigo);
            r = p.executeQuery();
            while(r.next()){
                obj.add(new Postagem(r.getInt("not_id"),r.getString("titulo"),r.getString("categoria"), r.getString("arquivo"), r.getInt("user_id")));
            }
            p.close();
        }
        return obj;
    }
    
    public ArrayList<Postagem> Pesquisa(String termo) throws SQLException{
        ArrayList<Postagem> obj;
        try (Connection conn = this.getConnection()) {
            PreparedStatement p = null;
            ResultSet r = null;
            obj = new ArrayList();
            
            String query = ("select * from noticia where titulo like ?");

            p = conn.prepareStatement(query);
            p.setString(1, "%"+termo+"%");
            r = p.executeQuery();
            while(r.next()){
                obj.add(new Postagem(r.getInt("not_id"),r.getString("titulo"),r.getString("categoria"), r.getString("arquivo"), r.getInt("user_id")));
            }
            p.close();
        }
        return obj;
    }
    
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getTitulo() {
        return titulo;
    }
    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

     public String getCategoria() {
        return categoria;
    }
    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }    

    public String getArquivo() {
        return arquivo;
    }    
    public void setArquivo(String arquivo) {
        this.arquivo = arquivo;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

}