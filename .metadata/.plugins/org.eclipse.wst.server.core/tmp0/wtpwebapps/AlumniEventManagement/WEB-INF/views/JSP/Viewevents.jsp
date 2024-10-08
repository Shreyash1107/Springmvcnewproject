<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin-Dashboard</title>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/Viewevents.css' />" rel="stylesheet" />
    <script src="resources/JS/pagination.js"></script>
    <script src="resources/JS/search.js"></script>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg">
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
        <h4 class="text-center">Scheduled Events</h4>
        <div class="col-md-12 mt-5">
            <div class="table-responsive">
                <table id="eventsTable" class="table table-sm table-black text-center bg-primary">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col" class="text-center">Sr. No</th>
                            <th scope="col" class="text-center">Name</th>
                            <th scope="col" class="text-center">Date</th>
                            <th scope="col" class="text-center">Time</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:set var="counter" value="1"/>
                        <c:forEach var="evlst" items="${ev}">
                            <tr>
                                <td>${counter}</td>
                                <td>${evlst.getName()}</td>
                                <td>${evlst.getDate()}</td>
                                <td>${evlst.getTime()}</td>
                            </tr>
                            <c:set var="counter" value="${counter + 1}" />
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Pagination -->
            <div id="nav" class="pagination-container d-flex justify-content-center mt-4"></div>
        </div>      
    </div>

    <!-- Initialize DataTables -->
    <script>
        $(document).ready(function() {
            $('#eventsTable').DataTable({
                paging: true,
                searching: true,
                info: false,
                language: {
                    search: "Search Events:"
                }
            });

            // Custom search function
            $('#searchInput').on('keyup', function() {
                $('#eventsTable').DataTable().search(this.value).draw();
            });
        });
    </script>
</body>
</html>
