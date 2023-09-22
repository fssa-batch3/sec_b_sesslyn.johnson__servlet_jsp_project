package in.fssa.minimal.servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/login.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try {

			UserService userService = new UserService();
			User user = userService.Login(email);
			String pwd = user.getPassword();
			BCrypt.checkpw(password, pwd);

			if (!BCrypt.checkpw(password, pwd)) {
				throw new ValidationException("Incorrect Password");
			} else {
				Logger.info("You have been logged in successfully");
				Integer id = user.getId();
				if (id != null) {
					request.getSession().setAttribute("userId", id);
					response.sendRedirect(request.getContextPath() + "/user/details");
					return;
				}
			}
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("email", email);
			request.setAttribute("password", password);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/login.jsp");
			rd.forward(request, response);
		}
	}
}
