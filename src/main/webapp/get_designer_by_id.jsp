<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap"
	rel="stylesheet">
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

.head {
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .2);
}

#sellerHeader {
	margin-left: 8rem;
}

#sellerProfile {
	margin-left: 5rem;
}

.main_header {
	display: flex;
	flex-direction: row;
	width: 100%;
	height: 8.8%;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .2);
}

.header {
	margin: 0.3rem 0.5rem 0rem 2rem;
	padding-bottom: 0rem;
}

.main_logo {
	height: 3rem;
	width: 3rem;
	margin-left: 2rem;
	margin-top: 0.5rem;
}

#nav_header {
	margin-left: 8rem;
}

.nav_header {
	margin-left: 1rem;
	margin-right: 4rem;
}

.main_header a {
	text-decoration: none;
}

.main_header p {
	font-size: 1.3rem;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
	float: left;
	padding: 1rem 1.5rem 0rem 1.5rem;
	margin: 0.5rem 0rem 0.8rem 0.6rem;
	color: black;
}

.sign_in {
	background-color: #000;
	color: white;
	margin: 1rem 2rem 0.625rem -2rem;
	border-radius: 10px;
	border-color: transparent;
	padding: 0.5rem 1rem 0.5rem 1rem;
	font-size: 1.2rem;
}

.signIn {
	background-color: #000;
	color: white;
	margin: 1rem 2rem 0.625rem 4rem;
	border-radius: 10px;
	border-color: transparent;
	padding: 0.5rem 1rem 0.5rem 1rem;
	font-size: 1.2rem;
}

.log_in {
	background-color: #000;
	color: white;
	margin: 1rem 2rem 0.625rem 1rem;
	border-radius: 10px;
	border-color: transparent;
	padding: 0.5rem 1rem 0.5rem 1rem;
	font-size: 1.2rem;
}

.header_para {
	display: inline-block;
	position: relative;
	color: #000;
}

.header_para:after {
	content: '';
	position: absolute;
	width: 100%;
	transform: scaleX(0);
	height: 1.6px;
	top: 3rem;
	left: 0;
	background-color: #000;
	transform-origin: bottom right;
	transition: transform 0.25s ease-out;
}

.header_para:hover:after {
	transform: scaleX(1);
	transform-origin: bottom left;
}

.btn {
	display: flex;
	flex-direction: row;
}

.btn_appoint {
	display: inline-block;
	margin: 1rem 2rem 0.625rem -7rem;
	width: 130px;
	height: 40px;
	border-radius: 10px;
	border: solid black;
	background-color: #000;
	position: relative;
	overflow: hidden;
	transition: all 0.5s ease-in;
	z-index: 1;
}

.btn_appoint::before, .btn_appoint::after {
	content: '';
	position: absolute;
	top: 0;
	width: 0;
	height: 100%;
	transform: skew(15deg);
	transition: all 0.5s;
	overflow: hidden;
	z-index: -1;
}

.btn_appoint:hover {
	border-color: #000;
}

.btn_appoint::before {
	left: -10px;
	background: rgb(7, 7, 7);
}

.btn_appoint::after {
	right: -10px;
	background: white;
}

.btn_appoint:hover::before, .btn_appoint:hover::after {
	width: 58%;
}

.btn_appoint:hover span {
	color: rgb(7, 7, 7);
}

.btn_appoint span {
	font-size: 18px;
	transition: all 0.3s ease-in;
	position: relative;
	z-index: 1;
	color: white;
}

.btn_appoint:hover span:first-child {
	color: white;
}

.btn_appoint:hover span:nth-child(2) {
	color: black;
}

/* Hover */
.btn_delete {
	display: inline-block;
	width: 130px;
	height: 40px;
	border-radius: 10px;
	background-color: #000;
	margin: 1rem 2rem 0.625rem 0rem;
	border: solid black;
	position: relative;
	overflow: hidden;
	transition: all 0.5s ease-in;
	z-index: 1;
}

.btn_delete::before, .btn_delete::after {
	content: '';
	position: absolute;
	top: 0;
	width: 0;
	height: 100%;
	transform: skew(15deg);
	transition: all 0.5s;
	overflow: hidden;
	z-index: -1;
}

.btn_delete:hover {
	border-color: #000;
	/* Set the border color to brown on hover */
}

.btn_delete::before {
	left: -10px;
	background: rgb(8, 8, 8);
}

.btn_delete::after {
	right: -10px;
	background: #fff;
}

.btn_delete:hover::before, .btn_delete:hover::after {
	width: 58%;
}

.btn_delete:hover span {
	color: rgb(7, 7, 7);
	transition: 0.3s;
}

.btn_delete span {
	margin: 0;
	color: rgb(247, 245, 245);
	font-size: 18px;
	transition: all 0.3s ease-in;
}

.btn_delete:hover span:first-child {
	color: white;
}

.btn_delete:hover span:nth-child(2) {
	color: black;
}

.profile_img {
	width: 26px;
	height: 26px;
	margin: 1rem 0rem 0rem 2rem;
}

.cart_img {
	width: 26px;
	height: 28px;
	margin: 1rem 3rem 0rem 3rem;
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
	<div class="main_header">
		<span class="header" id="header_shop"> <a href="#"> <img
				class="main_logo" id="main_logo" src="https://iili.io/Hy0p6kx.jpg"
				alt="logo of minimalistic" />
		</a>
		</span>
		<div class="nav_header">
			<span class="header"> <a href="#">
					<p class="header_para">SHOP</p>
			</a>
			</span> <span class="header"> <a href="#">
					<p class="header_para">ABOUT</p>
			</a>
			</span> <span class="header"> <a href="#">
					<p class="header_para">ORDERS</p>
			</a>
			</span> <span class="header"> <a href="#">
					<p class="header_para">SCHEDULE</p>
			</a>
			</span> <span class="header"> <a href="#">
					<p class="header_para">DESIGNERS</p>
			</a>
			</span>
		</div>
		<button class="btn_delete" id="logOut">
			<span>Log </span><span>Out</span>
		</button>
		<a href="#"> <img src="https://iili.io/HyVDPVV.png"
			class="profile_img" alt="profile picture" />
		</a> <a href="#"> <img src="https://iili.io/HyVDSHu.png"
			class="cart_img" alt="profile picture" />
		</a>
	</div>
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
							<a href="/designer/appointment/new?id=<%=designer.getId()%>">
								<button class="btnDelete" type="submit">Book Now</button>
							</a>
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
</body>
</html>