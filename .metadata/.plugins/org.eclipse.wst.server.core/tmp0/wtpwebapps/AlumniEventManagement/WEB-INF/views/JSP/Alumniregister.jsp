<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alumni Registration Form</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link href="<c:url value='/resources/CSS/alumniregister.css' />" rel="stylesheet" />
    <script src="resources/JS/register.js"></script>
	<script src="resources/JS/Validation.js"></script>
</head>
<body>
    <div class="container">
        <div class="registration-form">
            <h2 class="form-title">Registration Form</h2>
            <form name="frm" action="success" method="GET" onsubmit="return validateForm()">
                <div class="mb-3">
                    <label for="username" class="form-label">Username</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon1">
                            <i class="fas fa-user"></i>
                        </span>
                        <input
                            type="text" class="form-control" id="username" name="username"
                            placeholder="Enter your username" aria-describedby="basic-addon1"
                            onblur="validateName()">
                    </div>
                    <div id="n" class="text-danger"></div>
                </div>
                
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <div class="input-group">
                        <span class="input-group-text" id="togglePassword" style="cursor: pointer;">
                            <i class="fas fa-lock"></i>
                        </span>
                        <input
                            type="password" class="form-control" id="password" name="Password"
                            placeholder="Enter your password" aria-describedby="basic-addon2"
                            onblur="validatePassword()">
                    </div>
                    <div id="p" class="text-danger"></div>
                </div>
                
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon3">
                            <i class="fas fa-envelope"></i>
                        </span>
                        <input
                            type="email" class="form-control" id="email" name="email"
                            placeholder="Enter your email" aria-describedby="basic-addon3"
                            onblur="validateEmail()">
                    </div>
                    <div id="e" class="text-danger"></div>
                </div>
                
                <div class="mb-3">
                    <label for="contact" class="form-label">Contact</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon4">
                            <i class="fas fa-phone"></i>
                        </span>
                        <input
                            type="text" class="form-control" id="contact" name="Contact"
                            placeholder="Enter your contact number" aria-describedby="basic-addon4"
                            onblur="validateContact()">
                    </div>
                    <div id="c" class="text-danger"></div>
                </div>
                
                <div class="mb-3">
                    <label for="logintype" class="form-label">Login Type</label>
                    <div class="input-group">
                        <span class="input-group-text" id="basic-addon5">
                            <i class="fas fa-user-tag"></i>
                        </span>
                        <select
                            class="form-select" id="logintype" name="Logintype" aria-describedby="basic-addon5">
                            <option value="">Select</option>
                            <option value="Admin">Admin</option>
                            <option value="Alumni">Alumni</option>
                        </select>
                    </div>
                </div>

                <button type="submit" class="btn btn-custom">Register</button>
            </form>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
    document.getElementById('togglePassword').addEventListener('click',function()
    		{
    		    var password = document.getElementById('password');
    		    var icons = this.querySelector('i');
    		    if(password.type === 'password')
    		    {
    		        password.type = 'text';
    		        icons.classList.remove('fa-lock');
    		        icons.classList.add('fa-unlock');
    		    }
    		    else
    		    {
    		        password.type = 'password';
    		        icons.classList.remove('fa-unlock');
    		        icons.classList.add('fa-lock');
    		    }
    		});
    </script>
</body>
</html>
