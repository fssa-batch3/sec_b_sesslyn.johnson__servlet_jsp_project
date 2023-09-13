const rootPath = window.location.origin;
console.log(rootPath);

const beforeLogin = `
<div class="head">
<div class="main_header">
    <span class="header" id="header_shop"><a href="${rootPath}/index.html"><img class="main_logo" id="main_logo" src="https://iili.io/Hy0p6kx.jpg"
            alt="logo of minimalistic" /></a></span>
    <div id="nav_header">
       
        <span class="header"><a href="${rootPath}/pages/product/shop.html">
                <p class="header_para">SHOP</p>
            </a></span>
        <span class="header"><a href="${rootPath}/pages/profile/about.html">
                <p class="header_para">ABOUT</p>
            </a></span>
        <span class="header"><a href="${rootPath}/pages/order/order.html">
                <p class="header_para">ORDERS</p>
            </a></span>
        <span class="header"><a href="${rootPath}/pages/appointment/appointment_history.html">
            <p class="header_para">SCHEDULE</p>
        </a></span>
        <span class="header"><a href="${rootPath}/pages/designer/designers.html">
           <p class="header_para">DESIGNERS</p>
        </a></span>
    </div>
 <div class="btn">
   <a href = "${rootPath}/index.html"><button id="sign_in" class="sign_in">Sign In</button></a>
   
   <a href = "${rootPath}/index.html"><button id="userLogin" class="log_in">Log In</button> </a>
   
</div>
</div>
</div>
`;

const AfterLogin = ` 
<div class="head">
        <div class="main_header">
            <span class="header" id="header_shop"><a href="${rootPath}/pages/profile/homepage.html"><img class="main_logo" id="main_logo"
                        src="https://iili.io/Hy0p6kx.jpg" alt="logo of minimalistic" /></a></span>
            <div class="nav_header">
                <span class="header"><a href="${rootPath}/pages/product/shop.html">
                        <p class="header_para">SHOP</p>
                    </a></span>
                <span class="header"><a href="${rootPath}/pages/profile/about.html">
                        <p class="header_para">ABOUT</p>
                    </a></span>
                <span class="header"><a href="${rootPath}/pages/order/order.html">
                        <p class="header_para">ORDERS</p>
                    </a></span>
                <span class="header"><a href="${rootPath}/pages/appointment/appointment_history.html">
                    <p class="header_para">SCHEDULE</p>
                </a></span>
                <span class="header"><a href="${rootPath}/pages/designer/designers.html">
                     <p class="header_para">DESIGNERS</p>
                </a></span>
            </div>
          
            <button class="btn_delete" id="logOut"><span>Log </span><span>Out</span></button>
            <a href="${rootPath}/pages/profile/profile_new.html">
                <img src="${rootPath}/assets/images/home_page/profile.png" class="profile_img" alt="profile picture" />
            </a>
            <a href="${rootPath}/pages/cart.html">
            <img src="${rootPath}/assets/images/home_page/cartBlack.png" class="cart_img" alt="profile picture" />
        </a>
        </div>
        </div>
`;


