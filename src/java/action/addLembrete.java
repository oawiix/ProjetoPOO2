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

import model.lembrete;

@WebServlet(urlPatterns = {"/addlembrete"})
public class addLembrete extends HttpServlet {

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
                    lembrete Reminder = new lembrete();

                    // Obtém os valores enviados pelo formulário
                    String nome = request.getParameter("nome");
                    String descricao = request.getParameter("descricao");
                    String data = request.getParameter("data");
                    String hora = request.getParameter("hora");

                    // Define os valores do usuario
                    Reminder.setNome(nome);
                    Reminder.setDescricao(descricao);
                    Reminder.setData(data);
                    Reminder.setHora(hora);

                    // Salva o usuario
                    Reminder.save();

                    // Redireciona para a página de dashboard
                    response.sendRedirect("dashboard.jsp");
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
