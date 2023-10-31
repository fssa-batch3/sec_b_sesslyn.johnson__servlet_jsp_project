one();
async function one() {
	await fetchDataAndUpdatePage();
};

let addressArray = null;
async function fetchDataAndUpdatePage() {
	try {
		const response = await fetch("/minimalweb/order/address");

		if (!response.ok) {
			console.log(`HTTP Error! Status: ${response.status}`);
			return;
		}
		const data = await response.json();
		console.log(data);
		addressDetails = data.data.addressDetails;
		addressArray = addressDetails;
		console.log(addressArray);
		renderAddress(addressArray);

	} catch (error) {
		console.error(error);
	}
}

function renderAddress(addressArray) {
	const cart_list = JSON.parse(localStorage.getItem("cart_list")) || [];
	const user = JSON.parse(localStorage.getItem("profile_id"));

	const user_cart = cart_list.filter((e) => e.userId == user);
	console.log(user_cart);

	const emptyCart = document.getElementById('cart_empty');
	const cartFull = document.getElementById('small_container');

	function showMessageDiv() {
		emptyCart.style.display = 'block';
		cartFull.style.display = 'none';
	}

	if (user_cart.length === 0) {
		showMessageDiv();
	}

	let amount = 0;
	for (const product of user_cart) {
		const table = document.createElement("table");
		table.classList.add("table_product");

		const row = document.createElement("tr");
		table.classList.add("tr_row");
		table.append(row);

		const col1 = document.createElement("td");
		row.append(col1);

		const cartInfo = document.createElement("div");
		cartInfo.classList.add("cart_info");
		col1.append(cartInfo);

		const img = document.createElement("img");
		img.src = product.image_url;
		img.classList.add("product_1");
		img.setAttribute("data-add", product.product_uuid);
		img.alt = "Compat camal brown sofa";
		cartInfo.append(img);

		const h3 = document.createElement("h3");
		h3.textContent = product.product_name;
		cartInfo.append(h3);

		//Delivery Date
		const d = new Date();
		d.setDate(d.getDate() + 7);

		const monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		const monthIndex = d.getMonth();

		const monthName = monthNames[monthIndex];
		const day = d.getDate();
		const year = d.getFullYear();

		const formattedDate = `By ${monthName} ${day}, ${year}`;
		const col2 = document.createElement("td");
		col2.setAttribute("id", "user_dates");
		col2.innerText = formattedDate;
		row.append(col2);

		const col3 = document.createElement("td");
		row.appendChild(col3);

		const find_quantity = user_cart.find((e) => e.product_uuid === product.product_uuid);
		console.log(find_quantity);

		const input = document.createElement("input");
		input.classList.add("quantity");
		input.type = "number";
		input.setAttribute("data-id", product.product_uuid);
		input.value = product.product_quantity;
		input.min = "1";
		input.max = product.maximum_quantity; // "22"
		col3.appendChild(input);

		input.addEventListener("input", function() {
			const enteredValue = parseInt(this.value, 10);
			const maximumQuantity = parseInt(this.max, 10);

			if (enteredValue > maximumQuantity) {
				this.value = maximumQuantity;
			}
		});
		const col4 = document.createElement("td");
		col4.innerText = `Rs.${product.product_price * find_quantity.product_quantity}`;
		row.appendChild(col4);
		const col5 = document.createElement("td");
		row.appendChild(col5);

		const deleteIcon = document.createElement("img");
		deleteIcon.src = "https://iili.io/JJRqSN2.png";
		deleteIcon.setAttribute("data-remove", product.product_uuid);
		deleteIcon.setAttribute("id", "icon_remove");
		deleteIcon.classList.add("delete_icon");
		deleteIcon.alt = "delete_icon";
		col5.appendChild(deleteIcon);

		document.querySelector("div.contain_cart").append(table);

		amount += product.product_price * find_quantity.product_quantity;
		console.log(amount);


	}

	document.getElementById("total_amount").innerText = `Rs.${amount}`;

	const path = window.location.origin + '/minimalweb';
	console.log(path);
	//URL params for product details
	const bookCovers = document.querySelectorAll(".product_1");
	bookCovers.forEach((bookCover) => {
		bookCover.addEventListener("click", (event) => {
			const person_data = bookCover.dataset.add;

			window.location.href = `./description.html?product_id=${person_data}`;
		});
	});

	//Product Quantity
	const product_quantity = document.querySelectorAll(".quantity");
	product_quantity.forEach(function(add) {
		add.addEventListener("change", function(calcus) {
			const productId = this.dataset.id;
			localStorage.setItem("products_id", JSON.stringify(productId));
			console.log(productId);
			const productid = JSON.parse(localStorage.getItem("products_id"));
			const pdts = user_cart.find((e) => e.product_uuid === productid);
			let ogPrice = pdts.product_price;
			console.log(ogPrice);
			const parent = this.closest(".table_product");
			console.log(parent);
			const qauntity = parseInt(parent.querySelector(".quantity").value);
			console.log(qauntity);
			const cartPrice = ogPrice * qauntity;
			ogPrice = cartPrice;
			console.log(ogPrice);
			pdts.product_quantity = qauntity;
			localStorage.setItem("cart_list", JSON.stringify(user_cart));
			location.reload();
		});
	});


	const buyNowButton = document.getElementById('btn_order');
	buyNowButton.addEventListener('click', function() {
		if (user_cart.length === 0) {
			alert('Your cart is empty. Add products to your cart first.');
		} else if (addressArray.length >= 1) {
			window.location.href = path + '/pages/order/order_address.html';
		} else {
			window.location.href = path + '/user/address/create';
		}
	});

	// Delete Icon for Cart page
	const products = document.querySelectorAll("img#icon_remove");
	products.forEach(function(check) {
		check.addEventListener("click", function() {
			const product_id = this.dataset.remove;
			if (confirm("Are you sure you want to remove this product?")) {
				user_cart = user_cart.filter(e => e.product_uuid !== product_id);
				localStorage.setItem("cart_list", JSON.stringify(user_cart));
				window.location.reload();
			}
		});
	});
}
