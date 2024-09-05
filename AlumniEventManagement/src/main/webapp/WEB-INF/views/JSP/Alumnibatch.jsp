<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="<c:url value='/resources/CSS/department.css' />" rel="stylesheet" />
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin</a>
        </div>
    </nav>
    <div class="sidebar">
        <h3 class="text-center">Admin Dashboard</h3>
        <a href="department">Department Module</a>
        <a href="btchmodel">Batch Module</a>
        <a href="alumni">Alumni Module</a>
        <a href="events">Event Module</a>
        <a href="feedbackpage">Feedback Module</a>
        <a href="logout">Log out</a>
    </div>
    <div class="content">
        <h4 class="text-center">Department-wise Alumni</h4>
        <form name="frm" action="viewbatchalumni" method="POST">
            <div class="form-group row">
                <div class="col-auto">
                    <label for="batchselect">Pass-out Batch</label>
                    <select class="form-control" id="batchselect" name="batch_year" style="width: 400px;">
                        <option value="">Select Passout Year</option>
                        <c:forEach var="btchyear" items="${b}">
                            <option value="${btchyear.getBatch_year()}">${btchyear.getBatch_year()}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-auto d-flex align-items-end">
                    <button type="submit" class="btn btn-info">Show Alumni</button>
                </div>
            </div>
        </form>

        <div class="col-md-12 mt-5">
            <c:choose>
                <c:when test="${not empty c}">
                    <div class="table-responsive">
                        <table id="data" class="table table-striped table-dark text-center">
                            <thead class="thead-dark">
                                <tr>
                                    <th scope="col">Name</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Company</th>
                                    <th scope="col">Passout Year</th>
                                    <th scope="col">Gender</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="albatch" items="${c}">
                                    <tr>
                                        <td>${albatch.getName()}</td>
                                        <td>${albatch.getEmail()}</td>
                                        <td>${albatch.getCompany()}</td>
                                        <td>${albatch.getbatchmodel().getBatch_year()}</td> 
                                        <td>${albatch.getGender()}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="alert alert-info text-center" id="message-alert" role="alert">
                        No alumni found for the selected Batch. Please Add Alumni.
                    </div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#data').DataTable({
                "paging": true,    // Enable pagination
                "searching": true, // Enable searching
                "info": true,      // Show table info
                "lengthChange": true // Allow changing the number of records per page
            });
        });
    </script>
</body>
</html>
