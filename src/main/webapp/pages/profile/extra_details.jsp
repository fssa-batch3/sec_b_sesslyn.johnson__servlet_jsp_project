<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Extra Details</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/login.css">
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

</head>
<style>
.textareaField {
	font-family: "Roboto Condensed", sans-serif;
	height: 99px;
	width: 80%;
	padding: 8px;
	margin-bottom: 10px;
	margin: 0.7rem 0rem 0.2rem 0rem;
	border: 1px solid #000;
}

hr.new3 {
	border-bottom: 0.8px solid rgb(209, 209, 209);
	margin: -1rem 1rem 0rem 7rem;
}
</style>
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
							alt="logo of minimalistic m"></span></a> <span class="header">
						<a href="<%=request.getContextPath()%>/shop">
							<p class="header_para">SHOP</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/about">
							<p class="header_para">ABOUT</p>
					</a></span> <span class="header"> <a
						href="<%=request.getContextPath()%>/order">
							<p class="header_para">ORDERS</p>
					</a></span> <span class="header"> <a
						href="<%=request.getContextPath()%>/user/appointment_list">
							<p class="header_para">SCHEDULE</p>
					</a></span> <span class="header"> <a
						href="<%=request.getContextPath()%>/designer">
							<p class="header_para">DESIGNERS</p>
					</a>
					</span>
				</div>
				<hr class="new3">
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

		<!-- Login Div -->
		<div class="right_corner">
			<div class="menu">
				<a href="<%=request.getContextPath()%>/index"> <img
					src="https://iili.io/Hy19PWB.png" class="close_icon"
					alt="close icon" /></a>
			</div>
			<div class="circle">
				<a href="<%=request.getContextPath()%>/user/new"><div
						class="dot" id="dot"></div></a>
				<div class="double_circle"></div>
				<a href="<%=request.getContextPath()%>/user/login">
				<div class="dot"></div></a>
			</div>
			<div>
				<h1 class="sign-up">Info</h1>
				<p class="text_sign">
					An website to decor your home.<br>Welcome to minimalistic
				</p>
			</div>
			<div class="data_form">
				<%
				User user = (User) request.getAttribute("userDetails");
				System.out.println(user);
				%>
				<form action="<%=request.getContextPath()%>/user/extra" method="post">

					<%
					if (user.getRole() == "seller") {
					%>
					<div class="form_input">
						<label for="gstNumber">GST Number :</label> <input type="text"
							id="gstNumber" name="gstNumber" autofocus
							pattern="\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}"
							title="Must contains 15 characters and alphanumeric is allowed."
							required placeholder="GST Number">
					</div>
					<hr class="new1">

					<div class="form_input">
						<label for="aadharNumber">Aadhar Number:</label> <input
							type="text" class="inputField" id="aadharNumber"
							pattern="[2-9][0-9]{11}"
							name="aadharNumber"
							title="Aadhar Number must start with a digit from 2 to 9 and be 12 digits long"
							required="true" placeholder="Aadhar Number">
					</div>
					<hr class="new1">

					<div class="form_input">
						<label for="shopAddress">Shop / Home Address :</label><br>
						<textarea name="shopAddress" id="shopAddress"
							pattern="^(?!.*\s{2})[^\s].*[^\s]$"
							placeholder="Shop / Home Address" required minlength="10"
							class="textareaField"></textarea>
					</div>


					<%
					} else if (user.getRole() == "designer") {
					%>
					<div class="form_input">
						<label for="experience">Experience</label> <input type="number"
							name="experience" required autofocus
							title="It should be in months or years" id="designer_exper"
							class="inputField" />
					</div>
					<hr class="new1">
					<div class="form_input">
						<label class="resume" for="url">Photo </label> <input type="url"
							accept="image/*" name="image" required id="photo_image"
							class="inputField" />
					</div>
					<hr class="new1">
					<div class="form_input">
						<label for="description">Description :</label>
						<textarea name="description" id="designDescription"
							pattern="^(?!.*\s{2})[^\s].*[^\s]$"
							placeholder="Design Description" required minlength="30"
							class="textareaField"></textarea>
					</div>
					<%
					}
					%>
					<% session.setAttribute("userDetails", user); %>
					<input type="hidden" name="userDetails" value=<%=user %> />
					<div class="form_btn">
						<a href="<%=request.getContextPath()%>/user/new"><button
								class="btn_register" type="button">Back</button></a>
						<button class="btn_register" id="btn_password" type="submit">Sign
							Up</button>
					</div>

				</form>
				<div>
					<img class="sign_img" id="login_img"
						src="https://iili.io/HgdNmGI.png" alt="minimalistic.logo">
				</div>

			</div>
		</div>

		<script
			src="<%=request.getContextPath()%>/assets/js/profile/whatsappChat.js"></script>
</body>
</html>