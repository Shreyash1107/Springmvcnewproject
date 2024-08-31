<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Home Page</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href="<c:url value='/resources/CSS/btch.css' />" rel="stylesheet" />
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
	<h4 class="text-center">Batch Update Module</h4>
		<form name="frm" id="frm" action="finalupdatebatch" method="POST">
			<div class="form-group mt-4">
				<label for="exampleInputid">Bid</label>
				<input type="text" class="form-control mt-2" id="exampleInputid" name="bid" value="${bid}" readonly placeholder="Bid">
			</div>
			<div class="form-group mt-4">
				<label for="txtBatch">Passout Batch</label>
				<input type="text" name="batch_year" id="txtBatch" class="form-control" value="${batch_year}" placeholder="Enter Passout Batch" onkeyup="validateBatch()" autocomplete="off">
				<small id="s" class="form-text text-muted"></small>
			</div>
			<div class="form-group mt-4">
				<label for="txtBatch">Department</label>
				<input type="text" name="dept_id" id="txtBatch" class="form-control" value="${dept_id}" placeholder="Enter Department Id" onkeyup="validateBatch()" autocomplete="off">
				<small id="s" class="form-text text-muted"></small>
			</div>
			<div class="form-group d-flex justify-content-center mt-4">
				<input type='submit' name='s' id="btn" value='Update Batch' class="btn btn-info px-5 py-2 font-weight-bold"/>
			</div>
		</form>
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
