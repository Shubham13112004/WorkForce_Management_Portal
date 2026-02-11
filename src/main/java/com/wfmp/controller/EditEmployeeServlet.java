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

@WebServlet("/editEmployee")
public class EditEmployeeServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Get employee id
        int empId = Integer.parseInt(request.getParameter("id"));

        // 2. Fetch employee from DAO
        EmployeeDAO dao = new EmployeeDAOImpl();
        Employee emp = dao.getEmployeeById(empId);

        // 3. Send employee to JSP
        request.setAttribute("employee", emp);
        request.getRequestDispatcher("editEmployee.jsp")
               .forward(request, response);
    }
}
