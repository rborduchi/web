package Java;


public class Usuario {
    private int id;
    private String nome;
    private String email;
    private String cep;
    private String cidade;
    private String uf;
    private String senha;
    
    public Usuario(int id, String nome, String email, String cep, String cidade, String uf, String senha){
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cep = cep;
        this.cidade = cidade;
        this.uf = uf; 
        this.senha = senha;        
    }
    
    public Usuario(){
       
}


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    /**
     * @return the cep
     */
    public String getCep() {
        return cep;
    }

    /**
     * @param cep the cep to set
     */
    public void setCep(String cep) {
        this.cep = cep;
    }

    /**
     * @return the cidade
     */
    public String getCidade() {
        return cidade;
    }

    /**
     * @param cidade the cidade to set
     */
    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    /**
     * @return the uf
     */
    public String getUf() {
        return uf;
    }

    /**
     * @param uf the uf to set
     */
    public void setUf(String uf) {
        this.uf = uf;
    }
    
}
