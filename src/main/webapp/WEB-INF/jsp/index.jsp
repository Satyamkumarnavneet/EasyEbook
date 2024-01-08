<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.EasyEbook.models.Users"%>
<%@ page import="java.util.List"%>
<%@ page import="com.EasyEbook.models.Books"%>
<%@ page import="com.EasyEbook.models.Cart"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EasyEbook</title>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
 body {
     
        background-color: #f2f2f2	;
    }
.navbar-brand {
	font-weight: bold;
	color: #fff;
}

nav {
	background-color: #007bff;
	padding: 10px;
	color: white;
}

.navbar-nav {
	margin-left: auto;
}

a.nav-link {
	color: #fff;
	text-decoration: none;
	margin-right: 10px;
	font-weight: bold;
}

.navbar-nav {
	margin-left: auto;
}


.welcome-message {
	font-weight: bold;
	color: blanc;
	margin-top: 10px;
	margin-bottom: 20px;
}


section {
	margin-bottom: 20px;
.book-section {
    margin-bottom: 20px;
    background-image: url("path/to/your/image.jpg");
    background-size: cover;
    background-position: center;
}

.section-title {
    font-size: 20px;
    font-weight: bold;
    color: black;
}

.book-container {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
    grid-gap: 20px;
}

.book-card {
    background-color: #f8f9fa;
    padding: 10px;
    border: 1px solid #dee2e6;
    border-radius: 5px;
}

.author {
    font-weight: bold;
}

.price {
    margin-bottom: 10px;
}

.btn-primary {
    margin-top: 10px;
}


</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg">
		<div class="container">
			<a class="navbar-brand" href="/index">EasyEbook</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<!-- navbar items aligned to the right -->
					<li class="nav-item"><a class="nav-link btn btn-primary"
						href="/login">Admin</a></li>
					<li class="nav-item"><a class="nav-link btn btn-primary"
						href="/cart">Cart</a></li>

					<li class="nav-item">
						<form action="/logout" method="get">
							<button class="btn btn-primary" type="submit">Logout</button>
						</form>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container mt-4">
		<div class="welcome-message">
	<%
	String username = (String) session.getAttribute("loggedInUser");
	if (username != null) {
	%>
	Welcome, <%=username%>!
	<%
	}
	%>
</div>

		<br>
		<section>
			<div class="book-section">
    <h4 class="section-title">Explore Books</h4>
    <div class="book-container">
        <% Cart cart = new Cart();
        List<Books> books = (List<Books>) request.getAttribute("books");
        if (books != null) {
            for (Books book : books) { %>
        <div class="book-card">
            <div class="row">
                <div class="col-md-2">
                    <img src="">
                </div>
                <div class="col-md-10">
                    <p class="author">Author: <%=book.getAuthor()%></p>
                    <p class="price">Price: $<%=book.getPrice()%></p>
                    <form action="/cart/add/<%=book.getId()%>" method="post">
                        <input type="hidden" name="userId" value="<%=session.getAttribute("loggedInUser")%>">
                        <button class="btn btn-primary" type="submit">Add to Cart</button>
                    </form>
                </div>
            </div>
        </div>
        <% }
        } %>
    </div>
</div>

		</section>
	</div>
	</div>

	<!-- Add Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
