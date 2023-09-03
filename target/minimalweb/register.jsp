<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form</title>
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
	cursor: pointer;
	overflow: hidden;
}

.main_left {
	width: 58%;
}

#index_main {
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
	text-transform: uppercase;
	display: flex;
	flex-wrap: wrap;
	flex-direction: row;
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
	padding: 0.9rem 1.5rem 0rem 1.5rem;
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

.left_img {
	width: 32rem;
	height: 30rem;
	margin: 4rem 2rem 1rem 12rem;
}

.media a {
	text-decoration: none;
	color: #000;
}

.left_para {
	text-align: justify;
	margin: 1rem 19rem 1rem 14rem;
	letter-spacing: 0.1rem;
	font-size: 1.1rem;
}

.media {
	margin: 3rem 10rem 3rem 13rem;
}

.media span {
	padding: 1rem;
	font-weight: bold;
	font-size: medium;
}

.media span p {
	display: inline;
	margin-left: 1.5rem;
	padding-left: 1.5rem;
}

.main_right {
	width: 100%;
}

.right_img {
	width: 37.5rem;
	height: 40rem;
	margin-bottom: -0.3rem;
}

.main_img {
	box-shadow: -44px 250px 0px 0px rgba(217, 217, 217, 0.66);
}

#btn {
	background-color: transparent;
	color: black;
	border-color: transparent;
	font-size: 1.5rem;
	float: right;
	margin: 0.5rem 6rem 2rem 1rem;
}

#btn img {
	width: 2rem;
	height: 1rem;
	padding-left: 1rem;
}

hr.new1 {
	border-top: 1px solid rgb(20, 19, 19);
	margin: 3.5rem 3rem 2rem 1rem;
	width: 80%;
}

.right_para {
	margin: 0rem 2rem 0rem 2rem;
	letter-spacing: 0.1rem;
}

.para_right {
	text-transform: none;
	font-size: 20px;
	letter-spacing: 1.5px;
	font-family: Georgia, 'Times New Roman', Times, serif;
	margin: 0rem 2rem 1rem 2rem;
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
/* login */
#right_corner {
	display: block;
	float: right;
	height: 100%;
	width: 30%;
	background-color: #fff;
}

#left-div {
	width: 50%;
}

#left-div-img {
	width: 22rem;
	height: 22rem;
	margin: 8rem 2rem 1rem 5rem;
}

#left-div-para {
	margin: 3rem 5rem 1rem 5rem
}

#media-div {
	margin: 3rem 3rem 3rem 5rem;
}

#media-span {
	padding: 0rem;
}

#media-span2 {
	padding: 0rem;
}

#new {
	margin-top: -0.3rem;
}

#rightImg {
	width: 35.5rem;
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
	font-family: 'Roboto Condensed', sans-serif;
	background-color: transparent;
	color: black;
	font-size: medium;
	float: right;
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
	margin: 2rem 1rem 2rem 7rem;
}

.btn_register a {
	color: black;
	text-decoration: none;
}

#login_img {
	margin: 4rem 8rem;
}

.btn_register:hover {
	border-color: rgb(172, 170, 170);
}

small {
	padding-left: 4rem;
	padding-right: 5rem;
}

#small {
	padding-left: 4.5rem;
}

input[type=email] {
	text-overflow: ellipsis;
	padding-right: 0rem;
}

#inbox {
	margin-right: 350px;
	margin-top: 5px;
}

.input-container {
	display: flex;
	align-items: center;
	margin: 4px 0px;
}

#designer_toggle {
	margin-left: -320px;
	text-transform: none;
}

