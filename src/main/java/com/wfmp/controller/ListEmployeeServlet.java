package com.wfmp.controller;

import java.io.IOException;

import java.util.List;

import com.wfmp.dao.EmployeeDAO;
import com.wfmp.dao.EmployeeDAOImpl;
import com.wfmp.model.Employee;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/listEmployees")
public class ListEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Create DAO object
        EmployeeDAO dao = new EmployeeDAOImpl();

        // 2. Get data from DAO
        List<Employee> employeeList = dao.getAllEmployees();

        // 3. Set data in request scope
        request.setAttribute("employeeList", employeeList);

        // 4. Forward request to JSP
        request.getRequestDispatcher("listEmployee.jsp")
               .forward(request, response);
    }
}
