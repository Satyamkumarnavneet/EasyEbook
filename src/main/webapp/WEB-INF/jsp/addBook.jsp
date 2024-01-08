<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Add Book</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Book</h1>
        <form action="${pageContext.request.contextPath}/admin/books" method="post">
            <label for="bookName">Book Name:</label>
            <input type="text" id="bookName" name="bookName" required>
            <br/><br/>
            <label for="author">Author:</label>
            <input type="text" id="author" name="author" required>
            <br/><br/>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" required>
            <br/><br/>
            <input type="submit" value="Add Book">
        </form>
    </div>
</body>
</html>
