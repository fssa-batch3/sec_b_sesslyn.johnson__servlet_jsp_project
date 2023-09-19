package in.fssa.minimal.servlets;

import java.io.IOException;

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
import in.fssa.minimal.service.StyleService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class DesignInfoServlet
 */
@WebServlet("/designer/design/details")
public class DesignInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
		 String id = request.getParameter("id");
		 int designId = Integer.parseInt(id);
		 
        int userId = (Integer) request.getSession().getAttribute("userId");
     
            try {
               
                DesignAssetRespondDTO designAsset = new DesignAssetRespondDTO();
                DesignAssetService designAssetService = new DesignAssetService();

                if (designId > 0) {    	
                    designAsset = designAssetService.findDesignAssetById(designId);
                    int styleId = designAsset.getDesignId().getStyleId();
                    StyleService styleService = new StyleService();
                    String styleName = styleService.findStyleName(styleId);
                	User user = UserService.findByUserId(userId);
    				request.setAttribute("userDetails", user);
                    request.setAttribute("designAssetDetails", designAsset);
                    request.setAttribute("styleName", styleName);
                    request.getSession().setAttribute("designId", id);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/design_info.jsp");
                    dispatcher.forward(request, response);
                }
            } catch (NumberFormatException | ServiceException | ValidationException e) {
                Logger.error(e);
            }
    }
}
