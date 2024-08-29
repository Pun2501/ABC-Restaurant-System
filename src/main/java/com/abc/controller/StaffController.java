package com.abc.controller;

import com.abc.model.Staff;
import com.abc.service.StaffService;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;


public class StaffController extends HttpServlet {

    private StaffService staffService = new StaffService();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            // Add staff logic
            String name = request.getParameter("staffName");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Staff staff = new Staff(name, email, role, username, password);
            staffService.addStaff(staff);
            response.sendRedirect("staffManagement.jsp");

        } else if ("delete".equals(action)) {
            // Delete staff logic
            int staffId = Integer.parseInt(request.getParameter("staffId"));
            staffService.deleteStaff(staffId);
            response.sendRedirect("staffManagement.jsp");

        } else if ("edit".equals(action)) {
            // Edit staff logic
            int staffId = Integer.parseInt(request.getParameter("staffId"));
            String name = request.getParameter("staffName");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            Staff staff = new Staff(staffId, name, email, role, username, password);
            staffService.updateStaff(staff);
            response.sendRedirect("staffManagement.jsp");
        } else if ("login".equals(action)) {
            // Handle staff login
            String email = request.getParameter("email"); // Changed from username to email
            String password = request.getParameter("password");
            Staff staff = staffService.authenticateStaff(email, password); // Adjusted to use email

            if (staff != null) {
                HttpSession session = request.getSession();
                session.setAttribute("staff", staff);
                response.sendRedirect("staffDashboard.jsp"); // Redirect to the staff dashboard
            } else {
                response.sendRedirect("loginFailed.jsp"); // Redirect to a login failure page
            }
        }
    }
}
