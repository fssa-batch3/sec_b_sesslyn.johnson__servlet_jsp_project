<%@page import="in.fssa.minimal.dto.AppointmentRespondDTO"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description"
	content="Stay organized with our user-friendly Calendar featuring events, reminders, and a customizable interface. Built with HTML, CSS, and JavaScript. Start scheduling today!" />
<meta name="keywords"
	content="calendar, events, reminders, javascript, html, css, open source coding" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css"
	integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/designer/calender.css" />
<title>Book Appointment</title>
</head>
<style>
body {
	display: flex;
	flex-direction: column;
	position: relative;
	min-height: 100vh;
	display: flex;
	align-items: center;
	justify-content: center;
	padding-bottom: 30px;
	background-color: white;
	margin: 0px;
	padding: 0px;
}

.head {
	margin: 0px;
	width: 100%;
}

.container {
	margin: 2rem auto;
}

.popup {
	z-index: 1000;
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

	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />

	<%
	User user = (User) request.getAttribute("userDetails");
	System.out.println(user);
	%>

	<div>
		<div class="container">
			<div class="left">
				<div class="calendar">
					<div class="month">
						<i class="fas fa-angle-left prev"></i>
						<div class="date">December 2015</div>
						<i class="fas fa-angle-right next"></i>
					</div>
					<div class="weekdays">
						<div>Sun</div>
						<div>Mon</div>
						<div>Tue</div>
						<div>Wed</div>
						<div>Thu</div>
						<div>Fri</div>
						<div>Sat</div>
					</div>
					<div class="days"></div>
					<div class="goto-today">
						<div class="goto">
							<input type="text" placeholder="mm/yyyy" class="date-input" />
							<button class="goto-btn">Go</button>
						</div>
						<button class="today-btn">Today</button>
					</div>
				</div>
			</div>
			<div class="right">
				<div class="today-date">
					<div class="event-day">Wed</div>
					<div class="event-date">12th December 2022</div>
				</div>




				<%
				Set<AppointmentRespondDTO> appointmentList = (Set<AppointmentRespondDTO>) request.getAttribute("appointmentDetails");
				%>


				<%
				User designer = (User) request.getAttribute("designerDetails");
				System.out.println(designer);
				if (designer != null) { %>
				<form id="formDiv"
					action="<%=request.getContextPath()%>/designer/appointment/create?id=<%=designer.getId()%>"
					method="post">
					<div class="events"></div>
					<div class="add-event-wrapper">
						<div class="add-event-header">
							<div class="title">Add Event</div>
							<i class="fas fa-times close"></i>
						</div>
						<div class="add-event-body">
							<div class="add-event-input">
								<input type="email" name="email" id="user_email"
									title="Must be a valid email address"
									value="<%=user.getEmail()%>" required
									placeholder="Enter your email" class="formbold-form-input" />
							</div>
							<div class="add-event-input">
								<input type="tel" name="phone_number" id="user_phone"
									value="<%=user.getPhoneNumber()%>"
									title="Must be a valid phone number" pattern="[0-9]{10}"
									required placeholder="Enter your phone number"
									class="formbold-form-input" />
							</div>
							<div class="add-event-input">
								<input type="text" name="status" id="status" disabled
									placeholder="Waiting List" value="waiting_list" title="Status"
									class="formbold-form-input" />
							</div>

							<div class="add-event-input">
								<input type="time" name="time" id="user_time" min="08:00"
									max="20:00" required class="formbold-form-input"
									title="Select a time for the appointment" />
							</div>
							<div class="add-event-input">
								(Optional)
								<textarea name="address" id="designDescription"
									placeholder="Home Address" class="textareaField"></textarea>
							</div>

							<input type="hidden" name="date" id="user_date" required
								title="Select a date for the appointment"
								class="formbold-form-input" />

						</div>
						<div class="add-event-footer">
							<button type="submit" id="bookNow" class="add-event-btn">Add
								Event</button>
						</div>
					</div>
				</form>
				<%
				}
				%>
			</div>
			<button class="add-event">
				<i class="fas fa-plus"></i>
			</button>
		</div>
	</div>
	<script
		src="<%=request.getContextPath()%>/assets/js/designer/calender.js"></script>
</body>
</html>
