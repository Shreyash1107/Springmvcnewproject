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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <link href="<c:url value='/resources/CSS/department.css' />" rel="stylesheet" />
    <script src="<c:url value='/resources/JS/Validatealumni.js' />"></script>
    <!-- DataTables CSS -->
    <link href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.min.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
        <h4 class="text-center">Update Alumni</h4>
        <!-- Form for Updating Alumni -->
        <form name="frm" action="finalupdatealumni" method="POST" onsubmit="return validateForm()">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputaid">Aid</label>
                            <input type="text" class="form-control" id="inputaid" name="Aid" readonly value="${aid}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputname">Name</label>
                            <input type="text" class="form-control" id="inputname" name="Name" placeholder="Enter Alumni Name" autocomplete="off" value="${name}">
                            <div id="nameError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputemail">Email</label>
                            <input type="email" class="form-control" id="inputemail" name="Email" placeholder="Enter Alumni Email" autocomplete="off" value="${email}">
                            <div id="emailError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputcontact">Contact</label>
                            <input type="text" class="form-control" id="inputcontact" name="Contact" placeholder="Enter Alumni Contact" autocomplete="off" value="${Contact}">
                            <div id="contactError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputage">Age</label>
                            <input type="number" class="form-control" id="inputage" name="Age" placeholder="Enter Alumni Age" autocomplete="off" value="${Age}">
                            <div id="ageError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="inputcompany">Company</label>
                            <input type="text" class="form-control" id="inputcompany" name="Company" placeholder="Enter Alumni Company" autocomplete="off" value="${Company}">
                            <div id="companyError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="gend">Gender</label>
                            <select class="form-control" id="gend" name="Gender">
                                <option value="">Select Gender</option>
                                <option value="Male" ${Gender == 'Male' ? 'selected' : ''}>Male</option>
                                <option value="Female" ${Gender == 'Female' ? 'selected' : ''}>Female</option>
                            </select>
                            <div id="genderError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="deptSelect">Department</label>
                            <select class="form-control" id="deptSelect" name="dept_id">
                                <option value="">Select Department</option>
                                <c:forEach var="dept" items="${deptname}">
                                    <option value="${dept.dept_id}" ${dept.dept_id == dept_id ? 'selected' : ''}>
                                        ${dept.dept_name}
                                    </option>
                                </c:forEach>
                            </select>
                            <div id="deptError" class="text-danger"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group mt-4">
                            <label for="batchselect">Passout-Batch</label>
                            <select class="form-control" id="batchselect" name="Bid">
                                <option value="">Select Batch</option>
                                <c:forEach var="btyear" items="${b}">
                                    <option value="${btyear.getBid()}" ${btyear.getBid() == Bid ? 'selected' : ''}>
                                        ${btyear.getBatch_year()}
                                    </option>
                                </c:forEach>
                            </select>
                            <div id="batchError" class="text-danger"></div>
                        </div>
                    </div>
                </div>
                <div class="form-group mt-4 text-center">
                    <button type="submit" class="btn btn-info">Update Alumni</button>
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
                            <th scope="col" class="text-center">Aid</th>
                            <th scope="col" class="text-center">Name</th>
                            <th scope="col" class="text-center">Email</th>
                            <th scope="col" class="text-center">Contact</th>
                            <th scope="col" class="text-center">Age</th>
                            <th scope="col" class="text-center">Company</th>
                            <th scope="col" class="text-center">Gender</th>
                            <th scope="col" class="text-center">Dept_id</th>
                            <th scope="col" class="text-center">Bid</th>
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
                                <td>${alumni.getDept_id()}</td>
                                <td>${alumni.getBid()}</td>
                                <td>
                                    <a href="updatealumni?aid=${alumni.getAid()}&name=${alumni.getName()}&email=${alumni.getEmail()}&contact=${alumni.getContact()}&age=${alumni.getAge()}&company=${alumni.getCompany()}&gender=${alumni.getGender()}&bid=${alumni.getBid()}&dept_id=${alumni.getDept_id()}" class="btn btn-warning" role="button">Update</a>
                                </td>
                                <td>
                                    <a href="del?aid=${alumni.getAid()}" class="btn btn-danger" role="button">Delete</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap and jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.min.js"></script>
    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.min.js"></script>
    <script>
        $(document).ready(function() {
            $('#data').DataTable({
                "paging": true,
                "searching": true,
                "info": false
            });
        });
    </script>
</body>
</html>
