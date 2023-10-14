const path =  window.location.origin+'/minimalweb';
console.log(path);

const product_crud = JSON.parse(localStorage.getItem("product_crud"));
const added_products = JSON.parse(localStorage.getItem("added_products"));

//Url params
const queryString = window.location.search;
const urlParams = new URLSearchParams(queryString);
const product_id = urlParams.get("product_id");
const unique_id = product_crud.find((product) => product.product_uuid == product_id);
console.log(unique_id);
localStorage.setItem("product", JSON.stringify(unique_id.product_uuid));
let roundedAverageRating

const reviewsInfo = JSON.parse(localStorage.getItem("reviewsInfo")) || [];
if (reviewsInfo.length != 0) {
  const reviewProduct = reviewsInfo.filter((e) => e.product_id === product_id);
  console.log(reviewProduct)
  if (reviewProduct) {
    let starValue = 0;
    for (let i = 0; i < reviewProduct.length; i++) {
      starValue += parseInt(reviewProduct[i].ratingValue);
    }
    const averageRating = starValue / reviewProduct.length;
    roundedAverageRating = Math.round(averageRating);

  }

}

//DOM for product details
const div_left = document.createElement("div");
div_left.setAttribute("class", "left_corner");
console.log(div_left);

//<span class="real_price"></span>
const span_round = document.createElement("span");
span_round.setAttribute("class", "round");
div_left.append(span_round);

//<img/>
const img_product = document.createElement("img");
img_product.setAttribute("alt", "heart_icon");
img_product.setAttribute("class", "heart_icon");
img_product.setAttribute("onclick", "wish(event)");
img_product.setAttribute("data-id", unique_id.product_uuid);
img_product.setAttribute("src", "https://iili.io/J9edQUv.jpg");
span_round.append(img_product);

//<img/>
const img_details = document.createElement("img");
img_details.setAttribute("alt", `${unique_id.product_name} image`);
img_details.setAttribute("class", "description_img");
img_details.setAttribute("src", unique_id.image_url);
div_left.append(img_details);


const div_middle = document.createElement("div");
div_middle.setAttribute("class", "middle_contain");
console.log(div_middle);

const div_review = document.createElement("div");
div_review.setAttribute("class", "review");
div_middle.append(div_review);

//<p class="price"></p>
const p_paragraph = document.createElement("p");
p_paragraph.setAttribute("class", "review_para");
p_paragraph.innerHTML = "Reviews";
div_review.append(p_paragraph);

//<span class="real_price"></span>
const span_review = document.createElement("span");
span_review.setAttribute("class", "star_icon");
div_review.append(span_review);


for (let i = 0; i < 5; i++) {
  const i_star = document.createElement("i");
  if (i < roundedAverageRating) {
    i_star.setAttribute("class", "fa fa-star");
    i_star.setAttribute("id", "starIcon");
    span_review.append(i_star);
  } else {
    i_star.setAttribute("class", "fa fa-star");
    i_star.setAttribute("id", "fastarIcon");
    span_review.append(i_star);
  }
}
const div_head = document.createElement("div");
div_middle.append(div_head);

//<h2></h2>
const h1_title = document.createElement("h1");
h1_title.setAttribute("class", "product_name");
h1_title.innerHTML = unique_id.product_name;
div_head.append(h1_title);

const spanQuantity = document.createElement("span");
spanQuantity.setAttribute("id", "spanQuantity");
 if (parseInt(unique_id.product_quantity) < 10 && parseInt(unique_id.product_quantity) > 0) {
  spanQuantity.innerText = "Only " + unique_id.product_quantity + " stock left. Hurry up....";
  
} else if (parseInt(unique_id.product_quantity) == 0) {
  spanQuantity.innerText = "Out of Stock";
}
else {
  spanQuantity.innerText = "Available now. Start Buying";
}
div_head.append(spanQuantity);

const div_amount = document.createElement("div");
div_amount.setAttribute("class", "amount");
div_head.append(div_amount);

