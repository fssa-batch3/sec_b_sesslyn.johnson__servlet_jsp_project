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
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;
import model.HttpMethodRequestWrapper;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/user/create")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = new User();
        try {
            user.setName(request.getParameter("name"));
            user.setEmail(request.getParameter("email"));
            user.setPassword(request.getParameter("password"));
            String phoneNumber = request.getParameter("phone_number");
            long number = Long.parseLong(phoneNumber);
            user.setPhoneNumber(number);
            String role = request.getParameter("toggle");
            System.out.println(role);
            if (role == null || role.isEmpty() || role.equals("false")) {
                user.setRole("user");
            } else if (role.equals("true")) {
                user.setRole("designer");
            } else if (role.equals("-1")) {
                user.setRole("seller");
            }

            if (user.getRole().equals("user")) {
                UserService userService = new UserService();
                userService.createUser(user);
                request = new HttpMethodRequestWrapper(request, "GET");
                response.sendRedirect(request.getContextPath() + "/user/login");
            } else {
                request = new HttpMethodRequestWrapper(request, "GET");
                request.setAttribute("userDetails", user);
                RequestDispatcher rs = request.getRequestDispatcher("/user/extra");
                rs.forward(request, response);
            }
        } catch (ServiceException | ValidationException e) {
            Logger.error(e);
            request.setAttribute("userDetails", user);
            request.setAttribute("error", e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/pages/profile/register.jsp");
            rd.forward(request, response);
        }
    }
}
