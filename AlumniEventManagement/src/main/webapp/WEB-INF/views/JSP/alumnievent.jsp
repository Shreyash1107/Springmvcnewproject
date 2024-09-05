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
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.3/css/jquery.dataTables.min.css">
<script src="resources/JS/alert.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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
		<form name="frm" action="saveeventalumni" method="POST">
			<div class="form-group row">
				<div class="col-auto">
					<label for="deptSelect">Department</label> 
                    <select class="form-control" id="deptSelect" name="aname" style="width: 400px;">
						<option value="">Choose Alumni</option>
						<c:forEach var="amevent" items="${aml}">
							<option value="${amevent.getAid()}">${amevent.getName()}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-auto d-flex align-items-end">
					<button type="submit" class="btn btn-info">Show Events</button>
				</div>
			</div>
		</form>

		<div class="col-md-12 mt-5">
			<c:choose>
				<c:when test="${not empty al}">
					<div class="table-responsive-center">
						<table id="data" class="table table-striped table-dark text-center">
							<thead class="thead-dark">
								<tr>
									<th scope="col">Eid</th>
									<th scope="col">Event Name</th>
									<th scope="col">Alumni Name</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="event" items="${al}">
									<tr>
										<td>${event.getEid()}</td>
										<td>${event.getName()}</td>
										<td>${event.getAmodel().getName()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- Pagination will be handled by DataTables -->
				</c:when>
				<c:otherwise>
					<div class="alert alert-info text-center" id="message-alert" role="alert">No Event found for the selected Alumni, Please Add Event First</div>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<!-- Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<!-- DataTables JavaScript -->
	<script src="https://cdn.datatables.net/1.13.3/js/jquery.dataTables.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#data').DataTable({
				"paging": true, // Enable pagination
				"searching": true, // Enable search
				"info": true, // Show table info
				"lengthChange": true, // Allow changing number of records per page
				"pageLength": 10, // Default number of records per page
				"language": {
					"paginate": {
						"previous": "Previous",
						"next": "Next"
					},
					"lengthMenu": "Show _MENU_ records per page",
					"zeroRecords": "No matching records found",
					"info": "Showing page _PAGE_ of _PAGES_",
					"infoEmpty": "No records available",
					"infoFiltered": "(filtered from _MAX_ total records)"
				}
			});
		});
	</script>
</body>
</html>
