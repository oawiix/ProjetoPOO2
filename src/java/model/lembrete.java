package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class lembrete extends conBd {

    private Connection conn;
    private int id;
    private String nome;
    private String descricao;
    private String data;
    private String hora;

    public lembrete() throws Exception {
        // Get the connection object
        this.conn = conBd.getConnection();
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return this.nome;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return this.descricao;
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

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getHora() {
        return this.hora;
    }

    // Outros métodos da classe...
    public void save() throws SQLException {
        // Salvar o usuário no banco de dados
        String sql = "INSERT INTO lembretes (nome, descricao, data, hora) VALUES (?, ?, ?, ?)";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.nome);
        stmt.setString(2, this.descricao);
        stmt.setString(3, this.data);
        stmt.setString(4, this.hora);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void update() throws SQLException {
        // Atualizar o usuário no banco de dados
        String sql = "UPDATE lembretes SET nome = ?, descricao = ? data = ? hora = ? WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.nome);
        stmt.setString(2, this.descricao);
        stmt.setString(3, this.data);
        stmt.setString(4, this.hora);
        stmt.setInt(4, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void delete() throws SQLException {
        // Deletar o usuario no banco de dados
        String sql = "DELETE FROM lembretes WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setInt(1, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

}
