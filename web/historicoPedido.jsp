<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="test.AppListener" %>
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
    <title>Painel | Projeto PHP</title>
</head>

<body>
    <%@ include file="navbar.jsp" %>
 
    <!-- End of Sidebar Section -->
    <%
    int page2 = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;
    int limit = 10;
    int offset = (page2 - 1) * limit;

    String countQuery = "SELECT COUNT(*) FROM pedidos WHERE active = 2";
    PreparedStatement countStmt = conn.prepareStatement(countQuery);
    ResultSet countResult = countStmt.executeQuery();
    countResult.next();
    int totalRows = countResult.getInt(1);
    int totalPages = (int) Math.ceil(totalRows / (double) limit);

    String selectQuery = "SELECT * FROM pedidos WHERE active = 2 ORDER BY id DESC LIMIT ?, ?";
    PreparedStatement selectStmt = conn.prepareStatement(selectQuery);
    selectStmt.setInt(1, offset);
    selectStmt.setInt(2, limit);
    ResultSet pedidosResult = selectStmt.executeQuery();
    %>
    <!-- Main Content -->
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
        <div class="pages">
            <% if (totalPages > 1) { %>
                <% if (page2 > 1) { %>
                    <a href="?page=<%= page2 - 1 %>">Anterior</a>
                <% } %>

                <% for (int i = 1; i <= totalPages; i++) { %>
                    <% if (i == page2) { %>
                        <span><b><%= i %></b></span>
                    <% } else { %>
                        <a href="?page=<%= i %>"><%= i %></a>
                    <% } %>
                <% } %>

                <% if (page2 < totalPages) { %>
                    <a href="?page=<%= page2 + 1 %>">Proximo</a>
                <% } %>
            <% } %>
        </div>
        <!-- End of Analyses -->

        <!-- New Users Section -->

        <!-- End of New Users Section -->

        <!-- Recent Orders Table -->

        <div class="recent-orders" style="margin-top: px;">
            <!-- Botão para abrir o pop-up -->
            <h1>Todos os pedidos</h1>

            <!-- O pop-up (inicialmente oculto com display: none) -->

            <table border="1" id="testetable">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>CLIENTE</th>
                        <th>PRODUTO</th>
                        <th>DESCRIÇÃO</th>
                        <th>QUANTIDADE</th>
                        <th>VALOR</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <%
                         while (pedidosResult.next()) { %>
                            <!-- Add the tbody tag here -->
                                <tr>
                                    <td><%= pedidosResult.getInt("id") %></td>
                                    <td><%= pedidosResult.getString("cliente") %></td>
                                    <td><%= pedidosResult.getString("produto") %></td>
                                    <td><%= pedidosResult.getString("descricao") %></td>
                                    <td><%= pedidosResult.getInt("quantidade") %></td>
                                    <td><b>R$: </b> <%= pedidosResult.getDouble("valor") %></td>
                                    <td>
                                        <!-- Edicao do Conetudo -->
                                        <a style="text-decoration: none;"
                                            href="updatepage.php?id=<?= $pedido['id'] ?>">Editar</a>
                                    </td>
                                    <td>
                                        <!-- Tornar o pedido inativo -->
                                        <form action="noactivepedido.php" method="GET">
                                            <input type="hidden" name="id" value="">
                                            <button style="margin-left: -20px" type="submit"
                                                class="btn btn-success">Concluir</button>

                                        </form>
                                    </td>
                                </tr> <!-- Add the closing tbody tag here -->
                        <% } %>
                </tbody>
            </table>

        </div>
        <!-- End of Recent Orders -->

    </main>
<!-- Nome do Usuario + Cargo e Hora -->
<div class="right-section">
        <div class="nav">
            <div class="profile">
                <div class="info">
                    <p>Ola, <b>
                            <!-- Usuario  -->
                            <?php echo $_SESSION["nome"] ?>
                        </b></p>
                    <!-- Hora -->
                    <small class="text-muted"><?php echo date("Y-m-d"); ?></small>
                </div>
            </div>
        </div>
        <!-- Fim do Nome do Uusuario + Cargo e Hora  -->

        <!-- Perfil do Usuario -->
        <div style="margin-top:22px" class="user-profile">
            <div class="usuario-logado" style="margin-top:10px">
                <!-- Usuario -->
                <h2>
                    <?php echo $_SESSION["nome"] ?>
                </h2>
                <!-- Cargo -->
                <p>
                    <?php $modo = $_SESSION["tipo"] == 1 ? "Administrador" : "Colaborador";
                    echo $modo;
                    ?>
                </p>
            </div>
        </div>
        <!-- Fim Perfil do Usuario -->

        <!-- Lembretes - Nao finalizado -->
        <div class="reminders">
            <div class="header">
                <h2>Lembretes</h2>
                <span class="material-icons-sharp">
                    notifications_none
                </span>
            </div>

            <div class="notification">
                <div class="icon">
                    <span class="material-icons-sharp">
                        edit
                    </span>
                </div>
                <div class="content">
                    <div class="info">
                        <h3>Exemplo #1</h3>
                        <small class="text_muted">
                            15/06/24 | 16:00 - 21:00
                        </small>
                    </div>
                    <span class="material-icons-sharp">
                        more_vert
                    </span>
                </div>
            </div>

            <div class="notification deactive">
                <div class="icon">
                    <span class="material-icons-sharp">
                        edit
                    </span>
                </div>
                <div class="content">
                    <div class="info">
                        <h3>Exemplo #2</h3>
                        <small class="text_muted">
                            15/06/24 | 08:00 - 12:00
                        </small>
                    </div>
                    <span class="material-icons-sharp">
                        more_vert
                    </span>
                </div>
            </div>

            <div class="notification add-reminder">
                <div>
                    <span class="material-icons-sharp">
                        add
                    </span>
                    <h3>Adicionar Lembrete</h3>
                </div>
            </div>

        </div>



        <!-- Fim Lembretes - Nao finalizado -->
        </section>

</body>

</html>