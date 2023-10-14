package in.fssa.minimal.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.UserService;

/**
 * Servlet implementation class LogOutServlet
 */
@WebServlet("/user/logout")
public class LogOutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
   
     
        HttpSession session = request.getSession(false);
        if (session != null) {
            Integer userIdAttribute = (Integer) session.getAttribute("userId");
            if (userIdAttribute != null) {
                session.setAttribute("userId", 0);
                session.invalidate();
            }
        }
        String removeProfileIdScript = "<script>localStorage.removeItem('profile_id'); localStorage.removeItem('user');</script>";
        response.getWriter().println(removeProfileIdScript);

        response.sendRedirect(request.getContextPath() + "/index");
    }
}

