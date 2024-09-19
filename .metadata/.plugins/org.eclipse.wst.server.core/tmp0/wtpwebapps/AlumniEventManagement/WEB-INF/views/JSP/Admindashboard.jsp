<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<%@ page import="org.model.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/admindashboard.css' />" rel="stylesheet" />
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin</a>
        </div>
    </nav>

    <!-- Toggle Button -->
    <div class="toggle-container">
        <button class="toggle-btn" id="toggleBtn">
            <span></span> <span></span> <span></span>
        </button>
    </div>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <h3 class="text-center dashboard-heading mt-4">Admin Dashboard</h3>
        <a href="department">Department Module</a>
        <a href="btchmodel">Batch Module</a>
        <a href="alumni">Alumni Module</a>
        <a href="events">Event Module</a>
        <a href="feedbackpage">Feedback Module</a>
        <a href="logout">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content" id="mainContent">
        <div class="container">
            <!-- Welcome Text -->
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="welcome-text">Welcome to Admin Dashboard</h1>
                </div>
            </div>

            <div class="row">
                <!-- Card 1: Total Departments -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card text-center bg-primary text-white mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Total Departments</h5>
                            <p class="card-text">Number of departments in the system.</p>
                            <h3 class="card-text">${dash}</h3>
                        </div>
                    </div>
                </div>

                <!-- Card 2: Total Alumni -->
                <div class="col-12 col-sm-6 col-md-4">
                    <div class="card text-center bg-success text-white mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Total Alumni</h5>
                            <p class="card-text">Number of alumni registered for Application</p>
                            <h3 class="card-text">${alumnicount}</h3>
                        </div>
                    </div>
                </div>

                <!-- Card 3: Events Scheduled -->
                <div class="col-12 col-sm-6 col-md-4 mb-4">
                    <div class="card text-center bg-warning text-white mt-4">
                        <div class="card-body">
                            <h5 class="card-title">Events Scheduled</h5>
                            <p class="card-text">Number of events scheduled for Alumni</p>
                            <h3 class="card-text">${eventcount}</h3>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS for Sidebar Toggle -->
    <script src="<c:url value='/resources/JS/togglesidebar.js' />"></script>
</body>
</html>
