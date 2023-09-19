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
<title>Designer Appointment List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/designer/designer_appointment_list.css">
</head>
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
					<li><a href="<%=request.getContextPath()%>/designer/design"> <span class="las la-envelope"></span> <small>Designs</small>
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
											<%
											String userImage = appointment.getFromUser().getImage();
											%>
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
