<%@page import="in.fssa.minimal.model.User"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Designers</title>
    <style>
        table {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #DDDDDD;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #DDDDDD;
        }
    </style>
</head>
<body>
    <h2>List of Users</h2>
    <%
        Set<User> userList = (Set<User>) request.getAttribute("userDetails");
        %>
    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Email</th>
            <th>Phone Number</th>
            <th>View Details</th>
            <th>Edit</th>
            <th>Delete</th>
        </tr>

        <%
        for (User designer : userList) {
        %>
        <tr>
            <td><%= designer.getId() %></td>
            <td><%= designer.getName() %></td>
            <td><%= designer.getEmail() %></td>
            <td><%= designer.getPhoneNumber() %></td>
            <td><a href="user/details?id=<%= designer.getId() %>">
                    <button type="button">View Details</button>
                </a></td>
            <td><a href="user/edit?id=<%= designer.getId() %>">
                    <button type="button">Edit</button>
                </a></td>
            <td><a href="user/delete?id=<%= designer.getId() %>">
                    <button type="button">Delete</button>
                </a></td>
        </tr>
        <%
        }
        %>
    </table>
</body>
</html>
