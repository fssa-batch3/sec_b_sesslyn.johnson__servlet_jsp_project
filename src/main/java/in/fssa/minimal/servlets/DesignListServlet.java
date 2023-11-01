package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.List;
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

/**
 * Servlet implementation class DesignListServlet
 */
@WebServlet("/designer/design")
public class DesignListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");

		if (userIdObject != null) {
			try {
				int userId = userIdObject.intValue();
				DesignAssetService designAssetService = new DesignAssetService();
				List<DesignAssetRespondDTO> totalDesign = (List<DesignAssetRespondDTO>) designAssetService.getAllDesignAssetByDesignerId(userId);
				User user = UserService.findByUserId(userId);
				request.setAttribute("userDetails", user);
				request.setAttribute("totalDesign", totalDesign);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/design_list.jsp");
				dispatcher.forward(request, response);

			} catch (ServiceException e) {
				Logger.error(e);
			} catch (ValidationException e) {
				Logger.error(e);
			}
		} else {
			request.setAttribute("totalDesign", null);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/design_list.jsp");
			dispatcher.forward(request, response);
		}
	}

}
