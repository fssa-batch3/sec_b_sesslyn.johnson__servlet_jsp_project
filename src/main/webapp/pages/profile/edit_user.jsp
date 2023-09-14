<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/header.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/edit_profile.css">
</head>
<body>
	<%
	String errorMsg = (String) request.getAttribute("error");
	if (errorMsg != null && !errorMsg.isEmpty()) {
	%>
	<div class="overlay" id="overlay"></div>
	<div id="popup1" class="popup error">
		<h2>Alert !</h2>
		<a class="close" href="#" onclick="closeAlert()">&times;</a>
		<div class="content">
			<%=errorMsg%>
		</div>
		<button id="alert" onclick="closeAlert()" type="button">Ok</button>
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
	if (user != null) {
	%>

	<div class="container_profile">
		<div class="leftbox">
			<nav>
				<a id="profileId" class="active"> <img
					src="https://iili.io/HyVDPVV.png" class="profileIcon" />
				</a>
			</nav>
		</div>

		<form action="update" method="post">
			<div class="rightbox">
				<div class="profileId">
					<h1>Personal Info</h1>
					<div class="flexDiv">
						<div class="form_details">
							<label for="name" class="labelTag"><b>Name</b></label> <br>
							<input type="text" name="name" value="<%=user.getName()%>"
								required>

							<hr class="new3">
						</div>
						<div class="form_details">
							<label for="email" class="labelTag"><b>Email</b></label> <br>
							<input type="email" name="email" value="<%=user.getEmail()%>"
								disabled>
							<hr class="new3">
						</div>
					</div>


					<div class="flexDiv">
						<div class="form_details">
							<label for="phone" class="labelTag"><b>Phone Number</b></label> <input
								type="tel" name="phone_number"
								value="<%=user.getPhoneNumber()%>" required>
							<hr class="new3">
						</div>
						<div class="form_details">
							<label for="password" class="labelTag"><b>Password</b></label> <input
								type="password" name="password" value="<%=user.getPassword()%>"
								required>
							<hr class="new3">
						</div>
					</div>

					<label for="image" class="labelTag"><b>Image URL</b></label> <input
						type="url" id="image" name="image"
						value="<%=user.getImage() != null ? user.getImage() : " "%>">
					<hr class="new3">

					<div class="flexDiv">
						<div class="form_details">
							<label for="date_of_birth" class="labelTag"><b>D.O.B</b></label>
							<input type="date" class="name" max="2005-08-31"
								value="<%=user.getDateOfBirth() != null ? user.getDateOfBirth() : " "%>"
								name="date_of_birth" id="user_dob">
							<hr class="new3">
						</div>
						<div class="form_details">
							<label for="gender" class="labelTag"><b>Gender</b></label> <select
								type="text" class="name" id="user_gender" name="user_gender">
								<option value="">Select</option>
								<option value="Male"
									<%=user.getGender() != null && user.getGender().equals("male") ? "selected" : ""%>>Male</option>
								<option value="Female"
									<%=user.getGender() != null && user.getGender().equals("female") ? "selected" : ""%>>Female</option>
								<option value="Transgender"
									<%=user.getGender() != null && user.getGender().equals("other") ? "selected" : ""%>>Others</option>
							</select>
						</div>
					</div>

					<div class="tw-toggle">
						<input type="radio" name="toggle" value="false"
							<%=user.getRole() != null && user.getRole().equals("user") ? "checked" : ""%>>
						<label class="toggle toggle-yes">User</label> <input type="radio"
							name="toggle" value="-1"
							<%=user.getRole() != null && user.getRole().equals("seller") ? "checked" : ""%>>
						<label class="toggle toggle-yes">Seller</label> <input
							type="radio" name="toggle" value="true"
							<%=user.getRole() != null && user.getRole().equals("designer") ? "checked" : ""%>>
						<label class="toggle toggle-yes">Designer</label> <span></span>
					</div>


					<button class="formSubmit">Submit</button>
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
	<div class="delete">
		<a href="<%=request.getContextPath()%>/user/delete"
			onclick="return confirm('Are you sure to delete your account from the website ?');">
			<img src="https://iili.io/J9qwmGI.png" class="deleteIcon" />
		</a>
	</div>
	<script>
		function closeAlert() {
			var overlay = document.getElementById("overlay");
			var alertDiv = document.getElementById("popup1");
			overlay.style.display = "none";
			alertDiv.style.display = "none";

			var containerProfile = document.querySelector(".container_profile");
			containerProfile.style.zIndex = "";
		}

		function showAlert() {
			var overlay = document.getElementById("overlay");
			var alertDiv = document.getElementById("popup1");
			overlay.style.display = "block";
			alertDiv.style.display = "block";

			var containerProfile = document.querySelector(".container_profile");
			containerProfile.style.zIndex = -1;
		}

		const popup = document.getElementById("popup1");
		if (popup.classList.contains("error")) {
			showAlert();
		}
	</script>
</body>
</html>
