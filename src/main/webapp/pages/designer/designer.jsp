<%@page import="in.fssa.minimal.model.User"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of Designers</title>
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
	display: flex;
	flex-direction: row;
	min-width: 280px;
	padding: 20px;
	margin-top: 0.5rem;
	flex-wrap: wrap;
	justify-content: flex-start;
}

.slide {
	box-shadow: 0 0 20px #cdcddd;
	border-radius: 8px;
	display: flex;
	flex-direction: column;
	align-items: center;
	padding-bottom: 20px;
	margin: 2rem;
	min-width: 240px;
	margin-bottom: 6rem;
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
	height: 30rem;
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
	display: flex;
	flex-direction: row;
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

#btnDelete {
	margin-left: 5rem;
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
	Set<User> designerList = (Set<User>) request.getAttribute("designerDetails");
	%>

	<main id="slider">
		<section class="slider-container">
			<div class="slider">
				<div class="slider-item">

					<%
					for (User designer : designerList) {
					%>
					<div class="slide">
						<figure class="slide-image">
							<%
							String image = designer.getImage();
							if (image != null) {
							%>
							<img src="<%=image%>" alt="Image of Designers" />
							<%
							} else {
							%>
							<img
								src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
								alt="Image of Designers" />
							<%
							}
							%>
						</figure>
						<h4 class="slide-name"><%=designer.getName()%></h4>
						<p class="slide-profession">Designer</p>
						<div class="custom-line"></div>
						<div class="row">
							<p class="project">
								Id :
								<%=designer.getId()%></p>
							<strong>.</strong>
							<p class="team">3 Persons</p>
						</div>
						<div class="custom-line"></div>
						<div class="row custom-row">
							<a href="designer/details?id=<%=designer.getId()%>">
								<button class="viewMore" data-id="designerId">View More</button>
							</a>
						</div>
					</div>
					<%
					}
					%>
				</div>
			</div>
		</section>
	</main>


</body>
</html>