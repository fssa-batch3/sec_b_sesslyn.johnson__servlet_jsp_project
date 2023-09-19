<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Form</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/index.css">
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
<body onload="register()">
	<div id="overlay" class="overlay"></div>
	<%
	String errorMsg = (String) request.getAttribute("error");
	%>
	<%
	if (errorMsg != null && !errorMsg.isEmpty()) {
	%>
	<div id="popup1" class="popupOverlay">
		<div class="popupAlert">
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
				<a href="<%=request.getContextPath()%>/index"> <img
					src="https://iili.io/Hy19PWB.png" class="close_icon"
					alt="close icon" /></a>
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

				<%
				User user = (User) request.getAttribute("userDetails");
				%>
				<!-- Form -->
				<form action="<%=request.getContextPath()%>/user/create"
					method="post">
					<div class="form_input">
						<label for="name">Name</label> <input type="text" name="name"
							class="no_outline" id="user_name" pattern="[a-zA-Z]+"
							value="<%=(user != null) ? user.getName() : ""%>"
							title="Only contain Alphabets" required placeholder="Sesslyn">
					</div>
					<hr class="new3">
					<div class="form_input">
						<label for="email">Email Id</label> <input type="email"
							name="email" class="no_outline" id="user_email"
							value="<%=(user != null) ? user.getEmail() : ""%>"
							pattern="^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$"
							title="Must contain @ and only lower case is allowed." required
							placeholder="sess@...">
					</div>
					<hr class="new3">
					<div class="form_input">
						<label for="phone">Phone Number</label> <input
							pattern="[6-9][0-9]{9}" type="tel" name="phone_number"
							value="<%=(user != null) ? user.getPhoneNumber() : ""%>"
							title="It should be a 10-digit number starting with a digit between 6 and 9."
							class="no_outline" id="user_no" required maxlength="10"
							placeholder="995239...">
					</div>
					<hr class="new3">

					<div class="form_input">
						<label for="password">Password</label>
						<div class="password-toggle-1">
							<i class="fas fa-eye" id="togglePassword1"></i>
						</div>
						<input class="no_outline" required type="password" name="password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
							placeholder="Password" id="user_password">
					</div>
					<hr class="new3">

					<div class="form_input">
						<label for="repeat_password">Confirm password</label>
						<div class="password-toggle-2">
							<i class="fas fa-eye" id="togglePassword2"></i>
						</div>
						<input class="no_outline" required type="password"
							name="repeat_password"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
							placeholder="Password" id="confirm_password">
					</div>
					<hr class="new3">

					<div class="input-container">
						<div class="tw-toggle">
							<input type="radio" name="toggle" value="false"> <label
								class="toggle toggle-yes">Seller</label> <input checked
								type="radio" name="toggle" value="-1"> <label
								class="toggle toggle-yes">User</label> <input type="radio"
								name="toggle" value="true"> <label
								class="toggle toggle-yes">Designer</label> <span></span>
						</div>
					</div>


					<small>* Password must have 8 characters, uppercase,</small> <small
						id="small"> lowercase, and special case.</small>
					<div class="form_btn">
						<a href="<%=request.getContextPath()%>/user/login"
							class="btn_register">Login</a>
						<button class="btn_register" id="btn_login" type="submit"
							onclick="return checkPassword()">Sign Up</button>
					</div>

					<div id="popup" class="popup">
						<h2>To Know More About You</h2>

						<div id="sellerFields" style="display: none;">
							<div class="popupDiv">
								<label for="gstNumber">GST Number :</label> <input type="text"
									class="inputField" id="gstNumber"
									pattern="\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}"
									title="Only contain Alphabets" required="true"
									placeholder="GST Number">
							</div>
							<div class="popupDiv">
								<label for="aadharNumber">Aadhar Number :</label> <input
									type="text" class="inputField" id="aadharNumber"
									pattern="[2-9][0-9]{11}"
									title="Aadhar Number must start with a digit from 2 to 9 and be 12 digits long"
									required="true" placeholder="Aadhar Number">
							</div>
							<div class="popupDiv">
								<label for="shopAddress">Shop / Home Address :</label>
								<textarea name="shopAddress" id="shopAddress"
									pattern="^(?!.*\s{2})[^\s].*[^\s]$"
									placeholder="Shop / Home Address" required minlength="10"
									class="textareaField"></textarea>
							</div>
						</div>

						<div id="designerFields" style="display: none;">
							<div class="popupDiv">
								<label for="experience">Experience</label> <input type="text"
									name="experience" required
									pattern="^(?:\d+\smonths|\d+\syears)$"
									title="It should be in months or years" id="designer_exper"
									class="inputField" />
							</div>
							<div class="popupDiv">
								<label class="resume" for="file">Photo </label> <input
									type="file" accept="image/*" name="image" required
									id="photo_image" class="inputField" />
							</div>
							<div class="popupDiv">
								<label for="description">Description :</label>
								<textarea name="description" id="designDescription"
									pattern="^(?!.*\s{2})[^\s].*[^\s]$"
									placeholder="Design Description" required minlength="30"
									class="textareaField"></textarea>
							</div>
						</div>

						<button id="popupSubmit" class="popupBtn">Submit</button>
						<button id="popupClose" class="popupBtn">
							<img src="https://iili.io/Hy19PWB.png" class="close_icon"
								alt="close icon" />
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/assets/js/profile/index.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/profile/whatsappChat.js"></script>

</body>
</html>