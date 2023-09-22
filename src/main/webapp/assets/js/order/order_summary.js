
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


//Amount
document.getElementById("sub_total").innerText = `₹${amount + 2900}`;
document.getElementById("shipping_free").innerText = `₹ ${100}`;
document.getElementById("discount_amount").innerText = `₹ ${1400}`;
document.getElementById("total_amount").innerText = `₹ ${amount}`;

//Details from order details page
const selectedArray = JSON.parse(localStorage.getItem("selectedArray"));
const deliveryMethod = localStorage.getItem("user_delivery");

document.getElementById("user_name").innerHTML = selectedArray.user_name;
document.getElementById("user_email").innerHTML = selectedArray.user_email;
document.getElementById("user_address").innerHTML = selectedArray.user_address + " " + selectedArray.user_city + ", " + selectedArray.user_state + ", " + selectedArray.user_country + " -  " + selectedArray.user_code;
document.getElementById("user_no").innerHTML = `91 - ${selectedArray.user_no}`;
document.getElementById("delivery_mode").innerHTML = deliveryMethod;

//Order Details
document.querySelector("#place_order").addEventListener("click", function () {
  const user_delivery = localStorage.getItem('user_delivery');
  const selectedArray = JSON.parse(localStorage.getItem('selectedArray'));
  let cart_list = JSON.parse(localStorage.getItem("cart_list"));
  const profile_id = JSON.parse(localStorage.getItem("profile_id"));
  const order_cart = cart_list.filter(c => c.userId == profile_id);
  const order_list = JSON.parse(localStorage.getItem("order_list")) || [];

  const total_price = document.querySelector("#total_amount").innerText.replace("₹ ", "");
  console.log(total_price);

  if (order_cart.length === 0) {
    alert("You have not added any products to the cart");
    return;
  }

  if (!confirm("Confirm your order")) {
    return;
  }
  for (const cart_item of order_cart) {
    const order_uuid = uuidv4();
    order_list.push({
      "order_email": profile_id,
      "order_uuid": order_uuid,
      "ordered_time": new Date(),
      "selectedArray": selectedArray,
      "user_delivery": user_delivery,
      "ordered_items": cart_item,
      "total_price": parseInt(cart_item.product_price),
      "order_status": "On the Way"
    });
  }
  localStorage.setItem("order_list", JSON.stringify(order_list));

  cart_list = cart_list.filter(c => c.userId !== profile_id);
  console.log(cart_list);
  localStorage.setItem("cart_list", JSON.stringify(cart_list));

  for (i = 0; i < order_cart.length; i++) {
    let product_crud = JSON.parse(localStorage.getItem('product_crud'));
    let order_user = product_crud.filter(e => e.product_uuid === order_cart[i].product_uuid);
  
    if (order_user) {
      order_user[0].product_quantity = parseInt(order_user[0].product_quantity) - parseInt(order_cart[i].product_quantity);
 
    }
    console.log(order_user);
    localStorage.setItem("product_crud", JSON.stringify(product_crud));
  }

  localStorage.removeItem('user_delivery');
  localStorage.removeItem('selectedArray');
  window.location.href = "./order_success.html";

});

