package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.minimal.dto.AppointmentRespondDTO;
import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.AppointmentService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class EditAppointmentServlet
 */
@WebServlet("/designer/appointment/new")
public class NewAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
	    String designerIdParam = request.getParameter("id");
	    
        int designerId = Integer.parseInt(designerIdParam);
        
		UserService userService = new UserService();
		try {
			User user = userService.findByUserId(userId);
			User designer = userService.findByDesignerId(designerId);
			AppointmentService appointmentService = new AppointmentService();
			Set<AppointmentRespondDTO> appointment = appointmentService.getAllAppointmentByToUserId(designerId);
			request.setAttribute("userDetails", user);
			request.setAttribute("appointmentDetails", appointment);
			request.setAttribute("designerDetails", designer);
			RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/calender.jsp");
			rd.forward(request, response);
		} catch (ValidationException e) {
			Logger.error(e);
		} catch (ServiceException e) {
			Logger.error(e);
		}

	}

}
