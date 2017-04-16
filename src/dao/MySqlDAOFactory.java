package dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class MySqlDAOFactory {
	public static final String driver = "com.mysql.jdbc.Driver";
	public static final String url = "jdbc:mysql://localhost:3306/new_task";
	public static final String dbUserName = "root";
	public static final String dbPassword = "";
	
	public static Connection createConnection()throws ClassNotFoundException
	{
		  Connection conn = null;
		  try 
		  {
			  
			 Class.forName(driver);
			 conn = DriverManager.getConnection(url, dbUserName, dbPassword);	
			 if(conn!=null)
			 System.out.println("Connection enabled");
			
		  } 
	
		  catch (Exception e) 
		  {
			  e.printStackTrace();
		  }
		  return conn;
	}
}
