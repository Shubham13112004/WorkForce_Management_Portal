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
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");

        EmployeeDAO dao = new EmployeeDAOImpl();
        Employee emp = dao.login(email, password);

        if (emp != null) {
            HttpSession session = request.getSession();
            session.setAttribute("role", emp.getRole());
            session.setAttribute("empId", emp.getEmpId());
            
       System.out.println(emp.getRole());
       System.out.println(emp.getEmpId());

            if ("HR".equals(emp.getRole())) {
                response.sendRedirect("hrDashboard.jsp");
            } else if ("Manager".equals(emp.getRole())) {
                request.getRequestDispatcher("managerDashboard.jsp").forward(request, response);
            } else if ("DEVELOPER".equals(emp.getRole())){
                response.sendRedirect("developerDashboard.jsp");
            }

        } else {
            request.setAttribute("error", "Invalid Email or Password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
