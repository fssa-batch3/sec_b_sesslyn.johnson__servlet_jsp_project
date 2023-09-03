package in.fssa.minimal.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.UserService;

/**
 * Servlet implementation class DeleteUserServlet
 */
@WebServlet("/user/delete")
public class DeleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		User user = new User();
    	try {
			UserService userService = new UserService();
			String stringId = request.getParameter("id");
			HttpSession session = request.getSession(false);
			if (session != null) {
			    session.setAttribute("userId", 0);
			    Object userIdAttribute = session.getAttribute("userId");
			    System.out.println("userIdAttribute: " + userIdAttribute);
			    session.invalidate();
			}

			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				userService.deleteUser(id);
				response.sendRedirect(request.getContextPath() + "/index");
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}
