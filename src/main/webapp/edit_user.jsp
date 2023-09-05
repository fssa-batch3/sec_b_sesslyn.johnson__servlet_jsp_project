<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<style>
body {
	margin: 0;
	padding: 0;
}

.container_profile {
	background: #FFFFFF;
	width: 650px;
	height: 550px;
	margin: 0 auto;
	position: relative;
	margin-top: 8%;
	box-shadow: 2px 5px 20px rgba(119, 119, 119, 0.5);
}

.formSubmit {
	position: absolute;
	top: 90%;
	left: 74%;
	width: 100px;
	height: 40px;
	border-radius: 10px;
	background-color: #232323;
	color: white;
	border: none;
}

.formSubmit:hover {
	background-color: #ffbc43;
	color: black;
}

.leftbox {
	float: left;
	top: -5%;
	left: 5%;
	position: absolute;
	width: 15%;
	height: 110%;
	background: #ffbc43;
	box-shadow: 3px 3px 10px rgba(119, 119, 119, 0.5);
}

.leftbox nav a {
	list-style: none;
	padding: 35px;
	color: #FFFFFF;
	font-size: 1.1em;
	display: block;
	transition: all 0.3s ease-in-out;
}

.leftbox nav a:hover {
	color: #893a3f;
	transform: scale(1.2);
	cursor: pointer;
}

.leftbox nav a:first-child {
	margin-top: 7px;
}

.active {
	color: #893a3f;
}

.rightbox {
	width: 60%;
	height: 100%;
	margin-left: 12rem;
}

.profileId {
	transition: opacity 0.5s ease-in;
	position: absolute;
	width: 70%;
}

.profileId h1 {
	color: #2d2c2c;
	font-size: 1.5rem;
	margin-top: 40px;
	margin-bottom: 35px;
}

.profileIcon {
	height: 26px;
	width: 26px;
}

.labelTag {
	display: block;
	color: #777777;
	width: 80%;
	font-size: 1.2rem;
	margin-left: 2px;
	margin-top: 1.5rem;
	margin-bottom: 1rem;
}

.profileId span {
	font-size: 0.5em;
	color: #777777;
}

.profileId .btn {
	float: right;
	margin-right: 2rem;
	text-transform: uppercase;
	font-size: 10px;
	border: none;
	color: #893a3f;
}

.profileId .btn:hover {
	text-decoration: underline;
	font-weight: 900;
}

.profileId input {
	border: none;
	padding: 2px;
	margin: 0;
}

hr.new3 {
	border-top: 1px solid rgb(20, 19, 19);
	margin: 0.2rem 2rem 0rem 0rem;
}

.checkBox {
	margin-top: 2rem;
}

.designerCheckBox {
	margin-left: 0.8rem;
}

.delete {
	position: absolute;
    top: 25%;
    right: 30%;
}

.deleteIcon {
	width: 45px;
	height: 40px;
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

	<div class="container_profile">
		<div class="leftbox">
			<nav>
				<a id="profileId" class="active"> <img
					src="https://iili.io/HyVDPVV.png" class="profileIcon" />
				</a>
			</nav>
		</div>

		<form action="update" method="post">
			<div class="rightbox">
				<div class="profileId">
					<h1>Personal Info</h1>
					<label for="name" class="labelTag"><b>Name</b></label> <input
						type="text" name="name" value="<%=user.getName()%>" required>
					<button class="btn">Update</button>
					<hr class="new3">

					<label for="email" class="labelTag"><b>Email</b></label> <input
						type="email" name="email" value="<%=user.getEmail()%>" disabled>
					<hr class="new3">

					<label for="phone" class="labelTag"><b>Phone Number</b></label> <input
						type="tel" name="phone_number" value="<%=user.getPhoneNumber()%>"
						required>
					<button class="btn">Update</button>
					<hr class="new3">

					<label for="password" class="labelTag"><b>Password</b></label> <input
						type="password" name="password" value="<%=user.getPassword()%>"
						required>
					<button class="btn">Update</button>
					<hr class="new3">

					<div class="checkBox">
						<input type="checkbox" id="is_designer" name="is_designer">
						<label for="is_designer" class="designerCheckBox">Are you
							a designer?</label><br>
					</div>

				</div>
				<button class="formSubmit">Submit</button>
			</div>
		</form>
	</div>
	<%
	} else {
	%>
	<div class="container">
		<p>User not found.</p>
	</div>
	<%
	}
	%>
	<div class="delete">
		<a href="<%=request.getContextPath()%>/user/delete"
				onclick="return confirm('Are you sure to delete your account from the website ?');">
			<img src="https://iili.io/J9qwmGI.png" class="deleteIcon" /></a>
	</div>
	
</body>
</html>
