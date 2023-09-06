<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.sql.Date"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.dto.AppointmentRespondDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@300;400;500;600&display=swap')
	;

:root {
	--main-color: #000;
	--color-dark: #7a7979;
	--text-grey: #f5f2f2;
}

* {
	margin: 0;
	padding: 0;
	text-decoration: none;
	list-style-type: none;
	box-sizing: border-box;
	font-family: 'Merriweather', sans-serif;
}

#menu-toggle {
	display: none;
}

.sidebar {
	position: fixed;
	height: 100%;
	width: 165px;
	left: 0;
	bottom: 0;
	top: 0;
	z-index: 100;
	background: var(--color-dark);
	transition: left 300ms;
}

.side-header {
	box-shadow: 0px 5px 5px -5px rgb(0 0 0/ 10%);
	background: var(--main-color);
	height: 60px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.side-header h3, side-head span {
	color: #fff;
	font-weight: 400;
}

.side-content {
	height: calc(100vh - 60px);
	overflow: auto;
}

/* width */
.side-content::-webkit-scrollbar {
	width: 5px;
}

/* Track */
.side-content::-webkit-scrollbar-track {
	box-shadow: inset 0 0 5px grey;
	border-radius: 10px;
}

.side-content::-webkit-scrollbar-thumb {
	background: #b0b0b0;
	border-radius: 10px;
}

.side-content::-webkit-scrollbar-thumb:hover {
	background: #b30000;
}

.profile {
	text-align: center;
	padding: 2rem 0rem;
}

.bg-img {
	background-repeat: no-repeat;
	background-size: cover;
	border-radius: 50%;
	background-size: cover;
}

.profile-img {
	height: 80px;
	width: 80px;
	display: inline-block;
	margin: 0 auto .5rem auto;
	border: 3px solid #899DC1;
}

.profile h4 {
	color: #fff;
	font-weight: 500;
}

.profile small {
	color: #a9a7a7;
	font-weight: 600;
}

.side-menu ul {
	text-align: center;
	list-style: none;
	padding: 0;
}

.side-menu li {
	transition: background-color 0.3s;
}

.side-menu a {
	display: block;
	padding: 1.2rem 0rem;
	color: #fff;
	text-decoration: none;
}

.side-menu a:hover {
	background-color: #fff;
	color: black;
}

.side-menu a:hover span, .side-menu a:hover small {
	color: black;
}

.side-menu a span {
	display: block;
	text-align: center;
	font-size: 1.7rem;
	transition: color 0.3s;
}

.side-menu a small {
	display: block;
	transition: color 0.3s;
}

#menu-toggle:checked ~.sidebar {
	width: 60px;
}

#menu-toggle:checked ~.sidebar .side-header span {
	display: none;
}

#menu-toggle:checked ~.main-content {
	margin-left: 60px;
	width: calc(100% - 60px);
}

#menu-toggle:checked ~.main-content header {
	left: 60px;
}

#menu-toggle:checked ~.sidebar .profile, #menu-toggle:checked ~.sidebar .side-menu a small
	{
	display: none;
}

#menu-toggle:checked ~.sidebar .side-menu a span {
	font-size: 1.3rem;
}

.main-content {
	margin-left: 165px;
	width: calc(100% - 165px);
	transition: margin-left 300ms;
}

header {
	position: fixed;
	right: 0;
	top: 0;
	left: 165px;
	z-index: 100;
	height: 60px;
	box-shadow: 0px 5px 5px -5px rgb(0 0 0/ 10%);
	background: #fff;
	transition: left 300ms;
}

.header-content, .header-menu {
	display: flex;
	align-items: center;
}

.header-content {
	justify-content: space-between;
	padding: 0rem 1rem;
}

.header-content label:first-child span {
	font-size: 1.3rem;
}

.header-content label {
	cursor: pointer;
}

.header-menu {
	justify-content: flex-end;
	padding-top: .5rem;
}

.header-menu label, .header-menu .notify-icon {
	margin-right: 2rem;
	position: relative;
}

.header-menu label span, .notify-icon span:first-child {
	font-size: 1.3rem;
}

.notify-icon span:last-child {
	position: absolute;
	background: var(--main-color);
	height: 16px;
	width: 16px;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	right: -5px;
	top: -5px;
	color: #fff;
	font-size: .8rem;
	font-weight: 500;
}

