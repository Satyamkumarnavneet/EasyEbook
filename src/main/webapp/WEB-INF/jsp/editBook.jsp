<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Edit Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            padding: 20px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            width: 400px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <h1>Edit Book</h1>
    
    <form action="${pageContext.request.contextPath}/admin/books/update/${book.id}" method="post">
        <input type="hidden" name="_method" value="post">
        <label for="bookName">Book Name:</label>
        <input type="text" id="bookName" name="bookName" value="${book.bookName}" required>
        <br/><br/>
        
        <label for="author">Author:</label>
        <input type="text" id="author" name="author" value="${book.author}" required>
        <br/><br/>
        
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" value="${book.price}" required>
        <br/><br/>
        <input type="submit" value="Update Book">
    </form>
</body>
</html>
