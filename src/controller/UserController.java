package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDAO;
import model.User;

/**
 * Servlet implementation class UserController
 */
@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		
		if(action.equalsIgnoreCase("login"))
		{
			String email = request.getParameter("email");
			String pass = request.getParameter("password");
			System.out.println("Login --");
			if(email==null || pass==null)
			{
			//    Server Side Login Validation 	
				RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");  
				request.setAttribute("msg", "Please Enter valid Email or Password");
				rd.forward(request, response);	
			}
			else
			{
				User user =new User();
				user.setEmail(email);
				user.setPassword(pass);
				
				
				UserDAO userDAO = new UserDAO();
				
				User resUser = userDAO.login(user);
				if(resUser.getFullName()!=null)
				{
					System.out.println("Logged in");
					HttpSession session = request.getSession();
					session.setAttribute("Email", email);
					
					RequestDispatcher rd=request.getRequestDispatcher("jsp/Welcome.jsp");  
					request.setAttribute("msg", resUser.getFullName() );
					request.setAttribute("msg1", resUser.getEmail());
					rd.forward(request, response);
				}
				else
				{
					System.out.println("Wrong credentials");
					RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");  
					request.setAttribute("msg", "Wrong Username or Password");
					rd.forward(request, response);
				}
			}
		}
		else if(action.equalsIgnoreCase("signup"))
		{
			String name, username , email, password;
			name = request.getParameter("name").toString();
			
			email = request.getParameter("email").toString();
			password = request.getParameter("password").toString();
			if(email==null || password==null || name ==null)  //    Server Side Sign up Validation 
			{
				RequestDispatcher rd=request.getRequestDispatcher("jsp/registration.jsp");  
				request.setAttribute("msg", "Please Enter valid details");
				rd.forward(request, response);
			}
			//if(null)
			User  user = new User(name, email, password);
			
			UserDAO userDAO = new UserDAO();
			
			if(userDAO.isUserExists(user))
			{
				System.out.println("user already exists");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/registration.jsp");  
				request.setAttribute("msg", "user already exists");
				rd.forward(request, response);
			}
			else if(userDAO.signUp(user))
			{
				System.out.println("Successfully registered");
				HttpSession session = request.getSession();
				session.setAttribute("Email", email);
				RequestDispatcher rd=request.getRequestDispatcher("jsp/Welcome.jsp");  
				request.setAttribute("msg", user.getFullName() );
				request.setAttribute("msg1", user.getEmail() );
				rd.forward(request, response);
			}
			else
			{
				System.out.println("Something went wrong");
				RequestDispatcher rd=request.getRequestDispatcher("jsp/registration.jsp");  
				request.setAttribute("msg", "Something went wrong" );
				rd.forward(request, response);
			}
		}
		else if((action.equalsIgnoreCase("loginPage")))
		{
			RequestDispatcher rd=request.getRequestDispatcher("jsp/login.jsp");  
			
			rd.forward(request, response);
		}
		else if((action.equalsIgnoreCase("registerPage")))
		{
			RequestDispatcher rd=request.getRequestDispatcher("jsp/registration.jsp");  
			
			rd.forward(request, response);
		}
		else if((action.equalsIgnoreCase("logOut")))
		{
			RequestDispatcher rd=request.getRequestDispatcher("jsp/LogOut.jsp");  
			
			rd.forward(request, response);
		}
	}
	
}
