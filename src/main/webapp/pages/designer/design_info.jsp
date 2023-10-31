<%@page import="in.fssa.minimal.model.Asset"%>
<%@page import="in.fssa.minimal.model.Design"%>
<%@page import="in.fssa.minimal.dto.DesignAssetRespondDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/designer/design_info.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<title>Design Details</title>
</head>
<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>
	<jsp:include page="<%=headerJSP%>" />

	<%
	DesignAssetRespondDTO designAssetDetails = (DesignAssetRespondDTO) request.getAttribute("designAssetDetails");
	String styleName = (String) request.getAttribute("styleName");
	int id = designAssetDetails.getId();
	System.out.println(id);
	%>

	<section>
		<div class="container flex">
			<div class="left">
				<div class="main_image">
					<%
					Design designId = designAssetDetails.getDesignId();
					Asset assetId = designAssetDetails.getAssetsId();
					%>
					<iframe src="<%=assetId.getAssetsUrl()%>" frameborder="0"
						allow="autoplay; encrypted-media" class="slide" allowfullscreen
						loading="lazy"></iframe>
				</div>
			</div>
			<div class="right">
				<h3><%=designId.getName()%></h3>

				<h4>Location</h4>
				<p class="locate"><%=designId.getLocation()%>
					<%
					if (!designAssetDetails.isActive()) {
					%>
					- Inactive
					<%
					}
					%>
				</p>
				<h4>Style</h4>
				<p class="locate"><%=styleName%></p>

				<h4>Design Details</h4>
				<p><%=designId.getDescription().replaceAll("\n", "<br>")%></p>
				</p>
				<div class="flex">
					<h4>Click here to access your design in your portfolio</h4>
					<div class="checkbox-apple" style="margin-top: 0rem;">
						<input class="yep" style="display: none" id="check-apple-2"
							type="checkbox"> <label for="check-apple-2"></label>
					</div>
					<div id="alertBox" style="display: none;">
						<p>Are you sure ?</p>
					</div>
				</div>
				<a href="<%=request.getContextPath()%>/designer/design/edit"><button>Edit</button></a>
			</div>
	</section>
	<script>
function showAlert(message) {
    const alertBox = document.getElementById("alertBox");
    alertBox.style.display = "block";
    alertBox.textContent = message; 
}

const checkbox = document.getElementById("check-apple-2");

<%if (designAssetDetails.isActive()) {%>
const isActive = true;
checkbox.checked = true;
<%} else {%>
const isActive = false;
<%}%>

checkbox.addEventListener("change", () => {
    if (checkbox.checked) {
        showAlert("Item activated.");
        sendAjaxRequest("activate");
    } else {
        showAlert("Item deactivated.");
        sendAjaxRequest("delete");
    }
});

function sendAjaxRequest(action) {
    const root = window.location.origin+"/minimalweb";
    const designAssetId = <%=designAssetDetails.getId()%>; 
    let servletUrl = '';
    if (action === "activate") {
    	servletUrl = root+'/designer/design/details/activate';
    } else if (action === "delete") {
        servletUrl = root+'/designer/design/details/delete';
    }

    fetch(servletUrl, {
        method: "GET",
    })
    .then((response) => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    })
    .then((data) => {
        console.log(data);
    })
    .catch((error) => {
        console.error("Fetch error: ", error);
    });
}
</script>
</body>
</html>