package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.minimal.dto.DesignAssetRespondDTO;
import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.DesignAssetService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

@WebServlet("/user/details")
public class FindByUserIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		try {
			User user = UserService.findByUserId(userId);
			if (user != null) {
				System.out.print(user);
				request.setAttribute("userDetails", user);
				if ("user".equals(user.getRole())) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/profile/profile.jsp");
					dispatcher.forward(request, response);
				} else if ("designer".equals(user.getRole())) {
					DesignAssetService designAssetService = new DesignAssetService();
					Set<DesignAssetRespondDTO> totalDesign = (Set<DesignAssetRespondDTO>) designAssetService
							.getAllDesignAssetByDesignerId(userId);
					request.setAttribute("totalDesign", totalDesign);
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/profile/designer_profile.jsp");
					dispatcher.forward(request, response);
				} else if ("seller".equals(user.getRole())) {
					RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/profile/profile.jsp");
					dispatcher.forward(request, response);
				} else {
					response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
				}
			} else {
				response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
			}
		} catch (ServiceException e) {
			Logger.error(e);
		} catch (ValidationException e) {
			Logger.error(e);
		}
	}
}
