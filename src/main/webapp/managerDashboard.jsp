<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%
if (!"Manager".equals(session.getAttribute("role"))) {
    response.sendRedirect("unauthorized.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Manager Dashboard</title>
    <style>
        body { font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; background: #f0f2f5; margin: 0; }
        .dashboard { max-width: 1200px; margin: 0 auto; padding: 20px; }
        .header { background: white; padding: 20px; border-radius: 10px; margin-bottom: 30px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .grid { display: grid; grid-template-columns: repeat(auto-fit, minmax(280px, 1fr)); gap: 20px; }
        .card { background: white; padding: 25px; border-radius: 10px; box-shadow: 0 2px 10px rgba(0,0,0,0.1); }
        .btn { display: inline-block; padding: 10px 20px; background: #1d2671; color: white; border-radius: 5px; text-decoration: none; margin: 5px; }
        .menu { display: flex; gap: 15px; margin-top: 20px; flex-wrap: wrap; }
    </style>
</head>
<body>
    <div class="dashboard">
        <div class="header">
            <h1>Manager Dashboard</h1>
            <p>Welcome, <%= session.getAttribute("role") %></p>
            
            <div class="menu">
                <a href="listEmployees" class="btn">👥 View Team</a>
                <a href="editEmployee?id=<%= session.getAttribute("empId") %>" class="btn">👤 My Profile</a>
                <a href="#" class="btn">📊 Performance</a>
                <a href="logout" class="btn">🚪 Logout</a>
            </div>
        </div>
        
        <div class="grid">
            <div class="card">
                <h3>Team Management</h3>
                <p>View and manage your team members</p>
                <a href="listEmployees" class="btn">View Team</a>
            </div>
            
            <div class="card">
                <h3>Reports</h3>
                <p>View team performance reports</p>
                <a href="#" class="btn">Generate Reports</a>
            </div>
            
            <div class="card">
                <h3>Quick Links</h3>
                <ul style="list-style: none; padding: 0;">
                    <li><a href="#">📋 Team Schedule</a></li>
                    <li><a href="#">📈 Performance Metrics</a></li>
                    <li><a href="#">💬 Team Feedback</a></li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>