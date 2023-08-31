<%@page import="in.fssa.minimal.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update User</title>
<style>
body {
    font-family: Arial, sans-serif;
}

.container {
    width: 50%;
    margin: auto;
    padding: 20px;
    background-color: #f2f2f2;
    border-radius: 10px;
    box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
}

label {
    font-weight: bold;
}

input[type="text"], input[type="email"], input[type="tel"], input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 8px 0;
    border: 1px solid #ccc;
    border-radius: 4px;
}

input[type="checkbox"] {
    margin-right: 5px;
}

button.registerbtn {
    background-color: #4caf50;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    float: right;
}

button.registerbtn:hover {
    background-color: #45a049;
}
</style>
</head>
<body>
    <%
        User user = (User) request.getAttribute("userDetails");
        if (user != null) {
    %>
    <form action="update?id=<%=user.getId()%>" method="post">
        <div class="container">
            <h1>Update User</h1>
            <p>Please fill in this form to update the account information.</p>
            <hr>
            <label for="name"><b>Name</b></label>
            <input type="text" id="name" name="name" value="<%=user.getName()%>" required>

            <label for="email"><b>Email</b></label>
            <input type="email" id="email" name="email" value="<%=user.getEmail()%>" disabled required>

            <label for="phone"><b>Phone Number</b></label>
            <input type="tel" id="phone" name="phone_number" value="<%=user.getPhoneNumber()%>" required>

            <label for="password"><b>Password</b></label>
            <input type="password" id="password" name="password" value="<%=user.getPassword()%>" required>

            <input type="checkbox" id="is_designer" name="is_designer" <%= user.isDesigner() ? "checked" : "" %>>
            <label for="is_designer">I am a designer</label><br>

            <button type="submit" class="registerbtn">Update</button>
        </div>
    </form>
    <%
        } else {
    %>
    <div class="container">
        <p>User not found.</p>
    </div>
    <%
        }
    %>
</body>
</html>
