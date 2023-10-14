<%@page import="in.fssa.minimal.model.User"%>
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
<style>
 #statusInfo {
	display: flex;
	flex-direction: row;
}

#review {
	display: none;
}

.table__body {
	width: 95%;
	max-height: calc(89% - 1.6rem);
	background-color: #fffb;
	margin: .8rem auto;
	border-radius: .6rem;
	height: 100vh;
	overflow: overlay;
}

#reviewMain {
	display: grid;
	height: 100%;
	place-items: center;
	text-align: center;
}

.containerDiv {
	position: absolute;
	width: 400px;
	background: #111;
	padding: 60px 30px;
	border: 1px solid #444;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
	top: 30%;
	left: 35%;
}

.containerDiv .text {
	font-size: 25px;
	color: #eee;
	font-weight: 500;
	margin-top: -2rem;
}

.containerDiv .post {
	display: none;
}

.containerDiv .star-widget input {
	display: none;
}

.star-widget {
	margin-top: -2rem;
}

.star-widget label {
	font-size: 40px;
	color: #444;
	padding: 10px;
	float: right;
	transition: all 0.2s ease;
}

input:not(:checked) ~label:hover, input:not(:checked) ~label:hover ~label
	{
	color: #fd4;
}

input:checked ~label {
	color: #fd4;
}

input#rate-5:checked ~label {
	color: #fe7;
	text-shadow: 0 0 20px #952;
}

#rate-1:checked ~ form header:before {
	content: "I just hate it";
}

#rate-2:checked ~ form header:before {
	content: "I don't like it";
}

#rate-3:checked ~ form header:before {
	content: "I just like it";
}

#rate-4:checked ~ form header:before {
	content: "It is awesome";
}

#rate-5:checked ~ form header:before {
	content: "I just love it";
}

.reviewForm {
	display: none;
}

input:checked ~ .reviewForm {
	display: block;
}

form header {
	width: 100%;
	font-size: 25px;
	color: #fe7;
	font-weight: 500;
	margin: 5px 0 20px 0;
	text-align: center;
	transition: all 0.2s ease;
}

form .textarea {
	height: 100px;
	width: 100%;
	overflow: hidden;
}

form .textarea textarea {
	height: 100%;
	width: 100%;
	outline: none;
	color: #eee;
	border: 1px solid #333;
	background: #222;
	padding: 10px;
	font-size: 17px;
	resize: none;
}

form .btn {
	height: 45px;
	width: 100%;
	margin: 15px 0;
}

.btnPost {
	height: 100%;
	width: 100%;
	--color: #999;
	--color2: rgb(10, 25, 30);
	padding: 0.8em 1.75em;
	background-color: transparent;
	border-radius: 6px;
	border: .3px solid var(--color);
	transition: .5s;
	position: relative;
	overflow: hidden;
	cursor: pointer;
	z-index: 1;
	font-weight: 500;
	font-size: 17px;
	text-transform: uppercase;
	color: var(--color);
}

.btnPost::after, .btnPost::before {
	content: '';
	display: block;
	height: 100%;
	width: 100%;
	transform: skew(90deg) translate(-50%, -50%);
	position: absolute;
	inset: 50%;
	left: 25%;
	z-index: -1;
	transition: .5s ease-out;
	background-color: var(--color);
}

.blur-background {
	filter: blur(8px);
	-webkit-filter: blur(8px);
}

.btnPost::before {
	top: -50%;
	left: -25%;
	transform: skew(90deg) rotate(180deg) translate(-50%, -50%);
}

.btnPost:hover::before {
	transform: skew(45deg) rotate(180deg) translate(-50%, -50%);
}

.btnPost:hover::after {
	transform: skew(45deg) translate(-50%, -50%);
}

.btnPost:hover {
	color: var(--color2);
}

.btnPost:active {
	filter: brightness(.7);
	transform: scale(.98);
}

.btnDone {
	height: 50px;
	width: 150px;
	border: none;
	cursor: pointer;
	position: absolute;
	top: 4rem;
	bottom: 1rem;
	left: 7rem;
	border-radius: 50px;
	overflow: hidden;
	transition: all 0.5s ease-in-out;
}

.btnCancel {
	height: 100%;
	width: 100%;
	--color: #999;
	--color2: rgb(10, 25, 30);
	margin-left: 1rem;
	padding: 0.8em 1.75em;
	background-color: transparent;
	border-radius: 6px;
	border: .3px solid var(--color);
	transition: .5s;
	position: relative;
	overflow: hidden;
	cursor: pointer;
	z-index: 1;
	font-weight: 500;
	font-size: 17px;
	text-transform: uppercase;
	color: var(--color);
}

