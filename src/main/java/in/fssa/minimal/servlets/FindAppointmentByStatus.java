package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.Set;

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
 * Servlet implementation class FindAppointmentByStatus
 */
@WebServlet("/designer/appointment/status")
public class FindAppointmentByStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String status = request.getParameter("status");
		AppointmentService appointmentService = new AppointmentService();
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		try {
			int userId = userIdObject.intValue();
			Set<AppointmentRespondDTO> totalApp = appointmentService.getAllAppointment();
			int numberOfAppointments = totalApp.size();
			Set<AppointmentRespondDTO> appointment = appointmentService.getAllAppointmentByToUserId(userId);
			UserService userService = new UserService();
			User user = userService.findByUserId(userId);
			String role = user.getRole();
			Set<AppointmentRespondDTO> totalBasedOnStatus = appointmentService.getAllAppointmentByStatus(status);
			request.setAttribute("userDetails", user);
			request.setAttribute("totalAppointments", numberOfAppointments);
			request.setAttribute("appointmentDetails", appointment);
			request.setAttribute("statusDetails", totalBasedOnStatus);
			
		} catch (ValidationException e) {
			Logger.error(e);
		} catch (ServiceException e) {
			Logger.error(e);
		}
	}

}
