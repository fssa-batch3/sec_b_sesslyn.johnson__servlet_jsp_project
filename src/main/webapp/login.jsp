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
	margin: 0rem;
	padding: 0rem;
	font-family: 'Roboto Condensed', sans-serif;
	cursor: pointer;
}

/* Main page */
#index_main {
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
	text-transform: uppercase;
	display: flex;
	flex-direction: row;
}

.hide {
	display: none;
}

.block {
	display: block;
}

#main_page {
	display: flex;
	flex-direction: row;
	width: 70%;
}

.main_header {
	display: flex;
	flex-direction: row;
	height: 8.8%;
}

hr.new2 {
	border-bottom: 1px solid rgb(209, 209, 209);
	margin: -0.5rem 1rem 0rem 7rem;
}

.header {
	margin: 0.3rem 0.5rem 0rem 0.9rem;
	padding-bottom: 0rem;
}

.main_logo {
	height: 3rem;
	width: 3rem;
	margin-left: 2rem;
	padding: 1rem 1.5rem 0rem 1.5rem;
}

.main_header a {
	text-decoration: none;
}

.main_header p {
	font-size: 1.3rem;
	padding: 1rem 1.5rem 0rem 1.5rem;
	margin: 0.5rem 0rem 0.8rem 0rem;
	color: rgb(27, 25, 25);
}

.main_right {
	margin-left: -20rem;
	width: 100%;
}

.left_img {
	width: 22rem;
	height: 22rem;
	margin: 8rem 2rem 1rem 5rem;
}

.left_para {
	text-align: justify;
	margin: 1rem 30rem 1rem 5rem;
	letter-spacing: 0.1rem;
	font-size: 1.1rem;
}

.media {
	margin: 3rem 3rem 3rem 5rem;
}

.media span {
	padding: 0rem;
	font-weight: bold;
	font-size: medium;
}

.media span p {
	display: inline;
	margin-left: 1.5rem;
	padding-left: 1.5rem;
}

.right_img {
	width: 30.8rem;
	height: 40rem;
	margin-bottom: -0.3rem;
}

.main_img {
	box-shadow: -36px 170px 0px 34px rgba(217, 217, 217, 0.66);
}

#btn {
	background-color: transparent;
	color: black;
	border-color: transparent;
	font-size: 1.5rem;
	float: right;
	margin: -3rem 4rem 1rem 0rem;
}

#btn img {
	width: 2rem;
	height: 1rem;
	padding-left: 1rem;
}

hr.new1 {
	border-top: 1px solid rgb(20, 19, 19);
	margin: 1rem 5rem 2rem 4rem;
}

.right_para {
	margin: 3rem 2rem 2rem 2rem;
	letter-spacing: 0.1rem;
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
	top: 3.4rem;
	left: 0;
	background-color: #000;
	transform-origin: bottom right;
	transition: transform 0.25s ease-out;
}

.header_para:hover:after {
	transform: scaleX(1);
	transform-origin: bottom left;
}

hr.new3 {
	border-top: 1px solid rgb(20, 19, 19);
	margin: 1rem 5rem 2rem 4rem;
}

.form_btn {
	display: flex;
	flex-direction: row;
}

.btn_register {
	border-style: hidden hidden groove hidden;
	text-transform: uppercase;
	background-color: transparent;
	font-size: medium;
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: 300;
	margin: 2rem 1rem 2rem 4rem;
}

#btn_login {
	margin: 2rem 1rem 2rem 9rem;
}

#btn_password {
	margin: 2rem 1rem 2rem 10rem;
}

.right_corner {
	float: right;
	height: 100%;
	width: 30%;
}

a {
	text-decoration: none;
	color: #282525;
}

.menu {
	margin: 3rem 5rem;
	float: right;
}

.close_icon {
	width: 18px;
	height: 20px;
	margin: 4px 0;
}

.double_circle {
	width: 10px;
	float: left;
	height: 10px;
	border-radius: 50%;
	background-color: rgb(13, 12, 12);
	border: 1px solid black;
	box-shadow: inset 0 0 0 2px white;
	margin: 6.9rem 0rem 0rem 0.5rem;
}

#dot {
	margin: 7rem 0rem 0rem 4rem;
}

.dot {
	float: left;
	height: 8px;
	width: 8px;
	background-color: #bbb;
	border-radius: 50%;
	margin: 7rem 0rem 0rem 0.5rem;
}

.sign-up {
	margin: 10rem 2rem 2rem 4rem;
	text-transform: uppercase;
	font-family: 'Roboto Condensed', sans-serif;
}

.text_sign {
	margin: 0.1rem 2rem 2rem 4rem;
	color: grey;
	text-transform: uppercase;
	font-family: 'Roboto Condensed', sans-serif;
}

.form_input {
	margin: 1rem 0rem 1rem 4rem;
	font-family: 'Roboto Condensed', sans-serif;
}

label {
	font-size: medium;
	font-weight: bold;
	text-transform: uppercase;
	font-family: 'Roboto Condensed', sans-serif;
}

input {
	background-color: transparent;
	color: black;
	font-size: medium;
	float: right;
	font-family: 'Roboto Condensed', sans-serif;
	font-weight: bold;
	border: none;
}

.no_outline:focus {
	outline: none;
}

#email {
	float: inherit;
	margin: 0rem 1rem 0rem 4rem;
}

.btn_register a {
	color: black;
	text-decoration: none;
}

.sign_img {
	width: 12rem;
	height: 12rem;
	margin: 2rem 8rem;
}

#login_img {
	margin: 4rem 8rem;
}

.btn_register:hover {
	border-color: rgb(172, 170, 170);
}

