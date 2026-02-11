package com.wfmp.controller;

import java.io.IOException;


import com.wfmp.dao.EmployeeDAO;
import com.wfmp.dao.EmployeeDAOImpl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteEmployee")
public class DeleteEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get employee id from URL
        int empId = Integer.parseInt(request.getParameter("id"));

        // 2. Call DAO
        EmployeeDAO dao = new EmployeeDAOImpl();
        dao.deleteEmployee(empId);

        // 3. Redirect to list page
        response.sendRedirect("listEmployees");
    }
}
