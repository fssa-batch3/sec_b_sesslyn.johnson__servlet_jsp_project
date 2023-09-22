const rootPath = window.location.origin + '/minimalweb';
console.log(rootPath);

const beforeLogin = `
<div class="head">
<div class="main_header">
    <span class="header" id="header_shop"><a href="${rootPath}/index"><img class="main_logo" id="main_logo" src="https://iili.io/Hy0p6kx.jpg"
            alt="logo of minimalistic" /></a></span>
    <div id="nav_header">
       
        <span class="header"><a href="${rootPath}/pages/product/shop.html">
                <p class="header_para">SHOP</p>
            </a></span>
        <span class="header"><a href="${rootPath}/about">
                <p class="header_para">ABOUT</p>
            </a></span>
        <span class="header"><a href="${rootPath}/pages/order/order.html">
                <p class="header_para">ORDERS</p>
            </a></span>
        <span class="header"><a href="${rootPath}/user/appointment_list">
            <p class="header_para">SCHEDULE</p>
        </a></span>
        <span class="header"><a href="${rootPath}/designer">
           <p class="header_para">DESIGNERS</p>
        </a></span>
    </div>
 <div class="btn">
   <a href = "${rootPath}/user/new"><button id="sign_in" class="sign_in">Sign In</button></a>
   
   <a href = "${rootPath}/user/login"><button id="userLogin" class="log_in">Log In</button> </a>
   
</div>
</div>
</div>
`;

const AfterLogin = ` 
<div class="head">
        <div class="main_header">
            <span class="header" id="header_shop"><a href="${rootPath}/home_page"><img class="main_logo" id="main_logo"
                        src="https://iili.io/Hy0p6kx.jpg" alt="logo of minimalistic" /></a></span>
            <div class="nav_header">
                <span class="header"><a href="${rootPath}/pages/product/shop.html">
                        <p class="header_para">SHOP</p>
                    </a></span>
                <span class="header"><a href="${rootPath}/about">
                        <p class="header_para">ABOUT</p>
                    </a></span>
                <span class="header"><a href="${rootPath}/pages/order/order.html">
                        <p class="header_para">ORDERS</p>
                    </a></span>
                <span class="header"><a href="${rootPath}/user/appointment_list">
            <p class="header_para">SCHEDULE</p>
        </a></span>
        <span class="header"><a href="${rootPath}/designer">
           <p class="header_para">DESIGNERS</p>
        </a></span>
            </div>
          
            <button class="btn_delete" id="logOut"><span>Log </span><span>Out</span></button>
           
            <a href="${rootPath}/pages/product/cart.html">
            <img src="https://iili.io/HyVDSHu.png" class="cart_img" alt="profile picture" />
            </a>
             <a href="${rootPath}/user/details">
                <img src="https://iili.io/HyVDPVV.png" class="profile_img" alt="profile picture" />
            </a>
        </a>
        </div>
        </div>
`;
const loginUser = localStorage.getItem("profile_id");

function handleLogout() {
	localStorage.removeItem("profile_id");
	// Redirect the user to the logout servlet
	window.location.href = `${rootPath}/user/logout`;
}

window.addEventListener("DOMContentLoaded", () => {
	const loginUser = localStorage.getItem("profile_id");
	if (loginUser === "" || loginUser === null) {
		document.body.insertAdjacentHTML("afterbegin", beforeLogin);
		let userLoginElement = document.getElementById("userLogin");
		userLoginElement?.addEventListener("click", () => (document.body.innerHTML = AfterLogin));
		let userLogoutElement = document.getElementById("logOut");
		userLogoutElement?.addEventListener("click", handleLogout);
	} else {
		document.body.insertAdjacentHTML("afterbegin", AfterLogin);
		let userLoginElement = document.getElementById("userLogin");
		userLoginElement?.addEventListener("click", () => (document.body.innerHTML = AfterLogin));
		let userLogoutElement = document.getElementById("logOut");
		userLogoutElement?.addEventListener("click", handleLogout);
	}
});