#inbox {
	margin-left: 130px;
	margin-top: 5px;
}
</style>
</head>
<body>
	<div id="index_main">
		<div id="main_page">
			<div class="main_left" id="left-div">
				<div class="main_header">
					<span class="header"> <a
						href="<%=request.getContextPath()%>/index"> <img
							class="main_logo" src="https://iili.io/Hy0p6kx.jpg"
							alt="logo of minimalistic m"></span></a> <span class="header">
						<a href="./pages/shop.html">
							<p class="header_para">SHOP</p>
					</a>
					</span> <span class="header"> <a href="#">
							<p class="header_para">ABOUT</p>
					</a></span> <span class="header"> <a href="#">
							<p class="header_para">ORDERS</p>
					</a></span> <span class="header"> <a href="#">
							<p class="header_para">SCHEDULE</p>
					</a></span> <span class="header"> <a
						href="<%=request.getContextPath()%>/designer">
							<p class="header_para">DESIGNERS</p>
					</a></span>
				</div>
				<hr class="new2" id="new">
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
					<img class="right_img" id="rightImg"
						src="https://iili.io/Hy0ynYG.jpg" alt="Picture of a living room">
				</div>
				<div class="right">
					<div class="right_btn">
						<button id="btn" onclick="register()">
							Sign Up <a href="#"> <img src="https://iili.io/Hy0ymnS.png"
								alt="arrow towards right"></a>
						</button>
					</div>
					<div>
						<hr class="new1">
						<p class="para_right">
							Are you a <a href="#">seller</a>?
						</p>
						<p class="right_para">
							A Unique structure combined with a cushion <br>and a
							greenish plants.
						</p>
					</div>
				</div>
			</div>
		</div>
		<div id="right_corner">
			<div class="menu">
				<a href="index.jsp"> <img src="https://iili.io/Hy19PWB.png"
					class="close_icon" alt="close icon" /></a>
			</div>
			<div class="circle">
				<div class="double_circle"></div>
				<div class="dot"></div>
				<div class="dot"></div>
			</div>
			<div>
				<h1 class="sign-up">Sign up</h1>
				<p class="text_sign">
					An website to decor your home.<br>Welcome to minimalistic
				</p>
			</div>
			<div class="data_form">

				<!-- Form -->
				<form action="create" method="post">
					<div class="form_input">
						<label for="name">Name</label> <input type="text" name="name"
							class="no_outline" id="user_name" pattern="[a-zA-Z]+"
							title="Only contain Alphabets" required placeholder="Sesslyn">
					</div>
					<hr class="new3">
					<div class="form_input">
						<label for="email">Email Id</label> <input type="email"
							name="email" class="no_outline" id="user_email"
							pattern="^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$"
							title="Must contain @ and only lower case is allowed." required
							placeholder="sess@...">
					</div>
					<hr class="new3">
					<div class="form_input">
						<label for="phone">Phone Number</label> <input
							pattern="[6-9][0-9]{9}" type="tel" name="phone_number"
							title="It should be a 10-digit number starting with a digit between 6 and 9."
							class="no_outline" id="user_no" required maxlength="10"
							placeholder="995239...">
					</div>
					<hr class="new3">
					<div class="form_input">
						<label for="password">Password</label> <input class="no_outline"
							required type="password" name="password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
							placeholder="Password" id="user_password">
					</div>
					<hr class="new3">
					<div class="form_input">
						<label for="repeat_password">Confirm password</label> <input
							class="no_outline" required type="password"
							name="repeat_password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
							placeholder="Password" id="confirm_password">
					</div>
					<div class="input-container">
						<input type="checkbox" id="inbox" name="is_designer" value="true">
						<p for="is_designer" id="designer_toggle">Are you a designer ?</p>
					</div>
					<small>* Password must have 8 characters, uppercase,</small> <small
						id="small"> lowercase, and special case.</small>
					<div class="form_btn">
						<a href="<%=request.getContextPath()%>/login"><button
								class="btn_register"  type="button">Login</button></a>
						<button class="btn_register" id="btn_login" type="submit">Sign Up</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<script>
		function checkPassword() {
			let user_password = document.getElementById("user_password").value;
			let confirm_password = document.getElementById("confirm_password").value;
			if (user_password !== confirm_password) {
				alert("Password doesn't match. Please re-enter the password");
				document.getElementById("confirm_password").value = "";
			}
		}
	</script>
</body>
</html>