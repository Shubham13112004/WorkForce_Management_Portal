package com.wfmp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.wfmp.model.Employee;
import com.wfmp.util.DBConnection;

public class EmployeeDAOImpl implements EmployeeDAO {

    // ================= LOGIN =================
  

    @Override
    public Employee login(String email, String password) {
        
        String sql = "SELECT emp_id, name, role, email, department FROM employee WHERE email=? AND password=?";
        Employee emp = null;
        
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            ps.setString(1, email);
            ps.setString(2, password); 
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next()) {
                emp = new Employee();
                emp.setEmpId(rs.getInt("emp_id"));
                emp.setName(rs.getString("name"));
                emp.setRole(rs.getString("role"));
                emp.setEmail(rs.getString("email"));
                emp.setDepartment(rs.getString("department"));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return emp;
    }

    // ================= ADD EMPLOYEE =================
    @Override
    public boolean addEmployee(Employee emp) {

        String sql = "INSERT INTO employee "
                   + "(name, email, department, role, status, salary) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setString(4, emp.getRole());
            ps.setString(5, emp.getStatus());
            ps.setDouble(6, emp.getSalary());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ================= GET ALL EMPLOYEES =================
    @Override
    public List<Employee> getAllEmployees() {

        List<Employee> list = new ArrayList<>();
        String sql = "SELECT * FROM employee ORDER BY emp_id DESC";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Employee emp = new Employee();
                emp.setEmpId(rs.getInt("emp_id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setDepartment(rs.getString("department"));
                emp.setRole(rs.getString("role"));
                emp.setStatus(rs.getString("status"));
                emp.setSalary(rs.getDouble("salary"));
                emp.setCreatedAt(rs.getTimestamp("created_at")); 

                list.add(emp);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================= GET EMPLOYEE BY ID =================
    @Override
    public Employee getEmployeeById(int empId) {

        Employee emp = null;
        String sql = "SELECT * FROM employee WHERE emp_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, empId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                emp = new Employee();
                emp.setEmpId(rs.getInt("emp_id"));
                emp.setName(rs.getString("name"));
                emp.setEmail(rs.getString("email"));
                emp.setDepartment(rs.getString("department"));
                emp.setRole(rs.getString("role"));
                emp.setStatus(rs.getString("status"));
                emp.setSalary(rs.getDouble("salary"));
                emp.setCreatedAt(rs.getTimestamp("created_at")); 
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return emp;
    }

    // ================= UPDATE EMPLOYEE =================
    @Override
    public boolean updateEmployee(Employee emp) {

        String sql = "UPDATE employee SET "
                   + "name=?, email=?, department=?, role=?, status=?, salary=? "
                   + "WHERE emp_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, emp.getName());
            ps.setString(2, emp.getEmail());
            ps.setString(3, emp.getDepartment());
            ps.setString(4, emp.getRole());
            ps.setString(5, emp.getStatus());
            ps.setDouble(6, emp.getSalary());
            ps.setInt(7, emp.getEmpId());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    // ================= DELETE EMPLOYEE =================
    @Override
    public boolean deleteEmployee(int empId) {

        String sql = "DELETE FROM employee WHERE emp_id=?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, empId);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
