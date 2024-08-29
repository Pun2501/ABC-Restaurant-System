<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.abc.model.Staff" %>
<%@ page import="com.abc.service.StaffService" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Staff</title>
</head>
<body>
    <h2>Edit Staff</h2>
    <form action="StaffController" method="post">
        <input type="hidden" name="action" value="edit">
        <input type="hidden" name="staffId" value="${staff.id}">

        <label>Name:</label>
        <input type="text" name="staffName" value="${staff.name}" required><br>

        <label>Email:</label>
        <input type="email" name="email" value="${staff.email}" required><br>

        <label>Role:</label>
        <input type="text" name="role" value="${staff.role}" required><br>

        <label>Username:</label>
        <input type="text" name="username" value="${staff.username}" required><br>

        <label>Password:</label>
        <input type="password" name="password" value="${staff.password}" required><br>

        <input type="submit" value="Update Staff">
    </form>
</body>
</html>
