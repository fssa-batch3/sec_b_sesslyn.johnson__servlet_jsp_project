<!DOCTYPE html>

<%@page import="in.fssa.minimal.model.User"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Order page</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/order/order.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/profile/normalize.css">
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700," rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+SC:wght@200;300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Lato:wght@300&family=Prompt:wght@200&family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
</head>

<body>
<%
    String headerJSP = "/pages/profile/header.jsp";
%>

<jsp:include page="<%= headerJSP %>"/>
<%
    User user = (User) request.getAttribute("userDetails");
    System.out.println(user);
    if (user != null) {
%>
<div id="small_container">
    <div class="top-container">
        <div class="top_contain">
            <div>
                <img src="https://iili.io/HgdJlDJ.png" class="delivery_girl" alt="Delivery receiving image">
            </div>
            <div>
                <h1>
                    Best Furniture For Your Home <br> From Minimalistic
                </h1>
                <a href="../shop.html">
                    <p class="start_shop">
                        Start Shopping <img src="https://iili.io/JHBj5X9.png" alt="arrow image"
                            class="arrow_icon">
                    </p>
                </a>
            </div>
        </div>
        <div class="bottom_contain">
          <h4>Your haven't ordered yet !</h4>
        </div>
    </div>
</div>
<% } else { %>
<div id="cart_empty">
    <img src="https://iili.io/HgJi5I1.jpg" class="emptyCart" alt="Empty Cart image" />
    <p class="cartEmpty">You haven't placed an order yet.</p>
</div>
<% } %>

<script src="<%= request.getContextPath() %>/assets/js/order/order.js"></script>
<script src="<%= request.getContextPath() %>/assets/js/profile/chatBot.js"></script>

</body>
</html>