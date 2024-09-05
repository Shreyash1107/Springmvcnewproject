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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="<c:url value='/resources/CSS/department.css' />" rel="stylesheet" />
<!-- DataTables CSS -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
<!-- Custom CSS -->
<link href="resources/JS/pagination.css" rel="stylesheet" />
<script src="resources/JS/alert.js"></script>
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
		<a href="department">Department Module</a> <a href="btchmodel">Batch Module</a> <a href="alumni">Alumni Module</a> <a href="events">Event Module</a> <a href="feedbackpage">Feedback Module</a> <a href="logout">Log out</a>
	</div>
	<!-- Main Content -->
	<div class="content">
		<h4 class="text-center">Event Module</h4>
		<form name="frm" action="saveevent" method="POST">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<div class="form-group mt-4">
							<label for="inputname">Name</label> 
							<input type="text" class="form-control" id="inputname" name="Name" aria-describedby="evname" placeholder="Enter Event Name" autocomplete="off">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group mt-4">
							<label for="inputdate">Date</label> 
							<input type="date" class="form-control" id="inputdate" name="Date" aria-describedby="evdate" placeholder="Enter Event Date" autocomplete="off">
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group mt-4">
							<label for="inputtime">Time</label> 
							<input type="time" class="form-control" id="inputtime" name="Time" aria-describedby="amtime" autocomplete="off">
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-9">
						<!-- Empty column to align the button properly -->
					</div>
					<div class="col-md-12">
						<div class="form-group text-center">
							<button type="submit" class="btn btn-info text-center">Add Event</button>
						</div>
					</div>
				</div>
			</div>
		</form>
		<div class="col-md-12 mt-5">
			<div class="table-responsive">
				<table id="data" class="table table-striped table-dark text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col">Eid</th>
							<th scope="col">Name</th>
							<th scope="col">Date</th>
							<th scope="col">Time</th>
							<th scope="col">Update</th>
							<th scope="col">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="evlst" items="${e}">
							<tr>
								<td>${evlst.getEid()}</td>
								<td>${evlst.getName()}</td>
								<td>${evlst.getDate()}</td>
								<td>${evlst.getTime()}</td>
								<td><a href="updateevent?Eid=${evlst.getEid()}&Name=${evlst.getName()}&Date=${evlst.getDate()}&Time=${evlst.getTime()}" class="btn btn-warning" role="button">Update</a></td>
								<td><a href="delevent?Eid=${evlst.getEid()}" class="btn btn-danger" role="button">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div id="nav" class="pagination-container d-flex justify-content-center mt-4"></div>
			<div class="text-center mt-4">
				<a href="evreg" class="btn btn-warning">View Alumni Wise Event</a>
			</div>
		</div>		
	</div>

	<!-- DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#data').DataTable({
				"paging": true,
				"searching": true,
				"info": true,
				"lengthChange": true
			});
		});
	</script>
</body>
</html>
