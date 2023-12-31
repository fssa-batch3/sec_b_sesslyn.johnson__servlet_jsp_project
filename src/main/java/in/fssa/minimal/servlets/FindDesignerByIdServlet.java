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
import in.fssa.minimal.model.Review;
import in.fssa.minimal.model.User;
import in.fssa.minimal.service.DesignAssetService;
import in.fssa.minimal.service.ReviewService;
import in.fssa.minimal.service.UserService;
import in.fssa.minimal.util.Logger;

/**
 * Servlet implementation class FindDesignerById
 */
@WebServlet("/designer/details")
public class FindDesignerByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String idParam = request.getParameter("id");
		int designerId = Integer.parseInt(idParam);
		Integer userIdObject = (Integer) request.getSession().getAttribute("userId");
		DesignAssetService designAssetService = new DesignAssetService();
		
		if (userIdObject == null) {
			try {
				UserService userService = new UserService();
				request.setAttribute("userDetails", null);
				User designer = userService.findByDesignerId(designerId);
				request.setAttribute("designerDetails", designer);
				List<DesignAssetRespondDTO> designAsset = designAssetService.getAllActiveDesignAssetByDesignerId(designerId);
				ReviewService reviewService = new ReviewService();
				List<Review> reviewList = reviewService.getAllReviewByDesignerId(designerId);
            	System.out.println(reviewList);
            	request.setAttribute("reviewList", reviewList);	
				request.setAttribute("designAssetList", designAsset);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/get_designer_by_id.jsp");
				dispatcher.forward(request, response);
			}  catch (ServiceException | ValidationException e) {
				Logger.error(e);
			} 
			
		} else {
			try {
				int userId = userIdObject.intValue();
				UserService userService = new UserService();
				User user = userService.findByUserId(userId);
				User designer = userService.findByDesignerId(designerId);
				List<DesignAssetRespondDTO> designAsset = designAssetService.getAllActiveDesignAssetByDesignerId(designerId);
				ReviewService reviewService = new ReviewService();
				List<Review> reviewList = reviewService.getAllReviewByDesignerId(designerId);
            	System.out.println(reviewList);
            	request.setAttribute("reviewList", reviewList);
				request.setAttribute("designAssetList", designAsset);
				request.setAttribute("userDetails", user);
				request.setAttribute("designerDetails", designer);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/pages/designer/get_designer_by_id.jsp");
				dispatcher.forward(request, response);
			} catch (ServiceException | ValidationException e) {
				Logger.error(e);
			} 
		}
	}
}
