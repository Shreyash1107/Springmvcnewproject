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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="<c:url value='/resources/CSS/department.css' />" rel="stylesheet" />

    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet">
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
        <h4 class="text-center">Alumni Module</h4>
        <form name="frm" action="save" method="POST">
            <div class="container">
                <!-- Form Fields -->
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputname">Name</label>
                            <input type="text" class="form-control" id="inputname" name="Name" aria-describedby="amname" placeholder="Enter Alumni Name" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputemail">Email</label>
                            <input type="email" class="form-control" id="inputemail" name="Email" aria-describedby="amemail" placeholder="Enter Alumni Email" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputcontact">Contact</label>
                            <input type="text" class="form-control" id="inputcontact" name="Contact" aria-describedby="amcontact" placeholder="Enter Alumni Contact" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputage">Age</label>
                            <input type="number" class="form-control" id="inputage" name="Age" aria-describedby="amage" placeholder="Enter Alumni Age" autocomplete="off">
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="inputcompany">Company</label>
                            <input type="text" class="form-control" id="inputcompany" name="Company" aria-describedby="amcomp" placeholder="Enter Alumni Company" autocomplete="off">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="gend">Gender</label>
                            <select class="form-control" id="gend" name="Gender">
                                <option value="">Select Gender</option>
                                <option value="Male">Male</option>
                                <option value="Female">Female</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="row mt-4">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="deptSelect">Department</label>
                            <select class="form-control" id="deptSelect" name="dept_id">
                                <option value="">Select Department</option>
                                <c:forEach var="deptname" items="${dept}">
                                    <option value="${deptname.getDept_id()}">${deptname.getDept_name()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="batchselect">Passout-Batch</label>
                            <select class="form-control" id="batchselect" name="Bid">
                                <option value="">Select Batch</option>
                                <c:forEach var="btyear" items="${b}">
                                    <option value="${btyear.getBid()}">${btyear.getBatch_year()}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="form-group mt-4 text-center">
                    <button type="submit" class="btn btn-info">Add Alumni</button>
                </div>
            </div>
        </form>

        <c:if test="${not empty fd}">
            <div class="alert alert-warning mt-4 text-center" id="message-alert">${fd}</div>
        </c:if>

        <!-- DataTable -->
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
            <div id="nav" class="pagination-container d-flex justify-content-center mt-4"></div>
        </div>

        <!-- Added Buttons -->
        <div class="text-center mt-4">
            <a href="deptalumni" class="btn btn-success">View Department Wise Alumni</a>
            <a href="batchalumni" class="btn btn-warning">View Batch Year Wise Alumni</a>
        </div>
    </div>
    
    <!-- jQuery and DataTables JS -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        $(document).ready(function () {
            $('#data').DataTable({
                pagingType: 'simple_numbers', 
                language: {
                    searchPlaceholder: "Search records"
                },
                dom: 'lfrtip'
            });
        });
    </script>
</body>
</html>
