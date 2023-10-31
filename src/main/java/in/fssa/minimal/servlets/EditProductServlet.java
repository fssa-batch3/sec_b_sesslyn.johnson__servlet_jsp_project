package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.minimal.dto.ProductRespondDTO;
import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.Category;
import in.fssa.minimal.model.Product;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.CategoryService;
import in.fssa.minimal.service.ProductService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class EditProductServlet
 */
@WebServlet("/seller/product/update")
public class EditProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println(userId);
		int productId = (Integer) request.getSession().getAttribute("productId");
		System.out.println(productId);
		if (userId > 0 && productId > 0) {
			User user = null;
			
			try {
				ProductService productService = new ProductService();
				ProductRespondDTO product = productService.findByProductId(productId);
				user = UserService.findBySellerId(userId);
				CategoryService categoryService = new CategoryService();
				Set<Category> categoryList = categoryService.getAllCategory();
				request.setAttribute("productDetails", product);
				request.setAttribute("userDetails", user);
				request.setAttribute("categoryDetails", categoryList);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/seller/seller_update.jsp");
				rd.forward(request, response);
			} catch (ValidationException | ServiceException e) {
				Logger.error(e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		int designId = (Integer) request.getSession().getAttribute("productId");
		User user = new User();
		int categoryId = 0;
		Set<Category> categoryList = null;
		Product product = null;
		try {
			product = new Product();
			user = UserService.findByUserId(userId);
			CategoryService categoryService = new CategoryService();
			categoryList = categoryService.getAllCategory();

			product.setName(request.getParameter("product_name"));
			product.setDescription(request.getParameter("description"));
			product.setImageUrl(request.getParameter("image_url"));
			product.setWarranty(request.getParameter("warranty"));
			String priceValue = request.getParameter("price");
			int price = Integer.parseInt(priceValue);
			product.setPrice(price);
			String discountValue = request.getParameter("discount");
			int discount = Integer.parseInt(discountValue);
			product.setDiscount(discount);
			String quantityValue = request.getParameter("quantity");
			int quantity = Integer.parseInt(quantityValue);
			product.setQuantity(quantity);
			product.setSellerId(userId);
			String categoryName = request.getParameter("category");
			if (categoryName != null) {
				categoryId = Integer.parseInt(categoryName);
			}
			product.setCategoryId(categoryId);
			ProductService productService = new ProductService();
			productService.updateProduct(designId, product);

			response.sendRedirect(request.getContextPath() + "/pages/seller/product_list.html");
			
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", user);
			request.setAttribute("categoryDetails", categoryList);
			request.setAttribute("productDetails", product);
			request.setAttribute("categoryId", categoryId);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/seller/seller_update.jsp");
			rd.forward(request, response);
		}
	}

}
