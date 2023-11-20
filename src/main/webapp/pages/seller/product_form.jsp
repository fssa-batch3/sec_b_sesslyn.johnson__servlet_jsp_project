<!DOCTYPE html>
<%@page import="in.fssa.minimal.model.Product"%>
<%@page import="in.fssa.minimal.model.User"%>
<%@page import="in.fssa.minimal.model.Category"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Product Form</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Lora:ital@1&family=Noto+Serif+SC:wght@200;300;400&family=Open+Sans:wght@300;400;500&family=Shalimar&family=Source+Sans+Pro:ital,wght@0,200;0,300;0,400;0,600;0,700;0,900;1,200;1,300;1,400;1,600;1,700;1,900&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/seller/product_form.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/profile/header.css">
<link
	href="https://fonts.googleapis.com/css2?family=Lato:wght@300&family=Nunito:wght@300&family=Source+Sans+Pro:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
	User user = (User) request.getAttribute("userDetails");
	Product product = (Product) request.getAttribute("productDetails");
	int categoryId = (request.getAttribute("categoryId") != null) ? (int) request.getAttribute("categoryId") : -1;
	%>

	<div class="wrapper">
		<div class="inner">
			<div class="image-holder">
				<img src="https://iili.io/HgVcbdQ.png" alt="idea with the bulb">
			</div>
			<form action="<%=request.getContextPath()%>/seller/product/create"
				method="post">
				<h3>Start Selling</h3>
				<div class="form-group">
					<input type="text" placeholder="Product Name" name="product_name"
						pattern="^[a-zA-Z]+(\s{1}[a-zA-Z]+)*$"
						value="<%=(product != null) ? product.getName() : ""%>"
						title="Only Alphabets and space is allowed" id="product_name"
						required class="form-control">
				</div>
				<div class="form-group">
					<input type="text" placeholder="Product Description"
						name="description" id="product_description" 
						value="<%=(product != null) ? product.getDescription() : ""%>"
						required class="form-control">
				</div>
				<div class="form-group">
					<input type="text" placeholder="Image" id="image_url"
						value="<%=(product != null) ? product.getImageUrl() : ""%>"
						title="https://.*" pattern="https://.*" required name="image_url"
						class="form-control">
				</div>
				<div class="form-group">
					<input type="number" placeholder="Actual Price" id="product_real"
						value="<%=(product != null) ? product.getPrice() : ""%>" required
						title="Only numbers is allowed" min="300" max="100000"
						name="price" class="form-control"> <input type="number"
						placeholder="Discount" id="product_discount" required
						name="discount"
						value="<%=(product != null) ? product.getDiscount() : ""%>"
						title="Only 2 numbers is allowed" min="5" max="90"
						pattern="[1-9]{1}[0-9]{1}" class="form-control">
				</div>
				<div class="form-group">
					<input type="text" placeholder="Product Quantity" name="quantity"
						value="<%=(product != null) ? product.getQuantity() : ""%>"
						id="product_quantity" required title="Only 2 numbers is allowed"
						min="1" max="99" pattern="[1-9][0-9]{0,2}" class="form-control">
						
					<select class="form-control" id="product_category" name="category"
						required>
						<option value="" disabled selected>Product Category</option>
						<%
						List<Category> categoryList = (List<Category>) request.getAttribute("categoryDetails");
						System.out.println(categoryList);
						if (categoryList != null) {
							for (Category category : categoryList) {
						%>
						<option value="<%=category.getId()%>" class="status"
							<%if (category.getId() == categoryId) {%>
							selected <%}%>>
							<%=category.getName()%>
						</option>
						<%
						}
						}
						%>
					</select>

				</div>
				<div class="form-group">
					<input type="text" required placeholder="Warranty" name="warranty"
						value="<%=(product != null) ? product.getWarranty() : ""%>"
						title="Only Alphabets, numbers and space is allowed"
						id="product_warranty" pattern="^(\S+\s{0,1})+$"
						class="form-control">
				</div>
				<span>Note : Only numbers should be used to write prices (in
					Rs) and Discount should be in % </span>
				<div class="btn">
					<button type="submit" class="submit">Submit</button>
				</div>
			</form>
		</div>
	</div>

	<script>
		function closeAlert() {
			// Hide the popup
			var alertDiv = document.getElementById("popup1");
			alertDiv.style.display = "none";
		}
	</script>
	<script src="../../assets/js/profile/chatBot.js"></script>

</body>
</html>