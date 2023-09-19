<%@page import="in.fssa.minimal.util.StringUtil"%>
<%@page import="in.fssa.minimal.model.Asset"%>
<%@page import="in.fssa.minimal.model.Design"%>
<%@page import="in.fssa.minimal.dto.DesignAssetRespondDTO"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Designer Profile</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/designer/designer_details.css">
</head>
<style>
div.cardsNew {
	display: flex;
	flex-direction: row;
	text-align: center;
	margin-left: 18rem;
	flex-wrap: wrap;
}
#new1{
margin-left:0rem;
}</style>
<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />


	<%
	User user = (User) request.getAttribute("userDetails");
	boolean designerId = false;
	if (user != null) {
		String role = user.getRole();
		designerId = "designer".equals(role);
	}
	System.out.println(user);
	%>

	<%
	User designer = (User) request.getAttribute("designerDetails");
	System.out.println(designer);

	if (designer != null) {
	%>
	<div class="card details-card p-0">
		<div class="card">
			<div class="containRow">
				<div class="col-md-6 col-sm-12">
					<%
					String image = designer.getImage();
					if (image != null) {
					%>
					<img src="<%=image%>" class="img-fluid details-img"
						alt="Image of Designers" />
					<%
					} else {
					%>
					<img class="img-fluid details-img"
						src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
						alt="Image of Designers" />
					<%
					}
					%>
				</div>
				<div class="col-md-6 col-sm-12 description-container p-5">
					<div class="main-description">
						<p class="product-category mb-0">Interior Designer</p>
						<h3><%=designer.getName()%></h3>
						<hr>
						<div class="info">
							<a href="designer_link">
								<p class="product-price">Email :</p>
							</a>
							<p class="product-price"><%=designer.getEmail()%></p>
						</div>
						<hr>
						<p class="product-title mt-4 mb-1">About the Designer</p>
						<p class="product-description mb-4">Skilled in conceptualizing
							and executing innovative designs that align with clients' visions
							and functional requirements. Proficient in utilizing design
							software, such as AutoCAD and 3D modeling tools, to develop
							detailed plans and visualizations. Completed more than 20
							projects all over India and completed 1 project in Minimalistic.</p>
						<hr>
						<div class="eduInfo">
							<h3 class="edutext">Education :</h3>
							<p class="degreetext">B.E Interior Designer</p>
						</div>
						<div class="buttonInfo">
							<%
							if (user != null && !designerId) {
							%>
							<a
								href="<%=request.getContextPath()%>/designer/appointment/new?id=<%=designer.getId()%>"
								onclick="return true;">
								<button class="btnDelete" type="button">Book Now</button>
							</a>
							<%
							} else if (user == null && !designerId) {
							%>
							<button class="btnDelete" type="button"
								onclick="window.location.href='<%=request.getContextPath()%>/user/login';">Book
								Now</button>
							<%
							} else if (user != null && designerId) {
							%>
							<button class="btnDelete" type="button"
								onclick="alert('Designers cannot book appointments with other designers.');">Book
								Now</button>
							<%
							}
							%>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<p>Designer not found.</p>
	<%
	}
	%>
	<%
	Set<DesignAssetRespondDTO> designAssets = (Set<DesignAssetRespondDTO>) request.getAttribute("designAssetList");
	if (designAssets != null) {
		
	%>
	<h2>Projects</h2>
	<div class="cardsNew">
	<%for (DesignAssetRespondDTO designAsset : designAssets) {
		Design design = designAsset.getDesignId();
		Asset asset = designAsset.getAssetsId(); %>
	
		<div class="cardNew" id="new1">
			<div class="card__image-holderNew">
				<iframe width="300" height="280" src="<%=asset.getAssetsUrl()%>"
					frameborder="0" allow="autoplay; encrypted-media" allowfullscreen></iframe>
			</div>

			<div class="card-titleNew">
				<a href="#" class="toggle-info btnNew"> <span class="left"></span>
					<span class="right"></span>
				</a>
				<h2>
					<%=design.getName()%>
					<small><%=design.getLocation()%></small>
				</h2>
			</div>
			<div class="card-flap flap1">
				<div class="card-descriptionNew">
					<ul>
						<li>Customer Name: <%=(design != null) ? StringUtil.extractValue("Customer Name", design.getDescription()) : ""%></li>
						<li>Property Name: <%=(design != null) ? StringUtil.extractValue("Property Name", design.getDescription()) : ""%></li>
						<li>Apartment Size: <%=(design != null) ? StringUtil.extractValue("Apartment Size", design.getDescription()) : ""%></li>
						<li>Project Value: <%=(design != null) ? StringUtil.extractValue("Project Value", design.getDescription()) : ""%></li>
						<li>Designer: <%=designer.getName()%></li>
					</ul>
					<p><%=(design != null) ? StringUtil.extractValue("Design Description", design.getDescription()) : ""%></p>
				</div>
				<div class="card-flap flap2"></div>
			</div>
		</div>
	
	<%
	}
	}
	%>
	</div>
	<script>
    function confirmBooking(e) {
        if (confirm("Please login to book an appointment.")) {
            window.location.href = '<%=request.getContextPath()%>/user/login';
			} else {
				return false;
			}
		}
    
    document.addEventListener("DOMContentLoaded", function () {
        const toggleButtons = document.querySelectorAll(".toggle-info");

        toggleButtons.forEach(button => {
            button.addEventListener("click", function (event) {
                event.preventDefault();

                const cardFlap = this.closest(".cardNew").querySelector(".card-flap.flap1");
                cardFlap.classList.toggle("show");
            });
        });
    });
	</script>

</body>
</html>