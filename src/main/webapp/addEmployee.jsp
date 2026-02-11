<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
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
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            text-align: center;
            color: #333;
        }
        input, select {
            width: 100%;
            padding: 9px;
            margin: 8px 0;
        }
        button {
            width: 100%;
            padding: 10px;
            background: #1d2671;
            color: white;
            border: none;
            border-radius: 5px;
        }
        a {
            display: block;
            text-align: center;
            margin-top: 12px;
            text-decoration: none;
        }
    </style>
</head>

<body>
<div class="container">
    <h2>Add Employee</h2>

    <form action="addEmployee" method="post">
        <input type="text" name="name" placeholder="Employee Name" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="department" placeholder="Department" required>

        <select name="role">
            <option>Developer</option>
            <option>Manager</option>
            <option>HR</option>
        </select>

        <select name="status">
            <option>Active</option>
            <option>Inactive</option>
        </select>

        <input type="number" name="salary" placeholder="Salary" required>

        <button type="submit">Add Employee</button>
    </form>

    <a href="index.jsp">⬅ Back to Home</a>
</div>
</body>
</html>
