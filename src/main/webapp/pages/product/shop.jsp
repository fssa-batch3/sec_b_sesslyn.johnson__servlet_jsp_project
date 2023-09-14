<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chamber-Shop</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/product/shop.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/header.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&family=Prompt:wght@200&family=Source+Sans+Pro:wght@300&display=swap"
        rel="stylesheet">
</head>

<body>
	<%
	String headerJSP =  "/pages/profile/header.jsp";
	%>

	<jsp:include page="<%=headerJSP%>" />
    <div class="top">
        <div class="left_corner">
            <div class="home_interiors_div">
                <h3>Chamber</h3>
                <div class="interior-row" id="row1"></div>
                <a href="<%=request.getContextPath()%>/shop">
                    <h3>Products</h3>
                </a>
                <div class="interior-row" id="row2"></div>
            </div>
        </div>

        <div class="right_corner">
            <div class="categories" id="category">
                <h2 class="h1">Explore Our Categories</h2>
                <div class="categories-img" id="row1Interior">
                    
                </div>
            </div>

            <div class="category">
                <h2 class="h1" id="0">Sofas For Shopping</h2>
                <div class="categories-img" id="shop_sofa">
                    <!-- Sofa -->
                </div>
            </div>

            <div class="category">
                <h2 class="h1" id="1">Winsome Wallpaper</h2>
                <div class="categories-img" id="wallpaper_shop">
                    <!-- Wallpaper -->
                </div>
            </div>

            <div class="category">
                <h2 class="h1" id="2">Chandelier Lights to Brighten your Life</h2>
                <div class="categories-img" id="chandelier_shop">
                    <!-- Chandelier -->
                </div>
            </div>

            <div class="category">
                <h2 class="h1" id="3">Space Saving Furniture</h2>
                <div class="categories-img" id="reusable_shop">
                    <!-- Space Saving Furniture -->
                </div>
            </div>

            <div class="category">
                <h2 class="h1" id="4">Warming Wadrobe</h2>
                <div class="categories-img" id="wadrobe_shop">
                    <!-- Wadrobe -->
                </div>
            </div>

            <div class="category">
                <h2 class="h1" id="5">Classy Crockery Units</h2>
                <div class="categories-img" id="crockery_shop">
                    <!--Crockery Units -->
                </div>
            </div>
        </div>
    </div>

<script src="<%=request.getContextPath()%>/assets/js/profile/chatBot.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/product/shop.js"></script>
    <script src="<%=request.getContextPath()%>/assets/js/profile/header.js"></script>
</body>

</html>
