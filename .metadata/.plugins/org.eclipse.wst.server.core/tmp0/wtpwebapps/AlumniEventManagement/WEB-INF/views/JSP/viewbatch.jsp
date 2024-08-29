<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="<c:url value='/resources/CSS/viewdept.css' />" rel="stylesheet" />
<script src="resources/JS/pagination.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Admin</a>
        </div>
    </nav>
    <div class="sidebar">
        <h3 class="text-center">Admin Dashboard</h3>
        <a href="addview">Department Module</a> <a href="btchmodel">Batch Module</a><a href="alumni">Alumni Module</a> <a href="#">Event Module</a>
        <a href="#">Feedback Module</a><a href="logout">Log out</a>
    </div>
    <div class="content">
    <h4 class="text-center">Batch Module</h4>
        <div class="container-fluid">
        <div class="container-fluid">
            <a class="btn btn-success" href="addbatch" role="button">Add Batch</a> 
            <a class="btn btn-warning" href="viewdept" role="button">View Batch</a>
        </div>
        </div>
        <div class="col-md-12 mt-5">
            <table id="data" class="table table-striped table-dark">
                <thead class="thead">
                    <tr>
                        <th scope="col">Bid</th>
                        <th scope="col">Year</th>
                        <th scope="col">deptid</th>
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
                            <td><a href="updatebatches?bid=${batch.getBid()}&batch_year=${batch.getBatch_year()}&dept_id=${batch.getDept_id()}" class="btn btn-success" role="button">Update</a></td>
                            <td><a href="remove?bid=${batch.getBid()}" class="btn btn-danger" role="button">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <div id="nav" class="pagination-container"></div>
        </div>
    </div>
</body>
</html>