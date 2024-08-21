<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.abc.model.Staff" %>
<%@ page import="com.abc.service.StaffService" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Staff Member</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f0f0f0;
            color: #333;
        }

        header {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            padding: 20px;
            text-align: center;
        }

        h1 {
            margin: 0;
            color: white;
        }

        .container {
            width: 60%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: bold;
            color: #002F6C; /* Navy Blue */
        }

        input[type="text"],
        input[type="email"],
        select {
            width: calc(100% - 22px);
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        button {
            background-color: #002F6C; /* Navy Blue */
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        button:hover {
            background-color: #001A43; /* Darker Navy Blue */
        }
    </style>
</head>
<body>
    <header>
        <h1>Edit Staff Member</h1>
    </header>

    <div class="container">
        <%
            // Get staff ID from request parameter
            String staffIdStr = request.getParameter("staffId");
            int staffId = Integer.parseInt(staffIdStr);
            
            // Fetch staff details from database
            StaffService staffService = new StaffService();
            Staff staff = staffService.getStaffById(staffId);

            if (staff == null) {
                out.println("<p>Staff member not found.</p>");
            } else {
        %>
        <form action="StaffController" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="staffId" value="<%= staff.getId() %>">

            <label for="staffName">Staff Name:</label>
            <input type="text" id="staffName" name="staffName" value="<%= staff.getName() %>" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" value="<%= staff.getEmail() %>" required>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="Manager" <%= "Manager".equals(staff.getRole()) ? "selected" : "" %>>Manager</option>
                <option value="Chef" <%= "Chef".equals(staff.getRole()) ? "selected" : "" %>>Chef</option>
                <option value="Waiter" <%= "Waiter".equals(staff.getRole()) ? "selected" : "" %>>Waiter</option>
                <option value="Delivery" <%= "Delivery".equals(staff.getRole()) ? "selected" : "" %>>Delivery</option>
            </select>

            <button type="submit">Update Staff</button>
        </form>
        <% } %>
    </div>
</body>
</html>
