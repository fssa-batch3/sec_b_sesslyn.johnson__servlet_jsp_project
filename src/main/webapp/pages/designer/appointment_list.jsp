<%@page import="java.time.LocalTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="in.fssa.minimal.dto.AppointmentRespondDTO"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/designer/user_appointment_list.css">
</head>
<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />

	<%
	Set<AppointmentRespondDTO> appointmentList = (Set<AppointmentRespondDTO>) request.getAttribute("appointmentDetails");
	System.out.println(appointmentList);
	%>

	<%
	if (appointmentList == null || appointmentList.isEmpty()) {
	%>
	<div id="cart_empty">
		<img loading="lazy" src="https://iili.io/HgdHinR.jpg"
			class="emptyCart" alt="Empty Cart image" />
		<p class="cartEmpty">You haven't booked a meeting yet!</p>
	</div>

	<%
	} else {
	%>
	<main class="table">
		<section class="table__header">
			<h1>Appointments</h1>
		</section>
		<section class="table__body">
			<table>
				<thead>
					<tr>
						<th>No</th>
						<th id="user_email">User Details</th>
						<th id="designer_email">Designer Details</th>
						<th id="date">Date</th>
						<th>Time</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					if (appointmentList != null && !appointmentList.isEmpty()) {
						int index = 0;
						for (AppointmentRespondDTO appointment : appointmentList) {
							LocalDate currentDate = LocalDate.now();
							LocalTime currentTime = LocalTime.now();
							String targetDate = appointment.getDate();
							String targetTime = appointment.getTime();

							LocalDate parsedDate = LocalDate.parse(targetDate);
							LocalTime parsedTime = LocalTime.parse(targetTime);

							String statusToShow = "";

							if ("approved".equals(appointment.getStatus())) {
						statusToShow = currentDate.isAfter(parsedDate)
								|| (currentDate.isEqual(parsedDate) && currentTime.isAfter(parsedTime)) ? "completed" : "approved";
							} else if ("waiting_list".equals(appointment.getStatus())) {
						statusToShow = currentDate.isAfter(parsedDate)
								|| (currentDate.isEqual(parsedDate) && currentTime.isAfter(parsedTime)) ? "rejected"
										: "waiting_list";
							} else {
						statusToShow = appointment.getStatus();
							}
					%>
					<tr>
						<td><%=index + 1%></td>
						<td><%=appointment.getFromUser().getName()%><br> <small><%=appointment.getEmail()%></small></td>
						<td id="designer">
							<%
							out.print(appointment.getToUser().getName());
							if (!appointment.getToUser().isActive()) {
							%> - Inactive <%
							}
							%> <br> <small> <%if ("approved".equals(appointment.getStatus())) {
 	                               out.print(appointment.getToUser().getEmail());
                             }%>
						</small>
						</td>
						<td><%=appointment.getDate()%></td>
						<td><strong><%=appointment.getTime()%></strong></td>
						<td id="statusInfo"><details class="dropdown">
								<summary role="button">
									<p class="status <%=statusToShow.toLowerCase()%>">
										<%=statusToShow%>
									</p>
								</summary>
							</details></td>
					</tr>
					<%
					index++;
					}
					}
					%>
				</tbody>
			</table>
		</section>
	</main>
	<%
	}
	%>
</body>
</html>
