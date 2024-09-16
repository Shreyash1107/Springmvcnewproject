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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
		<form name="frm" action="finalupdatealumni" method="GET" class="mt-4" onsubmit="return validateForm()">

			<div class="row g-3">
				<!-- Alumni ID Field (Hidden) -->
				<input type="hidden" class="form-control" name="Aid" value="${aid}" readonly>

				<!-- Name Field -->
				<div class="col-md-3">
					<label for="inputname" class="form-label">Name</label>
					<input type="text" class="form-control" id="inputname" name="Name" value="${name}" placeholder="Enter Alumni Name" autocomplete="off" onkeyup="validateName()">
					<span id="nameError" class="error-message text-danger"></span>
				</div>

				<!-- Email Field -->
				<div class="col-md-3">
					<label for="inputemail" class="form-label">Email</label>
					<input type="email" class="form-control" id="inputemail" name="Email" value="${email}" placeholder="Enter Alumni Email" autocomplete="off" onkeyup="validateEmail()">
					<span id="emailError" class="error-message text-danger"></span>
				</div>

				<!-- Contact Field -->
				<div class="col-md-3">
					<label for="inputcontact" class="form-label">Contact</label>
					<input type="text" class="form-control" id="inputcontact" name="Contact" value="${Contact}" placeholder="Enter Alumni Contact" autocomplete="off" onkeyup="validateContact()">
					<span id="contactError" class="error-message text-danger"></span>
				</div>

				<!-- Age Field -->
				<div class="col-md-3">
					<label for="inputage" class="form-label">Age</label>
					<input type="number" class="form-control" id="inputage" name="Age" value="${Age}" placeholder="Enter Alumni Age" autocomplete="off" onkeyup="validateAge()">
					<span id="ageError" class="error-message text-danger"></span>
				</div>

				<!-- Company Field -->
				<div class="col-md-3">
					<label for="inputcompany" class="form-label">Company</label>
					<input type="text" class="form-control" id="inputcompany" name="Company" value="${Company}" placeholder="Enter Alumni Company" autocomplete="off" onkeyup="validateCompany()">
					<span id="companyError" class="error-message text-danger"></span>
				</div>

				<!-- Gender Dropdown -->
				<div class="col-md-3">
					<label for="gend" class="form-label">Gender</label>
					<select class="form-control" id="gend" name="Gender" onchange="validateGender()">
						<option value="">Select Gender</option>
						<option value="Male" ${Gender == 'Male' ? 'selected' : ''}>Male</option>
						<option value="Female" ${Gender == 'Female' ? 'selected' : ''}>Female</option>
					</select>
					<span id="genderError" class="error-message text-danger"></span>
				</div>

				<!-- Department Dropdown -->
				<div class="col-md-3">
					<label for="deptSelect" class="form-label">Department</label>
					<select class="form-control" id="deptSelect" name="dept_id" onchange="validateDept()">
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
					<select class="form-control" id="batchselect" name="Bid" onchange="validateBatch()">
						<option value="">Select Batch</option>
						<c:forEach var="btyear" items="${b}">
							<option value="${btyear.getBid()}" ${btyear.getBid() == Bid ? 'selected' : ''}>${btyear.getBatch_year()}</option>
						</c:forEach>
					</select>
					<span id="batchError" class="error-message text-danger"></span>
				</div>

				<!-- Update Button -->
				<div class="col-md-12 text-center">
					<button type="submit" class="btn btn-info" onsubmit="return validateForm()">Update Alumni</button>
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
					<c:set var="counter" value="1" />
						<c:forEach var="alumni" items="${al}">
							<tr>
								<td>${counter}</td>
								<td>${alumni.getName()}</td>
								<td>${alumni.getEmail()}</td>
								<td>${alumni.getContact()}</td>
								<td>${alumni.getAge()}</td>
								<td>${alumni.getCompany()}</td>
								<td>${alumni.getGender()}</td>
								<td>${alumni.getdeptmodel().getDept_name()}</td>
								<td>${alumni.getbatchmodel().getBatch_year()}</td>
								<td><a href="javascript:void(0);" class="btn btn-warning"
									onclick="confirmUpdate(${alumni.getAid()}, '${alumni.getName()}', '${alumni.getEmail()}', '${alumni.getContact()}', ${alumni.getAge()}, '${alumni.getCompany()}', '${alumni.getGender()}', '${alumni.getdeptmodel().getDept_id()}', '${alumni.getbatchmodel().getBid()}')"><i class="fas fa-pencil-alt"></i></a>
								</td>
								<td><a href="javascript:void(0);" class="btn btn-danger"
									onclick="confirmDelete(${alumni.getAid()})"><i
										class="fas fa-trash"></i></a></td>
							</tr>
							<c:set var="counter" value="${counter + 1}" />
						</c:forEach>
					</tbody>
				</table>
			</div>
		</c:if>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
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
		<script>
		function validateAge() {
		    var age = document.forms["frm"]["Age"].value;
		    var ageError = document.getElementById("ageError");
		    if (age === "") {
		        ageError.innerHTML = "Age is required.";
		        return false;
		    }
		    if (isNaN(age) || age < 18 || age > 100) {
		        ageError.innerHTML = "Age must be a number between 18 and 100.";
		        return false;
		    }
		    ageError.innerHTML = "";
		    return true;
		}

		function validateCompany() {
		    var company = document.forms["frm"]["Company"].value;
		    var companyError = document.getElementById("companyError");
		    if (company === "") {
		        companyError.innerHTML = "Company name is required.";
		        return false;
		    }
		    companyError.innerHTML = "";
		    return true;
		}

		function validateGender() {
		    var gender = document.forms["frm"]["Gender"].value;
		    var genderError = document.getElementById("genderError");
		    if (gender === "") {
		        genderError.innerHTML = "Gender is required.";
		        return false;
		    }
		    genderError.innerHTML = "";
		    return true;
		}

		function validateDept() {
		    var dept = document.forms["frm"]["dept_id"].value;
		    var deptError = document.getElementById("deptError");
		    if (dept === "") {
		        deptError.innerHTML = "Department is required.";
		        return false;
		    }
		    deptError.innerHTML = "";
		    return true;
		}

		function validateBatch() {
		    var batch = document.forms["frm"]["Bid"].value;
		    var batchError = document.getElementById("batchError");
		    if (batch === "") {
		        batchError.innerHTML = "Passout Batch is required.";
		        return false;
		    }
		    batchError.innerHTML = "";
		    return true;
		}

		function validateForm() {
		    if (!validateName() || !validateEmail() || !validateContact() || !validateAge() || !validateCompany() || !validateGender() || !validateDept() || !validateBatch()) {
		        return false;
		    }
		    return true;
		}

		</script>
</body>
</html>