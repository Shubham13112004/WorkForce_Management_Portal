package com.wfmp.controller;

import java.io.IOException;


import com.wfmp.dao.EmployeeDAO;
import com.wfmp.dao.EmployeeDAOImpl;
import com.wfmp.model.Employee;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/updateEmployee")
public class UpdateEmployeeServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Read updated data
        int empId = Integer.parseInt(request.getParameter("empId"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String department = request.getParameter("department");
        String role = request.getParameter("role");
        String status = request.getParameter("status");
        double salary = Double.parseDouble(request.getParameter("salary"));

        // 2. Create Employee object
        Employee emp = new Employee();
        emp.setEmpId(empId);
        emp.setName(name);
        emp.setEmail(email);
        emp.setDepartment(department);
        emp.setRole(role);
        emp.setStatus(status);
        emp.setSalary(salary);

        // 3. Call DAO
        EmployeeDAO dao = new EmployeeDAOImpl();
        dao.updateEmployee(emp);

        // 4. Redirect to list
        response.sendRedirect("listEmployees");
    }
}
