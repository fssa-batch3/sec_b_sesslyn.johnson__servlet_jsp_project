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
import in.fssa.minimal.model.Review;
import in.fssa.minimal.service.ReviewService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class ReviewAppointmentServlet
 */
@WebServlet("/user/appointment_list/review")
public class ReviewAppointmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int appointmentId = Integer.parseInt(request.getParameter("appointmentId"));
			int fromUserId = Integer.parseInt(request.getParameter("fromUserId"));
			int toUserId = Integer.parseInt(request.getParameter("toUserId"));
			int starRating = Integer.parseInt(request.getParameter("rate"));
			Review review = new Review();
			review.setAppointment_id(appointmentId);
			review.setFrom_user(fromUserId);
			review.setTo_user(toUserId);
			review.setRatings(starRating);
			review.setFeedback(request.getParameter("description"));
			ReviewService reviewService = new ReviewService();
			reviewService.createReview(review);
			response.sendRedirect(request.getContextPath() + "/user/appointment_list");
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("error", e.getMessage());
			response.sendRedirect(request.getContextPath() + "/user/appointment_list");
		}
	}

}
