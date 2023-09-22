//Order Details
document.querySelector("#place_order").addEventListener("click", function() {
  const order_user = JSON.parse(localStorage.getItem("order_user"));
  const profile_id = JSON.parse(localStorage.getItem("profile_id"));
  const current_user = order_user.find(user => user.user_email === profile_id);
  const order_list = JSON.parse(localStorage.getItem("order_list")) || [];
  const cart_list = JSON.parse(localStorage.getItem("cart_list"));
  const order_cart = cart_list.filter(c => c.userId == profile_id);
  const cart_products = [];
  
  for (let cart_item of order_cart) {
    const product = cart_list.find(p => p.productId === cart_item.productId);
    cart_products.push(product);
  }
  
  const user_details = order_user.find(user => user.user_email === profile_id);
  console.log(cart_products);
  console.log(user_details);
  
  const total_price = document.querySelector("#total_amount").innerText.replace("₹ ", "");
  console.log(total_price);

  if (cart_products == "") {
    alert("You have not added any products to the cart");
    return;
  }

  if (order_cart.length == 0) {
    return;
  }

  if (!confirm("Confirm your order")) {
    return;
  }

  //Order_User push
  for (const cart_item of order_cart) {
    const order_uuid = uuidv4();
    order_list.push({
      "order_uuid": order_uuid,
      "ordered_time": new Date(),
      "ordered_by": current_user.user_email,
      "ordered_items": [cart_item], 
      "total_price": parseInt(cart_item.product_price),
      "order_status": "On the Way"
    });
  }
  
  const cart_id = cart_list.filter(e => e.ordered_by !== profile_id );
  localStorage.setItem("order_list", JSON.stringify(order_list));
  localStorage.setItem("cart_list", JSON.stringify(cart_id));

  for (let k = cart_list.length - 1; k >= 0; k--) {
    if (profile_id === cart_list[k].userId) {
      cart_list.splice(k, 1);
    }
  }

  localStorage.setItem("cart_list", JSON.stringify(cart_list));  
  window.location.href="./order_success.html";
});
