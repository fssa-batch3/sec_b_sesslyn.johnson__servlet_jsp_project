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
import in.fssa.minimal.model.Address;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.AddressService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class EditAddressServlet
 */
@WebServlet("/user/address/edit")
public class EditAddressServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		String addressIdStr = request.getParameter("addressId");
		int addressId = Integer.parseInt(addressIdStr);
		request.getSession().setAttribute("addressId", addressId);
		if (userId > 0) {
			User user = null;
			try {
				user = UserService.findByUserId(userId);
				AddressService addressService = new AddressService();
				Address address = addressService.getAddressById(addressId);
				request.setAttribute("userDetails", user);
				request.setAttribute("addressDetails", address);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/order/edit_address.jsp");
				rd.forward(request, response);
			} catch (ValidationException | ServiceException e) {
				Logger.error(e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		int addressId = (Integer) request.getSession().getAttribute("addressId");
		Address address = new Address();
		User user = null;
		try {
			user = UserService.findByUserId(userId);
			address.setName(request.getParameter("name"));
			address.setEmail(request.getParameter("email"));
			String phoneNumberStr = request.getParameter("phone_number");
			long phoneNumber = Long.parseLong(phoneNumberStr);
			address.setPhoneNumber(phoneNumber);
			address.setAddress(request.getParameter("address"));
			address.setCity(request.getParameter("city"));
			address.setState(request.getParameter("state"));
			address.setCountry(request.getParameter("country"));
			String pincodeStr = request.getParameter("pincode");
			int pincode = Integer.parseInt(pincodeStr);
			address.setPincode(pincode);
			address.setTitle(request.getParameter("title"));
			address.setUserId(userId);

			AddressService addressService = new AddressService();
			addressService.updateAddress(addressId, address);
			
			response.sendRedirect(request.getContextPath() + "/pages/order/order_address.html");

		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", user);
			request.setAttribute("addressDetails", address);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/order/edit_address.jsp");
			rd.forward(request, response);
		}
	}


}
