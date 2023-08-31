<%@page import="java.util.Set"%>
<%@page import="in.fssa.minimal.dto.AppointmentRespondDTO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Appointment List</title>
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
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	cursor: pointer;
	font-family: "Source Sans Pro", "Helvetica Neue", Arial, sans-serif;
}

.head {
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

.main_header {
	font-size: 1rem;
}

body {
	overflow-x: hidden;
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
</style>
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
	<main class="table">
		<section class="table__header">
			<h1>Appointments</h1>
		</section>
		<section class="table__body">
			<table>
				<thead>
					<%
					Set<AppointmentRespondDTO> appointmentList = (Set<AppointmentRespondDTO>) request.getAttribute("appointmentDetails");
					%>
					<tr>
						<th>Id</th>
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
					for (AppointmentRespondDTO appointment : appointmentList) {
					%>
					<tr>
						<td><%=appointment.getId()%></td>
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
					}
					%>
				</tbody>
			</table>
		</section>
	</main>
</body>
</html>