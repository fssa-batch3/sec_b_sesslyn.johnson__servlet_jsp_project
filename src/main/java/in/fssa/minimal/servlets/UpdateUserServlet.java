package in.fssa.minimal.servlets;

import java.io.IOException;
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
 * Servlet implementation class UpdateServlet
 */
@WebServlet("/user/update")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
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
			
			String designerValue = request.getParameter("is_designer");
			boolean isDesigner = designerValue != null;
			user.setDesigner(isDesigner);

			user.setDesigner(isDesigner);
			System.out.println(user);
			UserService userService = new UserService();
			String stringId = request.getParameter("id");

			if (stringId != null && !stringId.isEmpty()) {
				int id = Integer.parseInt(stringId);
				userService.updateUser(id, user);
				response.sendRedirect(request.getContextPath()+"/user/details?id=" + id);
			}
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}

	}

}
