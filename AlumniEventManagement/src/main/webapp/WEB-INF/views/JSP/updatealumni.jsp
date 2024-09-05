<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- DataTables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script src="resources/JS/alert.js"></script>
    <link href="<c:url value='/resources/CSS/department.css' />" rel="stylesheet" />
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark">
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
        <h4 class="text-center mt-4">Alumni Module</h4>
        <form name="frm" action="finalupdatealumni" method="POST">
            <div class="container">
                <!-- Form Fields Here -->
                <!-- ... -->
                <div class="row mt-2">
                    <div class="col-md-6">
                        <div class="form-group mt-2">
                            <label for="txtDept">Department</label>
                            <select name="dept_id" id="txtDept" class="form-control mt-2" autocomplete="off">
                                <option value="">Select Department</option>
                                <c:forEach var="department" items="${deptname}">
                                    <option value="${department.getDept_id()}"
                                        <c:if test="${department.getDept_id() == dept_id}">selected</c:if>>
                                        ${department.getDept_name()}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6 d-flex align-items-end">
                        <button type="submit" class="btn btn-info mt-4 w-50">Update Alumni</button>
                    </div>
                </div>
            </div>
        </form>
        <div class="col-md-12 mt-5">
            <div class="table-responsive">
                <table id="data" class="table table-striped table-dark text-center">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">Aid</th>
                            <th scope="col">Name</th>
                            <th scope="col">Email</th>
                            <th scope="col">Contact</th>
                            <th scope="col">Age</th>
                            <th scope="col">Company</th>
                            <th scope="col">Gender</th>
                            <th scope="col">Dept_id</th>
                            <th scope="col">Bid</th>
                            <th scope="col">Update</th>
                            <th scope="col">Delete</th>
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
                                <td>${alumni.getDept_id()}</td>
                                <td>${alumni.getBid()}</td>
                                <td><a href="updatealumni?aid=${alumni.getAid()}&name=${alumni.getName()}&email=${alumni.getEmail()}&Contact=${alumni.getContact()}&Age=${alumni.getAge()}&Company=${alumni.getCompany()}&Gender=${alumni.getGender()}&Bid=${alumni.getBid()}&dept_id=${alumni.getDept_id()}" class="btn btn-warning" role="button">Update</a></td>
                                <td><a href="del?aid=${alumni.getAid()}" class="btn btn-danger" role="button">Delete</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Initialize DataTables -->
    <script>
        $(document).ready(function() {
            $('#data').DataTable({
                "paging": true,    
                "searching": true, 
                "info": true,      
                "lengthChange": true, 
            });
        });
    </script>
</body>
</html>
