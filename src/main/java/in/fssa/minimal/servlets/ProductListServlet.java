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

import in.fssa.minimal.dto.ProductRespondDTO;
import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.ProductService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;
import model.ResponseEntity;


/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/seller/product")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		if (userIdObject != null) {
			try {
				int userId = userIdObject.intValue();
				ProductService productService = new ProductService();
				Set<ProductRespondDTO> product = productService.findProductBySellerId(userId);
				UserService userService = new UserService();
				User user = userService.findBySellerId(userId);
				Map<String, Object> responseData = new HashMap<>();
				responseData.put("userDetails", user);
				responseData.put("productDetails", product);
			
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
}
