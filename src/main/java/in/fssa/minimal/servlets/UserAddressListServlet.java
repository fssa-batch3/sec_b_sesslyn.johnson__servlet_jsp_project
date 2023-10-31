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

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.Address;
import in.fssa.minimal.service.AddressService;
import in.fssa.minimal.util.Logger;
import model.ResponseEntity;

/**
 * Servlet implementation class UserAddressListServlet
 */
@WebServlet("/order/address")
public class UserAddressListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		try {
			AddressService addressService = new AddressService();
			Set<Address> address = addressService.getAllAddressByUserId(userId);
			Map<String, Object> responseData = new HashMap<>();
			responseData.put("addressDetails", address);

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
