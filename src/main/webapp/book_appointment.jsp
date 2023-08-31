<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<meta charset="ISO-8859-1">
<title>Appointment Form</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.head {
	cursor: pointer;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
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

#block {
	font-family: "Inter", Arial, Helvetica, sans-serif;
}

.block {
	display: block;
}

.container {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.appointmentImg {
	width: 38rem;
	height: 35rem;
	margin: 6rem 0rem 0rem 8rem;
}

.formbold-mb-5 {
	margin-bottom: 15px;
}

.formbold-pt-3 {
	padding-top: 12px;
}

.formbold-main-wrapper {
	display: flex;
	padding: 80px;
}

.formbold-form-wrapper {
	margin: 0 auto;
	max-width: 550px;
	width: 100%;
	background: white;
}

.formbold-form-label {
	display: block;
	font-weight: 500;
	font-size: 16px;
	color: #0e0e0e;
	margin-bottom: 12px;
}

.formbold-form-label-2 {
	font-weight: 600;
	font-size: 20px;
	margin-bottom: 20px;
}

.formbold-form-input {
	width: 100%;
	padding: 12px 24px;
	border-radius: 6px;
	border: 1px solid #e0e0e0;
	background: white;
	font-weight: 500;
	font-size: 16px;
	color: #020202;
	outline: none;
	resize: none;
}

.formbold-form-input:focus {
	border-color: #151515;
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

.formbold-btn {
	text-align: center;
	font-size: 16px;
	border-radius: 6px;
	padding: 14px 32px;
	border: none;
	font-weight: 600;
	background-color: #0e0e0f;
	color: white;
	width: 100%;
	cursor: pointer;
}

.formbold-btn:hover {
	box-shadow: 0px 3px 8px rgba(0, 0, 0, 0.05);
}

#divform {
	margin-left: 0px;
	justify-content: space-between;
}

#emailForm {
	margin-right: 30px;
}

.formbold--mx-3 {
	margin-left: -12px;
	margin-right: -12px;
}

.formbold-px-3 {
	padding-left: 12px;
	padding-right: 12px;
}

.flex {
	display: flex;
}

.flex-wrap {
	flex-wrap: wrap;
}

.w-full {
	width: 100%;
}

.pay_ment {
	display: flex;
	flex-direction: row;
}

.user_cash {
	margin: 2rem 2rem 1rem 1.8rem;
	padding: 0rem 0rem 0rem 2rem;
	display: inline;
	width: 20px;
	height: 20px;
	accent-color: rgb(5, 5, 5);
}

.payment_label {
	display: block;
	margin-top: 2rem;
	margin-left: -1.5rem;
}

#edit_icon {
	margin-top: 3rem;
	margin-right: 2rem;
	width: 1.2rem;
	height: 1rem;
	padding-right: 0.5rem;
}

@media ( min-width : 540px) {
	.sm\:w-half {
		width: 50%;
	}
}

.blur-background {
	filter: blur(8px);
	-webkit-filter: blur(8px);
}

.center-div {
	display: none;
	position: absolute;
	margin: auto;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	width: 300px;
	height: 350px;
	background-color: #ccc;
	border-radius: 15px;
}

h3 {
	text-align: center;
	margin-top: 2rem;
}

p {
	text-align: center;
	margin-top: 1rem;
}

.imgSuccess {
	width: 200px;
	height: 200px;
	margin-left: 60px;
}

.dashBoard {
	border-radius: 20px;
	padding: 0.5rem;
	margin: -1rem 0rem 1rem 3.5rem;
	border-color: black;
}

.buttonDiv {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

#btn_delete {
	width: 50%;
	margin-right: 2rem;
	text-align: center;
	font-size: 16px;
	border-radius: 6px;
	padding: 14px 32px;
	border: none;
	font-weight: 600;
	background-color: #0e0e0f;
	color: white;
	cursor: pointer;
}

#btn_appointment {
	width: 50%;
	margin-left: 2rem;
}

select {
	width: 100%;
	padding: 12px 44px;
	border-radius: 6px;
	border: 1px solid #e0e0e0;
	background: white;
	font-weight: 500;
	font-size: 16px;
	color: #020202;
	outline: none;
	resize: none;
}

