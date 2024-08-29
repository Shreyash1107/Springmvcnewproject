<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="<c:url value='/resources/CSS/admin.css' />" rel="stylesheet" />
</head>
<body>
	<div class="login-container">
        <div class="login-form">
            <h3 class="text-center">Login</h3>
            <!-- <div id="alert" class="alert alert-danger d-none" role="alert">
                Wrong username entered!
            </div> -->
            <form name = "frm" action="adminlogin" method="GET">
                <div class="form-group">
                    <label for="username">Username</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                        </div>
                        <input type="text" class="form-control" id="username" name = "Name" placeholder="Enter your username" autocomplete="off">
                    </div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="togglePassword" style="cursor: pointer;">
                                <i class="fas fa-lock"></i>
                            </span>
                        </div>
                        <input type="password" class="form-control" id="password" name = "pass"  placeholder="Enter your password" autocomplete="off">
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Login</button>
                 <!-- <a href="#" class="btn btn-primary btn-block">Login</a> -->
                 <div class="text-center mt-3">
                    <a href="alumniregister">Forgot Password?, Sign up here</a>
                </div>
                </div>
            </form>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	 <script src="resources/JS/login.js"></script>
</body>
</html>
