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
import model.HttpMethodRequestWrapper;

/**
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/user/create")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
		try {
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			user.setPassword(request.getParameter("password"));
			String phoneNumber = request.getParameter("phone_number");
			long number = Long.parseLong(phoneNumber);
			user.setPhoneNumber(number);
			String role = request.getParameter("toggle");
			System.out.println(role);
			if (role == null || role.isEmpty()) {
				role = "false";
			}

			if (role.equals("true")) {
				user.setRole("designer");
				  request = new HttpMethodRequestWrapper(request, "GET");
				request.setAttribute("userDetails", user);
				RequestDispatcher rs = request.getRequestDispatcher("/user/extra");
				rs.forward(request, response);
			} else if (role.equals("-1")) {
				user.setRole("seller");
				  request = new HttpMethodRequestWrapper(request, "GET");
				request.setAttribute("userDetails", user);
				RequestDispatcher rs = request.getRequestDispatcher("/user/extra");
				rs.forward(request, response);
			} else {
				user.setRole("user");
				UserService userService = new UserService();
				userService.createUser(user);
				RequestDispatcher rs = request.getRequestDispatcher("/user/login");
				rs.forward(request, response);
			}
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", user);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/register.jsp?error=");
			rd.forward(request, response);
		}
	}

}