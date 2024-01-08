<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.EasyEbook.models.Users"%>
<%@ page import="java.util.List"%>
<%@ page import="com.EasyEbook.models.Books"%>
<%@ page import="com.EasyEbook.models.Cart"%>
<!DOCTYPE html>
<html>
<head>
<title>User Management</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f2f2f2;
}

h1 {
	text-align: center;
	color: #333;
}

.container {
	margin: 20px auto;
	width: 80%;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f2f2f2;
}

.card {
	width: 300px;
	border: 1px solid #ddd;
	border-radius: 5px;
	margin: 10px;
	padding: 10px;
	background-color: #fff;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-header {
	font-weight: bold;
	margin-bottom: 10px;
	color: #333;
}

.card-content {
	margin-bottom: 10px;
}

.card-footer {
	text-align: right;
}

/* Color Palette */
.primary {
	color: #2c3e50;
	background-color: #e67e22;
}

.secondary {
	color: #ffffff;
	background-color: #3498db;
}

.accent {
	color: #ffffff;
	background-color: #9b59b6;
}

</style>
</head>
<body>
	<h1>User Management</h1>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>ID</th>
					<th>User Name</th>
					<th>User Type</th>
				</tr>
			</thead>
			<tbody>
				<%
				List<Users> users = (List<Users>) request.getAttribute("users");
				String userType = request.getParameter("userType");

				if (users != null) {
					for (Users user : users) {
						if (user.getUserType().equals("user")) {
				%>
				<tr>
					<td><%=user.getId()%></td>
					<td><%=user.getUsername()%></td>
					<td><%=user.getUserType()%></td>
				</tr>
				<%
				}
				}
				}
				%>
			</tbody>

		</table>
	</div>
</body>
</html>
