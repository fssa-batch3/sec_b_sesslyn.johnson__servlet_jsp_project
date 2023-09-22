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
 * Servlet implementation class ExtraUserDetails
 */
@WebServlet("/user/extra")
public class ExtraUserDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  RequestDispatcher rs = request.getRequestDispatcher("/pages/profile/extra_details.jsp"); 
		  rs.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    User user = new User();
	    User user1 = (User) request.getSession().getAttribute("userDetails");
	    System.out.println(user1);
	    try {
	    	 
	        user.setName(user1.getName());
	        user.setEmail(user1.getEmail());
	        user.setPassword(user1.getPassword());
	        user.setPhoneNumber(user1.getPhoneNumber());

	       String role = user1.getRole();
	        if (role.equals("designer")) 
	        {
	        	user.setRole("designer");
	            String exper = request.getParameter("experience");
	            int experience = Integer.parseInt(exper);
	            user.setExperience(experience);
	            user.setDesigner_description(request.getParameter("description"));
	        } else if (role.equals("seller")) {
	        	user.setRole("seller");
	        	String gstNumber = request.getParameter("gstNumber");
	        	System.out.println(gstNumber);
	           user.setGst_number(gstNumber);
	        
	            String aadhar = request.getParameter("aadharNumber");
	            long aadharNumber = Long.parseLong(aadhar);
	            user.setAadhar_number(aadharNumber);
	            user.setShop_address(request.getParameter("shopAddress"));
	        } else {
	            user.setRole("user");
	        }
            System.out.println(user);
	        UserService userService = new UserService();
	        userService.createUser(user);
	        response.sendRedirect(request.getContextPath() + "/user/login");
	    } catch (ServiceException | ValidationException e) {
	        Logger.error(e);
	        request.setAttribute("userDetails", user);
	        request.setAttribute("error", e.getMessage());
	        RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/register.jsp?error=");
	        rd.forward(request, response);
	    }
	}

}
