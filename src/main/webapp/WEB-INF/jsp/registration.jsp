<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>EasyEbook</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .registration-form {
            width: 100%;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 5px;
            margin-right: 30px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.5);
        }

        .form-label {
            font-weight: bold;
        }

        .form-control {
            border-radius: 2px;
        }

        .btn-primary {
            width: 100%;
            margin-top: 10px;
            border-radius: 2px;
        }

        .btn-primary:hover {
            background-color: #0069d9;
            border-color: #0062cc;
        }

        .login-link {
            text-decoration: none;
            color: #007bff;
            display: block;
            margin-top: 10px;
            text-align: center;
        }

        .registration-image-container {
            background-color: #ffffff;
        }

        .registration-image {
            width: 100%;
            height: auto;
        }

        /* Added CSS */
        @media (min-width: 768px) {
            .container {
                flex-direction: row;
                justify-content: flex-start;
            }

            .registration-form {
                margin-right: 150px;
                margin-left: 100Px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <form action="register" method="post" class="registration-form">
            <h3>Registration</h3>
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
            <button type="submit" class="btn btn-primary">Register</button>
            <a href="login" class="login-link">Already a member?</a>
        </form>
        <div class="registration-image-container">
            <img src="https://img.freepik.com/free-vector/tablet-login-concept-illustration_114360-7963.jpg?w=2000" class="registration-image">
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
