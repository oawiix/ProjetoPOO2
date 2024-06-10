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

import model.pedido;

/**
 *
 * @author dange
 */
@WebServlet(urlPatterns = {"/noactive"})
public class activePedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getMethod().equals("GET") && request.getParameter("id") != null) {
            try {
                pedido pedido = new pedido();
                int id = Integer.parseInt(request.getParameter("id"));
                pedido.noActive(id);
                response.sendRedirect("dashboard.jsp");
            } catch (Exception e) {
                // Handle the exception here
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
