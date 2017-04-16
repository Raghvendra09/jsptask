package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.User;
import utility.DBUtility;

public class UserDAO {

	Connection con=null;
	PreparedStatement ps=null;
	public User login(User user)
	{
	
	  
	 User u =new User();
	 try {
			
		 con=MySqlDAOFactory.createConnection();
		// System.out.println("connection"+con);
		 PreparedStatement pst=null;
	  
		 //System.out.println(user.getEmail());

		// System.out.println(user.getPassword());
		 pst=con.prepareStatement("select * from users where email=? and password=?");
		 pst.setString(1,user.getEmail());
		 pst.setString(2, user.getPassword());
		 ResultSet rs=pst.executeQuery();
		
		 while(rs.next())
		 {
			
				 
				 u.setFullName(rs.getString(1));
				 u.setEmail(rs.getString(2));
			
				 
			 
		 }	
	  }
	 
   	catch(Exception  e)
		{
   		
			e.printStackTrace();
		}finally
	{
		DBUtility.close(con);
		DBUtility.close(ps);
	}
	return u;
		
		
		
	}
	public boolean isUserExists(User user)
	{
		 
		boolean res = false;
		 try {
				
			 con=MySqlDAOFactory.createConnection();
			 PreparedStatement pst=null;
			 pst=con.prepareStatement("select * from users where email=?");
			 pst.setString(1,user.getEmail());
		
			 ResultSet rs=pst.executeQuery();
			
			if(rs.next())
				res = true;
		  }
		 
	   	catch(Exception  e)
			{
	   		
				e.printStackTrace();
			}finally
		{
			DBUtility.close(con);
			DBUtility.close(ps);
		}
		return res;
	}
	public boolean signUp(User user)
	{
		int  status = 0;
		try {
			con = MySqlDAOFactory.createConnection();
			PreparedStatement pst = null;

			pst = con.prepareStatement("insert into users (name, email, password )values (?,?,?)");
			pst.setString(1, user.getFullName());
			//pst.setString(2, "username43");
			pst.setString(2, user.getEmail());
			pst.setString(3, user.getPassword());
			status = pst.executeUpdate();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBUtility.close(con);
			DBUtility.close(ps);
		}
	return status==0?false:true;
	}
	
	public String getName(User user)
	{
		return "";
	}
}
