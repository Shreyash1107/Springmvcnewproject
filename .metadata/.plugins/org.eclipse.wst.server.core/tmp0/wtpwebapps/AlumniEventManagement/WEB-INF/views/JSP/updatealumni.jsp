<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Alumni</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value='/resources/CSS/alumni.css' />"
	rel="stylesheet" />
<script src="<c:url value='/resources/JS/Validatealumni.js' />"></script>
<script src="<c:url value='/resources/JS/alert.js' />"></script>
<link
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"
	rel="stylesheet">
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
		<a href="department">Department Module</a> 
		<a href="btchmodel">Batch Module</a> 
		<a href="alumni">Alumni Module</a> 
		<a href="events">Event Module</a> 
		<a href="feedbackpage">Feedback Module</a> 
		<a href="logout">Log out</a>
	</div>

	<!-- Main Content -->
	<div class="content">
		<h4 class="text-center">Update Alumni</h4>

		<!-- Form for Updating Alumni -->
		<form name="frm" action="finalupdatealumni" method="POST" class="mt-4"
			onsubmit="return validateForm()">
			<div class="row g-3">
				<!-- Alumni ID Field (Hidden) -->
				<input type="hidden" class="form-control" name="Aid" value="${aid}" readonly>

				<!-- Name Field -->
				<div class="col-md-3">
					<label for="inputname" class="form-label">Name</label>
					<input type="text" class="form-control" id="inputname" name="Name" value="${name}" placeholder="Enter Alumni Name" autocomplete="off">
					<span id="nameError" class="error-message text-danger"></span>
				</div>

				<!-- Email Field -->
				<div class="col-md-3">
					<label for="inputemail" class="form-label">Email</label>
					<input type="email" class="form-control" id="inputemail" name="Email" value="${email}" placeholder="Enter Alumni Email" autocomplete="off">
					<span id="emailError" class="error-message text-danger"></span>
				</div>

				<!-- Contact Field -->
				<div class="col-md-3">
					<label for="inputcontact" class="form-label">Contact</label>
					<input type="text" class="form-control" id="inputcontact" name="Contact" value="${Contact}" placeholder="Enter Alumni Contact" autocomplete="off">
					<span id="contactError" class="error-message text-danger"></span>
				</div>

				<!-- Age Field -->
				<div class="col-md-3">
					<label for="inputage" class="form-label">Age</label>
					<input type="number" class="form-control" id="inputage" name="Age" value="${Age}" placeholder="Enter Alumni Age" autocomplete="off">
					<span id="ageError" class="error-message text-danger"></span>
				</div>

				<!-- Company Field -->
				<div class="col-md-3">
					<label for="inputcompany" class="form-label">Company</label>
					<input type="text" class="form-control" id="inputcompany" name="Company" value="${Company}" placeholder="Enter Alumni Company" autocomplete="off">
					<span id="companyError" class="error-message text-danger"></span>
				</div>

				<!-- Gender Dropdown -->
				<div class="col-md-3">
					<label for="gend" class="form-label">Gender</label>
					<select class="form-control" id="gend" name="Gender">
						<option value="">Select Gender</option>
						<option value="Male" ${Gender == 'Male' ? 'selected' : ''}>Male</option>
						<option value="Female" ${Gender == 'Female' ? 'selected' : ''}>Female</option>
					</select>
					<span id="genderError" class="error-message text-danger"></span>
				</div>

				<!-- Department Dropdown -->
				<div class="col-md-3">
					<label for="deptSelect" class="form-label">Department</label>
					<select class="form-control" id="deptSelect" name="dept_id">
						<option value="">Select Department</option>
						<c:forEach var="dept" items="${deptname}">
							<option value="${dept.dept_id}" ${dept.dept_id == dept_id ? 'selected' : ''}>${dept.dept_name}</option>
						</c:forEach>
					</select>
					<span id="deptError" class="error-message text-danger"></span>
				</div>

				<!-- Passout Batch Dropdown -->
				<div class="col-md-3">
					<label for="batchselect" class="form-label">Passout Batch</label>
					<select class="form-control" id="batchselect" name="Bid">
						<option value="">Select Batch</option>
						<c:forEach var="btyear" items="${b}">
							<option value="${btyear.getBid()}" ${btyear.getBid() == Bid ? 'selected' : ''}>${btyear.getBatch_year()}</option>
						</c:forEach>
					</select>
					<span id="batchError" class="error-message text-danger"></span>
				</div>

				<!-- Update Button -->
				<div class="col-md-12 text-center">
					<button type="submit" class="btn btn-info">Update Alumni</button>
				</div>
			</div>
		</form>

		<!-- Message Display -->
		<c:choose>
			<c:when test="${not empty error}">
				<div class="alert alert-warning mt-4 text-center" id="message-alert">${error}</div>
			</c:when>
			<c:when test="${not empty success}">
				<div class="alert alert-success mt-4 text-center" id="message-alert">${success}</div>
			</c:when>
		</c:choose>

		<!-- Alumni Table -->
		<c:if test="${not empty success}">
			<div class="col-md-12 mt-5">
				<table id="data" class="table table-striped table-dark text-center">
					<thead>
						<tr>
							<th scope="col" class="text-center">Aid</th>
							<th scope="col" class="text-center">Name</th>
							<th scope="col" class="text-center">Email</th>
							<th scope="col" class="text-center">Contact</th>
							<th scope="col" class="text-center">Age</th>
							<th scope="col" class="text-center">Company</th>
							<th scope="col" class="text-center">Gender</th>
							<th scope="col" class="text-center">Department</th>
							<th scope="col" class="text-center">Passout-Year</th>
							<th scope="col" class="text-center">Update</th>
							<th scope="col" class="text-center">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="alumni" items="${al}">
							<tr>
								<td>${alumni.getAid()}</td>
								<td>${alumni.getName()}</td>
								<td>${alumni.getEmail()}</td>
								<td>${alumni.getContact()}</td>
								<td>${alumni.getAge()}</td>
								<td>${alumni.getCompany()}</td>
								<td>${alumni.getGender()}</td>
								<td>${alumni.getdeptmodel().getDept_name()}</td>
								<td>${alumni.getbatchmodel().getBatch_year()}</td>
								<td><a href="javascript:void(0);" class="btn btn-warning"
									onclick="confirmUpdate(${alumni.getAid()}, '${alumni.getName()}', '${alumni.getEmail()}', '${alumni.getContact()}', ${alumni.getAge()}, '${alumni.getCompany()}', '${alumni.getGender()}', '${alumni.getdeptmodel().getDept_id()}', '${alumni.getbatchmodel().getBid()}')">Update</a>
								</td>
								<td><a href="javascript:void(0);" class="btn btn-danger"
									onclick="confirmDelete(${alumni.getAid()})">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
	<script>
			$(document).ready(function () {
				$('#data').DataTable({
					"paging": true,
					"pageLength": 10,
					"lengthChange": false,
					"searching": true
				});
			});
		</script>
	<!-- JavaScript -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    $(document).ready(function() {
        $('#data').DataTable({
            "paging": true,
            "pageLength": 10,
            "lengthChange": true,
            "searching": true
        });
    });
</script>


</body>
</html>
