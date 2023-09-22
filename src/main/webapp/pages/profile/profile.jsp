<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/profile_new.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/normalize.css">
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
	href="https://fonts.googleapis.com/css2?family=Lato:wght@300&family=Prompt:wght@200&family=Source+Sans+Pro:wght@300&display=swap"
	rel="stylesheet">
</head>
<style>
.addressDiv {
	overflow-y: scroll;
	height: 405px;
	margin-top: 2rem;
	width: 320px;
}

ul {
	margin-top: 2rem;
}

.profile_right {
	margin: 3rem 0rem 3rem -4rem;
	overflow: hidden;
}

.quotes {
	font-size: 1.2rem;
	margin-right: 4rem;
	margin-left: 2rem;
}

.seller {
	background-color: rgb(218, 216, 216);
	margin: 0rem 3rem 0rem 0rem;
	padding: 0.5rem 0.5rem;
}

small {
	display: block;
	margin: 2.5rem 0rem 0rem -5.9rem;
}
</style>
<body>
	<%
	String headerJSP = "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />

	<%
	User user = (User) request.getAttribute("userDetails");
	System.out.println(user);
	if (user != null) {
	%>
	<div class="profile_container">
		<div class="profile_left" id="profile_left">
			<%
			String image = user.getImage();
			%>
			<%
			if (image != null) {
			%>
			<img src="<%=user.getImage()%>" id="user_image" class="user_profile"
				alt="Profile Image" />
			<%
			} else {
			%>
			<img
				src="https://e1.pxfuel.com/desktop-wallpaper/903/679/desktop-wallpaper-97-aesthetic-best-profile-pic-for-instagram-for-boy-instagram-dp-boys.jpg"
				id="user_image" alt="Profile Image" />
			<%
			}
			%>

			<p class="head_profile">ADDRESS</p>
			<hr class="new">
			<div class="addressDiv">

				<%
				if ("seller".equals(user.getRole())) {
				%>
				<div class="seller">
					<h3>Products that you can sell</h3>
					<ul>
						<li>Sofa</li>
						<li>Chandelier</li>
						<li>Space Saving Furniture</li>
						<li>Wallpaper</li>
						<li>Wardrobe</li>
						<li>Crockery Units</li>
					</ul>
					<p class="quotes">" Sometimes it's the smallest decisions that
						can change your life forever."</p>
				</div>
				<%
				} else {
				%>
				<div id="address">
					<table class="table_product">
						<caption></caption>
						<th></th>
						<caption></caption>
						<tbody>
							<tr class="tr_row">
								<td><a href="../order/order_details.html"><img
										src="https://iili.io/JHo3oVj.png" class="plus_icon"
										alt="plus icon"></a></td>
								<td>
									<h3>Add New Address</h3>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<%
				}
				%>

			</div>
		</div>
		<div class="profile_right">
			<div class="user_details">
				<h3 class="user_name" id="user_name"><%=user.getName()%></h3>
		         <span class="tooltip"> <a
					href="<%=request.getContextPath()%>/user/edit"> <img
						src="https://iili.io/JHo3RHP.png" id="edit_icon" alt="edit icon"></a>
					<p class="tooltiptext">Edit</p>
				</span>
			</div>
			<p class="user-title"></p>
			<div class="button_navigate">
				<a href="../wishlist.html">
					<button class="btn_wish">
						<img src="https://iili.io/JHo3lWJ.png" class="icon"
							alt="heart image">Wishlist
					</button>
				</a> <a href="../cart.html">
					<button class="btn_cart">
						<img src="https://iili.io/JHo3MUN.png" class="icon"
							alt="cart image">Cart
					</button>
				</a> <a href="../order/order.html">
					<button class="btn_orders">
						<img src="https://iili.io/JHo3hOX.png" class="icon"
							alt="order image">Orders
					</button>
				</a>
			</div>
			<%
			if ("seller".equals(user.getRole())) {
			%>
			<hr class="new2">
			<p class="right_profile">BUSINESS INFORMATION</p>
			<div class="user_details">
				<p class="content">GST Number :</p>
				<p class="details" id="user_email"><%=user.getGst_number()%></p>
			</div>
			<div class="user_details">
				<p class="content">Aadhar Number :</p>
				<p class="details" id="user_address">
				<p id="user_city"><%=user.getAadhar_number()%></p>
				</p>
			</div>
			<div class="user_details">
				<p class="content">Shop Address :</p>
				<p class="details" id="user_state"><%=user.getShop_address()%></p>
			</div>
			<%
			} else {
			%>
			<hr class="new2">
			<p class="right_profile">CONTACT INFORMATION</p>
			<div class="user_details">
				<p class="content">E-mail :</p>
				<p class="details" id="user_email"><%=user.getEmail()%></p>
			</div>
			<div class="user_details">
				<p class="content">Address :</p>
				<p class="details" id="user_address">
				<p id="user_city"></p>
				</p>
			</div>
			<div class="user_details">
				<p class="content">State :</p>
				<p class="details" id="user_state"></p>
			</div>
			<div class="user_details">
				<p class="content">Country :</p>
				<p class="details" id="user_country"></p>
			</div>
			<%
			}
			%>
			<div class="user_details">
				<p class="content" id="user">Phone No:</p>
				<p class="details" id="user_no"><%=user.getPhoneNumber()%></p>
			</div>
			<hr class="new2">
			<p class="right_profile">PERSONAL INFORMATION</p>
			<div class="user_details">
				<p class="content" id="contact">Birthday:</p>
				<p class="details" id="user_dob">
					<%
					String userDob = user.getDateOfBirth();
					if (userDob != null) {
						out.print(userDob);
					} else {
						out.print("&nbsp;"); // Display an empty space
					}
					%>
				</p>
			</div>
			<div class="user_details">
				<p class="content">Gender :</p>
				<p class="details" id="user_gender">
					<%
					String userGender = user.getGender();
					if (userGender != null) {
						out.print(userGender);
					} else {
						out.print("&nbsp;"); // Display an empty space
					}
					%>
				</p>
			</div>
		</div>
	</div>
	<%
	} else {
	%>
	<p>User not found.</p>
	<%
	}
	%>
	<script src="<%=request.getContextPath()%>/assets/js/order/order.js"></script>
	<script
		src="<%=request.getContextPath()%>/assets/js/profile/chatBot.js"></script>
</body>
</html>
