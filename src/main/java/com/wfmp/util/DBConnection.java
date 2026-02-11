package com.wfmp.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	private static final String URL = "jdbc:mysql://localhost:3306/workforce";
	private static final String USER = "root";
	private static final String PASS = "9657";
	
	
	
	  private DBConnection() {}

	    public static Connection getConnection() throws Exception {
	    	
	        return DriverManager.getConnection(URL, USER, PASS);
	    }

}
