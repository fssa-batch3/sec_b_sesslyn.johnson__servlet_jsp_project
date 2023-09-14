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
import in.fssa.minimal.util.Logger;
import in.fssa.minimal.validator.UserValidator;

@WebServlet("/header")
public class HeaderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    try {
	    	 int userId = (Integer) request.getSession().getAttribute("userId");

	        if (userId > 0) { 
	            User user = UserService.findByUserId(userId);
	                request.setAttribute("userDetails", user);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/profile/header.jsp");
	                dispatcher.forward(request, response);
	        }
	    } catch (NumberFormatException | ServiceException | ValidationException e) {
	    	Logger.error(e);
	    } 
	}

}