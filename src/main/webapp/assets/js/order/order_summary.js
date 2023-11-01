one();

async function one() {
	const selectedAddress = localStorage.getItem("selectedAddress");
	if (selectedAddress) {
		await fetchDataAndUpdatePage(selectedAddress);
	}
}

let addressDetails = null;
let addressArray = null;

async function fetchDataAndUpdatePage(selectedAddress) {
	try {
		const response = await fetch(`/minimalweb/order/address/details?addressId=${selectedAddress}`);
		if (!response.ok) {
			console.log(`HTTP Error! Status: ${response.status}`);
			return;
		}

		const data = await response.json();
		addressDetails = data.data.addressDetails;

		if (addressDetails.length === 0) {
		} else if (addressDetails) {
			addressArray = addressDetails;
			console.log(addressArray);
			renderProducts(addressArray);
		}
	} catch (error) {
		console.error(error);
	}
}

function renderProducts(addressArray) {
	const deliveryMethod = localStorage.getItem("user_delivery");

	document.getElementById("user_name").innerHTML = addressArray.name;
	document.getElementById("user_email").innerHTML = addressArray.email;
	document.getElementById("user_address").innerHTML = addressArray.address + " " + addressArray.city + ", " + addressArray.state + ", " + addressArray.country + " -  " + addressArray.pincode;
	document.getElementById("user_no").innerHTML = `91 - ${addressArray.phoneNumber}`;
	document.getElementById("delivery_mode").innerHTML = deliveryMethod;
}


const cart_list = JSON.parse(localStorage.getItem("cart_list"));
const user = JSON.parse(localStorage.getItem("profile_id"));

let amount = 0;

const user_cart = cart_list.filter((e) => e.userId == user);
console.log(user_cart);

for (const item of user_cart) {
	const div_details = document.createElement("div");
	div_details.setAttribute("class", "summary_details");
	console.log(div_details);

	const img_details = document.createElement("img");
	img_details.setAttribute("alt", "product");
	img_details.setAttribute("id", "similar_product");
	img_details.setAttribute("data-id", item.product_uuid);
	img_details.setAttribute("src", item.image_url);
	div_details.append(img_details);

	const header1 = document.createElement("h4");
	header1.setAttribute("class", "header_similar");
	header1.textContent = item.product_name;
	div_details.append(header1);

	const price1 = document.createElement("p");
	price1.className = "price";
	price1.textContent = `₹ ${item.product_price * item.product_quantity}`;
	div_details.append(price1);

	document.querySelector("div.contain_left").append(div_details);

	amount += item.product_price * item.product_quantity;
}

document.querySelector("#place_order").addEventListener("click", function() {
	const user_delivery = localStorage.getItem('user_delivery');
	const selectedArray = JSON.parse(localStorage.getItem('selectedArray'));

	if (user_cart.length === 0) {
		alert("You have not added any products to the cart");
		return;
	}

	if (!confirm("Confirm your orders")) {
		return;
	}
	
	
		 
	
	 const orderPromises = user_cart.map( async (cart_item) => {
			 console.log(user_cart);
			 console.log(user_cart.size);
			 
		 const orderData = {
			product_id: cart_item.product_uuid,
			product_price: '' + cart_item.product_price,
			product_quantity: '' + cart_item.product_quantity,
			seller_id: cart_item.seller_id,
			payment: user_delivery,
			status: "Waiting_list",
			address_id: localStorage.getItem("selectedAddress")
		};
		console.log(orderData);
		
		return await fetch(`/minimalweb/user/order/create?${new URLSearchParams(orderData).toString()}`, {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			
		});
	});

	Promise.all(orderPromises).then(() => {
			const updatedCart = cart_list.filter((item) => !user_cart.includes(item));
			localStorage.setItem('cart_list', JSON.stringify(updatedCart));
			localStorage.removeItem('user_delivery');
			localStorage.removeItem('selectedArray');
			console.log("Orders placed successfully");
			window.location.href = "./order_success.html";
		})
		.catch((error) => {
			console.error('Failed to place orders:', error);
		});
});

document.getElementById("sub_total").innerText = `₹${amount + 2900}`;
document.getElementById("shipping_free").innerText = `₹ ${100}`;
document.getElementById("discount_amount").innerText = `₹ ${1400}`;
document.getElementById("total_amount").innerText = `₹ ${amount}`;
