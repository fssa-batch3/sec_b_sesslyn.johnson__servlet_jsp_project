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
import in.fssa.minimal.service.AppointmentService;

/**
 * Servlet implementation class UpdateAppointmentServlet
 */
@WebServlet("/designer/appointment_list/update")
public class UpdateAppointmentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        int appointmentId = Integer.parseInt(id);

        String status = request.getParameter("status");

        AppointmentService appService = new AppointmentService();
        try {
            appService.updateAppointmentRequestStatus(appointmentId, status);
            response.sendRedirect(request.getContextPath() + "/designer/appointment_list");
        } catch (ServiceException e) {
            e.printStackTrace();
        } catch (ValidationException e) {
            e.printStackTrace();
        }
    }
}
