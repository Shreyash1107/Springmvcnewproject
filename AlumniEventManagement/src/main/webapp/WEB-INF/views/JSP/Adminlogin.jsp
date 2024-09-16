<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Admin Login</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
<link href="<c:url value='/resources/CSS/admin.css' />" rel="stylesheet" />
<script src="resources/JS/validatelogin.js"></script>
<script src="resources/JS/alert.js"></script>
</head>
<body>
	<div class="login-container">
		<div class="login-form">
			<h3 class="text-center">Login</h3>
			<form name="frm" action="adminlogin" method="GET"
				onsubmit="return validateForm()">
				<div class="form-group">
					<label for="username">Username</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" id="username" name="Name"
							placeholder="Enter your username" autocomplete="off"
							onblur="validateName(this.value)"> <span id="n"
							class="text-danger"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="password">Password</label>
					<div class="input-group">
						<div class="input-group-prepend">
							<span class="input-group-text" id="togglePassword"
								style="cursor: pointer;"> <i class="fas fa-lock"></i>
							</span>
						</div>
						<input type="password" class="form-control" id="password"
							name="pass" placeholder="Enter your password" autocomplete="off"
							onblur="validatePassword(this.value)"> <span id="p"
							class="text-danger"></span>
					</div>
				</div>
				<button type="submit" class="btn btn-primary btn-block">Login</button>
				<div class="text-center mt-3">
					<a href="alumniregister">Forgot Password? Sign up here</a>
				</div>
			</form>
			<c:if test="${not empty msg}">
                <div class="alert alert-warning mt-4 text-center" id="message-alert">${msg}</div>
            </c:if>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		document.getElementById('togglePassword').addEventListener('click',
				function() {
					var password = document.getElementById('password');
					var icons = this.querySelector('i');
					if (password.type === 'password') {
						password.type = 'text';
						icons.classList.remove('fa-lock');
						icons.classList.add('fa-unlock');
					} else {
						password.type = 'password';
						icons.classList.remove('fa-unlock');
						icons.classList.add('fa-lock');
					}
				});

		function preventBack() {
			window.history.forward();
		}
		setTimeout("preventBack()", 0);
		window.onunload = function() {
			null
		};
	</script>
</body>
</html>
