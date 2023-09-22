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
import in.fssa.minimal.model.Asset;
import in.fssa.minimal.model.Design;
import in.fssa.minimal.model.DesignAsset;
import in.fssa.minimal.model.Style;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.DesignAssetService;
import in.fssa.minimal.service.StyleService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class EditDesignServlet
 */
@WebServlet("/designer/design/edit")
public class EditDesignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		System.out.println("Us " +userId);
		String designIdStr = (String) request.getSession().getAttribute("designId");
		int designId = Integer.parseInt(designIdStr);
		System.out.println("Ds " +designId);
		if (userId > 0) {
			User user = null;
			try {
				DesignAssetRespondDTO designAsset = new DesignAssetRespondDTO();
				DesignAssetService designAssetService = new DesignAssetService();
				 designAsset = designAssetService.findDesignAssetById(designId);
				user = UserService.findByUserId(userId);
				StyleService styleService = new StyleService();
				Set<Style> styleList = styleService.getAllStyle();
				 request.setAttribute("designAssetDetails", designAsset);
				request.setAttribute("userDetails", user);
				request.setAttribute("styleDetails", styleList);
				RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/edit_design.jsp");
				rd.forward(request, response);
			} catch (ValidationException | ServiceException e) {
				Logger.error(e);
			}
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userId = (Integer) request.getSession().getAttribute("userId");
		String designIdStr = (String) request.getSession().getAttribute("designId");
		int designId = Integer.parseInt(designIdStr);
		Design design = new Design();
		Asset asset = new Asset();
		DesignAsset designAsset = new DesignAsset();
		int styleId = 0;
		User user = new User();
		Set<Style> styleList = null;
		try {
			user = UserService.findByUserId(userId);
			StyleService styleService = new StyleService();
			styleList = styleService.getAllStyle();
			design.setName(request.getParameter("design_name"));
			design.setLocation(request.getParameter("location"));
			String styleName = request.getParameter("style");
			styleId = Integer.parseInt(styleName); 
			design.setStyleId(styleId);

			String customerName = request.getParameter("customer_name");
			String projectValue = request.getParameter("project_value");
			String apartmentSize = request.getParameter("apartment_size");
			String description = request.getParameter("design_description");

			design.setDescription("Customer Name: " + customerName + "\n" + "Project Value: " + projectValue + "\n"
					+ "Apartment Size: " + apartmentSize + "\n" + "Design Description: " + description);

			asset.setAssetsUrl(request.getParameter("asset_url"));
			DesignAssetService designAssetService = new DesignAssetService();
			
			designAssetService.updateDesignAsset(designId,design,asset);

			response.sendRedirect(request.getContextPath() + "/designer/design");
		} catch (ServiceException | ValidationException e) {
			Logger.error(e);
			request.setAttribute("userDetails", user);
			request.setAttribute("styleDetails", styleList);
			request.setAttribute("designAssetDetails", designAsset);
			request.setAttribute("styleId", styleId);
			request.setAttribute("error", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/pages/designer/design_form.jsp");
			rd.forward(request, response);
		}
	}
}
