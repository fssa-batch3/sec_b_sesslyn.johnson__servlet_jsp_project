<%@page import="in.fssa.minimal.model.User"%>
<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/header.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/edit_profile.css">
</head>
<style>
#emailDiv {
	margin-top: -0.4rem;
}
.container_profile {
	background: #FFFFFF;
	width: 650px;
	height: 600px;
	margin: 0 auto;
	position: relative;
	margin-top: 5%;
	box-shadow: 2px 5px 20px rgba(119, 119, 119, 0.5);
}

.formSubmit {
	position: absolute;
	top: 102%;
	left: 68%;
	width: 100px;
	height: 40px;
	border-radius: 10px;
	background-color: #232323;
	color: white;
	border: none;
}
textarea {
	border: none;
	padding: 2px;
	margin-top: -1.2rem;
}

#designDescription {
	margin-top: 0.2rem;
	width: 90%;
}

select {
	padding-top: 1.4rem;
}

.delete {
	position: absolute;
	top: 20%;
	right: 30%;
}
</style>
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
		<%
		if ("user".equals(user.getRole())) {
		%>
		<form action="<%=request.getContextPath()%>/user/update" method="post">
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
						<div class="form_details" id="emailDiv">
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
							<label for="date_of_birth" class="labelTag"><b>D.O.B</b></label>
							<input type="date" class="name" max="2005-08-31"
								value="<%=user.getDateOfBirth() != null ? user.getDateOfBirth() : " "%>"
								name="date_of_birth" id="user_dob">
							<hr class="new3">
						</div>
					</div>
					<label for="image" class="labelTag"><b>Image URL</b></label> <input
						type="url" id="image" name="image"
						value="<%=user.getImage() != null ? user.getImage() : " "%>">
					<hr class="new3">
					<div class="flexDiv">

						<div class="form_details">
							<label for="gender" class="labelTag"><b>Gender</b></label> <select
								type="text" class="name" id="user_gender" name="gender">
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
					
					<button class="formSubmit">Submit</button>
				</div>
			</div>
		</form>
		<%
		} else if ("seller".equals(user.getRole())) {
		%>
		<form action="<%=request.getContextPath()%>/user/update" method="post">
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
						<div class="form_details" id="emailDiv">
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
							<label for="image" class="labelTag"><b>Image URL</b></label> <input
								type="url" id="image" name="image"
								value="<%=user.getImage() != null ? user.getImage() : " "%>">
							<hr class="new3">
						</div>
					</div>
					<div class="flexDiv">
						<div class="form_details">
							<label for="date_of_birth" class="labelTag"><b>D.O.B</b></label>
							<input type="date" class="name" max="2005-08-31"
								value="<%=user.getDateOfBirth() != null ? user.getDateOfBirth() : " "%>"
								name="date_of_birth" id="user_dob">
							<hr class="new3">
						</div>
						<div class="form_details">
							<label for="gstNumber" class="labelTag"><b>GST Number</b></label>
							<input type="text" id="gstNumber" name="gstNumber" 
							value="<%=user.getGst_number() != null ? user.getGst_number() : " "%>"
								pattern="\d{2}[A-Z]{5}\d{4}[A-Z]{1}[A-Z\d]{1}[Z]{1}[A-Z\d]{1}"
								title="Must contains 15 characters and alphanumeric is allowed."
								required placeholder="GST Number">
							<hr class="new3">
						</div>

					</div>
					<div class="flexDiv">
						<div class="form_details">
							<label for="gender" class="labelTag"><b>Gender</b></label> <select
								type="text" class="name" id="user_gender" name="gender">
								<option value="">Select</option>
								<option value="Male"
									<%=user.getGender() != null && user.getGender().equals("male") ? "selected" : ""%>>Male</option>
								<option value="Female"
									<%=user.getGender() != null && user.getGender().equals("female") ? "selected" : ""%>>Female</option>
								<option value="Transgender"
									<%=user.getGender() != null && user.getGender().equals("other") ? "selected" : ""%>>Others</option>
							</select>
							<hr class="new3">
						</div>
						<div class="form_details">
							<label for="shopAddress" class="labelTag"><b>Shop /
									Home Address</b></label><br>
							<textarea name="shopAddress" id="shopAddress"
								pattern="^(?!.*\s{2})[^\s].*[^\s]$"
								placeholder="Shop / Home Address" required minlength="10"
								class="textareaField"><%=user.getShop_address() != null ? user.getShop_address() : " "%></textarea>
							<hr class="new3">
						</div>
					</div>

					<button class="formSubmit">Submit</button>
				</div>
			</div>
		</form>
		<%
		} else if ("designer".equals(user.getRole())) {
		%>
		<form action="<%=request.getContextPath()%>/user/update" method="post">
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
						<div class="form_details" id="emailDiv">
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
							<label for="experience" class="labelTag"><b>Experience</b></label>
							<input type="number"
								value="<%=user.getExperience() > 0 ? user.getExperience() : " "%>"
								name="experience" required 
								title="It should be in months or years" id="designer_exper" />
							<hr class="new3">
						</div>
					</div>
					<label for="image" class="labelTag"><b>Image URL</b></label> <input
						type="url" id="image" name="image"
						value="<%=user.getImage() != null ? user.getImage() : " "%>">
					<hr class="new3">


					<label for="description" class="labelTag"><b>Description
							:</b></label>
					<textarea name="description" id="designDescription"
						pattern="^(?!.*\s{2})[^\s].*[^\s]$"
						placeholder="Design Description" required minlength="30"
						class="textareaField"><%=user.getDesigner_description() != null ? user.getDesigner_description() : " "%></textarea>
					<hr class="new3">

					<button class="formSubmit">Submit</button>
				</div>
			</div>
		</form>
		<%
		}
		%>
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
