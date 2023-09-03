<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Designer Profile</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	cursor: pointer;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
}

main {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	margin: 1rem 0rem 0rem 4rem;
	font-family: "Sarabun", "Roboto Condensed", sans-serif;
}

.slide:hover {
	background-color: #ffbc43;
}

.slide:hover .slide-image img {
	transform: translateY(-10%);
	transition: 500ms ease-in-out;
}

.slide:hover .viewMore {
	background-color: rgb(10, 10, 10);
	color: white;
}

.slide-image img {
	height: 120px;
	border-radius: 50%;
	width: 60%;
	margin: 0 auto;
	display: block;
	transition: transform 0.3s ease;
}

a {
	text-decoration: none;
	color: black;
}

#slider {
	position: relative;
}

.slider-container {
	margin-bottom: 2rem;
	padding: 2.5rem 1rem 0rem 0.5rem;
	overflow-x: hidden;
}

.slider {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	margin-top: 1rem;
}

.animation {
	transition: 500ms ease-in-out;
}

.slider-item {
	min-width: 280px;
	padding: 20px;
	margin-top: 0.5rem;
}

.slide {
	box-shadow: 0 0 20px #cdcddd;
	border-radius: 8px;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 20px;
}

.slide-image {
	width: 100%;
	margin-top: -30%;
	padding: 10px;
	margin-bottom: 30px;
	pointer-events: none;
}

.slide-name {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	font-size: 25px;
	margin-top: -20px;
	max-width: 60%;
	text-align: center;
	line-height: 26px;
	color: #0f0f0f;
	font-weight: 100;
}

.custom-line {
	width: 80%;
	height: 1px;
	margin: 10px 0;
	border: 1px solid #efefef;
}

.row {
	width: 80%;
	display: flex;
	justify-content: space-between;
	padding: 5px;
	color: #181818;
}

.row strong {
	color: #ffbc43;
}

.custom-row {
	font-weight: bold;
	align-items: center;
}

.slider-btn {
	width: 50px;
	height: 50px;
	border-radius: 20px;
	border: 0;
	background-color: #fff;
	box-shadow: 0 0 10px #ddd;
	position: absolute;
	top: 50%;
	transform: translateY(-50% + 50);
	font-size: 16px;
	padding-bottom: 5px;
	cursor: pointer;
}

.slider-btn:active {
	transform: translateY(-50% + 50) scale(0.9);
}

.slider-btn.btn-right {
	right: 0;
}

.slider-btn.btn-left {
	left: 0;
}

.viewMore {
	padding: 0.5rem 3.1rem;
	margin-left: 5px;
	border: none;
	background-color: #ffbc43;
}

/* Designers */
.container {
	box-sizing: border-box;
}

.details-card {
	width: 90%;
	margin: auto;
}

.containRow {
	margin: 0rem 5rem 0rem 7rem;
	display: flex;
	flex-direction: row;
}

.info {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.description-container {
	position: relative;
}

.img-fluid {
	width: 25rem;
	height: 33rem;
	margin: 8rem 2rem;
}

.main-description {
	margin: 8rem 4rem;
}

.main-description h3 {
	font-size: 2rem;
}

.product-title {
	font-size: 1.3rem;
	font-weight: bold;
	padding: 1rem 0rem 0rem 1rem;
	margin-top: 0.5rem;
}

.product-price {
	font-size: 1.8rem;
	padding: 1rem;
}

.product-description {
	padding: 1rem;
	margin-bottom: 1rem;
}

.product-category {
	padding: 1rem 0rem 0rem 1rem;
}

h3 {
	padding: 1rem;
}

.eduInfo {
	display: flex;
	flex-direction: row;
	margin: 1rem 0rem 0rem 0rem;
}

h3.edutext {
	font-size: 1.3rem;
}

.degreetext {
	margin: 1.3rem 0rem 0rem 0.5rem;
	font-size: 1.1rem;
}

#nav_6 {
	padding: 0.2rem 2.9rem;
}

#nav_7 {
	padding: 0.2rem 2.3rem;
}

#nav_8 {
	padding: 0.2rem 3.2rem;
}

.buttonInfo {
	margin: 1rem 0rem 0rem 0.8rem;
}

#btnPrimary {
	padding: 1rem 3.5rem;
	border: none;
	cursor: pointer;
	background-color: #ffbc43;
	color: black;
	overflow: hidden;
	transition: all 0.5s ease-in-out;
}

.btnDelete {
	margin-left: 2rem;
	padding: 1rem 3.5rem;
	border: none;
	cursor: pointer;
	background-color: black;
	color: white;
	overflow: hidden;
	transition: all 0.5s ease-in-out;
}
</style>
</head>
<body>
	<%
	String headerJSP = "";
	if (request.getAttribute("userDetails") != null) {
		headerJSP = "/header_after_login.jsp";
	} else {
		headerJSP = "/header_before_login.jsp";
	}
	%>

	<jsp:include page="<%=headerJSP%>" />

	<%
	User user = (User) request.getAttribute("userDetails");
	boolean designerId = false;
	if (user != null) {
		designerId = user.isDesigner();
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
					<img class="img-fluid details-img"
						src="https://interiordesign.net/wp-content/uploads/2021/06/62080-Manit-Rastogi-Morphogenesis.jpg"
						alt="Designer image">
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
							} else if (!designerId) {
							%>
							<button class="btnDelete" type="button"
								onclick="confirmBooking()">Book Now</button>
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
	<script>
	
	function confirmBooking() {
	    if (confirm("Please login to book an appointment.")) {
	        window.location.href = '<%=request.getContextPath()%>/login';
			} else {
				return false;
			}
		}
	
	</script>

</body>
</html>