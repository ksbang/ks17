package com.goku.ks;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class MySQLConnectionTest {
	
	private static final String DRIVER = "com.mysql.jdbc.Driver";
	
	private static final String URL = "jdbc:mysql://127.0.0.1:3306/bit";
	
	private static final String USER = "root";
	
	private static final String PW = "qwe124578";
	
	@Test
	public void testConnection() throws Exception{
		// TODO Auto-generated method stub
		Class.forName(DRIVER);
		
		try(Connection con = DriverManager.getConnection(URL, USER, PW)){
			
			System.out.println(con);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

		
	

}
