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

	        // Check if the 'image' parameter is present and not empty
	        String image = request.getParameter("image");
	        if (image != null && !image.isEmpty()) {
	            user.setImage(image);
	        }

	        user.setPassword(request.getParameter("password"));
	        String phoneNumber = request.getParameter("phone_number");
	        long number = Long.parseLong(phoneNumber);
	        user.setPhoneNumber(number);

	        // Check if the 'date_of_birth' parameter is present
	        String dateOfBirth = request.getParameter("date_of_birth");
	        if (dateOfBirth != null && !dateOfBirth.isEmpty()) {
	            user.setDateOfBirth(dateOfBirth);
	        }

	        // Check if the 'user_gender' parameter is present
	        String gender = request.getParameter("user_gender");
	        if (gender != null && !gender.isEmpty()) {
	            user.setGender(gender);
	        }
	        
	        String role = request.getParameter("toggle");
	        if (role != null && !role.isEmpty()) {
	            if (role.equals("false")) {
	                user.setRole("user"); // Set the role to "user"
	            } else if (role.equals("-1")) {
	                user.setRole("seller"); // Set the role to "seller"
	            } else if (role.equals("true")) {
	                user.setRole("designer"); // Set the role to "designer"
	            }else {
	            	 user.setRole("user");
	            }
	        }

	        if (userId > 0) {
	            userService.updateUser(userId, user);
	            response.sendRedirect(request.getContextPath() + "/user/details");
	        }
	    } catch (ServiceException | ValidationException e) {
	        Logger.error(e);
	        request.setAttribute("userDetails", user);
	        request.setAttribute("error", e.getMessage());
	        RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/edit_user.jsp");
	        rd.forward(request, response);
	    }
	}


}