const h3_price = document.createElement("h3");
h3_price.innerHTML = "Price";
div_amount.append(h3_price);

//<p class="price"></p>
const p_price = document.createElement("p");
p_price.setAttribute("class", "price");
div_amount.append(p_price);

//<span class="real_price"></span>
const span_price = document.createElement("span");
span_price.setAttribute("class", "current-price");
span_price.innerHTML = `Rs. ${unique_id.product_sell}`;
p_price.append(span_price);

//<del></del>
const del_price = document.createElement("del");
del_price.innerHTML = `Rs. ${unique_id.product_real}`;
p_price.append(del_price);

//  <small> </small>
const small_pattern = document.createElement("small");
small_pattern.setAttribute("class", "actual-prize");
small_pattern.innerHTML = `${unique_id.product_discount}% off`;
p_price.append(small_pattern);

const div_description = document.createElement("div");
div_description.setAttribute("class", "product_description");
div_head.append(div_description);

const h3_head = document.createElement("h3");
h3_head.setAttribute("class", "description_heading");
h3_head.innerHTML = "Description :";
div_description.append(h3_head);

const text = unique_id.product_description;
const dividedText = text.split(/(?=\*)/);

const p_text = document.createElement("p");
p_text.innerHTML = dividedText.join("<br>");
div_description.append(p_text);

const h3_warranty = document.createElement("h3");
h3_warranty.setAttribute("class", "warranty");
h3_warranty.innerHTML = "Warranty :";
div_description.append(h3_warranty);

//<p class="price"></p>
const p_warrant = document.createElement("p");
p_warrant.innerHTML = unique_id.product_warranty;
div_description.append(p_warrant);

const span_warrant = document.createElement("span");
span_warrant.setAttribute("id", "seller");
span_warrant.innerHTML = unique_id.sellerId;
div_description.append(span_warrant);

const button_primary = document.createElement("button");
button_primary.setAttribute("class", "btn_cart");
button_primary.setAttribute("type", "submit");
button_primary.setAttribute("data-id", unique_id.product_uuid);


const img_cart = document.createElement("img");
img_cart.setAttribute("alt", "cart_icon");
img_cart.setAttribute("src", "https://iili.io/J9ezbee.png");
button_primary.appendChild(img_cart);

button_primary.addEventListener("mouseover", function () {
  img_cart.setAttribute("src", "https://iili.io/J9eIKdP.png");
});

button_primary.addEventListener("mouseout", function () {
  img_cart.setAttribute("src", "https://iili.io/J9ezbee.png");
});

const text_node = document.createTextNode("Add to Cart");
button_primary.appendChild(text_node);

div_head.appendChild(button_primary);

const div_right = document.createElement("div");
div_right.setAttribute("class", "right_corner");
console.log(div_right);

const parentDiv = document.createElement("div");
div_right.append(parentDiv);

const childDiv1 = document.createElement("div");
const aSimilar = document.createElement("a");
aSimilar.setAttribute("href", `${path}/pages/product/description.html?product_id=550e8400-e29b-41d4-a716-446655440000`);
parentDiv.append(aSimilar);

const image1 = document.createElement("img");
image1.src = "https://iili.io/HrB7QXs.jpg";
image1.alt = "chandelier image";
image1.className = "similar_product";
aSimilar.append(image1);

const header1 = document.createElement("h4");
header1.className = "header_similar";
header1.textContent = "Foder pendant chandelier";
parentDiv.append(header1);

const price1 = document.createElement("p");
price1.className = "price";
price1.textContent = "₹ 36954";
parentDiv.append(price1);

const parentTop = document.createElement("div");
parentTop.className = "top";
parentDiv.append(parentTop);

const reviewIcon1 = document.createElement("span");
reviewIcon1.className = "review_icon";
parentTop.append(reviewIcon1);

for (let i = 0; i < 5; i++) {
  //<i></i>
  const star1 = document.createElement("i");
  star1.setAttribute("class", "fa fa-star");
  star1.setAttribute("id", "fastarIcon");
  reviewIcon1.append(star1);
}

