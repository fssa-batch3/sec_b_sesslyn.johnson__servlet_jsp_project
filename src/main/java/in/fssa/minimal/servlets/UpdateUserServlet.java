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
		int userId = (Integer) request.getSession().getAttribute("userId");
		User returnUser = null;
		try {
			UserService userService = new UserService();
			User user1 = userService.findByUserId(userId);
			String role = user1.getRole();
			if (role.equals("user")) {
				user.setRole("user");
				user.setName(request.getParameter("name"));
				String phoneNumber = request.getParameter("phone_number");
				long number = Long.parseLong(phoneNumber);
				user.setPhoneNumber(number);
				user.setDate_of_birth(request.getParameter("date_of_birth"));
				user.setGender(request.getParameter("gender"));
				user.setImage(request.getParameter("image"));
			} else if (role.equals("seller")) {
				user.setRole("seller");
				user.setName(request.getParameter("name"));
				String phoneNumber = request.getParameter("phone_number");
				long number = Long.parseLong(phoneNumber);
				user.setPhoneNumber(number);
				user.setDate_of_birth(request.getParameter("date_of_birth"));
				user.setGender(request.getParameter("gender"));
				user.setImage(request.getParameter("image"));
				user.setGst_number(request.getParameter("gstNumber"));
				user.setShop_address(request.getParameter("shopAddress"));
			} else if (role.equals("designer")) {
				user.setRole("designer");
				user.setName(request.getParameter("name"));
				String phoneNumber = request.getParameter("phone_number");
				long number = Long.parseLong(phoneNumber);
				user.setPhoneNumber(number);
				user.setImage(request.getParameter("image"));
				String experience = request.getParameter("experience");
				int exper = Integer.parseInt(experience);
				user.setExperience(exper);
				user.setDesigner_description(request.getParameter("description"));
			}
			userService.updateUser(userId, user);
			response.sendRedirect(request.getContextPath() + "/user/details");

		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", user);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/edit_user.jsp");
			rd.forward(request, response);
		}
	}

}
