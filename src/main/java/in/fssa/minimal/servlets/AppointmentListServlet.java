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
import in.fssa.minimal.service.AppointmentService;

/**
 * Servlet implementation class CreateUserServlet
 */
@WebServlet("/appointment_list")
public class AppointmentListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			AppointmentService appointmentService = new AppointmentService();
			Set<AppointmentRespondDTO> appointment = appointmentService.getAllAppointment();
			request.setAttribute("appointmentDetails", appointment);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/appointment_list.jsp");
			dispatcher.forward(request, response);
		} catch (ServiceException e) {
			e.printStackTrace();
		} catch (ValidationException e) {
			e.printStackTrace();
		}
	}

}