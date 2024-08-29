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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value='/resources/CSS/Adddept.css' />"
	rel="stylesheet" />
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
		<a href="addview">Department Module</a> <a href="btchmodel">Batch
			Module</a> <a href="alumni">Alumni Module</a> <a href="#">Event Module</a> <a
			href="#">Feedback Module</a><a href="logout">Log out</a>
	</div>

	<!-- Main Content -->
	<div class="content">
		<h4 class="text-center">Department Module</h4>
		<div class="container-fluid">
			<a class="btn btn-success" href="adddept" role="button">Add
				Department</a> <a class="btn btn-warning" href="viewdept" role="button">View
				Department</a>
		</div>
		<form name="frm" action="savedept" method="GET">
			<div class="form-group mt-4">
				<label for="exampleInputdept">Department Name</label> <input
					type="text" class="form-control mt-4" id="exampleInputdept"
					name="dept_name" aria-describedby="deptname"
					placeholder="Enter Department" autocomplete="off">
			</div>
			<div class="form-group-center mt-4">
				<button type="submit" class="btn btn-info">Add Department</button>
			</div>
		</form>
		<c:if test="${not empty dept}">
				<div class="alert alert-warning mt-4">${dept}</div>
			</c:if>
	</div>
	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
