package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.List;
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
 * Servlet implementation class DesignerAppointmentServlet
 */
@WebServlet("/designer/appointment_list")
public class DesignerAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");

		if (userIdObject != null) {
			try {
				int userId = userIdObject.intValue();
				AppointmentService appointmentService = new AppointmentService();
				List<AppointmentRespondDTO> totalApp = appointmentService.getAllAppointment();
				int numberOfAppointments = totalApp.size();
				List<AppointmentRespondDTO> appointment = appointmentService.getAllAppointmentByToUserId(userId);
				UserService userService = new UserService();
				User user = userService.findByUserId(userId);
				String role = user.getRole();
				request.setAttribute("userDetails", user);
				request.setAttribute("totalAppointments", numberOfAppointments); // Set the totalAppointment attribute here
				request.setAttribute("appointmentDetails", appointment);
				if ("designer".equals(role)) {
				    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/designer_appointment_list.jsp");
				    dispatcher.forward(request, response);
				} else {
				    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/appointment_list.jsp");
				    dispatcher.forward(request, response);
				}

			} catch (ServiceException e) {
				Logger.error(e);
			} catch (ValidationException e) {
				Logger.error(e);
			}
		} else {
			request.setAttribute("appointmentDetails", null);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/appointment_list.jsp");
			dispatcher.forward(request, response);
		}
	}
}