.user {
	display: flex;
	align-items: center;
}

.user div, .client-img {
	height: 40px;
	width: 40px;
	margin-right: 1rem;
}

.user span:last-child {
	display: inline-block;
	margin-left: .3rem;
	font-size: .8rem;
}

main {
	margin-top: 60px;
}

.page-header {
	padding: 1.3rem 1rem;
	background: #E9edf2;
	border-bottom: 1px solid #dee2e8;
}

.page-header h1, .page-header small {
	color: #74767d;
}

.page-content {
	padding: 1.3rem 1rem;
	background: #f1f4f9;
}

.analytics {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 2rem;
	margin-top: .5rem;
	margin-bottom: 2rem;
}

.card {
	box-shadow: 0px 5px 5px -5px rgb(0 0 0/ 10%);
	background: #fff;
	padding: 1rem;
	border-radius: 3px;
}

.card-head {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.card-head h2 {
	color: #333;
	font-size: 1.8rem;
	font-weight: 500;
}

.card-head span {
	font-size: 3.2rem;
	color: var(--text-grey);
}

.card-progress small {
	color: #777;
	font-size: .8rem;
	font-weight: 600;
}

.card-indicator {
	margin: .7rem 0rem;
	height: 10px;
	border-radius: 4px;
	background: #e9edf2;
	overflow: hidden;
}

.logo {
	height: 3rem;
	width: 3rem;
}

.indicator {
	height: 10px;
	border-radius: 4px;
}

.indicator.one {
	background: #11a8c3;
}

.indicator.two {
	background: #86e49d;
}

.indicator.three {
	background: #ebc474;
}

.indicator.four {
	background: #c85c75;
}

.records {
	box-shadow: 0px 5px 5px -5px rgb(0 0 0/ 10%);
	background: #fff;
	border-radius: 3px;
}

.record-header {
	margin-left: 60rem;
	padding: 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.browse {
	display: flex;
	align-items: center;
}

input, button, select {
	outline: none;
}

.browse input, .browse select {
	height: 35px;
	border: 1px solid #b0b0b0;
	border-radius: 3px;
	display: inline-block;
	width: 75px;
	padding: 0rem .5rem;
	margin-right: .8rem;
	color: #666;
}

.browse input {
	width: 150px;
}

.browse select {
	width: 100px;
}

.table-responsive {
	width: 100%;
	overflow: auto;
}

/* Dropdown styling */
.dropdown {
	position: relative;
	display: inline-block;
	cursor: pointer;
}

.dropdown button {
	padding: .7rem 1.5rem;
	border-radius: 2rem;
	border: none;
	cursor: pointer;
	background-color: #ebc474;
	color: black;
}

/* Dropdown content */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: white;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, 0.2);
	border-radius: 6px;
	z-index: 1;
	min-width: 120px;
}

.display-block {
	display: block;
}

.dropdown:hover .dropdown-content {
	display: block;
}

/* Dropdown options */
.dropdown-content a {
	display: block;
	padding: 0.5rem 1rem;
	text-decoration: none;
	color: black;
	transition: background-color 0.3s ease-in-out;
}

.dropdown-content a:hover {
	background-color: dodgerblue;
	color: white;
}

/* Status color classes */
.status.approved {
	background-color: #86e49d;
	color: #006b21;
}

.status.rejected {
	background-color: #d893a3;
	color: #b30021;
}

.status.pending {
	background-color: #ebc474;
	color: black;
}

table {
	border-collapse: collapse;
}

table thead tr {
	background: #e9edf2;
}

table thead th {
	padding: 1rem 0rem;
	text-align: left;
	color: #444;
	font-size: .9rem;
}

table thead th:first-child {
	padding-left: 1rem;
}

table tbody td {
	padding: 1rem 0rem;
	color: #444;
	width: 10%;
}

table tbody td:first-child {
	width: 5%;
	padding-left: 1rem;
	color: var(--main-color);
	font-weight: 600;
	font-size: .9rem;
}

table tbody tr {
	border-bottom: 1px solid #dee2e8;
}

#clientHead {
	padding-left: 4rem;
}

#statusHead {
	padding-left: 1rem;
}

.client {
	display: flex;
	align-items: center;
	margin-left: 2rem;
}

