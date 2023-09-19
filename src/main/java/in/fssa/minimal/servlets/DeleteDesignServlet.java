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
import in.fssa.minimal.service.DesignAssetService;
import in.fssa.minimal.util.Logger;
import model.ResponseEntity;

/**
 * Servlet implementation class DeleteDesignServlet
 */
@WebServlet("/designer/design/details/delete")
public class DeleteDesignServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String designIdStr = (String) request.getSession().getAttribute("designId");
		int designId = Integer.parseInt(designIdStr);
		try {
			DesignAssetService  designAssetService = new DesignAssetService();			
			designAssetService.deleteDesignAsset(designId);
			ResponseEntity res = new ResponseEntity();
			res.setStatus(200);
			res.setData("");
			res.setMessage("design successfully deleted");
			
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
