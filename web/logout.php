import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        HttpSession session = request.getSession();
        
        session.removeAttribute("usuario"); // Remove the session attribute "usuario"
        session.removeAttribute("nome"); // Remove the session attribute "nome"
        session.removeAttribute("tipo"); // Remove the session attribute "tipo"
        
        session.invalidate(); // Invalidate the session
        
        response.sendRedirect("index.jsp"); // Redirect to the "index.jsp" page
    }
}