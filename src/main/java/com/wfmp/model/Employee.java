package com.wfmp.model;

import java.sql.Timestamp;

public class Employee {
	


	private int empId;
	private String name;
    private String email;
    private String department;
    private String role;
    private String status;
    private double salary;
    
    private Timestamp createdAt;

  
	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	public Employee() {
		
	}
    
	public Employee(int empId, String name, String email, String department, String role, String status,
			double salary) {
		
		this.empId = empId;
		this.name = name;
		this.email = email;
		this.department = department;
		this.role = role;
		this.status = status;
		this.salary = salary;
		
	}
    
   
    public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}

}