.client-img {
	margin-right: .5rem;
	border: 2px solid #b0b0b0;
	height: 45px;
	width: 45px;
}

.client-info h4 {
	color: #555;
	font-size: .95rem;
}

.client-info small {
	color: #777;
}

.actions span {
	display: inline-block;
	font-size: 1.5rem;
	margin-right: .5rem;
}

#searchBtn {
	height: 35px;
	border: 1px solid #b0b0b0;
	border-radius: 3px;
	display: inline-block;
	width: 75px;
	padding: 0rem 0.5rem;
	margin-right: 0.8rem;
	color: #666;
}

.paid {
	display: inline-block;
	text-align: center;
	font-weight: 600;
	color: var(--main-color);
	background: #e5f8ed;
	padding: .5rem 1rem;
	border-radius: 20px;
	font-size: .8rem;
}

#btnUpdate {
	color: black;
	background-color: white;
	float: right;
	text-transform: uppercase;
	font-size: 10px;
	border: none;
	color: #893a3f;
	float: right;
}

.message {
	text-align: center;
	display: block;
	margin: 5rem 0rem 5rem 0rem;
}

@media only screen and (max-width: 1200px) {
	.analytics {
		grid-template-columns: repeat(2, 1fr);
	}
}

@media only screen and (max-width: 768px) {
	.analytics {
		grid-template-columns: 100%;
	}
	.sidebar {
		left: -165px;
		z-index: 90;
	}
	header {
		left: 0;
		width: 100%;
	}
	.main-content {
		margin-left: 0;
		width: 100%;
	}
	#menu-toggle:checked ~.sidebar {
		left: 0;
	}
	#menu-toggle:checked ~.sidebar {
		width: 165px;
	}
	#menu-toggle:checked ~.sidebar .side-header span {
		display: inline-block;
	}
	#menu-toggle:checked ~.sidebar .profile, #menu-toggle:checked ~.sidebar .side-menu a small
		{
		display: block;
	}
	#menu-toggle:checked ~.sidebar .side-menu a span {
		font-size: 1.7rem;
	}
	#menu-toggle:checked ~.main-content header {
		left: 0px;
	}
	table {
		width: 900px;
	}
}

#cart_empty {
	display: block;
}

.emptyCart {
	width: 33rem;
	height: 33rem;
	margin: 4rem 0rem 0rem 30rem;
}

