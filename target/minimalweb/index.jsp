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
<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:wght@300&display=swap"
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

.hide {
	display: none;
}

.block {
	display: block;
}

#main_page {
	display: flex;
	flex-direction: row;
	width: 100%;
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
	box-shadow: -46px 250px 0px 0px rgba(217, 217, 217, 0.66);
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
</style>
</head>
<body>
	<div id="index_main">
		<div id="main_page">
			<div class="main_left" id="left-div">
				<div class="main_header">
					<span class="header"> <a href="#"> <img
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
					</a></span> <span class="header"> <a href="#">
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
						<a href="register.jsp">
							<button id="btn">
								Sign Up <img src="https://iili.io/Hy0ymnS.png"
									alt="arrow towards right">
							</button>
						</a>
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
	</div>
</body>
</html>
