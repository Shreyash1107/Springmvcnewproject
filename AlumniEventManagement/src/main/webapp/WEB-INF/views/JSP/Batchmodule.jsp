<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Batch Module</title>
    <!-- Bootstrap CSS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/btch.css' />" rel="stylesheet" />
    <script src="resources/JS/pagination.js"></script>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
        <a href="#">Event Module</a>
        <a href="#">Feedback Module</a>
        <a href="logout">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h4 class="text-center">Batch Module</h4>

        <!-- Add Batch Form -->
        <form name="frm" action="batch" method="GET">
            <div class="form-group mt-4">
                <label for="exampleInputdept">Pass-out Batch</label>
                <input type="text" class="form-control mt-4" id="exampleInputdept" name="batch_year"
                       placeholder="Enter Passout-Batch" autocomplete="off">
            </div>
            <div class="form-group mt-2">
                <label for="deptSelect">Department</label>
                <select class="form-control mt-4" id="deptSelect" name="dept_id">
                    <option value="">Select Department</option>
                    <c:forEach var="depart" items="${d}">
                        <option value="${depart.getDept_id()}">${depart.dept_name}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group d-flex justify-content-center mt-4">
                <button type="submit" class="btn btn-info">Add Batch</button>
            </div>
        </form>

        <c:if test="${not empty batch}">
            <div class="alert alert-warning mt-4 text-center">${batch}</div>
        </c:if>

        <!-- View Batch Section -->
        <div class="col-md-12 mt-5">
            <div class="table-responsive">
                <table id="data" class="table table-striped table-dark text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Bid</th>
                            <th scope="col">Year</th>
                            <th scope="col">Dept ID</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="batch" items="${v}">
                            <tr>
                                <td>${batch.getBid()}</td>
                                <td>${batch.getBatch_year()}</td>
                                <td>${batch.getDept_id()}</td>
                                <td>
                                    <a href="updatebatches?bid=${batch.getBid()}&batch_year=${batch.getBatch_year()}&dept_id=${batch.getDept_id()}" 
                                       class="btn btn-warning" role="button">Update</a>
                                </td>
                                <td>
                                    <a href="remove?bid=${batch.getBid()}" 
                                       class="btn btn-danger" role="button">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            <!-- Centering the pagination -->
            <div id="nav" class="pagination-container d-flex justify-content-center mt-4"></div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
