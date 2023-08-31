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
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.UserService;


/**
 * Servlet implementation class GetAllDesignerServlet
 */
@WebServlet("/designer")
public class DesignerListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			UserService userService = new UserService();
			Set<User> user = userService.getAllDesigner();
			request.setAttribute("designerDetails", user);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/designer.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		}
	}

}
