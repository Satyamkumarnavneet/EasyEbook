<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>Admin Page</title>
<style>
body {
	background-color: #f2f2f2;
}

.navbar {
	background-color: blue;
	overflow: hidden;
	padding: 20px;
}

.navbar-title {
	float: left;
	color: white;
	font-size: 24px;
	margin: 0;
}

.navbar-logout {
	float: right;
	color: black;
	font-size: 16px;
	margin: 0;
	padding: 10px;
	cursor: pointer;
}

.navbar-logout:hover {
	color: blue;
}

.container {
	margin-top: 50px;
}

.card-grid {
	display: grid;
	grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
	gap: 20px;
	margin-top: 20px;
}

.card {
	background-color: white;
	padding: 20px;
	border-radius: 4px;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	transition: box-shadow 0.3s ease-in-out;
}

.card:hover {
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}

.card a {
	text-decoration: none;
	color: black;
}

.card-title {
	font-size: 18px;
	margin-bottom: 10px;
}

</style>
</head>
<body>
	<div class="navbar">
		<h2 class="navbar-title">Admin Panel</h2>
		<form action="/logout" method="get">
			<button class="navbar-logout" type="submit">Logout</button>
		</form>
	</div>
	<div class="container mt-4">
		<div class="welcome-message">
			<%
			String username = (String) session.getAttribute("loggedInUser");

			if (username != null) {
			%>
			Welcome,
			<%=username%>!
			<%
			}
			%>
		</div>

		<div class="card-grid">
			<div class="card">
				<a href="${pageContext.request.contextPath}/admin/users">
					<h3 class="card-title">User Management</h3>
					<p>Manage user accounts and permissions.</p>
				</a>
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/admin/books">
					<h3 class="card-title">Book Management</h3>
					<p>Manage the books in the system.</p>
				</a>
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/admin/orders">
					<h3 class="card-title">Order Management</h3>
					<p>Track and manage customer orders.</p>
				</a>
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/admin/categories">
					<h3 class="card-title">Category Management</h3>
					<p>Manage book categories and genres.</p>
				</a>
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/admin/reports">
					<h3 class="card-title">Reporting</h3>
					<p>Generate and view system reports.</p>
				</a>
			</div>
			<div class="card">
				<a href="${pageContext.request.contextPath}/admin/settings">
					<h3 class="card-title">Settings</h3>
					<p>Manage system settings and configurations.</p>
				</a>
			</div>
		</div>
	</div>

	<script>
	// Add any JavaScript code here if needed
   
	</script>
</body>
</html>
