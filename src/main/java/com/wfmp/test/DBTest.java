package com.wfmp.test;

import java.sql.Connection;

import com.wfmp.util.DBConnection;

public class DBTest {
	
	public static void main(String[] args) {
        try (Connection con = DBConnection.getConnection()) {
            System.out.println("Database Connected Successfully!");
        } catch (Exception e) {
            e.printStackTrace();
        }

}
}
