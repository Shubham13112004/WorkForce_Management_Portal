<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.wfmp.model.Employee, java.text.SimpleDateFormat" %>

<%
    List<Employee> list = (List<Employee>) request.getAttribute("employeeList");
    String role = (String) session.getAttribute("role");
    SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy HH:mm");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Employee Directory | Workforce Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', system-ui, sans-serif;
        }
        
        body {
            background: #f5f7fa;
            color: #333;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 30px;
        }
        
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            flex-wrap: wrap;
            gap: 20px;
        }
        
        .header h1 {
            color: #1d2671;
            font-size: 32px;
        }
        
        .header-actions {
            display: flex;
            gap: 15px;
            align-items: center;
        }
        
        .btn {
            padding: 12px 24px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            border: none;
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        
        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }
        
        .stats-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }
        
        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.05);
            border-left: 5px solid #667eea;
        }
        
        .stat-card h3 {
            color: #666;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }
        
        .stat-card .value {
            font-size: 32px;
            font-weight: bold;
            color: #1d2671;
        }
        
        .table-container {
            background: white;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            margin-top: 30px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
        }
        
        thead {
            background: linear-gradient(135deg, #1d2671 0%, #2a3c8f 100%);
            color: white;
        }
        
        th {
            padding: 18px 15px;
            text-align: left;
            font-weight: 500;
            font-size: 14px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        
        tbody tr {
            border-bottom: 1px solid #f0f0f0;
            transition: background 0.2s ease;
        }
        
        tbody tr:hover {
            background: #f8f9ff;
        }
        
        td {
            padding: 16px 15px;
            color: #555;
        }
        
        .status-badge {
            padding: 6px 12px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: 500;
            display: inline-block;
        }
        
        .status-active {
            background: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background: #f8d7da;
            color: #721c24;
        }
        
        .action-buttons {
            display: flex;
            gap: 8px;
        }
        
        .btn-action {
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            text-decoration: none;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }
        
        .btn-edit {
            background: #28a745;
            color: white;
        }
        
        .btn-delete {
            background: #dc3545;
            color: white;
        }
        
        .btn-view {
            background: #17a2b8;
            color: white;
        }
        
        .no-data {
            text-align: center;
            padding: 60px;
            color: #666;
        }
        
        .no-data i {
            font-size: 48px;
            margin-bottom: 15px;
            opacity: 0.5;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 15px;
            }
            
            .table-container {
                overflow-x: auto;
            }
            
            table {
                min-width: 800px;
            }
            
            .header {
                flex-direction: column;
                align-items: stretch;
            }
            
            .header-actions {
                justify-content: center;
            }
        }
    </style>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1><i class="fas fa-users"></i> Employee Directory</h1>
            <div class="header-actions">
                <a href="addEmployee.jsp" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Add Employee
                </a>
                <a href="<%= "HR".equals(role) ? "hrDashboard.jsp" : 
                           "Manager".equals(role) ? "managerDashboard.jsp" : 
                           "developerDashboard.jsp" %>" 
                   class="btn btn-secondary">
                    <i class="fas fa-home"></i> Dashboard
                </a>
            </div>
        </div>
        
        <div class="stats-cards">
            <div class="stat-card">
                <h3>Total Employees</h3>
                <div class="value"><%= list != null ? list.size() : 0 %></div>
            </div>
            <div class="stat-card">
                <h3>Active Employees</h3>
                <div class="value">
                    <% 
                        if (list != null) {
                            long activeCount = list.stream()
                                .filter(e -> "Active".equals(e.getStatus()))
                                .count();
                    %>
                    <%= activeCount %>
                    <% } else { %>0<% } %>
                </div>
            </div>
            <div class="stat-card">
                <h3>Total Salary</h3>
                <div class="value">
                    <% 
                        if (list != null && !list.isEmpty()) {
                            double totalSalary = list.stream()
                                .mapToDouble(Employee::getSalary)
                                .sum();
                    %>
                    ₹<%= String.format("%,.2f", totalSalary) %>
                    <% } else { %>₹0<% } %>
                </div>
            </div>
        </div>
        
        <div class="table-container">
            <% if (list != null && !list.isEmpty()) { %>
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                            <th>Department</th>
                            <th>Role</th>
                            <th>Status</th>
                            <th>Salary</th>
                            <th>Joined Date</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Employee emp : list) { %>
                        <tr>
                            <td>#<%= emp.getEmpId() %></td>
                            <td>
                                <strong><%= emp.getName() %></strong>
                            </td>
                            <td><%= emp.getEmail() %></td>
                            <td><%= emp.getDepartment() %></td>
                            <td><%= emp.getRole() %></td>
                            <td>
                                <span class="status-badge <%= "Active".equals(emp.getStatus()) ? "status-active" : "status-inactive" %>">
                                    <%= emp.getStatus() %>
                                </span>
                            </td>
                            <td>₹<%= String.format("%,.2f", emp.getSalary()) %></td>
                            <td><%= emp.getCreatedAt() != null ? sdf.format(emp.getCreatedAt()) : "N/A" %></td>
                            <td>
                                <div class="action-buttons">
                                    <a href="editEmployee?id=<%= emp.getEmpId() %>" 
                                       class="btn-action btn-edit" 
                                       title="Edit">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <% if ("HR".equals(role)) { %>
                                    <a href="deleteEmployee?id=<%= emp.getEmpId() %>"
                                       class="btn-action btn-delete"
                                       title="Delete"
                                       onclick="return confirm('Are you sure you want to delete <%= emp.getName() %>? This action cannot be undone.');">
                                        <i class="fas fa-trash"></i> Delete
                                    </a>
                                    <% } %>
                                    <a href="editEmployee?id=<%= emp.getEmpId() %>" 
                                       class="btn-action btn-view"
                                       title="View Details">
                                        <i class="fas fa-eye"></i> View
                                    </a>
                                </div>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <div class="no-data">
                    <i class="fas fa-users-slash"></i>
                    <h3>No Employees Found</h3>
                    <p>Get started by adding your first employee</p>
                    <a href="addEmployee.jsp" class="btn btn-primary" style="margin-top: 20px;">
                        <i class="fas fa-plus"></i> Add First Employee
                    </a>
                </div>
            <% } %>
        </div>
    </div>
    
    <script>
       
        document.addEventListener('DOMContentLoaded', function() {
            const deleteLinks = document.querySelectorAll('.btn-delete');
            deleteLinks.forEach(link => {
                link.addEventListener('click', function(e) {
                    if (!confirm('Are you sure you want to delete this employee?')) {
                        e.preventDefault();
                    }
                });
            });
        });
    </script>
</body>
</html>