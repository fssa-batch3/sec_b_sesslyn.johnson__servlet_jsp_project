<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
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
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/header.css">
</head>
<style>
#sellerNavHeader {
	margin-right: 15rem;
}
</style>
<body>
	<%
	User user = (User) request.getAttribute("userDetails");
	if (user != null) {
		String role = user.getRole();
	%>
	<div class="head">
		<div class="main_header">
			<span class="header" id="header_shop"> <a
				href="<%=request.getContextPath()%>/homepage"> <img
					class="main_logo" id="main_logo" src="https://iili.io/Hy0p6kx.jpg"
					alt="logo of minimalistic" />
			</a>
			</span>

			<%if ("seller".equals(role)) {%>
			<div class="nav_header" id="sellerNavHeader">
				<%} else {%>
				<div class="nav_header">
					<%
					}
					if ("designer".equals(role)) {
					%>
					<span class="header"> <a
						href="<%=request.getContextPath()%>/designer/design">
							<p class="header_para">DESIGN</p>
					</a>
					</span>
					<%
					} else if ("seller".equals(role)) {
					%>
					<span class="header"> <a
						href="<%=request.getContextPath()%>/pages/seller/product_list.html">
							<p class="header_para">PRODUCTS</p>
					</a>
					</span>
					<%
					} else {
					%>
					<span class="header"> <a
						href="<%=request.getContextPath()%>/pages/product/shop.html">
							<p class="header_para">SHOP</p>
					</a>
					</span>
					<%
					}
					%>


					<span class="header"> <a
						href="<%=request.getContextPath()%>/about">
							<p class="header_para">ABOUT</p>
					</a> <%if ("designer".equals(role)) {%> <span class="header"> <a
							href="<%=request.getContextPath()%>/designer/details?id=<%=user.getId()%>">
								<p class="header_para">PORTFOLIO</p>
						</a>
					</span> <%
 } else if ("seller".equals(role)) {
 %>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/pages/seller/seller_order.html">
							<p class="header_para">ORDERS</p>
					</a>
					</span>
					<%
					} else {
					%>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/pages/order/order.html">
							<p class="header_para">ORDERS</p>
					</a>
					</span>

					<%
					}
					%>

					<%
					if ("designer".equals(role)) {
					%>
					<span class="header"> <a
						href="<%=request.getContextPath()%>/designer/appointment_list">
							<p class="header_para">SCHEDULE</p>
					</a>
					</span>
					<%
					} else if ("seller".equals(role)) {
					%>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/seller/product/create">
							<p class="header_para">ADD PRODUCT</p>
					</a>
					</span>
					<%} else {%>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/user/appointment_list">
							<p class="header_para">SCHEDULE</p>
					</a>
					</span>
					<%}%>


					<%if (!"seller".equals(role)) {%>
					<span class="header"> <a
						href="<%=request.getContextPath()%>/designer">
							<p class="header_para">DESIGNERS</p>
					</a>
					</span>
					<%}%>
				</div>
				<a href="<%=request.getContextPath()%>/user/logout"
					onclick="return confirm('Are you sure to logout from the website ?');">
					<button class="btn_delete" id="logOut">
						<span>Log</span><span>Out</span>
					</button>
				</a>


				<%
				if ("designer".equals(role)) {
				%>
				<a href="<%=request.getContextPath()%>/designer/design/create">
					<img src="https://iili.io/JHSyM9S.png" class="profile_img"
					alt="plus icon" />

				</a>
				<%
				} else if ("seller".equals(role)) {
				%>

				<%
				} else {
				%>
				<a href="<%=request.getContextPath()%>/pages/product/cart.html">
					<img src="https://iili.io/HyVDSHu.png" class="cart_img"
					alt="profile picture" />
				</a>

				<%
				}
				%>

				<a href="<%=request.getContextPath()%>/user/details"> <img
					src="https://iili.io/HyVDPVV.png" class="profile_img"
					alt="profile picture" />

				</a>

			</div>
		</div>
		<%
		} else {
		%>
		<div class="head">
			<div class="main_header">
				<span class="header" id="header_shop"> <a
					href="<%=request.getContextPath()%>/index"> <img
						class="main_logo" id="main_logo" src="https://iili.io/Hy0p6kx.jpg"
						alt="logo of minimalistic" />
				</a>
				</span>
				<div class="nav_header">
					<span class="header"> <a
						href="<%=request.getContextPath()%>/pages/product/shop.html">
							<p class="header_para">SHOP</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/about">
							<p class="header_para">ABOUT</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/pages/order/order.html">
							<p class="header_para">ORDERS</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/user/appointment_list">
							<p class="header_para">SCHEDULE</p>
					</a>
					</span> <span class="header"> <a
						href="<%=request.getContextPath()%>/designer">
							<p class="header_para">DESIGNERS</p>
					</a>
					</span>
				</div>
				<div class="btn">
					<a href="<%=request.getContextPath()%>/user/new"><button
							id="sign_in" class="sign_in">Sign In</button></a> <a
						href="<%=request.getContextPath()%>/user/login"><button
							id="userLogin" class="log_in">Log In</button> </a>

				</div>
			</div>
		</div>
		<%
		}
		%>
		<script>
			document.getElementById("logOut").addEventListener("click",
					function() {
						localStorage.removeItem("profile_id");
					});
		</script>
</body>
</html>