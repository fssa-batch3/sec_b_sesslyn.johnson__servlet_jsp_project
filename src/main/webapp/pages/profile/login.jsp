<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
						<a href="<%=request.getContextPath()%>/pages/product/shop.html">
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
				<a href="<%=request.getContextPath()%>/index"> <img
					src="https://iili.io/Hy19PWB.png" class="close_icon"
					alt="close icon" /></a>
			</div>
			<div class="circle">
				<a href="<%=request.getContextPath()%>/user/new"><div
						class="dot" id="dot"></div></a>
				<div class="dot"></div>
				<a href="<%=request.getContextPath()%>/user/login"><div
						class="double_circle"></div></a>
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
						<label for="email">Email Id</label> <input type="email"
							value="<%=(email != null) ? email : ""%>" class="no_outline"
							id="user_email" name="email" required
							pattern="^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$"
							title="Must contain @ and only lower case is allowed."
							placeholder="sess@...">
					</div>
					<hr class="new1">

					<div class="form_input">
						<label for="password">Password</label>
						<div class="password-toggle-1">
							<i class="fas fa-eye" id="togglePassword1"></i>
						</div>
						<input type="password"
							value="<%=(password != null) ? password : ""%>"
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
    document.getElementById("btn_password").addEventListener("click", function() {
        var email = document.getElementById("user_email").value;
     
        localStorage.setItem("profile_id", JSON.stringify(email)); 
        document.getElementById("form1").submit();
    });
</script>
		<script src="<%=request.getContextPath()%>/assets/js/profile/login.js"></script>
		<script
			src="<%=request.getContextPath()%>/assets/js/profile/whatsappChat.js"></script>
</body>
</html>