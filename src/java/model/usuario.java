package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class usuario extends conBd {

    private Connection conn;
    private int id;
    private String nome;
    private String email;
    private String usuario;
    private String senha;
    private String tipo;
    private String data;

    public usuario() throws Exception {
        // Get the connection object
        this.conn = conBd.getConnection();
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return this.email;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getUsuario() {
        return this.usuario;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public String getSenha() {
        return this.senha;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getTipo() {
        return this.tipo;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setData(String data) {
        this.data = data;
    }

    public String getData() {
        return this.data;
    }

    // Outros métodos da classe...
    public void save() throws SQLException {
        // Salvar o usuário no banco de dados
        String sql = "INSERT INTO usuarios (nome, email, usuario, senha, tipo, data) VALUES (?, ?, ?, ?, ?, ?)";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.nome);
        stmt.setString(2, this.email);
        stmt.setString(3, this.usuario);
        stmt.setString(4, this.senha);
        stmt.setString(5, this.tipo);
        stmt.setString(6, this.data);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void update() throws SQLException {
        // Atualizar o usuário no banco de dados
        String sql = "UPDATE usuarios SET nome = ?, email = ?, usuario = ?, senha = ?, tipo = ? WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.nome);
        stmt.setString(2, this.email);
        stmt.setString(3, this.usuario);
        stmt.setString(4, this.senha);
        stmt.setString(5, this.tipo);
        stmt.setInt(6, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void delete() throws SQLException {
        // Deletar o usuario no banco de dados
        String sql = "DELETE FROM usuarios WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setInt(1, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

}
