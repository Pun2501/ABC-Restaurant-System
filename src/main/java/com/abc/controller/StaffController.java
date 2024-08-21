package com.abc.controller;

import com.abc.model.Staff;
import com.abc.service.StaffService;

import javax.servlet.*;
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

            Staff staff = new Staff(name, email, role);
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

            Staff staff = new Staff(staffId, name, email, role);
            staffService.updateStaff(staff);
            response.sendRedirect("staffManagement.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if ("login".equals(action)) {
            // Handle staff login
            HttpSession session = request.getSession();
            Staff staff = staffService.getStaffById(Integer.parseInt(request.getParameter("staffId")));
            session.setAttribute("staff", staff);
            response.sendRedirect("staffPage.jsp"); // Redirect to the staff page
        }
    }
}
