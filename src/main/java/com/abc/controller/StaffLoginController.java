package com.abc.controller;

import com.abc.model.Staff;
import com.abc.service.StaffService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/staffLoginController")
public class StaffLoginController extends HttpServlet {

    private StaffService staffService = new StaffService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Staff staff = staffService.authenticateStaff(email, password);

        if (staff != null) {
            HttpSession session = request.getSession();
            session.setAttribute("staff", staff);
            response.sendRedirect("staffDashboard");
        } else {
            request.setAttribute("errorMessage", "Invalid email or password.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("staffLogin.jsp");
            dispatcher.forward(request, response);
        }
    }
}
