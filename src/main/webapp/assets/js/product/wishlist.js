//DOM of wishlist
let wish_list = JSON.parse(localStorage.getItem("wish_list"))||[];
 
const profile_id = JSON.parse(localStorage.getItem("profile_id"));
const user_crud = JSON.parse(localStorage.getItem("user_crud"));

//Specific Usere data
const prod_data = user_crud.find((user) => user.user_email === profile_id);
console.log(prod_data);

//User Image
if (prod_data.user_image !== "") {
  document.getElementById("user_image").src = prod_data.user_image;
}

const product_crud = JSON.parse(localStorage.getItem("product_crud"));

const emptyCart = document.getElementById('cart_empty');
const cartFull = document.getElementById('wish_product');
const user_wish = wish_list.filter((e) => e.user_id == profile_id);
console.log(user_wish);
function showMessageDiv() {
  emptyCart.style.display = 'block';
  cartFull.style.display = 'none';
}

if (user_wish.length === 0) {
  showMessageDiv();
}

for (const wish of wish_list) {
  if (wish.user_id === profile_id) {
    const prod_data = product_crud.find(
      (product) => product.product_uuid === wish.product_id
    );
    const div_details = document.createElement("div");
    div_details.setAttribute("class", "wish_details");
    console.log(div_details);

    const div_product = document.createElement("div");
    div_product.setAttribute("class", "product");
    div_details.append(div_product);

    const img_details = document.createElement("img");
    img_details.setAttribute("alt", "Product");
    img_details.setAttribute("class", "product_1");
    img_details.setAttribute("data-id", prod_data.product_uuid);
    img_details.setAttribute("src", prod_data.image_url);
    div_product.append(img_details);

    const div_delete = document.createElement("div");
    div_delete.setAttribute("class", "product_delete");
    div_product.append(div_delete);

    const p_paragraph = document.createElement("p");
    p_paragraph.setAttribute("class", "product_name");
    p_paragraph.innerHTML = prod_data.product_name;
    div_delete.append(p_paragraph);

    const img_delete = document.createElement("img");
    img_delete.setAttribute("alt", "Delete icon");
    img_delete.setAttribute("class", "delete_icon");
    img_delete.setAttribute("data-remove", prod_data.product_uuid);
    img_delete.setAttribute("src", "../assets/images/home_page/delete_icon.png");
    div_delete.append(img_delete);

    const hr = document.createElement("hr");
    hr.setAttribute("class", "new2");
    div_product.append(hr);

    const p_price = document.createElement("p");
    p_price.setAttribute("class", "price");
    p_price.innerHTML = `₹ ${prod_data.product_sell}`;
    div_product.append(p_price);

    const button_primary = document.createElement("button");
    button_primary.setAttribute("class", "btn_primary");
    button_primary.setAttribute("src", "");
    button_primary.setAttribute("data-add", prod_data.product_uuid);
    button_primary.innerHTML = "Add to Cart";
    div_product.append(button_primary);

    document.querySelector("div.contain").append(div_details);
  }
}

//URL params
const bookCovers = document.querySelectorAll(".product_1");
bookCovers.forEach((bookCover) => {
  bookCover.addEventListener("click", (event) => {
    const person_data = bookCover.dataset.id;
    window.location.href = `./description.html?product_id=${person_data}`;
  });
});

//Add to Cart
const add = document.querySelectorAll("button.btn_primary");
add.forEach(function (findId) {
  findId.addEventListener("click", function () {
    const id_cart = this.dataset.add;
    const product_crud = JSON.parse(localStorage.getItem("product_crud"));
    const wish_crud = product_crud.find(function (e) {
      return e.product_uuid == id_cart;
    });
    console.log(wish_crud);
    const cart_list = JSON.parse(localStorage.getItem("cart_list")) || [];
    const profile_id = JSON.parse(localStorage.getItem("profile_id"));
    const exist =
      cart_list.length &&
      JSON.parse(localStorage.getItem("cart_list")).some(
        (data) => data.product_uuid == id_cart && data.profile_id === profile_id);
    if (
      cart_list.find(
        (p) => p.product_uuid === id_cart && p.userId === profile_id)) {
      alert("Sorry, the product is already added to the cart");
      return;
    }
    if (!profile_id) {
      alert("Log In");
      window.location.href = "./profile/login.html";
      return;
    }
    if (!exist) {
      cart_list.push({
        product_uuid: id_cart,
        product_name: wish_crud.product_name,
        image_url: wish_crud.image_url,
        product_price: wish_crud.product_sell,
        userId: profile_id,
        product_quantity: 1,
      });
      localStorage.setItem("cart_list", JSON.stringify(cart_list));
      alert("Product Added to the Cart");
      location.href = "./cart.html";
    }
  });
});

//Delete the product from wishlist
const products = document.querySelectorAll("img.delete_icon");
products.forEach(function (check) {
  check.addEventListener("click", function () {
    const product_id = this.dataset.remove;
    localStorage.setItem("products_id", JSON.stringify(product_id));
    console.log(product_id);
    if (confirm("Are you sure to remove this product?")) {
      const all_products = JSON.parse(localStorage.getItem("wish_list"));
      console.log(all_products);
      const pdts = all_products.find(
        (e) => e.product_id == product_id && e.user_id == profile_id);
      console.log(pdts);
      const indexOfProduct = all_products.indexOf(pdts);
      all_products.splice(indexOfProduct, 1);
      console.log(indexOfProduct);
      localStorage.setItem("wish_list", JSON.stringify(all_products));
    }
    window.location.reload();
  });
});
