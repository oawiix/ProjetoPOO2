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
    <title>Adicionar Usuários | Projeto POO</title>
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
        <h1>Adicionando Usuário</h1>
        <h2>ID do Pedido: <%= %>
        </h2>

        <!-- FormulÃ¡rio de adicionar o usuário -->
        <div class="up" style="    background-color: var(--color-white);
             padding: var(--card-padding);
             box-shadow: var(--box-shadow);
             border-radius: var(--card-border-radius);">
            <form style=" margin-top: 125px; margin-bottom: 150px; font-size: 25px;" action="updateUsuarios" method="POST">

                <span style="margin-left: 25px;"><b>NOME</b></span>
                <input type="text" name="nome" value="<%=%>" style="padding: 5px; border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>EMAIL</b></span>
                <input type="text" name="email" value="<%=%>"
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>USUARIO</b></span>
                <input type="text" name="usuario" value="<%=%>"
                       style="padding: 5px;border-radius: 5px;"><br><br>

                <span style="margin-left: 25px;"><b>SENHA</b></span>
                <input type="number" name="senha" value="<%=%>" value="1" min="1"
                       style="padding: 5px;border-radius: 5px;">

                <span style="margin-left: 25px;"><b>TIPO</b></span>
                <input type="number" name="tipo" value="<%=%>" value="1" min="1"
                       style="padding: 5px;border-radius: 5px;">

                <span style="margin-left: 25px;"><b>DATA</b></span>
                <input type="number" name="data" value="<%=%>" value="1" min="1"
                       style="padding: 5px;border-radius: 5px;">

                <button id="incrementButton" class="btn btn-outline-primary" type="button"
                        style="margin-left: 20px; padding: 10px">+</button>

                <button id="decrementButton" class="btn btn-outline-primary" type="button"
                        style="padding: 10px">-</button>

                <button id="incrementButton5x" class="btn btn-outline-primary" type="button" style="padding: 10px">+5</button>

                <button id="decrementButton5x" class="btn btn-outline-primary" type="button" style="padding: 10px">-5</button><br><br>


                style="padding: 5px;border-radius: 5px;"><br><br>
                <input type="hidden" name="id" value=<%=%>>

                <a class="btn btn-danger" type="button" href="dashboard.jsp"
                   style="padding: 15px; padding-left: 40px; padding-right: 40px; margin-left: 25px; margin-top: 25px;">Cancelar</a>

                <button class="btn btn-outline-primary" type="submit"
                        style="padding: 15px; padding-left: 50px; padding-right: 50px; margin-left: 25px; margin-top: 25px;">Editar</button>
            </form>
        </div>

</main>
<%@ include file="WEB-INF/jspf/rightSection.jsp" %> <!-- Inclui rightSection -->
</body>

</html>