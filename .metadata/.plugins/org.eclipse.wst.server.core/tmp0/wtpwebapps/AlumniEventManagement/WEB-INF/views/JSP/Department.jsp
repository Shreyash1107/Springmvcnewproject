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
    <script src="resources/JS/pagination.js"></script>
    <script src="resources/JS/alert.js"></script>
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
        <a href="#">Feedback Module</a>
        <a href="logout">Log out</a>
    </div>

    <!-- Main Content -->
    <div class="content">
        <h4 class="text-center">Department Module</h4>
        
        <!-- Form for Adding Department -->
        <form name="frm" action="department" method="POST" class="mt-4">
            <div class="row g-3">
                <div class="col-md-4">
                    <label for="exampleInputdept" class="form-label">Department Name</label>
                    <input type="text" class="form-control" id="exampleInputdept" name="dept_name" placeholder="Enter Department" autocomplete="off">
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-info">Add Department</button>
                </div>
            </div>
        </form>

        <!-- Message Display -->
        <c:if test="${not empty message}">
            <div class="alert alert-info mt-4 text-center" id="message-alert">${message}</div>
        </c:if>

        <!-- Department List Table -->
        <div class="col-md-12 mt-5">
            <table id="data" class="table table-striped table-dark text-center">
                <thead>
                    <tr>
                        <th scope="col">Deptid</th>
                        <th scope="col">Dept Name</th>
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
                                <a href="update?dept_id=${dept.dept_id}&dept_name=${dept.dept_name}" 
                                   class="btn btn-warning" role="button">Update</a>
                            </td>
                            <td>
                                <a href="delete?dept_id=${dept.dept_id}" 
                                   class="btn btn-danger" role="button">Delete</a>
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
</body>
</html>
