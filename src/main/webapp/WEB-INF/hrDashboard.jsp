<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


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
</head>
<body>

<h2>HR Dashboard</h2>

<ul>
    <li><a href="addEmployee.jsp">➕ Add Employee</a></li>
    <li><a href="listEmployees">📋 View Employees</a></li>
    <li><a href="logout">🚪 Logout</a></li>
</ul>

</body>
</html>






</body>
</html>