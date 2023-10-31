<%@page import="in.fssa.minimal.model.Address"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>New Address Page</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/order/order_details.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/header.css">
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link
		href="https://fonts.googleapis.com/css2?family=Lato:wght@300&family=Prompt:wght@200&family=Source+Sans+Pro:wght@300&display=swap"
		rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Comfortaa:wght@300&display=swap" rel="stylesheet">
</head>

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
			<a onclick="closeAlert()" class="close" href="#">&times;</a>
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
	Address address = (Address) request.getAttribute("addressDetails");
	%>
	<main>

		<div class="top">
			<div class="top_container">
				<h2>Delivery Information</h2>
				<form action="<%=request.getContextPath()%>/user/address/edit"
					method="post" id="formDiv">
					<div class="order-details">
						<div class="details">
							<div class="form_details">
								<label>Name</label> 
								<input type="text" class="name" value="<%=(address != null) ? address.getName() : ""%>"
									required="true" id="user_name" name="name"
									title="Only Alphabets are allowed." pattern="[a-zA-Z]+"
									placeholder="Daniel">
							</div>

							<div class="form_details">
								<label class="mobile_no">Mobile Number</label> <input
									type="text" class="name" required="true" value="<%=(address != null) ? address.getPhoneNumber() : ""%>"
									title="it should be 10 digit number" name="phone_number"
									id="user_no" pattern="[6-9]{1}[0-9]{9}"
									placeholder="9952393568">
							</div>
						</div>

						<div class="details">
							<div class="form_details">
								<label>E-mail</label> <input type="text" class="name"
									required="true" id="user_email" value="<%=(address != null) ? address.getEmail() : ""%>"
									pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" name="email"
									title="Must contain @ and only lower case is allowed."
									required="true" placeholder="daniel05@gmail.com">
							</div>

							<div class="form_details">
								<label class="mobile_no">City</label> <input type="text"
									class="name" title="Only Alphabets and space is allowed"
									required="true" id="user_city" name="city" value="<%=(address != null) ? address.getCity() : ""%>"
									placeholder="Chennai">
							</div>
						</div>

						<div class="details">
							<div class="form_details">
								<label>State</label> <input type="text" class="name"
									required="true" id="user_state" name="state" value="<%=(address != null) ? address.getState() : ""%>"
									title="Only Alphabets and space is allowed"
									placeholder="Tamil Nadu">
							</div>

							<div class="form_details" id="zip_no">
								<label>ZIP Code</label> <input type="number" class="name"
									required="true" name="pincode" value="<%=(address != null) ? address.getPincode() : ""%>"
									title="It should be a 6 digit number without spaces and first digit can not be zero"
									pattern="[6]{1}[0-9]{4}[1-9]{1}" maxlength="6" min="600001"
									max="643253" id="user_code" placeholder="600094">
							</div>

							<div class="form_details" id="country_no">
								<label class="country_no">Country</label> <input type="text" value="<%=(address != null) ? address.getCountry() : ""%>"
									class="name" required="true" id="user_country" name="country"
									title="Only Alphabets and space is allowed" placeholder="India">
							</div>

						</div>

						<div class="details">
							<div class="form_details">
								<label>Address</label> <input type="text" class="name" value="<%=(address != null) ? address.getAddress() : ""%>"
									required="true" id="user_address" name="address"
									title="Accepts Alphabets, number and special character and space too."
									placeholder="12th Nehru street, Perungudi.">
							</div>
							<div class="form_details">
								<label class="notes">Title</label> <input type="text" value="<%=(address != null) ? address.getTitle() : ""%>"
									class="name" id="user_notes" name="title" required
									title="Accepts Alphabets, number and special character and space too."
									placeholder="Home">
							</div>
						</div>
					</div>

					<button class="btn_order" type="submit">Proceed</button>

				</form>
			</div>
		</div>
	</main>
	<Script>
		function closeAlert() {
			var alertDiv = document.getElementById("popup1");
			alertDiv.style.display = "none";
		}
	</Script>
	<script src="<%=request.getContextPath()%>/assets/js/profile/chatBot.js"></script>
</body>

</html>