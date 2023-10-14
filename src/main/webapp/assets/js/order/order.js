const order_list = JSON.parse(localStorage.getItem("order_list")) || [];
const profile_id = JSON.parse(localStorage.getItem("profile_id"));
const order_user = order_list.filter((e) => e.order_email == profile_id);

const updated_order = JSON.parse(localStorage.getItem("updated_order")) || [];

const emptyCart = document.getElementById('cart_empty');
const cartFull = document.getElementById('small_container');

function showMessageDiv() {
	emptyCart.style.display = 'block';
	cartFull.style.display = 'none';
}

if (order_user.length === 0) {
	showMessageDiv();
}

for (const order of order_user) {

	const table = document.createElement("table");
	table.setAttribute("id", "table_product");
	console.log(table);

	const caption = document.createElement("caption");
	table.append(caption);

	const row = document.createElement("tr");
	table.append(row);

	const header = document.createElement("th");
	row.append(header);

	const productData = document.createElement("td");
	row.append(productData);

	const cartInfo = document.createElement("div");
	cartInfo.setAttribute("class", "cart_info");
	productData.append(cartInfo);

	const productImg = document.createElement("img");
	productImg.setAttribute("src", order.ordered_items.image_url);
	productImg.setAttribute("data-id", order.order_uuid);
	productImg.setAttribute("class", "product_1");
	productImg.setAttribute("alt", "Compat camal brown sofa");
	cartInfo.appendChild(productImg);

	const productName = document.createElement("h3");
	productName.textContent = order.ordered_items.product_name;
	cartInfo.appendChild(productName);

	const orderDate = document.createElement("td");
	const inputDate = order.ordered_time.substr(0, 10);
	const date = new Date(inputDate);

	const months = [
		"January",
		"February",
		"March",
		"April",
		"May",
		"June",
		"July",
		"August",
		"September",
		"October",
		"November",
		"December",
	];

	const month = months[date.getMonth()];
	const day = date.getDate();
	const year = date.getFullYear();

	orderDate.textContent = `Order on ${day} ${month}, ${year}`;
	row.appendChild(orderDate);

	const quantity = document.createElement("td");
	row.appendChild(quantity);

	const quantityInput = document.createElement("input");
	quantityInput.setAttribute("type", "number");
	quantityInput.setAttribute("value", order.ordered_items.product_quantity);
	quantityInput.setAttribute("disabled", "");
	quantity.appendChild(quantityInput);

	const price = document.createElement("td");
	price.textContent = "₹" + order.ordered_items.product_price;
	row.appendChild(price);


	const deliveryStatus = document.createElement("td");
	row.appendChild(deliveryStatus);

	let updated_user_order = [];
	if (updated_order.length !== 0) {
		updated_user_order = updated_order.find(e => e.order_uuid === order.order_uuid);
	}
	console.log(updated_user_order);
	
	const deliveryButton = document.createElement("button");
	
	if (updated_user_order && updated_user_order.updated_status === "Delivered") {
		deliveryButton.setAttribute("class", "btnButton btn_primary");
		deliveryButton.textContent = updated_user_order.updated_status;
		order.order_status = "Delivered";
		localStorage.setItem("order_list", JSON.stringify(order_list));
	} else if (updated_user_order && updated_user_order.updated_status === "Rejected") {
		deliveryButton.setAttribute("class", "btnButton btn_secondary");
		deliveryButton.textContent = updated_user_order.updated_status;
		order.order_status = "Rejected";
		localStorage.setItem("order_list", JSON.stringify(order_list));
	} else {
		deliveryButton.setAttribute("class", "btnButton btn_tertiary");
		deliveryButton.textContent = "On the way";
		order.order_status = "On the way";
		localStorage.setItem("order_list", JSON.stringify(order_list));
	}

	deliveryStatus.appendChild(deliveryButton);

	document.querySelector("div.bottom_contain").append(table);
}

//URL Params
const bookCovers = document.querySelectorAll(".product_1");
bookCovers.forEach((bookCover) => {
	bookCover.addEventListener("click", (event) => {
		const person_data = bookCover.dataset.id;
		window.location.href = `./order_history.html?order_id=${person_data}`;
	});
});

