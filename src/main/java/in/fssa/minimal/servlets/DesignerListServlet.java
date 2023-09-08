package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.Set;

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
 * Servlet implementation class GetAllDesignerServlet
 */
@WebServlet("/designer")
public class DesignerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		if (userIdObject == null) {
			try {
				UserService userService = new UserService();
				Set<User> designers = userService.getAllDesigner();
				request.setAttribute("designerDetails", designers);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/designer.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException e) {
				Logger.error(e);
			}
			
		} else {
			try {
				int userId = userIdObject.intValue();
				UserService userService = new UserService();
				User user = userService.findByUserId(userId);
				Set<User> designers = userService.getAllDesigner();
				request.setAttribute("userDetails", user);
				request.setAttribute("designerDetails", designers);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/designer.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException e) {
				Logger.error(e);
			} catch (ValidationException e) {
				Logger.error(e);
			}
		}
		
	}

}
