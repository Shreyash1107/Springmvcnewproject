<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Module</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/department.css' />" rel="stylesheet" />
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
        <a href="<c:url value='/department' />">Department Module</a>
        <a href="<c:url value='/btchmodel' />">Batch Module</a>
        <a href="<c:url value='/alumni' />">Alumni Module</a>
        <a href="<c:url value='/events' />">Event Module</a>
        <a href="<c:url value='/feedbackpage' />">Feedback Module</a>
        <a href="<c:url value='/logout' />">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h4 class="text-center">Department Module</h4>
        
        <!-- Form for Adding Department -->
        <form name="frm" action="<c:url value='/department' />" method="POST" class="mt-4" onsubmit="return validateDeptName()">
            <div class="row g-3">
                <div class="col-md-4">
                    <label for="exampleInputdept" class="form-label">Department Name</label>
                    <input type="text" class="form-control" id="txtDept" name="dept_name" placeholder="Enter Department" autocomplete="off">
                    <span id="deptError" class="text-danger"></span> <!-- Error Message Element -->
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-info">Add Department</button>
                </div>
            </div>
        </form>

        <!-- Message Display -->
        <c:if test="${not empty message}">
            <div class="alert alert-primary mt-4 text-center" id="message-alert">${message}</div>
        </c:if>

        <!-- Department List Table -->
        <div class="col-md-12 mt-5">
            <table id="data" class="table table-striped table-dark text-center">
                <thead>
                    <tr>
                        <th scope="col">Sr. No</th>
                        <th scope="col">Department</th>
                        <th scope="col">Update</th>
                        <th scope="col">Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dept" items="${deptlist}">
                        <tr>
                            <td>${dept.dept_id}</td>
                            <td>${dept.dept_name}</td>
                            <td>
                                <a href="javascript:void(0);" 
                                   class="btn btn-warning" 
                                   onclick="confirmUpdate(${dept.dept_id}, '${dept.dept_name}')">Update</a>
                            </td>
                            <td>
                                <a href="javascript:void(0);" 
                                   class="btn btn-danger" 
                                   onclick="confirmDelete(${dept.dept_id})">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <!-- Pagination Buttons -->
            <div id="nav" class="pagination-container d-flex justify-content-center mt-4"></div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/resources/JS/Confirmation.js' />"></script>
    <script src="<c:url value='/resources/JS/Validatedept.js' />"></script>
    <script src="<c:url value='/resources/JS/alert.js' />"></script>
    <script src="<c:url value='/resources/JS/pagination.js' />"></script>
</body>
</html>
