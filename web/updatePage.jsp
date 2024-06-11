<%@ page import="java.sql.*" %>
<%@ page import="model.conBd" %>
<% if (session.getAttribute("nome") != null) { // Verifica se o usuário está logado %>
<% conBd conexao=new conBd(); // Instancia a conexão
            Connection conn = conexao.getConnection(); // Pega a conexão
            Statement s = conn.createStatement(); // Cria um statement %>  

<% int id2 = Integer.parseInt(request.getParameter("id"));  // Pega o id do pedido
    String countQuery = "SELECT * FROM pedidos WHERE id = ?"; // Query para pegar o pedido
    PreparedStatement countStmt = conn.prepareStatement(countQuery); // Prepara a query
    countStmt.setInt(1, id2); // Adiciona o id
    ResultSet pedidosResult = countStmt.executeQuery(); // Executa a query
    pedidosResult.next(); // Pega o resultado
    int id3 = pedidosResult.getInt(1);  // Pega o id
    String nome = pedidosResult.getString(2);  // Pega o nome
    String produto = pedidosResult.getString(3);    // Pega o produto
    String descricao = pedidosResult.getString(4); // Pega a descrição
    int quantidade = pedidosResult.getInt(5);  // Pega a quantidade
    double valor = pedidosResult.getDouble(6); // Pega o valor
               %> 

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
          rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
          crossorigin="anonymous">
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Sharp" rel="stylesheet">
    <link rel="stylesheet" href="css/index.css">
    <title>Editar | Projeto POO</title>
</head>
<%@ include file="WEB-INF/jspf/navbar.jsp" %> <!-- Inclui navbar -->
<style>
    .up form input {
        margin-left: 20px;
        background-color: rgb(241, 241, 241);
    }
</style>
<main>

    <h2>
        <h1>Editando pedido</h1>
        <h2>ID do Pedido: <%= id2 %>
        </h2>

        <!-- Formulário de edição do pedido -->
        <div class="up" style="    background-color: var(--color-white);
             padding: var(--card-padding);
             box-shadow: var(--box-shadow);
             border-radius: var(--card-border-radius);">
            <form style=" margin-top: 125px; margin-bottom: 150px; font-size: 25px;" action="updatePedido" method="POST">

                <span style="margin-left: 25px;"><b>NOME</b></span>
                <input type="text" name="nome" value="<%= nome%>" style="padding: 5px; border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>PRODUTO</b></span>
                <input type="text" name="produto" value="<%= produto%>"
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>DESCRICAO</b></span>
                <input type="text" name="descricao" value="<%= descricao%>"
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>QUANTIDADE</b></span>
                <input type="number" name="quantidade" value="<%= quantidade%>" value="1" min="1"
                       style="padding: 5px;border-radius: 5px;">

                <button id="incrementButton" class="btn btn-outline-primary" type="button"
                        style="margin-left: 20px; padding: 10px">+</button>

                <button id="decrementButton" class="btn btn-outline-primary" type="button"
                        style="padding: 10px">-</button>

                <button id="incrementButton5x" class="btn btn-outline-primary" type="button" style="padding: 10px">+5</button>

                <button id="decrementButton5x" class="btn btn-outline-primary" type="button" style="padding: 10px">-5</button><br><br>

                <span style="margin-left: 25px;"><b>VALOR</b><span
                        style="margin-left: 30px">R$</span>
                    <input type="number" step="0.01" name="valor" value="<%= valor%>"
                           style="padding: 5px;border-radius: 5px;"><br><br>
                    <input type="hidden" name="id" value=<%=id2%>>

                    <a class="btn btn-danger" type="button" href="dashboard.jsp"
                       style="padding: 15px; padding-left: 40px; padding-right: 40px; margin-left: 25px; margin-top: 25px;">Cancelar</a>

                    <button class="btn btn-outline-primary" type="submit"
                            style="padding: 15px; padding-left: 50px; padding-right: 50px; margin-left: 25px; margin-top: 25px;">Editar</button>
            </form>
            <script>
                // Função para incrementar a quantidade
                document.getElementById('incrementButton').addEventListener('click', function () {
                    var input = document.getElementsByName('quantidade')[0];
                    input.value++;
                });

                // Função para decrementar a quantidade
                document.getElementById('decrementButton').addEventListener('click', function () {
                    var input = document.getElementsByName('quantidade')[0];
                    if (input.value > 1)
                        input.value--;
                });


                document.getElementById('incrementButton5x').addEventListener('click', function () {
                    for (var i = 0; i < 5; i++) {
                        var input = document.getElementsByName('quantidade')[0];
                        input.value++;
                    }
                });

                document.getElementById('decrementButton5x').addEventListener('click', function () {
                    for (var i = 0; i < 5; i++) {
                        var input = document.getElementsByName('quantidade')[0];
                        if (input.value > 1)
                            input.value--;
                    }
                });


            </script>

        </div>

</main>
<%@ include file="WEB-INF/jspf/rightSection.jsp" %> <!-- Inclui rightSection -->
</body>

</html>
<% } else {
        response.sendRedirect("index.jsp"); // Redireciona para a página de login
    }%>