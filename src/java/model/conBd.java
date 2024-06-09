package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class conBd {
    private Connection conn;
    private String servername = "localhost";
    private String username = "root";
    private String password = "";
    private String dbname = "zteste";

    public conBd() {
        try {
            conn = DriverManager.getConnection("jdbc:mysql://" + servername + "/" + dbname, username, password);
            System.out.println("Conectado com sucesso, Banco de Dados: " + dbname);
        } catch (SQLException e) {
            System.out.println("Falha na conexão, erro: " + e.getMessage());
        }
    }

    public Connection getConnection() {
        return conn;
    }
}
