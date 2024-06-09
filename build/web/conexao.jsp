<%@ page import="java.sql.*" %>
<%@ page import="model.conBd" %>

<% conBd conexao = new conBd();
        Connection conn = conexao.getConnection();
        Statement s = conn.createStatement(); %>