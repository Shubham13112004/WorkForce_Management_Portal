package com.wfmp.dao;

import java.util.List;
import com.wfmp.model.Employee;

public interface EmployeeDAO {

    boolean addEmployee(Employee employee);

    List<Employee> getAllEmployees();

    Employee getEmployeeById(int empId);

    boolean updateEmployee(Employee employee);

    boolean deleteEmployee(int empId);
    
    Employee login(String email, String password);

}
