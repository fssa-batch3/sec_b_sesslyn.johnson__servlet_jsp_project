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

/**
 * Servlet implementation class ShopServlet
 */
@WebServlet("/shop")
public class ShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		if (userIdObject != null) {
			int userId = userIdObject.intValue();
			try {
				UserService userService = new UserService();
				User user = userService.findByUserId(userId);
				request.setAttribute("userDetails", user);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/product/shop.jsp");
				rd.forward(request, response);	
			} catch (ValidationException e) {
				Logger.error(e);
			} catch (ServiceException e) {
				Logger.error(e);
			}
		} else {
			RequestDispatcher rd = request.getRequestDispatcher("/pages/product/shop.jsp");
			rd.forward(request, response);	
		}
		
	}
}