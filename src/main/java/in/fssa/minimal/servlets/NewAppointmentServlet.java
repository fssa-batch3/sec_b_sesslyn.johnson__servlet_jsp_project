package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.minimal.dto.AppointmentRespondDTO;
import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.AppointmentService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;
import model.ResponseEntity;

/**
 * Servlet implementation class EditAppointmentServlet
 */
@WebServlet("/designer/appointment/new")
public class NewAppointmentServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println("userId   " + userId);
		String designerIdParam = request.getParameter("id");
		System.out.println("deid  " +designerIdParam);
		int designerId = 0;

		if (designerIdParam != null) {
		    designerId = Integer.parseInt(designerIdParam);
		    request.getSession().setAttribute("designer_id", designerId);
		} 
		else {
			designerId = (Integer)request.getSession().getAttribute("designer_id");
		}
		System.out.println("Get  " + designerId);
		try {

			UserService userService = new UserService();
			User user = userService.findByUserId(userId);
			User designer = userService.findByDesignerId(designerId);
			AppointmentService appointmentService = new AppointmentService();
			Set<AppointmentRespondDTO> appointments = appointmentService.getAllAppointmentByToUserId(designerId);
			System.out.println(appointments);
			Map<String, Object> responseData = new HashMap<>();

			responseData.put("userDetails", user);
			responseData.put("appointmentDetails", appointments);
			responseData.put("designerDetails", designer);

			// Create a ResponseEntity for success
			ResponseEntity res = new ResponseEntity();
			res.setStatus(200);
			res.setData(responseData);
			res.setMessage("Details successfully sent");

			Gson gson = new Gson();
			String responseJson = gson.toJson(res);

			// Set response content type and encoding for JSON
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(responseJson);
		} catch (ValidationException e) {
			Logger.error(e);
			// Handle exceptions here and send an appropriate error response if needed
		} catch (ServiceException e) {
			Logger.error(e);
			// Handle exceptions here and send an appropriate error response if needed
		}
	}
}
