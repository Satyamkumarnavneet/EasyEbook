<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <title>Delete Book</title>
</head>
<body>
    <h1>Delete Book</h1>
    <form action="${pageContext.request.contextPath}/admin/books/delete/${book.id}" method="post">
        <input type="hidden" name="_method" value="get">
        <input type="submit" value="Delete">
    </form>
</body>
</html>
