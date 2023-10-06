const rootPath = window.location.origin + '/minimalweb';
console.log(rootPath);

const AfterLogin = `
<div class="head">
    <div class="main_header">
        <span class="header" id="header_shop">
            <a href="${rootPath}/pages/profile/home_page.html">
                <img class="main_logo" id="main_logo"
                    src="${rootPath}/assets/images/home_page/Logo.jpg" alt="logo of minimalistic" />
            </a>
        </span>
        
        <div class="nav_header" id="sellerHeader">
            <span class="header"><a href="${rootPath}/pages/seller/product_list.html">
                <p class="header_para">PRODUCTS</p>
            </a></span>
            <span class="header"><a href="${rootPath}/about">
                <p class="header_para">ABOUT</p>
            </a></span>
            <span class="header"><a href="${rootPath}/pages/seller/seller_order.html">
                <p class="header_para">ORDERS</p>
            </a></span>
            <span class="header"><a href="${rootPath}/pages/seller/product_form.html">
                <p class="header_para">ADD PRODUCT</p>
            </a></span>
        </div>

        <button class="btn_delete" id="logOut" onclick="handleLogout()">
            <span>Log </span><span>Out</span>
        </button>

        <a href="${rootPath}/user/details">
            <img src="https://iili.io/HyVDPVV.png" class="profile_img" alt="profile" />
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
		
	} else {
		document.body.insertAdjacentHTML("afterbegin", AfterLogin);
		let userLoginElement = document.getElementById("userLogin");
		userLoginElement?.addEventListener("click", () => (document.body.innerHTML = AfterLogin));
		let userLogoutElement = document.getElementById("logOut");
		userLogoutElement?.addEventListener("click", handleLogout);
	}
});
