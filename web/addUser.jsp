<%@ page import="java.sql.*" %>
<%@ page import="model.conBd" %>
<% if (session.getAttribute("nome") != null) { // Verifica se o usuário está logado %>
<% conBd conexao=new conBd(); // Instancia a conexão
            Connection conn = conexao.getConnection(); // Pega a conexão
            Statement s = conn.createStatement(); // Cria um statement %>  

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
        <h1 style="margin-top: 20px;">Criando novo usuario</h1>

        <!-- Formulário de edição do pedido -->
        <div class="up" style="    background-color: var(--color-white);
             padding: var(--card-padding);
             box-shadow: var(--box-shadow);
             border-radius: var(--card-border-radius);">
            <form style=" margin-top: 88px; margin-bottom: 130px; font-size: 25px;" action="addusuario" method="POST">

                <span style="margin-left: 25px;"><b>NOME</b></span>
                <input type="text" name="nome" value="" style="padding: 5px; border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>EMAIL</b></span>
                <input type="text" name="email" value=""
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>USUARIO</b></span>
                <input type="text" name="usuario" value=""
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>SENHA</b></span>
                <input type="password" name="senha" value=""
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>TIPO</b></span>
                <select name="tipo" id="escolha" style="border-radius: 5px; padding:5px">
                    <option value="1">Administrador</option>
                    <option value="0">Colaborador</option>
                </select><br><br>

                <span style="margin-left: 25px;"><b>DATA</b> <%= new java.text.SimpleDateFormat("dd-MM-yyyy").format(new java.util.Date()) %></span>
                <input type="hidden" name="data" style="padding: 5px;border-radius: 5px;" 
                value="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"><br><br>

                    <a class="btn btn-danger" type="button" href="usersPage.jsp"
                       style="padding: 15px; padding-left: 40px; padding-right: 40px; margin-left: 25px; margin-top: 25px;">Cancelar</a>

                    <button class="btn btn-outline-primary" type="submit"
                            style="padding: 15px; padding-left: 50px; padding-right: 50px; margin-left: 25px; margin-top: 25px;">Criar</button>
            </form>

        </div>

</main>
<%@ include file="WEB-INF/jspf/rightSection.jsp" %> <!-- Inclui rightSection -->
</body>

</html>
<% } else {
        response.sendRedirect("index.jsp"); // Redireciona para a página de login
    }%>