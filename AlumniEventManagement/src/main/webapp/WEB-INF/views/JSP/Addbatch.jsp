<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Batch Module</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="<c:url value='/resources/CSS/addbtch.css' />"
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
		<h4 class="text-center">Batch Module</h4>
		<div class="container-fluid">
			<a class="btn btn-success" href="addbatch" role="button">Add
				Batch</a> <a class="btn btn-warning" href="view" role="button">View
				Batch</a>
		</div>
		<form name="frm" action="batch" method="GET">
			<div class="form-group mt-4">
				<label for="exampleInputdept">Pass-out Batch</label> <input
					type="text" class="form-control mt-4" id="exampleInputdept"
					name="batch_year" aria-describedby="deptname"
					placeholder="Enter Passout-Batch" autocomplete="off">
			</div>
			<div class="form-group mt-4">
				<label for="deptSelect">Department</label> <select
					class="form-control mt-4" id="deptSelect" name="dept_id">
					<option value="">Select Department</option>
					<c:forEach var="depart" items="${d}">
						<option value="${depart.getDept_id()}">${depart.dept_name}</option>
					</c:forEach>
				</select>
			</div>
			<div class="form-group-center mt-4">
				<button type="submit" class="btn btn-info">Add Batch</button>
			</div>
		</form>
		<c:if test="${not empty batch}">
					<div class="alert alert-warning mt-4">${batch}</div>
				</c:if>
	</div>
	</div>
	</div>
</body>
</html>
