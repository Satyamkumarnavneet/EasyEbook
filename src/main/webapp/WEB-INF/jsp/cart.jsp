<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.EasyEbook.models.Cart" %>
<%@ page import="com.EasyEbook.models.Books" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        
        .card {
            border: 1px solid #ccc;
            padding: 10px;
            margin-bottom: 10px;
            width: 300px;
        }
        
        h1 {
            color: #333;
        }
        
        h3 {
            margin-top: 0;
        }
        
        p {
            margin-bottom: 5px;
        }
        
        .button {
            display: inline-block;
            padding: 5px 10px;
            background-color: #4CAF50;
            color: white;
            text-decoration: none;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }
        
        .button:hover {
            background-color: #45a049;
        }
        
        .no-items {
            color: #888;
            font-style: italic;
        }
        
        .actions {
            margin-top: 20px;
        }
        
        .actions a {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <h1>Cart</h1>
    
    <% List<Cart> cartItems = (List<Cart>) request.getAttribute("cartItems"); %>
    <% if (cartItems != null && !cartItems.isEmpty()) { %>
        <% for (Cart cartItem : cartItems) { %>
            <% Books book = cartItem.getBook(); %>
            <div class="card">
                <h3><%= book.getBookName() %></h3>
                <p>Author: <%= book.getAuthor() %></p>
                <p>Price: <%= book.getPrice() %></p>
                <form method="post" action="/cart/remove/<%= cartItem.getId() %>">
                    <button class="button" type="submit">Remove</button>
                </form>
            </div>
        <% } %>
    <% } else { %>
        <p class="no-items">No items in the cart</p>
    <% } %>
    
    <div class="actions">
        <a class="button" href="/index">Continue Shopping</a>
        <a class="button" href="/index">Place an Order</a>
    </div>
</body>
</html>
