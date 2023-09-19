package in.fssa.minimal.servlets;

import java.io.IOException;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import in.fssa.minimal.exception.ServiceException;
import in.fssa.minimal.exception.ValidationException;
import in.fssa.minimal.model.Asset;
import in.fssa.minimal.model.Design;
import in.fssa.minimal.model.DesignAsset;
import in.fssa.minimal.model.Style;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.DesignAssetService;
import in.fssa.minimal.service.StyleService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

@WebServlet("/designer/design/create")
public class CreateDesignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		if (userId > 0) {
			User user = null;
			try {
				user = UserService.findByUserId(userId);
				StyleService styleService = new StyleService();
				Set<Style> styleList = styleService.getAllStyle();
				request.setAttribute("userDetails", user);
				request.setAttribute("styleDetails", styleList);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/design_form.jsp");
				rd.forward(request, response);
			} catch (ValidationException | ServiceException e) {
				Logger.error(e);
			}
		} else {
			StyleService styleService = new StyleService();
			Set<Style> styleList;
			try {
				styleList = styleService.getAllStyle();
				request.setAttribute("styleDetails", styleList);
				request.setAttribute("userDetails", null);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/design_form.jsp");
				rd.forward(request, response);
			} catch (ServiceException e) {
				Logger.error(e);
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		Design design = new Design();
		Asset asset = new Asset();
		DesignAsset designAsset = new DesignAsset();
		int styleId = 0;
		User user = new User();
		Set<Style> styleList = null;
		String customerName = request.getParameter("customer_name");
		String projectValue = request.getParameter("project_value");
		String apartmentSize = request.getParameter("apartment_size");
		String description = request.getParameter("design_description");

		String designDescription = "Customer Name: " + customerName + "\n" + "Project Value: " + projectValue + "\n"
				+ "Apartment Size: " + apartmentSize + "\n" + "Design Description: " + description;
		try {
			user = UserService.findByUserId(userId);
			StyleService styleService = new StyleService();
			styleList = styleService.getAllStyle();
			design.setName(request.getParameter("design_name"));
			design.setLocation(request.getParameter("location"));
			String styleName = request.getParameter("style");
			styleId = Integer.parseInt(styleName); // Corrected method name
			design.setStyleId(styleId);
			

			design.setDescription(designDescription);

			asset.setAssetsUrl(request.getParameter("asset_url"));

			DesignAssetService designAssetService = new DesignAssetService();
			designAssetService.createDesignAsset(design, asset, userId);

			response.sendRedirect(request.getContextPath() + "/designer/design");
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", user);
			request.setAttribute("styleDetails", styleList);
			request.setAttribute("designDetails", design);
			request.setAttribute("assetDetails", asset);
			request.setAttribute("styleId", styleId);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/design_form.jsp");
			rd.forward(request, response);
		}
	}
}
