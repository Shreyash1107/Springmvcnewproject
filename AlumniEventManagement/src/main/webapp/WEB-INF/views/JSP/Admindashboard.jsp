<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/admindashboard.css' />" rel="stylesheet" />
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin</a>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center">Admin Dashboard</h3>
        <a href="addview">Department Module</a>
         <a href="btchmodel">Batch Module</a>
        <a href="alumni">Alumni Module</a>
        <a href="#">Event Module</a>
        <a href="#">Feedback Module</a>
        <a href="logout">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="container-fluid">
            <h2 class="text-center mb-5">Welcome to the Admin Dashboard</h2>    
            <!-- Cards Section -->
            <div class="row md-4">
                <div class="col-md-4 mb-3">
                    <div class="card text-white bg-warning mb-3">
                        <div class="card-header">Total Departments</div>
                        <div class="card-body">
                            <h5 class="card-title"></h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card text-white bg-secondary mb-3">
                        <div class="card-header">Registered Events</div>
                        <div class="card-body">
                            <h5 class="card-title"></h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 mb-3">
                    <div class="card text-white bg-success mb-3">
                        <div class="card-header">Total Alumni</div>
                        <div class="card-body">
                            <h5 class="card-title"></h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Buttons Section -->
           <!--  <div class="mb-4">
                <button class="btn btn-custom me-2">Add</button>
                <button class="btn btn-custom">View</button>
            </div> -->
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
