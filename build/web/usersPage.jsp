<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.conBd" %>
<% if(session.getAttribute("tipo").equals("1")) { %>
<% conBd conexao = new conBd();
        Connection conn = conexao.getConnection();
        Statement s = conn.createStatement(); %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <title>Painel | Projeto POO</title>
</head>

<body>

    <%@ include file="WEB-INF/jspf/navbar.jsp" %>
    <!-- End of Sidebar Section -->

    <!-- Main Content -->
    <main>

        <!-- End of Analyses -->

        <!-- New Users Section -->

        <!-- End of New Users Section -->

        <!-- Recent Orders Table -->
        <div class="container">
            <h1 style="margin-top:20px">Usuarios</h1>
        
        <div class="" >
            <%
            ResultSet usuarios = conn.createStatement().executeQuery("SELECT * FROM usuarios ORDER BY id DESC");
            while (usuarios.next()) {
                String nome = usuarios.getString("Nome");
                int tipo = usuarios.getInt("Tipo");
                String cargo = tipo == 1 ? "Administrador" : "Colaborador";
                String data = usuarios.getString("Data");
                int id = usuarios.getInt("id");
            %>

            <div class="col-md-4" >
                <div class="new-users">
                    <div class="user-list">
                        <div class="user">
                            <h2 ><%= nome %></h2>
                            <p><%= cargo %></p>
                            <p><b>Data </b> <%= data %></p>
                            <form action="deleteUser" method="GET">
                                <input type="hidden" name="id" value="<%= id %>">
                                <button style="margin-left: -20px" type="submit"
                                    class="btn btn-outline-danger">Excluir</button>
                        </div>
                    </div>
                </div>
            </div>
            <%
            }
            usuarios.close();
            %>
            </div>

    </main>


    <!-- Right Section -->
    <%@ include file="WEB-INF/jspf/rightSection.jsp" %>
</body>

</html>
<% }
else {
    response.sendRedirect("dashboard.jsp");
} %>