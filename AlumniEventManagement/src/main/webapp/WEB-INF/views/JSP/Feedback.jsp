<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Alumni</a>
        </div>
    </nav>

    <div class="sidebar">
        <h3 class="text-center">Alumni Dashboard</h3>
        <a href="eventview">View Events</a>
        <a href="feedback">Feedback</a>
        <a href="logout">Log out</a>
    </div>

    <div class="content">
        <div class="container mt-4">
            <h2 class="text-center">Feedback Form</h2>
            <form action="#" method="post">
                <div class="mb-3 d-flex justify-content-between">
                    <div style="flex: 1; margin-right: 20px;">
                        <label for="alumniName" class="form-label">Alumni Name</label>
                        <input type="text" class="form-control" id="alumniName" name="alumniName" placeholder="Your Name" required>
                    </div>
                    <div style="flex: 1;">
                        <label for="eventName" class="form-label">Event Name</label>
                        <select class="form-select" id="eventName" name="eventName" required>
                            <option value="">Select Event</option>
                            <c:forEach var="event" items="${evl}">
                                <option value="${event.getEid()}">${event.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label for="feedbackDetails" class="form-label">Feedback Details</label>
                    <textarea class="form-control" id="feedbackDetails" name="feedbackDetails" rows="4" placeholder="Enter your feedback here..."></textarea>
                </div>

               <div class="form-group">
    <label for="rating">Rating</label>
    <div class="rating">
        <input type="radio" id="star5" name="rating" value="5" />
        <label for="star5" title="5 stars">&#9733;</label>
        <input type="radio" id="star4" name="rating" value="4" />
        <label for="star4" title="4 stars">&#9733;</label>
        <input type="radio" id="star3" name="rating" value="3" />
        <label for="star3" title="3 stars">&#9733;</label>
        <input type="radio" id="star2" name="rating" value="2" />
        <label for="star2" title="2 stars">&#9733;</label>
        <input type="radio" id="star1" name="rating" value="1" />
        <label for="star1" title="1 star">&#9733;</label>
    </div>
</div>


                <button type="submit" class="btn btn-primary mt-4 w-30">Submit Feedback</button>
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
