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
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/viewfeedback.css' />" rel="stylesheet" />
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin</a>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar">
        <h3 class="text-center">Admin Dashboard</h3>
        <a href="department">Department Module</a>
        <a href="btchmodel">Batch Module</a>
        <a href="alumni">Alumni Module</a>
        <a href="events">Event Module</a>
        <a href="feedbackpage">Feedback Module</a>
        <a href="logout">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <div class="container">
            <h4 class="text-center">Events Feedback</h4>
            <div class="col-md-12 mt-5">
                <div class="table-responsive">
                    <table id="dataTable" class="table table-striped table-dark text-center">
                        <thead>
                            <tr>
                                <th scope="col" class="text-center">Sr. No</th>
                                <th scope="col" class="text-center">Suggestions</th>
                                <th scope="col" class="text-center">Event-Name</th>
                                <th scope="col" class="text-center">Alumni-Name</th>
                                <th scope="col" class="text-center">Ratings</th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:set var="counter" value="1" />
                            <c:forEach var="viewfd" items="${fdview}">
                                <tr>
                                    <td>${counter}</td>
                                    <td>${viewfd.getSuggestions()}</td>
                                    <td>${viewfd.getEmodel().getName()}</td>
                                    <td>${viewfd.getName()}</td>
                                    <td>${viewfd.getRatings()}</td>
                                </tr>
                                <c:set var="counter" value="${counter + 1}" />
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>

    <script>
        $(document).ready(function() {
            // Initialize the DataTable with pagination and other features
            $('#dataTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "pageLength": 10, 
                "lengthMenu": [5, 10, 25, 50] 
            });
        });
    </script>
</body>
</html>