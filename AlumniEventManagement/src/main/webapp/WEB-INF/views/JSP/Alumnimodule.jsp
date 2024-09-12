<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Alumni Module</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="<c:url value='/resources/CSS/department.css' />"
	rel="stylesheet" />
<script src="<c:url value='/resources/JS/Validatealumni.js' />"></script>
<script src="<c:url value='/resources/JS/alert.js' />"></script>
<script src="<c:url value='/resources/JS/ConfirmAlumni.js' />"></script>
<!-- DataTables CSS -->
<link
	href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css"
	rel="stylesheet">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Admin</a>
		</div>
	</nav>
	<div class="sidebar">
		<h3 class="text-center">Admin Dashboard</h3>
		<a href="department">Department Module</a> <a href="btchmodel">Batch
			Module</a> <a href="alumni">Alumni Module</a> <a href="events">Event
			Module</a> <a href="feedbackpage">Feedback Module</a> <a href="logout">Log
			out</a>
	</div>
	<div class="content">
		<h4 class="text-center mt-4">Alumni Module</h4>
		<form name="frm" action="save" method="POST"
			onsubmit="return validateForm()">
			<div class="container">
				<!-- Form Fields -->
				<div class="row">
					<div class="col-md-6">
						<div class="form-group mt-4">
							<label for="inputname">Name</label> <input type="text"
								class="form-control" id="inputname" name="Name"
								placeholder="Enter Alumni Name" autocomplete="off">
							<div id="nameError" class="text-danger"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group mt-4">
							<label for="inputemail">Email</label> <input type="email"
								class="form-control" id="inputemail" name="Email"
								placeholder="Enter Alumni Email" autocomplete="off">
							<div id="emailError" class="text-danger"></div>
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-6">
						<div class="form-group">
							<label for="inputcontact">Contact</label> <input type="text"
								class="form-control" id="inputcontact" name="Contact"
								placeholder="Enter Alumni Contact" autocomplete="off">
							<div id="contactError" class="text-danger"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="inputage">Age</label> <input type="number"
								class="form-control" id="inputage" name="Age"
								placeholder="Enter Alumni Age" autocomplete="off">
							<div id="ageError" class="text-danger"></div>
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-6">
						<div class="form-group">
							<label for="inputcompany">Company</label> <input type="text"
								class="form-control" id="inputcompany" name="Company"
								placeholder="Enter Alumni Company" autocomplete="off">
							<div id="companyError" class="text-danger"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="gend">Gender</label> <select class="form-control"
								id="gend" name="Gender">
								<option value="">Select Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
							</select>
							<div id="genderError" class="text-danger"></div>
						</div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col-md-6">
						<div class="form-group">
							<label for="deptSelect">Department</label> <select
								class="form-control" id="deptSelect" name="dept_id">
								<option value="">Select Department</option>
								<c:forEach var="deptname" items="${dept}">
									<option value="${deptname.getDept_id()}">${deptname.getDept_name()}</option>
								</c:forEach>
							</select>
							<div id="deptError" class="text-danger"></div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="form-group">
							<label for="batchselect">Passout-Batch</label> <select
								class="form-control" id="batchselect" name="Bid">
								<option value="">Select Batch</option>
								<c:forEach var="btyear" items="${b}">
									<option value="${btyear.getBid()}">${btyear.getBatch_year()}</option>
								</c:forEach>
							</select>
							<div id="batchError" class="text-danger"></div>
						</div>
					</div>
				</div>
				<div class="form-group mt-4 text-center">
					<button type="submit" class="btn btn-info" onclick="validateName()">Add
						Alumni</button>
				</div>
			</div>
		</form>

		<c:if test="${not empty a}">
			<div class="alert alert-primary mt-4 text-center" id="message-alert">${a}</div>
		</c:if>

		<c:if test="${not empty error}">
			<div class="alert alert-danger mt-4 text-center" id="message-alert">${error}</div>
		</c:if>

		<!-- DataTable -->
		<div class="container mt-5">
			<div class="table-responsive">
				<table id="data" class="table table-striped table-dark text-center">
					<thead class="thead-dark">
						<tr>
							<th scope="col" class="text-center p-6">Sr. No</th>
							<th scope="col" class="text-center p-6">Name</th>
							<th scope="col" class="text-center p-6">Email</th>
							<th scope="col" class="text-center p-6">Contact</th>
							<th scope="col" class="text-center p-6">Age</th>
							<th scope="col" class="text-center p-6">Company</th>
							<th scope="col" class="text-center p-6">Gender</th>
							<th scope="col" class="text-center p-6">Department</th>
							<th scope="col" class="text-center p-6">Passout-Year</th>
							<th scope="col" class="text-center p-6">Update</th>
							<th scope="col" class="text-center p-6">Delete</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="alumni" items="${al}">
							<tr>
								<td class="p-6">${alumni.getAid()}</td>
								<td class="p-6">${alumni.getName()}</td>
								<td class="p-6">${alumni.getEmail()}</td>
								<td class="p-6">${alumni.getContact()}</td>
								<td class="p-6">${alumni.getAge()}</td>
								<td class="p-6">${alumni.getCompany()}</td>
								<td class="p-6">${alumni.getGender()}</td>
								<td class="p-6">${alumni.getdeptmodel().getDept_name()}</td>
								<td class="p-6">${alumni.getbatchmodel().getBatch_year()}</td>
								<td><a href="javascript:void(0);" class="btn btn-warning" onclick="confirmUpdate(${alumni.getAid()}, '${alumni.getName()}', '${alumni.getEmail()}', '${alumni.getContact()}', ${alumni.getAge()}, '${alumni.getCompany()}', '${alumni.getGender()}', '${alumni.getdeptmodel().getDept_id()}', '${alumni.getbatchmodel().getBid()}')">Update</a></td>
								<td><a href="javascript:void(0);" class="btn btn-danger" onclick="confirmDelete(${alumni.getAid()})">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<!-- jQuery and DataTables JS -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
		<script>
			$(document).ready(function () {
				$('#data').DataTable({
					"paging": true,
					"pageLength": 10,
					"lengthChange": true,
					"searching": true
				});
			});
		</script>
		<!-- Bootstrap JS -->
		<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
	</div>
</body>
</html>
