package in.fssa.minimal.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.Order;
import in.fssa.minimal.service.OrderService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/user/order/create")
public class CreateOrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Order order = new Order();
            int userId = (Integer) request.getSession().getAttribute("userId");

            String product_id = request.getParameter("product_id");
            String product_price = request.getParameter("product_price");
            String product_quantity = request.getParameter("product_quantity");
            String seller_id = request.getParameter("seller_id");
            String payment = request.getParameter("payment");
            System.out.println(payment);
            String status = request.getParameter("status");
            String address_id = request.getParameter("address_id");
     
            int price = Integer.parseInt(product_price);
            int quantity = Integer.parseInt(product_quantity);
            int sellerId = Integer.parseInt(seller_id);
            int addressId = Integer.parseInt(address_id);
            int productId = Integer.parseInt(product_id);
            
            order.setPrice(price);
            order.setQuantity(quantity);
            order.setPayment(payment);
            order.setStatus(status);
            order.setUserId(userId);
            order.setSellerId(sellerId);
            order.setAddressId(addressId);
            order.setProductId(productId);
         
            OrderService orderService = new OrderService();
            orderService.createOrder(order);
            
            response.setStatus(HttpServletResponse.SC_OK);

        } catch (ServiceException | ValidationException | NumberFormatException e) {
            Logger.error(e);
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
        }
    }

}

