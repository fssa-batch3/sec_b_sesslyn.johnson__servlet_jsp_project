<%@page import="in.fssa.minimal.model.User"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.dto.AppointmentRespondDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment List</title>
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	cursor: pointer;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
	overflow-x: hidden;
}

.main_header {
	font-size: 1rem;
}

h1 {
	margin: 2rem 2rem 0rem 2rem;
}

main.table {
	margin: 2rem 2rem 0rem 2rem;
	overflow-y: scroll;
	border-radius: .8rem;
	overflow: hidden;
}

.table__header {
	width: 100%;
	height: 10%;
	background-color: #fff4;
	padding: .8rem 1rem;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

table {
	width: 100%;
	table-layout: fixed;
	border-collapse: collapse;
}

thead th, tbody td {
	padding: 1rem;
	text-align: left;
	padding-left: 3rem;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

thead th:first-child, tbody td:first-child {
	width: 100px;
	min-width: 100px;
	text-align: center;
}

thead th:nth-child(2), tbody td:nth-child(2) {
	width: 150px;
	min-width: 150px;
	text-align: center;
}

thead th:not(:first-child):not(:nth-child(2)), tbody td:not(:first-child):not(:nth-child(2))
	{
	width: auto;
}

.table__body {
	width: 95%;
	max-height: calc(89% - 1.6rem);
	background-color: #fffb;
	margin: .8rem auto;
	border-radius: .6rem;
	overflow: auto;
	overflow: overlay;
}

.table__body::-webkit-scrollbar {
	width: 0.5rem;
	height: 0.5rem;
}

.table__body::-webkit-scrollbar-thumb {
	border-radius: .5rem;
	background-color: #0004;
	visibility: hidden;
}

.table__body:hover::-webkit-scrollbar-thumb {
	visibility: visible;
}

table {
	width: 100%;
}

.designer {
	display: flex;
	flex-direction: row;
	margin-right: 3rem;
}

#designer_image {
	width: 30px;
	height: 30px;
	border-radius: 50%;
	margin: 2rem 2rem 0rem 2rem;
	padding: 0rem;
}

h4 {
	margin: 2.5rem 0rem 0rem 0rem;
	padding: 0rem;
}

table, th, td {
	border-collapse: collapse;
	padding: 1rem;
	text-align: left;
	padding-left: 3rem;
}

thead th {
	padding-left: 3rem;
	background-color: #bab7b0;
	cursor: pointer;
	text-transform: capitalize;
}

tbody tr {
	background-color: #0000000b;
}

tbody tr {
	--delay: .1s;
	transition: .5s ease-in-out var(--delay), background-color 0s;
}

tbody tr.hide {
	opacity: 0;
	transform: translateX(100%);
}

tbody tr:hover {
	background-color: #fff6 !important;
}

tbody tr td, tbody tr td p, tbody tr td img {
	transition: .2s ease-in-out;
}

tbody tr.hide td, tbody tr.hide td p {
	padding: 0;
	font: 0/0 sans-serif;
	transition: .2s ease-in-out .5s;
}

tbody tr.hide td img {
	width: 0;
	height: 0;
	transition: .2s ease-in-out .5s;
}

.status {
	padding: .4rem 0;
	border-radius: 2rem;
	text-align: center;
	cursor: pointer;
}

.status.waiting_list {
	background-color: #ebc474;
	color: black;
}

.status.approved {
	background-color: #86e49d;
	color: #006b21;
}

.status.rejected {
	background-color: #d893a3;
	color: #b30021;
}

a.button {
	width: 100%;
	padding: 0.6rem 0.5rem;
	display: flex;
	border-radius: 10px;
	justify-content: space-around;
	align-items: center;
	transition: .2s ease-in-out;
	border: none;
	background: #ebc474;
	color: black;
	font-size: 24px;
	cursor: pointer;
}

a.button:active {
	filter: brightness(75%);
}

.dropdown {
	position: relative;
	padding: 0;
	margin-right: 1em;
	border: none;
}

.dropdown summary {
	list-style: none;
	list-style-type: none;
}

.dropdown>summary::-webkit-details-marker {
	display: none;
}

.dropdown summary:focus {
	outline: none;
}

.dropdown summary:focus a.button {
	border: 2px solid white;
}

.dropdown summary:focus {
	outline: none;
}

.dropdown ul {
	position: absolute;
	margin: 20px 0 0 0;
	padding: 20px 0;
	width: 160px;
	left: 50%;
	margin-left: calc(( 160px/ 2)* -1);
	box-sizing: border-box;
	z-index: 2;
	background: white;
	border-radius: 6px;
	list-style: none;
}

.dropdown ul li {
	padding: 0;
	margin: 0;
}

.dropdown ul li a:link, .dropdown ul li a:visited {
	display: inline-block;
	padding: 10px 0.8rem;
	width: 100%;
	box-sizing: border-box;
	color: black;
	text-decoration: none;
}

.dropdown ul li a:hover {
	background-color: dodgerblue;
	color: white;
}

.dropdown ul::before {
	content: ' ';
	position: absolute;
	width: 0;
	height: 0;
	top: -10px;
	left: 50%;
	margin-left: -10px;
	border-style: solid;
	border-width: 0 10px 10px 10px;
	border-color: transparent transparent white transparent;
}

.dropdown>summary::before {
	display: none;
}

.dropdown[open]>summary::before {
	content: ' ';
	display: block;
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	z-index: 1;
}

@media ( max-width : 1000px) {
	td:not(:first-of-type) {
		min-width: 12.1rem;
	}
}

thead th span.icon-arrow {
	display: inline-block;
	width: 1.3rem;
	height: 1.3rem;
	border-radius: 50%;
	border: 1.4px solid transparent;
	text-align: center;
	font-size: 1rem;
	margin-left: .5rem;
	transition: .2s ease-in-out;
}

thead th.asc span.icon-arrow {
	transform: rotate(180deg);
}

thead th.active, tbody td.active {
	color: #dbf1df;
}

#cart_empty {
	display: block;
}
.emptyCart{
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
	String headerJSP = "";
	if (request.getAttribute("userDetails") != null) {
		headerJSP = "/header_after_login.jsp";
	} else {
		headerJSP = "/header_before_login.jsp";
	}
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
						<th>Name</th>
						<th id="email">Email</th>
						<th>Designer Name</th>
						<th id="email">Designer Email</th>
						<th id="date">Date</th>
						<th id="time">Time</th>
						<th id="date">Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					int index = 1; 
					for (AppointmentRespondDTO appointment : appointmentList) {
					%>
					<tr>
						<td><%=index%></td>
						<td><%=appointment.getFromUser().getName()%></td>
						<td><%=appointment.getFromUser().getEmail()%></td>
						<td><%=appointment.getToUser().getName()%></td>
						<td><%=appointment.getToUser().getEmail()%></td>
						<td><%=appointment.getDate()%></td>
						<td><strong><%=appointment.getTime()%></strong></td>
						<td><details class="dropdown">
								<summary role="button">
									<p class="status <%=appointment.getStatus().toLowerCase()%>">
										<%=appointment.getStatus()%>
									</p>
								</summary>
							</details></td>
					</tr>
					<%
					index++; 
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