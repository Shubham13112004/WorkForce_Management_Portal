<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="com.wfmp.model.Employee" %>

<%
    Employee emp = (Employee) request.getAttribute("employee");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <style>
        body {
            font-family: Arial;
            background: #eef2f3;
        }
        .container {
            width: 420px;
            margin: 70px auto;
            background: white;
            padding: 25px;
            border-radius: 10px;
        }
        input, select {
            width: 100%;
            padding: 9px;
            margin: 8px 0;
        }
        button {
            width: 100%;
            background: #28a745;
            padding: 10px;
            color: white;
            border: none;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>Edit Employee</h2>

    <form action="updateEmployee" method="post">
        <input type="hidden" name="empId" value="<%= emp.getEmpId() %>">

        <input type="text" name="name" value="<%= emp.getName() %>" required>
        <input type="email" name="email" value="<%= emp.getEmail() %>" required>
        <input type="text" name="department" value="<%= emp.getDepartment() %>" required>

        <select name="role">
            <option selected><%= emp.getRole() %></option>
            <option>Developer</option>
            <option>Manager</option>
            <option>HR</option>
        </select>

        <select name="status">
            <option selected><%= emp.getStatus() %></option>
            <option>Active</option>
            <option>Inactive</option>
        </select>

        <input type="number" name="salary" value="<%= emp.getSalary() %>" required>

        <button type="submit">Update Employee</button>
    </form>
</div>
</body>
</html>
