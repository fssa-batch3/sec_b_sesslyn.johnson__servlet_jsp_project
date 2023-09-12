<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Form</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
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
	%>

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

					<form id="formDiv"
						action="<%=request.getContextPath()%>/designer/appointment/create?id=<%=designer.getId()%>"
						method="post">

						<label class="formbold-form-label formbold-form-label-2">Personal
							Details</label>
						<div class="flex flex-wrap formbold--mx-3" id="divform">
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5">
									<label for="email" class="formbold-form-label">Email
										Address</label> <input type="email" name="email" id="user_email"
										value="<%=user.getEmail()%>"
										title="Must be a valid email address"
										pattern="[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
										required placeholder="Enter your email"
										class="formbold-form-input" />
								</div>
							</div>
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5">
									<label for="phone" class="formbold-form-label">Phone
										Number</label> <input type="tel" name="phone_number" id="user_phone"
										value="<%=user.getPhoneNumber()%>"
										title="Must be a valid phone number" pattern="[0-9]{10}"
										required placeholder="Enter your phone number"
										class="formbold-form-input" />
								</div>
							</div>
						</div>
						<div class="flex flex-wrap formbold--mx-3" id="divform">
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5">
									<label for="name" class="formbold-form-label">Designer
										Name</label> <input type="text" name="name" id="designer_name"
										value="<%=designer.getName()%>" title="Designer's name"
										disabled class="formbold-form-input" />
								</div>
							</div>
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5">
									<label for="status" class="formbold-form-label">Status</label>
									<input type="text" name="status" id="status"
										value="waiting_list" title="Status" disabled
										class="formbold-form-input" />
								</div>
							</div>
						</div>
						<div class="flex flex-wrap formbold--mx-3">
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5 w-full">
									<label for="date" class="formbold-form-label">Date</label> <input
										type="date" name="date" id="user_date" required
										title="Select a date for the appointment"
										class="formbold-form-input" />
								</div>
							</div>
							<div class="w-full sm:w-half formbold-px-3">
								<div class="formbold-mb-5">
									<label for="time" class="formbold-form-label">Time</label> <input
										type="time" name="time" id="user_time" min="08:00" max="20:00"
										required class="formbold-form-input"
										title="Select a time for the appointment" />
								</div>
							</div>
						</div>
						<div class="formbold-mb-5 formbold-pt-3">
							<label class="formbold-form-label formbold-form-label-2">Address
								Details (Optional)</label>
							<div class="flex flex-wrap formbold--mx-3">
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="area" id="user_area"
											title="Enter your area" placeholder="Enter area"
											class="formbold-form-input" />
									</div>
								</div>
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="city" id="user_city"
											title="Enter your city" placeholder="Enter city"
											class="formbold-form-input" />
									</div>
								</div>
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="state" id="user_state"
											title="Enter your state" placeholder="Enter state"
											class="formbold-form-input" />
									</div>
								</div>
								<div class="w-full sm:w-half formbold-px-3">
									<div class="formbold-mb-5">
										<input type="text" name="post_code" id="user_post_code"
											title="Enter your post code" placeholder="Post Code"
											class="formbold-form-input" />
									</div>
								</div>

							</div>
						</div>
						<div>
							<a
								href="<%=request.getContextPath()%>/designer/appointment/new?id=<%=designer.getId()%>"><button
									class="formbold-btn" id="appointment">Book Appointment</button></a>
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



	<script>
		let today = new Date();

		let tomorrow = new Date();
		tomorrow.setDate(today.getDate() + 1);

		let maxDate = new Date();
		maxDate.setDate(today.getDate() + 90);

		let formattedTomorrow = tomorrow.toISOString().split('T')[0];
		let formattedMaxDate = maxDate.toISOString().split('T')[0];

		document.getElementById("user_date").setAttribute("min",
				formattedTomorrow);
		document.getElementById("user_date").setAttribute("max",
				formattedMaxDate);

		function closeAlert() {
			var alertDiv = document.getElementById("popup1");
			alertDiv.style.display = "none";
		}
	</script>
</body>
</html>