.right_btn {
	margin-top: 4rem;
}
.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
}

.overlay:target {
	visibility: visible;
	opacity: 1;
}

.popup {
	margin: 70px auto;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	width: 30%;
	position: relative;
	transition: all 5s ease-in-out;
}

.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}

.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}

.popup .close:hover {
	color: #06D85F;
}

.popup .content {
	max-height: 30%;
	overflow: auto;
}

@media screen and (max-width: 700px) {
	.box {
		width: 70%;
	}
	.popup {
		width: 70%;
	}
}

#alert {
	padding: 0.4rem 2rem 0.2rem 2rem;
	margin: 1rem 0rem 0rem 8rem;
	background-color: black;
	color: white;
	border: none;
	border-radius: 10px;
}
</style>
</head>
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
			<a class="close" href="#">&times;</a>
			<div class="content">
				<%=errorMsg%>
			</div>
			<button id="alert" onclick="closeAlert()" type="button">Ok</button>
		</div>
	</div>
	<%
	}
	%>

	<div id="index_main">
		<div id="main_page">
			<div class="main_left" id="left-div">
				<div class="main_header">
					<span class="header"> <a
						href="<%=request.getContextPath()%>/index"> <img
							class="main_logo" src="https://iili.io/Hy0p6kx.jpg"
							alt="logo of minimalistic m">
					</a>
					</span> <span class="header"> <a href="../shop.html">
							<p class="header_para">SHOP</p>
					</a>
					</span> <span class="header"> <a href="../about.html">
							<p class="header_para">ABOUT</p>
					</a>
					</span> <span class="header"> <a href="#">
							<p class="header_para">ORDERS</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/user/appointment_list">
							<p class="header_para">SCHEDULE</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/designer">
							<p class="header_para">DESIGNERS</p>
					</a></span>
				</div>
				<hr class="new2">
				<div class="left">
					<img class="left_img" id="left-div-img"
						src="https://iili.io/HgdNtQp.png"
						alt="Design Minimalistic picture">
					<p class="left_para" id="left-div-para">Your house may have
						many functions, which requires that its device be ergonomic. This
						is where the role of the interior designor begins.</p>
				</div>
				<div class="media" id="media-div">
					<span id="media-span"> <a
						href="https://www.facebook.com/profile.php?id=100087049213851">facebook</a>
						<p>/</p>
					</span> <span id="media-span2"> <a
						href="https://twitter.com/narendramodi/status/1617894256928247808?ref_src=twsrc%5Etfw%7Ctwcamp%5Etweetembed%7Ctwterm%5E1617894256928247808%7Ctwgr%5E56ae42402f42bde87178a40653b92ee0b79920d8%7Ctwcon%5Es1_&ref_url=https%3A%2F%2Fthesportsgrail.com%2Fwho-is-rishi-shiv-prasanna-his-iq-biography-age-family-parents-father-app-name%2F">Twitter</a>
						<p>/</p>
					</span> <span><a
						href="https://www.instagram.com/endeavour_sess/?next=https%3A%2F%2Fwww.instagram.com%2F">Instagram</a></span>
				</div>
			</div>
			<div class="main_right">
				<div class="main_img">
					<img class="right_img" src="https://iili.io/Hy0ynYG.jpg"
						alt="Picture of a living room">
				</div>
				<div class="right">
					<div class="right_btn">
						<button id="btn">
							Sign Up <a href="#"> <img src="https://iili.io/Hy0ymnS.png"
								alt="arrow towards right">
							</a>
						</button>
					</div>
					<div>
						<hr class="new1">
						<p class="right_para">
							A Unique structure combined with a cushion <br>and a
							greenish plants.
						</p>
					</div>

				</div>
			</div>
		</div>
		<%String email = (String) request.getAttribute("email");%>
		<%String password = (String) request.getAttribute("password");%>
		<!-- Login Div -->
		<div class="right_corner">
			<div class="menu">
				<a href="<%=request.getContextPath()%>/index"> <img src="https://iili.io/Hy19PWB.png"
					class="close_icon" alt="close icon" /></a>
			</div>
			<div class="circle">
				<div class="dot" id="dot"></div>
				<div class="double_circle"></div>
				<div class="dot"></div>
			</div>
			<div>
				<h1 class="sign-up">Login</h1>
				<p class="text_sign">
					An website to decor your home.<br>Welcome to minimalistic
				</p>
			</div>
			<div class="data_form" onload="document.form1.text1.focus()">
				<form action="login" method="post">


					<div class="form_input">
						<label for="email">Email Id</label> <input type="email" value="<%=(email != null) ? email : ""%>"
							class="no_outline" id="user_email" name="email" required
							pattern="^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$"
							title="Must contain @ and only lower case is allowed."
							placeholder="sess@...">
					</div>
					<hr class="new1">

					<div class="form_input">
						<label for="password">Password</label> <input type="password" value="<%=(password != null) ? password : ""%>"
							class="no_outline" required name="password"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							placeholder="Password" id="user_password">
					</div>

					<div class="form_btn">
						<a href="<%=request.getContextPath()%>/user/new"><button
								class="btn_register" type="button">Sign in</button></a>
						<button class="btn_register" id="btn_password" type="submit">Login</button>
					</div>

				</form>
				<div>
					<img class="sign_img" id="login_img"
						src="https://iili.io/HgdNmGI.png" alt="minimalistic.logo">
				</div>

			</div>
		</div>
		<script>
		function closeAlert() {
			var alertDiv = document.getElementById("popup1");
			alertDiv.style.display = "none";
		}
		</script>
</body>
</html>