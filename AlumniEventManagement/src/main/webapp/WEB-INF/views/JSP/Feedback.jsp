<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feedback Form</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/Feedback.css' />" rel="stylesheet" />
    <script src="resources/JS/alert.js"></script>
    <script src="resources/JS/Validatefeedback.js"></script> 
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Alumni</a>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center">Alumni Dashboard</h3>
        <a href="eventview">View Events</a>
        <a href="feedback">Feedback</a>
        <a href="logout">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="container mt-4">
            <h2 class="text-center">Feedback Form</h2>
            <form name="frm" action="getfeedback" method="post" onsubmit="return validateFeedbackForm()">
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="eventName" class="form-label mt-4">Event Name</label>
                        <select class="form-select mt-2" id="eventName" name="eventid" required>
                            <option value="">Select Event</option>
                            <c:forEach var="event" items="${evl}">
                                <option value="${event.getEid()}">${event.getName()}</option>
                            </c:forEach>
                        </select>
                        <!-- Error message for Event Name -->
                        <span id="eventError" style="color: red;"></span>
                    </div>
                    <div class="col-md-6">
                        <label for="rating" class="form-label mt-4">Rating</label>
                        <select class="form-select mt-2" id="rating" name="rating" required>
                            <option value="">Select a rating</option>
                            <option value="1">1 - Worst</option>
                            <option value="2">2 - Poor</option>
                            <option value="3">3 - Average</option>
                            <option value="4">4 - Good</option>
                            <option value="5">5 - Excellent</option>
                        </select>
                        <!-- Error message for Rating -->
                        <span id="ratingError" style="color: red;"></span>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="alumniName" class="form-label mt-4">Alumni Name</label>
                        <input class="form-control mt-2" id="alumniName" name="Name" placeholder="Enter your name" required autocomplete="off"/>
                        <!-- Error message for Alumni Name -->
                        <span id="alumniNameError" style="color: red;"></span>
                    </div>
                    <div class="col-md-6">
                        <label for="feedbackDetails" class="form-label mt-4">Any Suggestions</label>
                        <input class="form-control mt-2" id="feedbackDetails" name="feedbackDetails" rows="4" placeholder="Enter your feedback here..." style="width:100%" required autocomplete="off"></input>
                        <!-- Error message for Feedback Details -->
                        <span id="feedbackDetailsError" style="color: red;"></span>
                    </div>
                </div>
                <div class="text-center mt-4">
                    <button type="submit" class="btn btn-primary mt-4">Submit Feedback</button>
                </div>
            </form>
            <!-- Feedback message -->
            <c:if test="${not empty fd}">
                <div class="alert alert-warning mt-4 text-center" id="message-alert">${fd}</div>
            </c:if>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
