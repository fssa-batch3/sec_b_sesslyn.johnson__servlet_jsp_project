package in.fssa.minimal.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.service.AddressService;
import in.fssa.minimal.util.Logger;
import model.ResponseEntity;

/**
 * Servlet implementation class UpdateDefaultAddressServlet
 */
@WebServlet("/order/address/default")
public class UpdateDefaultAddressServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int userId = (Integer) request.getSession().getAttribute("userId");
        String addressIdStr = request.getParameter("addressId");
        System.out.println(addressIdStr);
        int addressId = Integer.parseInt(addressIdStr);
        try {
            AddressService addressService = new AddressService();
            addressService.updateDefaultStatus(userId, addressId);

            ResponseEntity res = new ResponseEntity();
            res.setStatus(200);
            res.setData("");
            res.setMessage("Address successfully updated");

            Gson gson = new Gson();
            String responseJson = gson.toJson(res);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(responseJson);
        } catch (ServiceException e) {
            Logger.error(e);
        } catch (ValidationException e) {
            Logger.error(e);
        }
    }
}

