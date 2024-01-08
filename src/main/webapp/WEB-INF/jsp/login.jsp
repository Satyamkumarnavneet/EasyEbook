<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>EasyEbook</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: white;
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .login-details {
            width: 500px;
            background-color: #fff;
            padding: 56px;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.4);
            margin-right: 200px;
        }

        .login-image {
            width: 500px;
            max-width: 100%;
            height: auto;
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 2px;
        }

        .btn-primary,
        .btn-danger {
            width: 100%;
            margin-top: 10px;
            border-radius: 2px;
        }

        .btn-primary {
            background-color: #007bff;
            border-color: #007bff;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-details">
            <%-- Check if error message exists and display error message --%>
            <% if (request.getAttribute("loginFailed") != null) { %>
                <div class="alert alert-danger">Login failed. Please try again.</div>
            <% } %>
            <form action="login" method="post">
                <h3>Login</h3>
                <div class="mb-3">
                    <label for="username" class="form-label">Username:</label>
                    <input type="text" id="username" name="username" required class="form-control">
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" id="password" name="password" required class="form-control">
                </div>
                <div class="mb-3">
                    <label for="userType" class="form-label">User Type:</label>
                    <select id="userType" name="userType" class="form-control">
                        <option value="user">User</option>
                        <option value="admin">Admin</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary">Login</button>
                <a href="/register" class="btn btn-danger">Register</a>
            </form>
        </div>
        <img class="login-image" alt="imagelogin" src="https://namastecredit.com/wp-content/uploads/2021/11/NBiz_loan_hub_Banner-image2-1024x943.png">
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
