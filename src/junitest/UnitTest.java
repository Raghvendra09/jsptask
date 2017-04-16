package junitest;

import static org.junit.Assert.*;

import org.junit.Test;

import dao.UserDAO;
import model.User;

public class UnitTest {

	@Test
	public void testuser () {
		String name = "raghvendra";
		String email= "rsk.bond@gmail.com";
		String password = "qwerty";
		
		User u = new User(name,email,password);
		
		assertEquals(name, u.getFullName());
		assertEquals(email, u.getEmail());
		assertEquals(password, u.getPassword());
		System.out.println("Test Passed");
		
	}
	public void testlogin()
	{
	String name = "raghvendra";
	String email= "rsk.bond@gmail.com";
	String password = "qwerty";
	
	User u = new User(name,email,password);
	
	UserDAO  uuu = new UserDAO();
	User x=uuu.login(u);
	assertEquals(true,x.getFullName()!=null);
	System.out.println("Test Passed");
	}
	@Test
	public void testIsUserExists() {
		
		
		String name = "raghvendra";
		String email= "rsk.bond@gmail.com";
		String password = "qwerty";
		
		User u = new User(name,email,password);
		UserDAO  uuu = new UserDAO();
		
		assertEquals(true,uuu.isUserExists(u));
		System.out.println("Test Passed");
		
	}

	@Test
	public void testSignUp() {

		String name = "raghvendra";
		String email= "rsk.bond@gmail.com";
		String password = "qwerty";
		
		User u = new User(name,email,password);
		UserDAO  uuu = new UserDAO();
		
		assertEquals(false,uuu.signUp(u));
		System.out.println("Test Passed");
	}
	//Jsp -> controller-> DAO(DATa access object)-> JDBC

}
