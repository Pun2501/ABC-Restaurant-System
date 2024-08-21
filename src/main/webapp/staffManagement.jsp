<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.abc.model.Staff" %>
<%@ page import="com.abc.service.StaffService" %>
<!DOCTYPE html>
<html>
<head>
    <title>Staff Management</title>
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

        h1, h2 {
            margin: 0;
            color: white;
        }

        h2 {
            color: #000000; /* Black for sub-headings */
        }

        .container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        form {
            margin-bottom: 20px;
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px;
            text-align: left;
        }

        th {
            background-color: #e0e0e0;
            color: #002F6C; /* Navy Blue */
        }

        .actions {
            display: flex;
            justify-content: center;
        }

        .actions form {
            margin: 0 5px;
        }

        .alert, .success {
            color: white;
            font-weight: bold;
            padding: 10px;
            text-align: center;
            border-radius: 4px;
            margin-bottom: 20px;
        }

        .alert {
            background-color: #d9534f; /* Red */
        }

        .success {
            background-color: #5bc0de; /* Light Blue */
        }
    </style>
</head>
<body>
    <header>
        <h1>Staff Management</h1>
    </header>
    <div class="container">
        <h2>Add New Staff Member</h2>
        <form action="StaffController" method="post">
            <input type="hidden" name="action" value="add">
            <label for="staffName">Staff Name:</label>
            <input type="text" id="staffName" name="staffName" required>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>

            <label for="role">Role:</label>
            <select id="role" name="role" required>
                <option value="Manager">Manager</option>
                <option value="Chef">Chef</option>
                <option value="Waiter">Waiter</option>
                <option value="Delivery">Delivery</option>
            </select>

            <button type="submit">Add Staff</button>
        </form>

        <h2>View Existing Staff Members</h2>
        <% 
            StaffService staffService = new StaffService();
            List<Staff> staffMembers = staffService.getAllStaffMembers();
        %>
        <table>
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    for (Staff staff : staffMembers) {
                %>
                <tr>
                    <td><%= staff.getName() %></td>
                    <td><%= staff.getEmail() %></td>
                    <td><%= staff.getRole() %></td>
                    <td class="actions">
                        <!-- Edit Form -->
                        <form action="StaffController" method="post" style="display:inline;">
                            <input type="hidden" name="action" value="edit">
                            <input type="hidden" name="staffId" value="<%= staff.getId() %>">
                            <button type="submit">Edit</button>
                        </form>
                        <!-- Delete Form -->
                        <form action="StaffController" method="post" style="display:inline;" onsubmit="return confirmDelete();">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="staffId" value="<%= staff.getId() %>">
                            <button type="submit">Delete</button>
                        </form>
                    </td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    </div>

    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this staff member?");
        }
    </script>
</body>
</html>
