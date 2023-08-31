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

/**
 * Servlet implementation class EditAppointmentServlet
 */
@WebServlet("/designer/appointment/new")
public class NewAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = (Integer) request.getSession().getAttribute("userId");
		UserService userService = new UserService();
		try {
			User user = userService.findByUserId(id);
			request.setAttribute("userDetails", user);
			RequestDispatcher rd = request.getRequestDispatcher(request.getContextPath() + "/book_appointment.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			e.printStackTrace();
		} catch (ServiceException e) {
			e.printStackTrace();
		}

	}

}
