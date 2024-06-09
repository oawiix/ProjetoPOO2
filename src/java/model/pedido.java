package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class pedido extends conBd{
    private Connection conn;
    private int id;
    private String cliente;
    private String produto;
    private String descricao;
    private int quantidade;
    private double valor;
    private int active;

    public pedido() throws Exception {
        // Get the connection object
        this.conn = conBd.getConnection();
    }

    public void setCliente(String cliente) {
        this.cliente = cliente;
    }

    public String getCliente() {
        return this.cliente;
    }

    public void setProduto(String produto) {
        this.produto = produto;
    }

    public String getProduto() {
        return this.produto;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getDescricao() {
        return this.descricao;
    }

    public void setQuantidade(int quantidade) {
        this.quantidade = quantidade;
    }

    public int getQuantidade() {
        return this.quantidade;
    }

    public void setValor(double valor) {
        this.valor = valor;
    }

    public double getValor() {
        return this.valor;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId() {
        return this.id;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public int getActive() {
        return this.active;
    }

    // Outros métodos da classe...

    public void save() throws SQLException {
        // Salvar o pedido no banco de dados
        String sql = "INSERT INTO pedidos (cliente, produto, descricao, quantidade, valor) VALUES (?, ?, ?, ?, ?)";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.cliente);
        stmt.setString(2, this.produto);
        stmt.setString(3, this.descricao);
        stmt.setInt(4, this.quantidade);
        stmt.setDouble(5, this.valor);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void update() throws SQLException {
        // Atualizar o pedido no banco de dados
        String sql = "UPDATE pedidos SET cliente = ?, produto = ?, descricao = ?, quantidade = ?, valor = ? WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setString(1, this.cliente);
        stmt.setString(2, this.produto);
        stmt.setString(3, this.descricao);
        stmt.setInt(4, this.quantidade);
        stmt.setDouble(5, this.valor);
        stmt.setInt(6, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void delete() throws SQLException {
        // Deletar o pedido no banco de dados
        String sql = "DELETE FROM pedidos WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setInt(1, this.id);

        // Execute the statement
        stmt.executeUpdate();
    }

    public void noActive(int id) throws SQLException {
        // Deletar o pedido no banco de dados
        String sql = "UPDATE pedidos SET active = 2 WHERE id = ?";

        // Prepare the PreparedStatement
        PreparedStatement stmt = this.conn.prepareStatement(sql);

        // Bind the parameters
        stmt.setInt(1, id);

        // Execute the statement
        stmt.executeUpdate();
    }
}
