package action;
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.usuario;

@WebServlet(urlPatterns = {"/addusuario"})
public class addUsuario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws Exception 
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {}


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { 
                try {
                    usuario user = new usuario();

                    // Obtém os valores enviados pelo formulário
                    String nome = request.getParameter("nome");
                    String email = request.getParameter("email");
                    String usuario = request.getParameter("usuario");
                    String senha = request.getParameter("senha");
                    String tipo = request.getParameter("tipo");
                    String data = request.getParameter("data");

                    // Define os valores do usuario
                    user.setNome(nome);
                    user.setEmail(email);
                    user.setUsuario(usuario);
                    user.setSenha(senha);
                    user.setTipo(tipo);
                    user.setData(data);

                    // Salva o usuario
                    user.save();

                    // Redireciona para a página de dashboard
                    response.sendRedirect("usersPage.jsp");
                } catch (Exception e) {
                    // Handle the exception here
                    e.printStackTrace();
                }
            }
    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
