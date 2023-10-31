package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.minimal.dto.OrderRespondDTO;
import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.service.OrderService;
import in.fssa.minimal.util.Logger;
import model.ResponseEntity;

/**
 * Servlet implementation class FindOrderByIdServlet
 */
@WebServlet("/user/order/details")
public class FindOrderByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderIdStr = request.getParameter("order_id");
		int orderId = Integer.parseInt(orderIdStr);

		try {
			OrderService orderService = new OrderService();
			OrderRespondDTO order = orderService.getOrderById(orderId);
			Map<String, Object> responseData = new HashMap<>();
			responseData.put("orderDetails", order);

			ResponseEntity res = new ResponseEntity();
			res.setStatus(200);
			res.setData(responseData);
			res.setMessage("Details successfully sent");

			Gson gson = new Gson();
			String responseJson = gson.toJson(res);

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(responseJson);
		} catch (ValidationException e) {
			Logger.error(e);
		} catch (ServiceException e) {
			Logger.error(e);
		}

	}
}
