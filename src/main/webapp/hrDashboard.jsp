<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
if (!"HR".equals(session.getAttribute("role"))) {
    response.sendRedirect("unauthorized.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>HR Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f2f5; margin: 0; }
        .sidebar { width: 250px; background: #1d2671; color: white; height: 100vh; position: fixed; }
        .sidebar h2 { padding: 20px; margin: 0; background: rgba(0,0,0,0.2); }
        .sidebar ul { list-style: none; padding: 0; }
        .sidebar li { padding: 15px 20px; border-bottom: 1px solid rgba(255,255,255,0.1); }
        .sidebar a { color: white; text-decoration: none; display: block; }
        .sidebar li:hover { background: rgba(255,255,255,0.1); }
        .main-content { margin-left: 250px; padding: 30px; }
        .card-container { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
        .card { background: white; padding: 25px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .btn { display: inline-block; padding: 10px 20px; background: #1d2671; color: white; border-radius: 5px; text-decoration: none; margin: 5px; }
        .btn-success { background: #28a745; }
        .btn-danger { background: #dc3545; }
        .header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .welcome { font-size: 24px; color: #333; }
    </style>
</head>
<body>
    <div class="sidebar">
        <h2>HR Dashboard</h2>
        <ul>
            <li><a href="listEmployees">👥 View All Employees</a></li>
            <li><a href="addEmployee.jsp">➕ Add New Employee</a></li>
            <li><a href="#">📊 Reports</a></li>
            <li><a href="editEmployee?id=<%= session.getAttribute("empId") %>">👤 My Profile</a></li>
            <li><a href="logout">🚪 Logout</a></li>
        </ul>
    </div>
    
    <div class="main-content">
        <div class="header">
            <div class="welcome">Welcome, HR Manager!</div>
            <div>Role: <%= session.getAttribute("role") %></div>
        </div>
        
        <div class="card-container">
            <div class="card">
                <h3>Quick Actions</h3>
                <a href="addEmployee.jsp" class="btn">➕ Add Employee</a>
                <a href="listEmployees" class="btn">👥 View Employees</a>
            </div>
            <div class="card">
                <h3>Statistics</h3>
                <p>Total Employees: [To be implemented]</p>
                <p>Active Employees: [To be implemented]</p>
            </div>
        </div>
    </div>
</body>
</html>