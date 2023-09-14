<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment Form</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/designer/book_appointment.css">
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
	String headerJSP = "/pages/profile/header.jsp";
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