//2
const parent2Div = document.createElement("div");
div_right.append(parent2Div);

const childDiv2 = document.createElement("div");

const aSimilar2 = document.createElement("a");
aSimilar2.setAttribute("href", `${path}/pages/product/description.html?product_id=38b9c9dc-ec16-41d2-8e87-09e69bcf2c7e`);
parent2Div.append(aSimilar2);


const image3 = document.createElement("img");
image3.src = "https://iili.io/HNgYWMl.th.jpg";
image3.alt = "TV Units image";
image3.className = "similar_product";
aSimilar2.append(image3);

const header2 = document.createElement("h4");
header2.className = "header_similar";
header2.textContent = "White Wadrobe";
parent2Div.append(header2);

const price2 = document.createElement("p");
price2.className = "price";
price2.textContent = "₹ 30099";
parent2Div.append(price2);

const parent2Top = document.createElement("div");
parent2Top.className = "top";
parent2Div.append(parent2Top);

const reviewIcon2 = document.createElement("span");
reviewIcon2.className = "review_icon";
parent2Top.append(reviewIcon2);

for (let i = 0; i < 5; i++) {

  const star2 = document.createElement("i");
  star2.setAttribute("class", "fa fa-star");
  star2.setAttribute("id", "fastarIcon");
  reviewIcon2.append(star2);
}
document.querySelector("div.container").append(div_left);
document.querySelector("div.container").append(div_middle);
document.querySelector("div.container").append(div_right);

//Add to Cart
document.querySelector(".btn_cart").addEventListener("click", function () {
  const id_cart = this.dataset.id;
  const product_price = parseInt(
    document.querySelector(".current-price").innerHTML.replace("Rs.", "")); 
  const cart_list = JSON.parse(localStorage.getItem("cart_list")) || [];
  const product_name = document.querySelector(".product_name").innerHTML; 
  const image_url = document.querySelector(".description_img").getAttribute("src");
  const profile_id = JSON.parse(localStorage.getItem("profile_id"));
   const seller_id = document.querySelector("#seller").innerHTML;
  
  const exist =
    cart_list.length &&
    JSON.parse(localStorage.getItem("cart_list")).some(
      (data) => data.product_uuid == id_cart && data.profile_id === profile_id
    );

  if (
    cart_list.find((p) => p.product_uuid === id_cart && p.userId === profile_id)
  ) {
    alert("Sorry, the product is already added to the cart");
    return;
  }
  if (!profile_id) {
    alert("Log In");
    location.href = path + '/user/login';
    return;
  }
  if (!exist) {
    cart_list.push({
      product_uuid: id_cart,
      product_name,
      image_url,
      product_price,
      seller_id : seller_id,
      userId: profile_id,
      product_quantity: 1,
    });
    localStorage.setItem("cart_list", JSON.stringify(cart_list));
    alert("Product Added to the Cart");
    location.href = path + '/pages/product/shop.html';
  }
});

//Add to wishlist
function wish(e) {
  e.preventDefault();
  const wish_list = JSON.parse(localStorage.getItem("wish_list")) || [];
  const profile_id = JSON.parse(localStorage.getItem("profile_id"));
  const condition = JSON.parse(localStorage.getItem("profile_id"));
    const seller_id = document.querySelector("#seller").innerHTML;
  if (!condition) {
    alert("Log In");
    window.location.href = path +"/user/login";
    return;
  }
  const product_uuid = new URLSearchParams(window.location.search).get(
    "product_id"
  );
  const prod_data = wish_list.find(
    (product) =>
      product.product_id === product_uuid && product.user_id === profile_id
  );
  if (prod_data) {
    alert("Sorry, the product is already added to the wishlist");
  } else {
    const prod = {
      product_id: product_uuid,
      user_id: profile_id,
      seller_id : seller_id
    };
    wish_list.push(prod);
    localStorage.setItem("wish_list", JSON.stringify(wish_list));
    alert("Your product has been added to the wishlist");
    window.location.href = path +  "/pages/product/shop.html";
  }
}

