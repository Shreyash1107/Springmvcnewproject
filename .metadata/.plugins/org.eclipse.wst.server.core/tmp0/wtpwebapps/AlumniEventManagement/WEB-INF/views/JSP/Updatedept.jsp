<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<!-- Bootstrap CSS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/resources/CSS/updatedept.css' />" rel="stylesheet" />
<script src="resources/JS/pagination.js"></script>
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
		<a href="department">Department Module</a> <a href="btchmodel">Batch Module</a> <a href="alumni">Alumni Module</a>
		<a href="#">Event Module</a> <a href="#">Feedback Module</a><a href="logout">Log out</a>
	</div>

	<!-- Main Content -->
	<div class="content">
	<h4 class="text-center">Update Department Module</h4>
		<form name="frm" id="frm" action="finalupdate" method="POST">
			<div class="form-group mt-4">
				<label for="exampleInputid">Department ID</label>
				<input type="text" class="form-control mt-2" id="exampleInputid" name="dept_id" value="${deptid}" readonly placeholder="Dept Id">
			</div>
			<div class="form-group mt-4">
				<label for="txtBatch">Department Name</label>
				<input type="text" name="dept_name" id="txtBatch" class="form-control" value="${deptname}" placeholder="Enter Department" onkeyup="validateBatch()" autocomplete="off">
				<small id="s" class="form-text text-muted"></small>
			</div>
			<div class="form-group d-flex justify-content-center mt-4">
				<input type='submit' name='s' id="btn" value='Update Department' class="btn btn-info px-5 py-2 font-weight-bold"/>
			</div>
		</form>
		<c:if test="${not empty m}">
			<div class="alert alert-primary mt-4">${m}</div>
		</c:if>
		<div class="col-md-12 mt-5">
            <table id="data" class="table table-striped table-dark">
                <thead>
                    <tr>
                        <th scope="col">Deptid</th>
                        <th scope="col">Dept Name</th>
                        <th scope="col">Update</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="batch" items="${v}">
                        <tr>
                            <td>${batch.dept_id}</td>
                            <td>${batch.dept_name}</td>
                            <td><a href="update?dept_id=${batch.dept_id}&dept_name=${batch.dept_name}" class="btn btn-warning" role="button">Update</a></td>
                            <td><a href="delete?dept_id=${batch.dept_id}" class="btn btn-danger" role="button">Delete</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- Pagination Buttons -->
            <div id="nav" class="pagination-container d-flex justify content center"></div>
        </div>
	</div>
	<!-- Bootstrap JS -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