#reviewBtn {
	border: none;
	margin-bottom: 0rem;
	margin-left: -3rem;
}

</style>
<body>
<% int userId = 0;
int appointmentId = 0;
int designerId = 0;
%>
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

                        if ("approved".equals(appointment.getStatus().toLowerCase())) {
                            statusToShow = currentDate.isAfter(parsedDate)
                                    || (currentDate.isEqual(parsedDate) && currentTime.isAfter(parsedTime)) ? "completed" : "approved";
                        } else if ("waiting_list".equals(appointment.getStatus().toLowerCase())) {
                            statusToShow = currentDate.isAfter(parsedDate)
                                    || (currentDate.isEqual(parsedDate) && currentTime.isAfter(parsedTime))
                                            ? "rejected"
                                            : "waiting_list";
                        } else {
                            statusToShow = appointment.getStatus().toLowerCase();
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
                        %>
                        <br> <small>
                            <%
                            if ("approved".equals(appointment.getStatus())) {
                                out.print(appointment.getToUser().getEmail());
                            }
                            %>
                        </small>
                    </td>
                    <td><%=appointment.getDate()%></td>
                    <td><strong><%=appointment.getTime()%></strong></td>
                    <td id="statusInfo">
                                <p class="status <%=statusToShow.toLowerCase()%>">
                                    <%=statusToShow%>
                        </p>
                        <%
                        if (statusToShow.equals("completed")) {
                            appointmentId = appointment.getId();
                           userId = appointment.getFromUser().getId();
                           designerId = appointment.getToUser().getId();
                        %>
                       <button class="review-button" id="reviewBtn" type="button">Review</button>
                        <%
                        }
                        %></td>
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

<div id="review">
    <main id="reviewMain">
        <div class="containerDiv">
            <form
                action="<%=request.getContextPath()%>/user/appointment_list/review"
                method="post">
                <div class="post">
                    <div class="text">Thanks for rating us!</div>
                    <a href="<%=request.getContextPath()%>/user/appointment_list"><button
                            class="btnDone">Done</button></a>
                </div>
                <input type="hidden" name="appointmentId" id="appointmentId" value="">
                <input type="hidden" name="fromUserId" id="fromUserId" value="">
                <input type="hidden" name="toUserId" id="toUserId" value="">

                <div class="star-widget">
                    <input type="radio" name="rate" value="5" id="rate-5"> <label
                        for="rate-5" class="fas fa-star"></label> <input type="radio"
                        name="rate" value="4" id="rate-4"> <label for="rate-4"
                        class="fas fa-star"></label> <input type="radio" name="rate"
                        value="3" id="rate-3"> <label for="rate-3"
                        class="fas fa-star"></label> <input type="radio" name="rate"
                        value="2" id="rate-2"> <label for="rate-2"
                        class="fas fa-star"></label> <input type="radio" name="rate"
                        value="1" id="rate-1"> <label for="rate-1"
                        class="fas fa-star"></label>
                    <div class="reviewForm">
                        <header class="comment"> </header>
                        <div class="textarea">
                            <textarea cols="30" id="about" name="description"
                                placeholder="Describe your experience.."></textarea>
                        </div>
                        <div class="btn" id="btn">
                            <button class="btnPost" id="btnPost" type="submit">Post</button>
                            <button class="btnCancel" id="btnCancel" type="button">Cancel</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </main>
</div>

<script>
    

document.querySelectorAll("button.review-button").forEach(function (button) {
    button.addEventListener("click", function () {
        const appointmentId = '<%= appointmentId %>';
        const userId = '<%= userId %>';
        const designerId = '<%= designerId %>';

        const messageDiv = document.getElementById("review");
        messageDiv.style.display = "block";

        // Set the hidden input values
        document.getElementById("appointmentId").value = appointmentId;
        document.getElementById("fromUserId").value = userId;
        console.log(userId);
        document.getElementById("toUserId").value = designerId;
        console.log(designerId);

        // Assuming you have an element with the id "table" to blur
        const table = document.getElementById("table");
        if (table) {
            table.classList.add("blur-background");
        }

        const btnPost = document.querySelector(".btnPost");
        const btnCancel = document.querySelector(".btnCancel");
        const post = document.querySelector(".post");
        const widget = document.querySelector(".star-widget");

        btnPost.addEventListener('click', function () {
            widget.style.display = "none";
            post.style.display = "block";
        });

        btnCancel.addEventListener('click', function () {
            messageDiv.style.display = "none";
            if (table) {
                table.classList.remove("blur-background");
            }
        });
    });
});
</script>
</body>
</html>
