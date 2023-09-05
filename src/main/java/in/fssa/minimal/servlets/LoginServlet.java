package in.fssa.minimal.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.UserService;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
		rd.forward(request, response);	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try {
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        UserService userService = new UserService();
	        User user = userService.findByEmail(email);

	        if (user == null) {
	            System.out.println("User not found");
	        } else if (!password.equals(user.getPassword())) {
	            System.out.println("Incorrect password");
	        } else {
	            System.out.println("You have been logged in successfully");
	            Integer id = user.getId();
	            if (id != null) {
	                request.getSession().setAttribute("userId", id); 
	                response.sendRedirect(request.getContextPath() + "/user/details");
	            }
	        }    

	    } catch (ServiceException e) {
	        e.printStackTrace();
	    } catch (ValidationException e) {
	        e.printStackTrace();
	    }
	}


}
