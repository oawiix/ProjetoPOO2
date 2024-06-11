<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="test.AppListener" %>
<% if(session.getAttribute("nome") != null) { %>
<% AppListener appListener = new AppListener();
        Connection conn = appListener.getConnection();
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
    <title>Historico | Projeto POO</title>
</head>

<body>
    <%@ include file="WEB-INF/jspf/navbar.jsp" %> <!-- Inclui navbar -->
 
    <%
    int page2 = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1; // Pega o valor da página
    int limit = 12; // Define o limite de pedidos por página
    int offset = (page2 - 1) * limit; // Calcula o offset

    String countQuery = "SELECT COUNT(*) FROM pedidos WHERE active = 2"; // Query para contar o total de pedidos
    PreparedStatement countStmt = conn.prepareStatement(countQuery); // Prepara a query
    ResultSet countResult = countStmt.executeQuery(); // Executa a query
    countResult.next(); // Pega o resultado
    int totalRows = countResult.getInt(1); // Pega o total de pedidos
    int totalPages = (int) Math.ceil(totalRows / (double) limit); // Calcula o total de páginas

    String selectQuery = "SELECT * FROM pedidos WHERE active = 2 ORDER BY id DESC LIMIT ?, ?"; // Query para selecionar os pedidos
    PreparedStatement selectStmt = conn.prepareStatement(selectQuery); // Prepara a query
    selectStmt.setInt(1, offset); // Adiciona o offset
    selectStmt.setInt(2, limit); // Adiciona o limite
    ResultSet pedidosResult = selectStmt.executeQuery(); // Executa a query
    %>
    <!-- Conteudo Main -->
    <main>
        <style>
            .pages {
                text-decoration: none;
                display: flex;
                justify-content: end;
                gap: 20px;
                margin-bottom: -57px;
                margin-top: 40px;
                margin-right: 20px;

            }

            .pages a {
                text-decoration: none;
            }
        </style>
        <!-- Paginacao -->
        <div class="pages">
            <% if (totalPages > 1) { %>
                <% if (page2 > 1) { %>
                    <a href="?page=<%= page2 - 1 %>">Anterior</a>
                <% } // Verifica se há mais de uma página %>

                <% for (int i = 1; i <= totalPages; i++) { %>
                    <% if (i == page2) { %>
                        <span><b><%= i %></b></span>
                    <% } else { %>
                        <a href="?page=<%= i %>"><%= i %></a>
                    <% } %>
                <% } // Loop para mostrar as páginas %>

                <% if (page2 < totalPages) { %>
                    <a href="?page=<%= page2 + 1 %>">Proximo</a>
                <% } %>
            <% } // Verifica se há mais páginas %>
        </div>
        <!-- Fim Paginacao -->

        <!-- Tabela Historico de Pedidos -->
        <div class="recent-orders" style="margin-top: 20px;">
            <!-- Botão para abrir o pop-up -->
            <h1>Todos os pedidos       
                <p>                 
                <%
                int total3 = 0; // Variável para armazenar o total
                ResultSet pedidos3 = s.executeQuery("SELECT id FROM pedidos WHERE active = 2"); // Query para pegar os pedidos concluídos
                while (pedidos3.next()) { // Loop para contar os pedidos
                    total3 += 1; // Conta os pedidos
                }
                out.print(total3); // Mostra o total de pedidos
                %> 
            </p> 
            <p>
                <% if (pesquisaNotAtivo != null && !pesquisaNotAtivo.isEmpty()) { %>
                    <p style="font-size: 20px;"><b>Mostrando resultados para</b> <%= pesquisaNotAtivo != null ? pesquisaNotAtivo : "Todos os pedidos" %></p>
                      <% } %>
            </p>
            </h1>

            <table border="1" id="testetable">
                <!-- Cabecalho da Tabela -->
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>CLIENTE</th>
                        <th>PRODUTO</th>
                        <th>DESCRICAO</th>
                        <th>QUANTIDADE</th>
                        <th>VALOR</th>
                        <th></th>
                    </tr>
                </thead>

                <!-- Corpo da Tabela -->
                <tbody>
                    <%
                         while (pedidosResult.next()) { %>
                                <tr>
                                    <td><%= pedidosResult.getInt("id") %></td> 
                                    <td><%= pedidosResult.getString("cliente") %></td>
                                    <td><%= pedidosResult.getString("produto") %></td> 
                                    <td><%= pedidosResult.getString("descricao") %></td>
                                    <td><%= pedidosResult.getInt("quantidade") %></td>
                                    <td><b>R$: </b> <%= pedidosResult.getDouble("valor") %></td>
                                    <td>
                                        <!-- Excluir pedido do Banco de Dados -->
                                        <form action="delete" method="GET">
                                            <input type="hidden" name="id" value=<%= pedidosResult.getInt("id") %>>
                                            <button style="margin-left: -20px" type="submit"
                                                class="btn btn-danger">Excluir</button>

                                        </form>
                                    </td>
                                </tr>
                        <% } %>
                </tbody>
            </table>

        </div>
        <!-- Fim Tabela Historico de Pedidos -->

    </main>
     <!-- Fim do Main -->

    <!-- Conteudo da Direia -->
    <!-- Nome do Usuario + Cargo e Hora -->
        <!-- Perfil do Usuario -->
        <!-- Lembretes -->
        <%@ include file="WEB-INF/jspf/rightSection.jsp" %>
        <!-- Fim Perfil do Usuario -->
     <!-- Fim do Nome do Uusuario + Cargo e Hora  -->

</body>

</html>
<% }
else {
    response.sendRedirect("index.jsp"); // Redireciona para a página de login
} %>