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

@WebServlet("/home_page")
public class HomePageServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		if (userIdObject != null) {
			int userId = userIdObject.intValue();
			try {
				UserService userService = new UserService();
				User user = userService.findByUserId(userId);
				request.setAttribute("userDetails", user);
				RequestDispatcher rd = request.getRequestDispatcher("/home_page.jsp");
				rd.forward(request, response);
			} catch (ValidationException e) {
				e.printStackTrace();
			} catch (ServiceException e) {
				e.printStackTrace();
			}
		} else {

			response.sendRedirect("/user/login");
		}
	}
}