p.cartEmpty {
	text-align: center;
	font-size: 1.5rem;
	margin-top: 0rem;
	letter-spacing: 0.1rem;
}
</style>
<body>

	<%
	User user = (User) request.getAttribute("userDetails");
	System.out.println(user);
	%>
	<%
	Integer totalAppointmentNo = (Integer) request.getAttribute("totalAppointments");
	int totalAppointments = totalAppointmentNo.intValue();
	System.out.println(totalAppointments);
	%>
	<%
	Set<AppointmentRespondDTO> appointmentList = (Set<AppointmentRespondDTO>) request.getAttribute("appointmentDetails");
	System.out.println(appointmentList);
	int totalDesignerAppointment = appointmentList.size();
	LocalDate currentDate = LocalDate.now();
	int approvedAppointmentsCount = 0;
	int upComingAppointmentsCount = 0;
	int rejectedAppointmentsCount = 0;
	for (AppointmentRespondDTO appointment : appointmentList) {
		String dateString = appointment.getDate();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate localDate = LocalDate.parse(dateString, formatter);
		if (localDate.isBefore(currentDate) && "approved".equals(appointment.getStatus())) {
			approvedAppointmentsCount++;
		} else if (localDate.isAfter(currentDate) && "approved".equals(appointment.getStatus())) {
			upComingAppointmentsCount++;
		} else if ("rejected".equals(appointment.getStatus())) {
			rejectedAppointmentsCount++;
		}
	}
	%>


	<%
	if (appointmentList != null || !appointmentList.isEmpty()) {
	%>
	<input type="checkbox" id="menu-toggle">
	<div class="sidebar">
		<div class="side-header">
			<h3>
				<a href="<%=request.getContextPath()%>/home_page"> <img
					src="https://iili.io/Hy0p6kx.jpg" class="logo"></a>
			</h3>
		</div>

		<div class="side-content">
			<div class="profile">
				<%
				String image = user.getImage();
				if (image != null && !image.isEmpty()) {
				%>
				<div class="profile-img bg-img"
					style="background-image: url('<%=image%>')"></div>
				<%
				} else {
				%>
				<div class="profile-img bg-img"
					style="background-image: url('https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg')">
				</div>
				<%
				}
				%>


				<h4><%=user.getName()%></h4>
				<small>Designer</small>
			</div>

			<div class="side-menu">
				<ul>
					<li><a href="<%=request.getContextPath()%>/home_page"
						class="active"> <span class="las la-home"></span> <small>Dashboard</small>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/user/details">
							<span class="las la-user-alt"></span> <small>Profile</small>
					</a></li>
					<li><a href=""> <span class="las la-envelope"></span> <small>Designs</small>
					</a></li>
					<li><a
						href="<%=request.getContextPath()%>/designer/appointment_list">
							<span class="las la-clipboard-list"></span> <small>Appointments</small>
					</a></li>
					<li><a
						href="<%=request.getContextPath()%>/designer/details?id=<%=user.getId()%>">
							<span class="las la-shopping-cart"></span> <small>Portfolio</small>
					</a></li>
					<li><a href="<%=request.getContextPath()%>/user/logout"
						onclick="return confirm('Are you sure to logout from the website ?');">
							<span class="las la-shopping-cart"></span> <small>LogOut</small>
					</a></li>
				</ul>
			</div>
		</div>
	</div>

	<div class="main-content">

		<header>
			<div class="header-content">
				<label for="menu-toggle"> <span class="las la-bars"></span>
				</label>
				<div class="header-menu">
					<div class="user">
						<%
						if (image != null && !image.isEmpty()) {
						%>
						<div class=" bg-img" style="background-image: url('<%=image%>')"></div>
						<%
						} else {
						%>
						<div class="bg-img"
							style="background-image: url('https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg')">
						</div>
						<%
						}
						%>

					</div>
				</div>
			</div>
		</header>

		<main>

			<div class="page-header">
				<h1>Appointment List</h1>
			</div>

			<div class="page-content">

				<div class="analytics">

					<%
					int completedAppointments = appointmentList.size();

					int percentageCompleted = (completedAppointments * 100) / totalAppointments;
					%>
					<div class="card">
						<div class="card-head">
							<h2><%=totalDesignerAppointment%></h2>
							<span class="las la-user-friends"></span>
						</div>
						<div class="card-progress">
							<small>Total No of Appointments</small>
							<div class="card-indicator">
								<div class="indicator one"
									style="width: <%=(totalDesignerAppointment * 100) / totalAppointments%>%;"></div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-head">
							<h2><%=approvedAppointmentsCount%></h2>
							<span class="las la-eye"></span>
						</div>
						<div class="card-progress">
							<small>Completed</small>
							<div class="card-indicator">
								<div class="indicator two"
									style="width: <%=(approvedAppointmentsCount * 100) / totalAppointments%>%;"></div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-head">
							<h2><%=upComingAppointmentsCount%></h2>
							<span class="las la-envelope"></span>
						</div>
						<div class="card-progress">
							<small>Upcoming Appointments</small>
							<div class="card-indicator">
								<div class="indicator three"
									style="width: <%=(upComingAppointmentsCount * 100) / totalAppointments%>%;"></div>
							</div>
						</div>
					</div>

					<div class="card">
						<div class="card-head">
							<h2><%=rejectedAppointmentsCount%></h2>
							<span class="las la-envelope"></span>
						</div>
						<div class="card-progress">
							<small>Rejected Appointments</small>
							<div class="card-indicator">
								<div class="indicator four"
									style="width: <%=(rejectedAppointmentsCount * 100) / totalAppointments%>%;"></div>
							</div>
						</div>
					</div>

				</div>

				<div class="records table-responsive">

					<div class="record-header">
						<div class="browse">
							<form
								action="<%=request.getContextPath()%>/designer/appointment_list/status"
								method="post">
								<input type="search" placeholder="Search" class="record-search">
								<button id="searchBtn" type="submit">Search</button>
							</form>
						</div>
					</div>

					<div>
						<table width="100%">
							<thead>
								<tr>
									<th>Id</th>
									<th id="clientHead">CLIENT</th>
									<th>ISSUED DATE</th>
									<th>ISSUED TIME</th>
									<th id="statusHead">STATUS</th>
								</tr>
							</thead>
							<tbody id="appointmentTableBody">
								<%
								int index = 1;
								for (AppointmentRespondDTO appointment : appointmentList) {
								%>
								<tr>
									<td name="id"><%=appointment.getId()%></td>
									<%
									boolean active = appointment.getFromUser().isActive();
									%>
									<td>
										<div class="client">
										<%String userImage = appointment.getFromUser().getImage(); %>
											<%
											if (userImage != null && !userImage.isEmpty()) {
											%>
											<div class="client-img bg-img"
												style="background-image: url('<%=userImage%>')"></div>
											<%
											} else {
											%>
											<div class="client-img bg-img"
												style="background-image: url('https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg')">
											</div>
											<%
											}
											%>

											
											<div class="client-info">
												<h4><%=appointment.getFromUser().getName()%></h4>
												<small><%=appointment.getFromUser().getEmail()%></small><br>
												<small><%=appointment.getFromUser().getPhoneNumber()%>
													<%
													if (!active) {
													%> (Inactive) <%
													}
													%> </small>
											</div>
										</div>
									</td>
									<td><%=appointment.getDate()%></td>
									<td><%=appointment.getTime()%></td>
									<td>
										<div class="dropdown">
											<form
												action="<%=request.getContextPath()%>/designer/appointment_list/update"
												method="post" id="appointmentForm_<%=appointment.getId()%>">
												<input type="hidden" name="id"
													value="<%=appointment.getId()%>">

												<%
												String appointmentStatus = appointment.getStatus();
												String statusClass = "status pending";

												if ("approved".equals(appointmentStatus)) {
													statusClass = "status approved";
												} else if ("rejected".equals(appointmentStatus)) {
													statusClass = "status rejected";
												}
												%>

												<%
												if (appointmentStatus.equals("approved") || appointmentStatus.equals("rejected")) {
												%>
												<button id="btn" value="<%=appointmentStatus%>"
													class="<%=statusClass%>" disabled><%=appointmentStatus%></button>
												<%
												} else if (appointmentStatus.equals("waiting_list")) {
												%>
												<button id="btn" value="<%=appointmentStatus%>"
													class="<%=statusClass%>"><%=appointmentStatus%></button>
												<select class="dropdown-content" name="status">
													<option value="approved" class="status approved">approved</option>
													<option value="rejected" class="status rejected">rejected</option>
												</select>
												<button type="submit" id="btnUpdate">Update</button>
												<%
												}
												%>
											</form>
										</div>
									</td>
								</tr>
								<%
								index++;
								}
								%>
								<%
								if (appointmentList == null || appointmentList.isEmpty()) {
								%>
								<tr>
									<td colspan="5">
										<h1 class="message">You have no appointments yet!</h1>
									</td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>

				</div>

			</div>

		</main>
		<%
		}
		%>
	</div>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const tableBody = document.querySelector("tbody");

							tableBody
									.addEventListener(
											"click",
											function(event) {
												const clickedElement = event.target;

												if (clickedElement.classList
														.contains("status")) {
													const row = clickedElement
															.closest("tr");
													const dropdownButton = row
															.querySelector(".status.pending");

													if (!row.classList
															.contains("approved")
															&& !row.classList
																	.contains("rejected")) {
														const dropDown = row
																.querySelector(".dropdown-content");

														if (clickedElement.classList
																.contains("approved")) {
															row.classList
																	.add("approved");
															dropdownButton.textContent = "approved";
															dropdownButton.classList
																	.remove("rejected");
															dropdownButton.classList
																	.add("approved");
															dropdownButton.style.backgroundColor = "#86e49d";
															dropdownButton.style.color = "#006b21";
															dropDown.style.display = "none";
														} else if (clickedElement.classList
																.contains("rejected")) {
															row.classList
																	.add("rejected");
															dropdownButton.textContent = "Rejected";
															dropdownButton.classList
																	.remove("approved");
															dropdownButton.classList
																	.add("rejected");
															dropdownButton.style.backgroundColor = "#d893a3";
															dropdownButton.style.color = "#b30021";
															dropDown.style.display = "none";
														}
													}
												}
											});
						});

		function submitForm(appointmentId) {
			var formId = "appointmentForm_" + appointmentId;
			document.getElementById(formId).submit();
		}
	</script>

</body>
</html>
