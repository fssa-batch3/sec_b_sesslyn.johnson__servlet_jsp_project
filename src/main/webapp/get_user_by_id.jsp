<%@page import="in.fssa.minimal.model.User"%>
<%@page import="in.fssa.minimal.service.UserService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Profile</title>
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

:root {
	--indent: 0;
}

@media screen and (min-width: 40rem) {
	:root {
		--indent: clamp(1.5rem, 4vw, 2.5rem);
	}
}

body {
	margin: 0;
	font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto,
		Oxygen, Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}

img {
	display: block;
	width: 100%;
	height: 100%;
}

.card {
	margin: 4rem 5rem 2rem 15rem;
	display: grid;
	grid-template-columns: var(--indent) calc(3 * var(--indent)) 1fr 1fr
		calc(2 * var(--indent)) var(--indent);
	grid-template-rows: var(--indent) calc(3 * var(--indent)) 1fr
		calc(2 * var(--indent)) var(--indent);
	max-width: 60rem;
}

.card::before {
	content: "";
	display: block;
	background: white;
	background-image: url(https://source.unsplash.com/6YmzwamGzCg/1200x1200);
	background-size: cover;
	grid-column: 2/-1;
	grid-row: 2/-1;
	box-shadow: 0 0 2rem hsla(0, 0%, 0%, 0.1);
}

.card::after {
	content: "";
	display: block;
	background: #e0dde4;
	grid-column: 1/-2;
	grid-row: 1/-2;
	z-index: -1;
}

.card img {
	grid-column: 4/5;
	grid-row: 3/4;
	box-shadow: 0 0 1rem hsla(0, 0%, 0%, 0.3);
	object-fit: cover;
	aspect-ratio: 1/1;
}

.card figcaption {
	grid-column: 3/5;
	grid-row: 3/4;
	display: grid;
	grid-template-columns: 3fr 1fr 2fr;
}

.card blockquote {
	grid-column: 1/3;
	margin: 0;
	padding-bottom: 1rem;
	font-size: 3rem;
	font-weight: 100;
	align-self: flex-end;
}

.card cite {
	grid-column: 1/2;
	font-size: 1.3rem;
	font-weight: 100;
	font-style: normal;
}

.card .credit {
	grid-column: 2/4;
	place-self: flex-end;
	margin: 0;
	padding: 1rem;
	text-align: end;
	color: white;
	font-weight: 400;
}

.card a {
	color: white;
}

#edit_icon {
	height: 20px;
	margin: 11rem 0rem 0rem -8rem;
}

.tooltip {
	position: relative;
	display: inline-block;
	margin-right: 20px;
}

#tooltiptext {
	display: none;
	width: 75px;
	background-color: rgb(198, 196, 196);
	color: #000;
	text-align: center;
	border-radius: 6px;
	position: absolute;
	top: 160px;
	left: -25px;
	transform: translateX(-50%);
	z-index: 1;
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
	System.out.println(user);
	if (user != null) {
	%>

	<div class="wrapper">
		<figure class="card">
			<%
			String image = user.getImage();
			%>
			<%
			if (image != null) {
			%>
			<img src="<%=user.getImage()%>" width="640" height="640" alt="Profile Image" />
			<%
			} else {
			%>
			<img src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
			width="640" height="640" alt="Profile Image" />
			<%
			}
			%>
			<span class="tooltip"> <a
				href="<%=request.getContextPath()%>/user/edit"> <img
					src="https://iili.io/J9HJ8fs.png" id="edit_icon" alt="edit icon">
			</a>
				<p id="tooltiptext">Edit</p>
			</span>

			<figcaption>
				<blockquote>
					<%=user.getName()%>
				</blockquote>
				<cite><strong>Email:</strong>
					<p><%=user.getEmail()%></p> </cite> <cite><strong>Phone
						Number:</strong>
					<p><%=user.getPhoneNumber()%></p> </cite> <cite><strong>Password:</strong>
					<p><%=user.getPassword()%></p> </cite>
				<p class="credit">
					<strong>Minimalistic</strong>
				</p>
			</figcaption>
		</figure>
	</div>
	<%
	} else {
	%>
	<p>User not found.</p>
	<%
	}
	%>
	<script>
	const editIcon = document.getElementById("edit_icon");
	const messageDiv = document.getElementById("tooltiptext");

	// Add a mouseover event listener to the edit icon
	editIcon.addEventListener("mouseover", () => {
	    messageDiv.style.display = "block";
	});

	// Add a mouseout event listener to hide the tooltip when not hovering
	editIcon.addEventListener("mouseout", () => {
	    messageDiv.style.display = "none";
	});


	</script>
</body>
</html>
