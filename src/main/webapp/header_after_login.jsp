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
</style>
</head>

<body>
	<%
	User user = (User) request.getAttribute("userDetails");
	if (user != null) {
		boolean designer = user.isDesigner();
%>
	<div class="head">
		<div class="main_header">
			<span class="header" id="header_shop"> <a
				href="<%= request.getContextPath() %>/home_page"> <img
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
				</span> <span class="header"> <a
					href="<%= request.getContextPath() %>/<%= designer ? "designer" : "user" %>/appointment_list">
						<p class="header_para">SCHEDULE</p>
				</a>
				</span> <span class="header"> <a
					href="<%= request.getContextPath() %>/designer">
						<p class="header_para">DESIGNERS</p>
				</a>
				</span>
			</div>
			<a href="<%= request.getContextPath() %>/user/logout"
				onclick="return confirm('Are you sure to logout from the website ?');">
				<button class="btn_delete" id="logOut">
					<span>Log</span><span>Out</span>
				</button>
			</a> <a href="<%= request.getContextPath() %>/user/details"> <img
				src="https://iili.io/HyVDPVV.png" class="profile_img"
				alt="profile picture" />

			</a> <a href="#"> <img src="https://iili.io/HyVDSHu.png"
				class="cart_img" alt="profile picture" />
			</a>
		</div>
	</div>
<%
	} else {
%>
	<p>User not found.</p>
<%
	}
%>
</body>
</html>