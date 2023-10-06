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
			if (image != null && !image.trim().isEmpty()) {
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
				<div id="address" style="width: 100%;">
					<table class="table_product">
						<caption></caption>
						<th></th>
						<caption></caption>
						<tbody>
							<tr class="tr_row">
								<td><a
									href="<%=request.getContextPath()%>/pages/order/order_details.html"><img
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
				<a href="<%=request.getContextPath()%>/pages/product/wishlist.html">
					<button class="btn_wish">
						<img src="https://iili.io/JHo3lWJ.png" class="icon"
							alt="heart image">Wishlist
					</button>
				</a> <a href="<%=request.getContextPath()%>/pages/product/cart.html">
					<button class="btn_cart">
						<img src="https://iili.io/JHo3MUN.png" class="icon"
							alt="cart image">Cart
					</button>
				</a> <a href="<%=request.getContextPath()%>/pages/order/order.html">
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
	<script>
	 const profile_id = JSON.parse(localStorage.getItem("profile_id"));
	let addressList = JSON.parse(localStorage.getItem("addressList"));
    let addressArray = addressList.filter((e) => e.user_email == profile_id);
    console.log(addressArray);

    for (const address of addressArray) {
        const newDiv = document.createElement('div');
        newDiv.classList.add('addressInfo');

        const span = document.createElement('span');
        span.classList.add('tooltip');
        newDiv.appendChild(span);

        const img = document.createElement('img');
        img.src = 'https://iili.io/JHo3RHP.png';
        img.alt = 'edit icon';
        img.setAttribute('class', 'edit_icon');
        img.setAttribute('data-id', address['address_id']);
        span.appendChild(img);

        const table = document.createElement('table');
        table.classList.add('table_product');
        newDiv.appendChild(table);

        const tbody = document.createElement('tbody');
        table.appendChild(tbody);

        const tr = document.createElement('tr');
        tr.classList.add('tr_address');
        tbody.appendChild(tr);

        const td1 = document.createElement('td');
        td1.classList.add('idh4');
        tr.appendChild(td1);

        const h4 = document.createElement('h4');
        if (address['user_notes']) {
            h4.innerText = address['user_notes'];
            if (address['default_status']) {
                h4.innerText += ' (default)';
            }
        } else {
            h4.innerText = 'Address';
            if (address['default_status']) {
                h4.innerText += ' (default)';
            }
        }
        td1.appendChild(h4);

        const td2 = document.createElement('td');
        tr.appendChild(td2);

        const p1 = document.createElement('p');
        p1.setAttribute('class', 'address_td');
        p1.innerText = address['user_address'] + ' ' + address['user_city'] + ' ,  ' + address['user_state'] + ' ,  ' + address['user_country'] + ' - ' + address['user_code'];
        td2.appendChild(p1);

        const td3 = document.createElement('td');
        tr.appendChild(td3);

        const p2 = document.createElement('p');
        p2.setAttribute('id', 'address_td');
        p2.innerText = 'No' + ' : ' + address['user_no'];
        td3.appendChild(p2);

        const td4 = document.createElement('td');
        tr.appendChild(td4);

        const button1 = document.createElement('button');
        button1.setAttribute('class', 'btnDefault');
        button1.setAttribute('data-id', address['address_id']);
        button1.innerText = 'DELETE';
        if (address['default_status'] === true) {
            button1.style.display = 'none';
        }
        td4.appendChild(button1);

        if (address['default_status'] === false) {
            const button = document.createElement('button');
            button.setAttribute('class', 'setDefault');
            button.setAttribute('data-id', address['address_id']);
            button.innerText = 'SET AS DEFAULT';
            td4.appendChild(button);
        }

        document.querySelector('div.addressDiv').append(newDiv);
    }
    const path = window.location.origin + '/minimalweb';
    console.log(path);

    const bookCovers = document.querySelectorAll(".edit_icon");

    bookCovers.forEach((bookCover) => {
        bookCover.addEventListener("click", (event) => {
            const person_data = bookCover.dataset.id;
            window.location.href = path + '/pages/order/edit_address.html?edit_address=' + person_data;
        });
    });

    const default_add = document.querySelectorAll("button.setDefault");
    default_add.forEach(function (getID) {
        getID.addEventListener("click", function () {
            const { id } = this.dataset;
            localStorage.setItem("address_id", JSON.stringify(id));
            const add_uuid = JSON.parse(localStorage.getItem("address_id"));
            if (window.confirm("Are you sure you want to change this as your default address?")) {
                let def_add = addressArray.find(e => e.default_status === true);
                console.log(def_add);
                def_add.default_status = false;
                function find_data(e) {
                    return e.address_id === add_uuid;
                }
                const set_default = addressList.find(find_data);
                console.log(set_default);
                set_default.default_status = true;
                localStorage.setItem("addressList", JSON.stringify(addressList));
                window.location.reload();
            }
        })
    });

    const del_add = document.querySelectorAll("button.btnDefault");
    del_add.forEach(function (getID) {
        getID.addEventListener("click", function () {
            const { id } = this.dataset;
            localStorage.setItem("address_id", JSON.stringify(id));
            const add_uuid = JSON.parse(localStorage.getItem("address_id"));
            function find_data(e) {
                return e.address_id === add_uuid;
            }
            const address_del = addressList.find(find_data);
            if (address_del.default_status === true) {
                window.alert("This is your default address. Please change your default address to another address before deleting it.")
            }
            else {
                if (window.confirm("Are you sure?")) {
                    const indexOfAddress = addressList.indexOf(address_del);
                    addressList.splice(indexOfAddress, 1);
                    localStorage.setItem("addressList", JSON.stringify(addressList));
                    window.location.reload();
                }
            }
        })
    });
    let defaultUserAddress = addressArray.find((e) => e.default_status === true);
    console.log(defaultUserAddress);
    document.getElementById("user_address").innerHTML = defaultUserAddress.user_address;
    document.getElementById("user_state").innerHTML = defaultUserAddress.user_state;
    document.getElementById("user_country").innerHTML = defaultUserAddress.user_country;

</script>
<script src="<%=request.getContextPath()%>/assets/js/profile/chatBot.js"></script>
</body>
</html>
