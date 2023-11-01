<%@page import="in.fssa.minimal.dto.DesignAssetRespondDTO"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.minimal.model.Style"%>
<%@page import="in.fssa.minimal.model.Design"%>
<%@page import="in.fssa.minimal.model.Asset"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@page import="in.fssa.minimal.util.StringUtil"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Design Form</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/designer/design_form.css">
</head>
<style>
.form-control {
	border: none;
	border-bottom: 2px solid #e6e6e6;
}
.head {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .2);
}

.wrapper {
	margin-top: -2rem;
}
.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
	z-index: 99999;
}
</style>
<body>
	<%
	String errorMsg = (String) request.getAttribute("error");
	%>
	<%
	if (errorMsg != null && !errorMsg.isEmpty()) {
	%>
	<div id="popup1" class="overlay">
		<div class="popup">
			<h2>Alert !</h2>
			<a onclick="closeAlert()" class="close" href="#">&times;</a>
			<div class="content">
				<%=errorMsg%>
			</div>
			<button id="alert" onclick="closeAlert()" type="button">Ok</button>
		</div>
	</div>
	<%
	}
	%>

	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />
	<%
	User user = (User) request.getAttribute("userDetails");
	System.out.println(user);
	%>

	<%
	DesignAssetRespondDTO designAsset = (DesignAssetRespondDTO) request.getAttribute("designAssetDetails");
	Design design = designAsset.getDesignId();
	Asset asset = designAsset.getAssetsId();
	%>
	<%
	List<Style> styleDetails = (List<Style>) request.getAttribute("styleDetails");
	%>
	<div class="wrapper">
		<form action="<%=request.getContextPath()%>/designer/design/edit"
			method="post" id="wizard" onsubmit="return validateForm()">
			<!-- SECTION 1 -->
			<section id="section1">
				<div class="inner">
					<div class="image-holder">
						<img
							src="https://images.livspace-cdn.com/plain/https://d3gq2merok8n5r.cloudfront.net/abhinav/3d-team-di-1658214249-E1mkx/jfm-2023-1672726979-9mxFg/wall-design-1672726991-8azl6/wd-7-1674306160-RF6L9.jpg"
							alt="">
					</div>
					<div class="form-content">
						<div class="form-header">
							<h3>Design Info</h3>
						</div>
						<p>Please fill in the design details</p>
						<div class="form-row">
							<div class="form-holder">
								<input type="text" name="design_name" placeholder="Design Name"
									value="<%=(design != null) ? design.getName() : ""%>"
									title="Only Alphabets ans numbers with space between" pattern="[a-zA-Z0-9 ]+"
									class="form-control" required>
							</div>

							<div class="form-holder">
								<input type="text" name="customer_name"
									placeholder="Customer Name"
									title="Only Alphabets with space between and special characters (. & ) only Eg: Mr.Sonam & Mrs.Sonam"
									pattern="[a-zA-Z. & ]+" class="form-control" required
									value="<%=(design != null) ? StringUtil.extractValue("Customer Name", design.getDescription()) : ""%>">
							</div>
						</div>
						<div class="form-row">
							<div class="form-holder">
								<input type="text" placeholder="Project Value"
									name="project_value"
									pattern="^[a-zA-Z0-9 .-]+(?:\s(thousand|lakh|crore|million|billion))?$"
									title="Enter a valid project value with suffix (e.g., 2.5 thousand|lakh|crore|million|billion)"
									class="form-control" required
									value="<%=(design != null) ? StringUtil.extractValue("Project Value", design.getDescription()) : ""%>">
							</div>
							<div class="form-holder">
								<input type="text" placeholder="Apartment Size"
									title="Only number followed by BHK Eg : 3 BHK"
									pattern="^\d+\sBHK$" class="form-control" name="apartment_size"
									required
									value="<%=(design != null) ? StringUtil.extractValue("Apartment Size", design.getDescription()) : ""%>">
							</div>

						</div>
						<div class="form-row">
							<div class="form-holder w-100">
								<input type="text" name="location" pattern="[a-zA-Z. & ]+"
									placeholder="Location"
									value="<%=(design != null) ? design.getLocation() : ""%>"
									required title="Only Alphabets with space between"
									class="form-control">
							</div>
						</div>
						<div class="form-row">
							<div class="form-holder">
								<select class="form-control" name="style" required>
									<option value="" disabled selected>Style</option>
									<%
									if (styleDetails != null) {
										for (Style style2 : styleDetails) {
									%>
									<option value="<%=style2.getId()%>" class="status"
										<%if (style2.getId() == design.getStyleId()) {%> selected <%}%>>
										<%=style2.getName()%>
									</option>
									<%
									}
									}
									%>
								</select>
							</div>
							<div class="form-holder">
								<input type="url" name="asset_url" placeholder="Video" 
									value="<%=(asset != null) ? asset.getAssetsUrl() : ""%>"
									class="form-control">
							</div>
						</div>
						<div class="form-row">
							<div class="form-holder w-100">
								<textarea name="design_description" id="design_description"
									pattern="^(?!.*\s{2})[^\s].*[^\s]$"
									placeholder="Design Description" required minlength="30"
									class="form-control" style="height: 99px;"><%=(design != null) ? StringUtil.extractValue("Design Description", design.getDescription()) : ""%></textarea>
								<span id="design-description-error" class="error-message"></span>
							</div>
						</div>
						<div class="checkbox-circle">
							<label> <input type="checkbox" checked> Your work
								speaks for you. So stay humble and just do the work. <span
								class="checkmark"></span>
							</label>
						</div>
					</div>
					<button class="btn common" id="forward1">
						<p>Submit</p>
					</button>
				</div>
			</section>


		</form>
	</div>
	<!-- Add this script to your JSP page -->
	<script>
		function validateForm() {
			var designName = document.forms["wizard"]["design_name"].value
					.trim();
			var customerName = document.forms["wizard"]["customer_name"].value
					.trim();
			var projectValue = document.forms["wizard"]["project_value"].value
					.trim();
			var apartmentSize = document.forms["wizard"]["apartment_size"].value
					.trim();
			var location = document.forms["wizard"]["location"].value.trim();
			var style = document.forms["wizard"]["style"].value.trim();
			var assetUrl = document.forms["wizard"]["asset_url"].value.trim();
			var designDescription = document.forms["wizard"]["design_description"].value
					.trim();

			if (designName === "" || customerName === "" || projectValue === ""
					|| apartmentSize === "" || location === "" || style === ""
					|| assetUrl === "" || designDescription === "") {
				alert("Please fill in all fields.");
				return false;
			}

			return true;
		}

		
		function closeAlert() {
		    // Hide the popup
		    var alertDiv = document.getElementById("popup1");
		    alertDiv.style.display = "none";
		}
	</script>
</body>

</html>