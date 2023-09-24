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
import in.fssa.minimal.model.Appointment;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.AppointmentService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class BookAppointmentServlet
 */
@WebServlet("/designer/appointment/create")
public class BookAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println(userId);
		String designerIdParam = request.getParameter("designer_id");
		System.out.println(designerIdParam);
		int designerId = Integer.parseInt(designerIdParam);
		System.out.println(designerIdParam);
		UserService userService = new UserService();
		User user = null;
		User designer = null;
		try {
			user = userService.findByUserId(userId);
			designer = userService.findByDesignerId(designerId);
			Appointment appointment = new Appointment();
			appointment.setFromUser(userId);
			appointment.setToUser(designerId);
			appointment.setStatus("waiting_list");
			appointment.setEmail(request.getParameter("email"));
			String phoneNumber = request.getParameter("phone_number");
			long number = Long.parseLong(phoneNumber);
			appointment.setPhoneNumber(number);
			appointment.setDate(request.getParameter("date"));
			String inputTime = request.getParameter("time");
			String formattedTime = inputTime + ":00";
			appointment.setTime(formattedTime);
			String address = request.getParameter("address");
			if(address != null && !address.trim().isEmpty()) {
				appointment.setAddress(address);
			}
			else {
				appointment.setAddress(null);
			}

			AppointmentService appointmentService = new AppointmentService();
			appointmentService.createAppointment(appointment);
			response.sendRedirect(request.getContextPath() + "/user/appointment_list");
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/calender.jsp?id="+designerId);
			rd.forward(request, response);
		}

	}

}