#designers_name {
	margin-right: 2rem;
}
</style>
</head>
<body>
	<div class="head">
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
	</div>


	<div id="block">
		<div class="container">
			<div class="left">
				<img class="appointmentImg" src="https://iili.io/HgJQo1s.jpg"
					alt="Appointment image">
			</div>
			<div class="formbold-main-wrapper">
				<%
				User designer = (User) request.getAttribute("designerDetails");
				System.out.println(designer);
				if (designer != null) {
				%>
				<div class="formbold-form-wrapper">
					<form id="formDiv" action="designer/apppointment/create?id=<%=designer.getId()%>"
						method="post">
						<label class="formbold-form-label formbold-form-label-2">
							Personal Details </label>
						<div class="flex flex-wrap formbold--mx-3" id="divform">
							<div class="formbold-mb-5" id="nameForm">
								<label for="name" class="formbold-form-label"> Name </label> 
								<input type="text" name="from_user_name" id="user_name" required
									pattern="[a-zA-Z]+" title="Only Alphabets are allowed."
									placeholder="Enter your Name" class="formbold-form-input" />
							</div>
							<div class="formbold-mb-5" id="emailForm">
								<label for="phone" class="formbold-form-label"> Phone
									Number </label> <input type="tel" name="phone_number" id="user_no"
									required pattern="[0-9]{10}"
									title="it should be 10 digit number"
									placeholder="Enter your phone number"
									class="formbold-form-input" />
							</div>
						</div>
						<div class="flex flex-wrap formbold--mx-3" id="divform">
							<div class="formbold-mb-5">
								<label for="email" class="formbold-form-label"> Email
									Address </label> <input type="email" name="email" id="user_email"
									title="it can contain alphabets, number and must have @gmail.com"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required
									placeholder="Enter your email" class="formbold-form-input" />
							</div>
							<div class="formbold-mb-5" id="designers_name">
								<label for="designer_name" class="formbold-form-label">
									Designers </label> <input type="text" name="to_user"
									id="user_name" disabled pattern="[a-zA-Z]+" value=<%=designer.getName() %>
									class="formbold-form-input" />
							</div>

						</div>
						<div class="flex flex-wrap formbold--mx-3">
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5 w-full">
									<label for="date" class="formbold-form-label"> Date </label>
									 <input type="date" name="date" id="user_date" required
										title="Book appointment in this month"
										class="formbold-form-input" />
								</div>
							</div>
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5">
									<label for="time" class="formbold-form-label"> Time </label> <input
										type="time" name="time" id="user_time" required="true"
										class="formbold-form-input" />
								</div>
							</div>
						</div>

						<div class="formbold-mb-5 formbold-pt-3">
							<label class="formbold-form-label formbold-form-label-2">
								Address Details ( Optional ) </label>
							<div class="flex flex-wrap formbold--mx-3">
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="area" id="user_address"
											title="Only Alphabets and space is allowed"
											placeholder="Enter area" class="formbold-form-input" />
									</div>
								</div>
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="city" id="user_city"
											title="Only Alphabets and space is allowed"
											placeholder="Enter city" class="formbold-form-input" />
									</div>
								</div>
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="state" id="user_state"
											title="Only Alphabets and space is allowed"
											placeholder="Enter state" class="formbold-form-input" />
									</div>
								</div>
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="post-code" id="user_code"
											title="It should be a 6 digit number without spaces and first digit can not be zero"
											pattern="[6]{1}[0-9]{4}[1-9]{1}" maxlength="6" min="600001"
											max="643253" placeholder="Post Code"
											class="formbold-form-input" />
									</div>
								</div>
							</div>
						</div>

						<div>
							<button class="formbold-btn" id="appointment">Book
								Appointment</button>
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
			</div>
		</div>
	</div>
	<div class="center-div" id="center-div">
		<h3>Good Job</h3>
		<p>Your meeting is now saved.</p>
		<img
			src="https://images.fineartamerica.com/images/artworkimages/medium/3/cute-cartoon-baloon-whale-red-balloon-flying-whale-designed-by-vexels-transparent.png"
			alt="dolphin with balloon" class="imgSuccess"> <a
			href="../appointment/appointment_history.html"><button
				class="dashBoard">Go the the appointment details</button></a>
	</div>

	<script>
		
		let area = document.getElementById("user_address").value;
		let city = document.getElementById("user_city").value;
		let state = document.getElementById("user_state").value;
		let postCode = document.getElementById("user_code").value;

		let address = area + ", " + city + ", " + state + ", "
				+ postCode;

		let userCombinedAddress = combinedAddress;
		
		var today = new Date();

		var tomorrow = new Date();
		tomorrow.setDate(today.getDate() + 1);

		var maxDate = new Date();
		maxDate.setDate(today.getDate() + 90);

		var formattedTomorrow = tomorrow.toISOString().split('T')[0];
		var formattedMaxDate = maxDate.toISOString().split('T')[0];
		
		document.getElementById("user_date").setAttribute("min", formattedTomorrow);
		document.getElementById("user_date").setAttribute("max", formattedMaxDate);

		function showMessageDiv() {
			const messageDiv = document.getElementById("center-div");
			messageDiv.style.display = "block";
			document.getElementById("block").classList.add("blur-background");
		}
	</script>
</body>
</html>