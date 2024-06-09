
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UpdatePedidoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Pedido pedido = new Pedido();

        // Obtém os valores enviados pelo formulário
        String cliente = request.getParameter("nome");
        String produto = request.getParameter("produto");
        String descricao = request.getParameter("descricao");
        int quantidade = Integer.parseInt(request.getParameter("quantidade"));
        double valor = Double.parseDouble(request.getParameter("valor"));
        int id = Integer.parseInt(request.getParameter("id"));

        // Define os valores do objeto Pedido
        pedido.setCliente(cliente);
        pedido.setProduto(produto);
        pedido.setDescricao(descricao);
        pedido.setQuantidade(quantidade);
        pedido.setValor(valor);
        pedido.setId(id);

        // Chama o método de atualização do pedido
        pedido.update();

        // Redireciona para a página de dashboard após a atualização
        response.sendRedirect("dashboard.jsp");
    }
}
