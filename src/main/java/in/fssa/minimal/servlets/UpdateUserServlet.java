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
			returnUser = userService.findByUserId(userId);
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			String image = request.getParameter("image");
			if(image != null) {
			user.setImage(image);
			}
			user.setPassword(request.getParameter("password"));
			String phoneNumber = request.getParameter("phone_number");
			long number = Long.parseLong(phoneNumber);
			user.setPhoneNumber(number);
			
			String designerValue = request.getParameter("is_designer");
			boolean isDesigner = designerValue != null;
			user.setDesigner(isDesigner);

			user.setDesigner(isDesigner);
			
			if (userId > 0) {
				userService.updateUser(userId, user);
				response.sendRedirect(request.getContextPath()+"/user/details");
			}
		}  catch (ServiceException | ValidationException e) {
		    Logger.error(e);
		    request.setAttribute("userDetails", returnUser);
		    request.setAttribute("error", e.getMessage());
		    RequestDispatcher rd = request.getRequestDispatcher("/edit_user.jsp");
		    rd.forward(request, response);
		}


	}

}
