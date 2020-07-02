<%-- 
    Document   : payrolls
    Created on : 28-May-2020, 10:30:55
    Author     : SuperSoft
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div class="container">
    <div class="row">
        <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;"> 
            <div id="result"></div>


            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                <div class="card mx-1 warning-color white-text px-2">
                    <div class="d-flex align-items-center"><h5 class="bg">Employees</h5>

                        <div class="d-flex align-items-center">

                            <div id="table_export_btns" hidden></div>
                            <div class="dropdown" style="left: 640px; ">
                            </div>
                        </div>
                    </div>
                    <div>
                        <input id="lowerDate" hidden /><input id="upperDate" hidden />
                    </div>
                </div>
                <!--        <div class="row">
                          <button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div> 
                          <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addClient" id="submitClient" type="button"> <div id="spinner"></div> Add Client</button>
                                                    
                        </div>-->

                <!--        <div class="mt-2">
                            <h3 class="font-weight-light" id="cm">
                               Total Clients:
                            </h3>
                        </div>-->
                <div class="mt-3">
                    <table id="tbl_employee" class="table table-hover table-sm tbl_employees tbl_employee_download">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Designation</th>
                                <th>Grade</th>
                                <th>Department</th>
                                <th>Phone Number</th>
                                <th>Email</th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th>Action</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${employee.length() > 0}">
                                    <c:forEach var="i" begin="0" end="${employee.length() - 1}">
                                        <tr class="add-cursor tr_${i}" id="">
                                            <td class="text-center">${i + 1}</td>
                                            <td class="m_id">${employee.getJSONObject(i).getString("firstname")}</td> 
                                            <td class="m_id">${employee.getJSONObject(i).getString("lastname")}</td> 
                                            <td>${employee.getJSONObject(i).getString("designation")}</td> 
                                            <td>${employee.getJSONObject(i).getString("grade")}</td> 
                                            <td>${employee.getJSONObject(i).getString("department")}</td> 
                                            <td class="m_creation_date">${employee.getJSONObject(i).getString("phonenumber")}</td>
                                            <td class="m_creation_date">${employee.getJSONObject(i).getString("email")}</td>
                                            <td class="d-none">${employee.getJSONObject(i).getString("id")}</td> 
                                            <td class="d-none">${employee.getJSONObject(i).getString("division")}</td> 
                                            <td class="d-none">${employee.getJSONObject(i).getString("accountnumber")}</td> 
                                            <td class="d-none">${employee.getJSONObject(i).getString("location")}</td> 
                                            <td class="d-none">${employee.getJSONObject(i).getString("bank")}</td>  
                                            <td class="d-none">${employee.getJSONObject(i).getString("datecreated")}</td> 
                                            <td class="d-none">${employee.getJSONObject(i).getString("region")}</td> 
                                            <td class="d-none">${employee.getJSONObject(i).getString("financialinstitutioncode")}</td> 
                                            <td> <button class="btn btn-sm btn-amber edit_employee"  id="edit_${i}" data-no="${i}" type="button">Edit</button></td>
                                            <td> <button class="btn btn-sm btn-amber view_employee"  id="view_${i}" data-no="${i}" type="button">More</button></td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:when test="${employee.length() <= 0}">
                                    <tr>
                                        No Employee Data!
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td class="d-none"></td>
                                        <td></td>
                                        <td></td>
                                    </tr>

                                </c:when>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>




<!-- Central Modal Small -->
<div class="modal fade" id="viewEmployee" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">

    <!-- Change class .modal-sm to change the size of the modal -->
    <div class="modal-dialog modal-sm" role="document">


        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title w-100" id="myModalLabel">Employee Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <p>Location: <span id="employeeLoc"></span></p>
                </div>
                <div class="row">
                    <p>Bank: <span id="employeeB"></span></p> 
                </div>
                <div class="row">
                    <p>Account Number:  <span id="employeeAcc"></span></p>
                </div>
                <div class="row">
                    <p>Division: <span id="employeeDiv"></span></p>
                </div>
                <div class="row">
                    <p>Date Created: <span id="employeeDateCreated"></span></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary btn-sm" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Central Modal Small -->


<div class="modal fade" id="addEmployee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Employee Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>



            </div>
            <div class="modal-body">
                <!-- Beginning of Modal Body -->
                <div class="container">
                    <form class="text-center" id="addEmployeeForm" style="color: #757575;" action="#!">

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" name="fname" id="fname" class="form-control">
                                <label for="fname">First Name</label>
                                <div class="text-white" id="fname_error"></div>
                            </div>

                            <!-- Password -->
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="lname" name="lname" class="form-control">
                                <label for="lname">Last Name</label>
                                <div class="text-white" id="lname_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <input type="email" id="email" name="email" class="form-control">
                                <label for="email">Email</label>
                                <div class="text-white" id="email_error"></div>
                            </div>

                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="phonenumber" name="phonenumber" class="form-control">
                                <label for="lname">Phone Number</label>
                                <div class="text-white" id="phone_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <input type="password" id="password" name="password" class="form-control">
                                <label for="password">Password</label>
                                <div class="text-white" id="pass_error"></div>
                            </div>

                            <div class="md-form col-6 my-1 py-1">
                                <input type="number" id="accountnumber" name="accountnumber" class="form-control">
                                <label for="account">Account Number</label>
                                <div class="text-white" id="acc_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <select name="grade" id="grade" class="form-control">
                                    <option>- Select Grade -</option> 
                                    <c:choose>
                                        <c:when test="${grade.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${grade.length() - 1}"> 
                                                <option value="${grade.getJSONObject(i).getString("id")}">
                                                    ${grade.getJSONObject(i).getString("gradename")}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:when test="${grade.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="grade_error"></div>
                            </div>

                            <div class="md-form col-6 my-1 py-1">
                                <select name="department" id="department" class="form-control">
                                    <option>- Select Department -</option>
                                    <c:choose>
                                        <c:when test="${department.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${department.length() - 1}"> 
                                                <option value="${department.getJSONObject(i).getString("id")}">${department.getJSONObject(i).getString("departmentname")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${department.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="dept_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <select name="designation" id="designation" class="form-control">
                                    <option>- Select Designation -</option>
                                    <c:choose>
                                        <c:when test="${designation.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${designation.length() - 1}">
                                                <option value="${designation.getJSONObject(i).getString("id")}">${designation.getJSONObject(i).getString("designation")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${designation.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="des_error"></div>
                            </div>

                            <div class="md-form col-6 my-1 py-1">
                                <select name="region" id="region" class="form-control">
                                    <option>- Select Region -</option> 
                                    <c:choose>
                                        <c:when test="${region.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${region.length() - 1}">x
                                                <option value="${region.getJSONObject(i).getString("id")}">${region.getJSONObject(i).getString("region")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${region.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="reg_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <select name="location" id="location" class="form-control">
                                    <option>- Select Location -</option> 
                                    <c:choose>
                                        <c:when test="${location.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${location.length() - 1}">
                                                <option value="${location.getJSONObject(i).getString("id")}">${location.getJSONObject(i).getString("location")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${location.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="loc_error"></div>
                            </div>

                            <div class="md-form col-6 my-1 py-1">
                                <select name="division" id="division" class="form-control">
                                    <option>- Select Division -</option>
                                    <c:choose>
                                        <c:when test="${division.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${division.length() - 1}">
                                                <option value="${division.getJSONObject(i).getString("id")}">${division.getJSONObject(i).getString("divisionname")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${division.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="div_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <select name="leave" id="leave" class="form-control">
                                    <option>- Select Leave Type -</option> 
                                    <c:choose>
                                        <c:when test="${leave.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${leave.length() - 1}">
                                                <option value="${leave.getJSONObject(i).getString("id")}">${leave.getJSONObject(i).getString("numberofDays")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${leave.length() <= 0}">

                                        </c:when>   
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="leave_error"></div>
                            </div>


                            <div class="md-form col-md-6 my-1 py-1">
                                <select name="institution" id="institution" class="form-control" selected>
                                    <option>- Select Bank -</option>
                                    <c:choose>
                                        <c:when test="${financialinstitution.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${financialinstitution.length() - 1}">
                                                <option value="${financialinstitution.getJSONObject(i).getString("bankcode")}">${financialinstitution.getJSONObject(i).getString("bankname")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${financialinstitution.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="institution_error"></div>
                            </div>
                        </div>

                    </form>			
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="btn_create_employee">Save</button>
                <div class="success_message"></div>
            </div>
        </div>
    </div>
</div>

<!-- Editing Client Information here -->

<div class="modal fade" id="editEmployee" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>



            </div>
            <div class="modal-body">
                <!-- Beginning of Modal Body -->
                <div class="container">
                    <form class="text-center" id="editEmployeeForm" style="color: #757575;" action="#!">
                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="employeeFirstName" class="form-control">
                                <label for="First Name" id="LabelEmployeeFirstName"></label>
                                <div class="text-white" id="efirstname_error"></div>
                            </div>
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="employeeLastName" class="form-control">
                                <label for="Last Name" id="LabelEmployeeLastName"></label>
                                <div class="text-white" id="elastname_error"></div>
                            </div>
                        </div>
                        <input type="hidden" id="ID">
                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="employeeEmail" class="form-control">
                                <label for="Email" id="LabelEmployeeEmail"></label>
                                <div class="text-white" id="eemail_error"></div>
                            </div>
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="employeePhoneNumber" class="form-control">
                                <label for="Phone Number" id="LabelEmployeePhoneNumber"></label>
                                <div class="text-white" id="ephone_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-md-6 my-1 py-1">
                                <select name="division" id="employeeDivision" class="form-control">
                                    <option disabled>- Select Division -</option>
                                    <c:choose>
                                        <c:when test="${division.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${division.length() - 1}">
                                                <option value="${division.getJSONObject(i).getString("id")}">${division.getJSONObject(i).getString("divisionname")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${division.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="edivision_error"></div>
                            </div>
                            <div class="md-form col-6 my-1 py-1">
                                <input type="text" id="employeeAccountNumber" class="form-control">
                                <label for="Account Number" id="LabelEmployeeAccount"></label>
                                <div class="text-white" id="eaccount_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6 my-1 py-1">
                                <select name="department" id="employeeDepartment" class="form-control" selected>
                                    <option disabled>- Select Department -</option>
                                    <c:choose>
                                        <c:when test="${department.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${department.length() - 1}">
                                                <option value="${department.getJSONObject(i).getString("id")}">${department.getJSONObject(i).getString("departmentname")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${department.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="edepartment_error"></div>
                            </div>

                            <div class="md-form col-6 my-1 py-1">
                                <select name="employeeGrade" id="employeeGrade" class="form-control" selected>
                                    <option disabled>- Select Grade -</option>
                                    <c:choose>
                                        <c:when test="${grade.length() > 0}">
                                            <c:forEach var="j" begin="0" end="${grade.length() - 1}">
                                                <option value="${grade.getJSONObject(j).getString("id")}">
                                                    ${grade.getJSONObject(j).getString("gradename")}</option>
                                                </c:forEach>
                                            </c:when>
                                            <c:when test="${grade.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="egrade_error"></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="md-form col-md-6 my-1 py-1">
                                <select name="designation" id="employeeDesignation" class="form-control" selected>
                                    <option disabled>- Select Designation -</option>
                                    <c:choose>
                                        <c:when test="${designation.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${designation.length() - 1}">
                                                <option value="${designation.getJSONObject(i).getString("id")}">${designation.getJSONObject(i).getString("designation")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${designation.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="edesignation_error"></div>
                            </div>

                            <div class="md-form col-md-6 my-1 py-1">
                                <select name="location" id="employeeLocation" class="form-control" selected>
                                    <option disabled>- Select Location -</option>
                                    <c:choose>
                                        <c:when test="${location.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${location.length() - 1}">
                                                <option value="${location.getJSONObject(i).getString("id")}">${location.getJSONObject(i).getString("location")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${location.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="elocation_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-md-6 my-1 py-1">
                                <select name="region" id="employeeRegion" class="form-control" selected>
                                    <option disabled>- Select Region -</option>
                                    <c:choose>
                                        <c:when test="${region.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${region.length() - 1}">
                                                <option value="${region.getJSONObject(i).getString("id")}">${region.getJSONObject(i).getString("region")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${region.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="eregion_error"></div>
                            </div>


                            <div class="md-form col-md-6 my-1 py-1">
                                <select name="institution" id="employeeInstitution" class="form-control" selected>
                                    <option disabled>- Select Bank -</option>
                                    <c:choose>
                                        <c:when test="${financialinstitution.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${financialinstitution.length() - 1}">
                                                <option value="${financialinstitution.getJSONObject(i).getString("bankcode")}">${financialinstitution.getJSONObject(i).getString("bankname")}</option>
                                            </c:forEach>
                                        </c:when>
                                        <c:when test="${financialinstitution.length() <= 0}">

                                        </c:when>
                                    </c:choose>
                                </select> 
                                <div class="text-white" id="einstitution_error"></div>
                            </div>
                        </div>

                    </form>					
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="edit_employee">Save Changes</button><div id="spinner"></div>
                <div class="success_message"></div>

            </div>
        </div>
    </div>
</div>



<script>
    var gradeName = $("#employeeGrade");
    var departmentName = $("#employeeDepartment");
    var designationName = $("#employeeDesignation");
    var locationName = $("#employeeLocation");
    var regionName = $("#employeeRegion");
    var divisionName = $("#employeeDivision");
    var institutionName = $("#employeeInstitution");
    var gradeID;
    var departmentID;
    var designationID;
    var locationID;
    var regionID;
    var divisionID;
    var institutionID;


    for (let i = 0; i <${employee.length()}; i++) {
        $("#edit_" + (i)).click(function () {
            values = [];
            $(".tr_" + (i)).children().each(function () {
                var cellText = $(this).html();

                $("#employeeFirstName").val(values[1]);
                $("#employeeLastName").val(values[2]);
                $("#employeeEmail").val(values[7]);
                $("#employeePhoneNumber").val(values[6]);
    <c:choose>
        <c:when test="${department.length() > 0}">
                for (let a = 0; a <${department.length()}; a++) {
                    if (values[5] === "${department.getJSONObject(a).getString("departmentname")}") {
                        departmentID = "${department.getJSONObject(a).getString("id")}";
                    }
                }

        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${grade.length() > 0}">
                for (let j = 0; j <${grade.length()}; j++) {
                    if (values[4] === "${grade.getJSONObject(j).getString("gradename")}") {
                        gradeID = "${grade.getJSONObject(j).getString("id")}";
                    }
                }

        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${designation.length() > 0}">
                for (let b = 0; b <${designation.length()}; b++) {
                    if (values[3] === "${designation.getJSONObject(b).getString("designation")}") {
                        designationID = "${designation.getJSONObject(b).getString("id")}";
                    }
                }

        </c:when>
    </c:choose>
    <c:choose>
        <c:when test="${location.length() > 0}">
                for (let c = 0; c <${location.length()}; c++) {
                    if (values[11] === "${location.getJSONObject(c).getString("location")}") {
                        locationID = "${location.getJSONObject(c).getString("id")}";
                    }
                }

        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${division.length() > 0}">
                for (let d = 0; d <${division.length()}; d++) {
                    if (values[9] === "${division.getJSONObject(d).getString("divisionname")}") {
                        divisionID = "${division.getJSONObject(d).getString("id")}";
                        console.log("i got here: division id is " + divisionID);
                    }
                }

        </c:when>
    </c:choose>

    <c:choose>
        <c:when test="${region.length() > 0}">
                for (let e = 0; e <${region.length()}; e++) {
                    if (values[14] === "${region.getJSONObject(e).getString("region")}") {
                        regionID = "${region.getJSONObject(e).getString("id")}";

                    }
                }
        </c:when>
    </c:choose>
                console.log("i got here: region id is " + regionID);
                console.log("i got here: department id is " + departmentID);
                console.log("i got here: designation id is " + designationID);
                console.log("i got here: division id is " + divisionID);
                console.log("i got here: region id is " + locationID);
                console.log("i got here: region id is " + gradeID);
                $("#employeeDepartment").val(departmentID);
                $("#employeeGrade").val(gradeID);
                $("#employeeDesignation").val(designationID);
                $("#employeeDivision").val(divisionID);
                $("#employeeRegion").val(regionID);
                $("#employeeInstitution").val(values[15]);
                $("#employeeLocation").val(locationID);
                $("#employeeAccountNumber").val(values[10]);
                $("#employeeBank").val(values[12]);
                $("#ID").val(values[8]);
                values.push(cellText);
            });
            //console.log(values);
            $('#editEmployee').modal('show');

        });
    }

    for (let i = 0; i <${employee.length()}; i++) {
        $("#view_" + (i)).click(function () {
            values = [];
            $(".tr_" + (i)).children().each(function () {
                var cellText = $(this).html();
                $("#employeeAcc").html(values[10]);
                $("#employeeB").html(values[12]);
                $("#employeeLoc").html(values[11]);
                $("#employeeDiv").html(values[9]);
                $("#employeeDateCreated").html(values[13]);
//                   $("#username_L").html(""); 
//                   $("#username").val(values[4]).addClass("disabled");
//                   $("#role").val(values[5]);
//                   $("#id").val(values[6]);
                //$("#password").val(values[7]);
//                   $("#c_passwordDiv").hide();
//                   $("#addUser").hide();
//                   $("#editUser").show();
                values.push(cellText);
            });
            //console.log(values);
            $('#viewEmployee').modal('show');

        });
    }



    // Generating Customer Information into the invoice 
    $("#edit_employee").click(function (e) {
        let url = "${pageContext.request.contextPath}/updateEmployeeDetail";
        e.preventDefault();
        console.log("Editing in progress");
        let errorcheck = validate2();
        if (!(errorcheck.includes("error"))) {
            $("#edit_employee").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#edit_employee").html(spinner);
            let designationName = $("#employeeDesignation");
            let gradeName = $("#employeeGrade");
            let departmentName = $("#employeeDepartment");
            let firstname = $("#employeeFirstName");
            let lastname = $("#employeeLastName");
            let email = $("#employeeEmail");
            let phonenumber = $("#employeePhoneNumber");
            let accountnumber = $("#employeeAccountNumber");
            let divisionName = $("#employeeDivision");
            let regionName = $("#employeeRegion");
            let locationName = $("#employeeLocation");
            let financialInstitution = $("#employeeInstitution");
            let id = $("#ID");
            let company = ${companyCode};


            let editEmployeeData = {
                "firstname": firstname.val(),
                "lastname": lastname.val(),
                "email": email.val(),
                "phonenumber": phonenumber.val(),
                "financialinstitutioncode": financialInstitution.val(),
                "accountnumber": accountnumber.val(),
                "gradeId": gradeName.val(),
                "departmentId": departmentName.val(),
                "designationId": designationName.val(),
                "locationId": locationName.val(),
                "regionId": regionName.val(),
                "companyCode": company.toString(),
                "id": id.val(),
                "divisionId": divisionName.val()
            };
            console.log(editEmployeeData);
            $.ajax({
                type: "POST",
                dataType: "json",
                contentType: 'application/json',
                url: url,
                data: JSON.stringify(editEmployeeData),
                beforeSend: function (xhr) {
                    console.log(editEmployeeData);
                },
                success: function (data) {
                    if (data.responsecode === "00") {
                        $("#spinner").html("");
                        $(".success_message").html("Employee Updated Successfully").addClass("alert alert-success");
                        setTimeout(function () {
                            $("#editEmployee").modal('hide');
                            $(".success_message").html("");
                            $("#edit_employee").attr("disabled", false);
                            reloadPage("employee");
                        }, 3000);
                    } else {
                        $("#spinner").html("");
                        $(".success_message").html("Error: Couldn't Edit Employee: " + data.responsecode);
                    }
                },
                error: function (err) {
                    console.log(err);
                    $("#edit_employee").html("Save");
                    $("#edit_employee").attr("disabled", false);
                    $(".success_message").html("Error: Couldn't Edit Employee: " + err);
                }
            });
        }
    });



    $("#btn_create_employee").click(function (e) {
        e.preventDefault();
        let btn = $(this);
        let span = btn.children("span");
        let fname = $("#fname");
        let lname = $("#lname");
        let email = $("#email");
        let phone = $("#phonenumber");
        let acc = $("#accountnumber");
        let grade = $("#grade");
        let department = $("#department");
        let designation = $("#designation");
        let region = $("#region");
        let location = $("#location");
        let division = $("#division");
        let password = $("#password");
        let leave = $("#leave");
        let company = ${companyCode};
        let financialInstitution = $("#institution");
        let preloader = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`;
        let url3 = "${pageContext.request.contextPath}/createEmployee";
        let errorcheck1 = validate();
        if (!(errorcheck1.includes("error"))) {
            $("#btn_create_employee").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#btn_create_employee").html(spinner);

            let newEmployeeData = {
                "firstname": fname.val(),
                "lastname": lname.val(),
                "email": email.val(),
                "phonenumber": phone.val(),
                "financialinstitutioncode": financialInstitution.val(),
                "accountnumber": acc.val(),
                "gradeId": grade.val(),
                "departmentId": department.val(),
                "designationId": designation.val(),
                "locationId": location.val(),
                "regionId": region.val(),
                "companyCode": company.toString(),
                "password": password.val(),
                "leaveType": leave.val(),
                "divisionId": division.val()
            };

            $.ajax({
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json',
                url: url3,
                data: JSON.stringify(newEmployeeData),
                beforeSend: function () {
                    console.log(newEmployeeData);
                },
                success: function (data) {
                    if (data.responsecode === "00") {
                        $("#btn_create_employee").html("Create");
                        document.getElementById("addEmployeeForm").reset();
                        $("#btn_create_employee").attr("disabled", false);
                        $(".success_message").html("Employee Added Successfully").addClass("alert alert-success");
                        setTimeout(function () {
                            $("#addEmployee").modal('hide');
                            $(".success_message").html("");
                            reloadPage("employee");
                        }, 3000);
                    } else {
                        $("#btn_create_employee").html("Create");
                        $("#btn_create_employee").attr("disabled", false);
                        $(".success_message").html("Error: Couldn't Register Employee: " + data.responsecode);
                    }
                },
                error: function (err) {
                    console.log(err);
                    $("#btn_create_employee").html("Create");
                    $("#btn_create_employee").attr("disabled", false);
                    $(".success_message").html("Error: Couldn't Create Employee: " + err);
                }
            });
        }
    });


    function validate() {
        let error = [];
        let fname = $("#fname").val();
        let lname = $("#lname").val();
        let email = $("#email").val();
        let phone = $("#phonenumber").val();
        let acc = $("#accountnumber").val();
        let grade = $("#grade").val();
        let department = $("#department").val();
        let designation = $("#designation").val();
        let region = $("#region").val();
        let location = $("#location").val();
        let division = $("#division").val();
        let password = $("#password").val();
        let leave = $("leave").val();
        if ((fname === "" || fname === "undefined") && (lname === "" || lname === "undefined") && (email === "" || email === "undefined")
                && (phone === "" || phone === "undefined") && (acc === "" || acc === "undefined") && (grade === "" || grade === "undefined")
                && (department === "" || department === "undefined") && (designation === "" || designation === "undefined") && (region === "" || region === "undefined")
                && (location === "" || location === "undefined") && (division === "" || division === "undefined") && (password === "" || password === "undefined") && (leave === "" || leave === "undefined")) {
            error.push("error");
            $("#fname_error").html("Employee first name cannot be empty").addClass("bg-danger");
            $("#lname_error").html("Employee last name cannot be empty").addClass("bg-danger");
            $("#email_error").html("Employee email cannot be empty").addClass("bg-danger");
            $("#phone_error").html("Employee phonenumber cannot be empty").addClass("bg-danger");
            $("#acc_error").html("Employee account cannot be empty").addClass("bg-danger");
            $("#des_error").html("Employee designation cannot be empty").addClass("bg-danger");
            $("#dept_error").html("Employee department cannot be empty").addClass("bg-danger");
            $("#grade_error").html("Employee grade cannot be empty").addClass("bg-danger");
            $("#div_error").html("Employee division cannot be empty").addClass("bg-danger");
            $("#reg_error").html("Employee region cannot be empty").addClass("bg-danger");
            $("#loc_error").html("Employee location cannot be empty").addClass("bg-danger");
            $("#pass_error").html("Employee password cannot be empty").addClass("bg-danger");
            $("#leave_error").html("Leave Type must be selected").addClass("bg-danger");
        } else if (fname === "" || fname === "undefined") {
            error.push("error");
            $("#fname_error").html("Employee first name cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (lname === "" || lname === "undefined") {
            error.push("error");
            $("#lname_error").html("Employee last name cannot be empty").addClass("bg-danger");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (email === "" || email === "undefined") {
            error.push("error");
            $("#email_error").html("Employee email cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (phone === "" || phone === "undefined") {
            error.push("error");
            $("#phone_error").html("Employee phonenumber cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (acc === "" || acc === "undefined") {
            error.push("error");
            $("#acc_error").html("Employee account cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (designation === "" || designation === "undefined") {
            error.push("error");
            $("#des_error").html("Employee designation cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#dept_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (department === "" || department === "undefined") {
            error.push("error");
            $("#dept_error").html("Employee department cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (grade === "" || grade === "undefined") {
            error.push("error");
            $("#grade_error").html("Employee grade cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (location === "" || location === "undefined") {
            error.push("error");
            $("#loc_error").html("Employee grade cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#div_error").html("");
            $("#reg_error").html("");
            $("#grade_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (region === "" || region === "undefined") {
            error.push("error");
            $("#reg_error").html("Employee region cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#div_error").html("");
            $("#loc_error").html("");
            $("#grade_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (division === "" || division === "undefined") {
            error.push("error");
            $("#div_error").html("Employee division cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#grade_error").html("");
            $("#pass_error").html("");
            $("#leave_error").html("");
        } else if (password === "" || password === "undefined") {
            error.push("error");
            $("#pass_error").html("Employee password cannot be empty").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#leave_error").html("");
        } else if (leave === "" || leave === "undefined") {
            error.push("error");
            $("#leave_error").html("Leave Type must be selected").addClass("bg-danger");
            $("#lname_error").html("");
            $("#fname_error").html("");
            $("#email_error").html("");
            $("#phone_error").html("");
            $("#acc_error").html("");
            $("#des_error").html("");
            $("#dept_error").html("");
            $("#reg_error").html("");
            $("#loc_error").html("");
            $("#grade_error").html("");
            $("#div_error").html("");
            $("#pass_error").html("");
        }
        return error;
    }



    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/" + pagemapping;
        $.post(urlU, function (res) {
            $(".page").html(res);
        });
    }


    function validate2() {
        let error = [];
        let fname2 = $("#employeeFirstName").val();
        let lname2 = $("#employeeLastName").val();
        let email2 = $("#employeeEmail").val();
        let phone2 = $("#employeePhoneNumber").val();
        let acc2 = $("#employeeAccountNumber").val();
        let grade2 = $("#employeeGrade").val();
        let department2 = $("#employeeDepartment").val();
        let designation2 = $("#employeeDesignation").val();
        let region2 = $("#employeeRegion").val();
        let location2 = $("#employeeLocation").val();
        let division2 = $("#employeeDivision").val();
        if ((fname2 === "" || fname2 === "undefined") && (lname2 === "" || lname2 === "undefined") && (email2 === "" || email2 === "undefined")
                && (phone2 === "" || phone2 === "undefined") && (acc2 === "" || acc === "undefined") && (grade2 === "" || grade2 === "undefined")
                && (department2 === "" || department2 === "undefined") && (designation2 === "" || designation2 === "undefined") && (region2 === "" || region2 === "undefined")
                && (location2 === "" || location2 === "undefined") && (division2 === "" || division2 === "undefined")) {
            error.push("error");
            $("#efirstname_error").html("Employee first name cannot be empty").addClass("bg-danger");
            $("#elastname_error").html("Employee last name cannot be empty").addClass("bg-danger");
            $("#eemail_error").html("Employee email cannot be empty").addClass("bg-danger");
            $("#ephone_error").html("Employee phonenumber cannot be empty").addClass("bg-danger");
            $("#eaccount_error").html("Employee account cannot be empty").addClass("bg-danger");
            $("#edesignation_error").html("Employee designation cannot be empty").addClass("bg-danger");
            $("#edepartment_error").html("Employee department cannot be empty").addClass("bg-danger");
            $("#egrade_error").html("Employee grade cannot be empty").addClass("bg-danger");
            $("#edivision_error").html("Employee division cannot be empty").addClass("bg-danger");
            $("#eregion_error").html("Employee region cannot be empty").addClass("bg-danger");
            $("#elocation_error").html("Employee location cannot be empty").addClass("bg-danger");
        } else if (fname2 === "" || fname2 === "undefined") {
            error.push("error");
            $("#efirstname_error").html("Employee first name cannot be empty").addClass("bg-danger");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (lname2 === "" || lname2 === "undefined") {
            error.push("error");
            $("#elastname_error").html("Employee last name cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (email2 === "" || email2 === "undefined") {
            error.push("error");
            $("#eemail_error").html("Employee email cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (phone2 === "" || phone2 === "undefined") {
            error.push("error");
            $("#ephone_error").html("Employee phonenumber cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (acc2 === "" || acc2 === "undefined") {
            error.push("error");
            $("#eaccount_error").html("Employee account cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (designation2 === "" || designation2 === "undefined") {
            error.push("error");
            $("#edesignation_error").html("Employee designation cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edepartment_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (department2 === "" || department2 === "undefined") {
            error.push("error");
            $("#edepartment_error").html("Employee department cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#egrade_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (grade2 === "" || grade2 === "undefined") {
            error.push("error");
            $("#egrade_error").html("Employee grade cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html(""); 
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#elocation_error").html("");
        } else if (location2 === "" || location2 === "undefined") {
            error.push("error");
            $("#elocation_error").html("Employee grade cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#edivision_error").html("");
            $("#eregion_error").html("");
            $("#egrade_error").html("");
        } else if (region2 === "" || region2 === "undefined") {
            error.push("error");
            $("#eregion_error").html("Employee region cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#edivision_error").html("");
            $("#egrade_error").html("");
            $("#elocation_error").html("");
        } else if (division2 === "" || division2 === "undefined") {
            error.push("error");
            $("#edivision_error").html("Employee division cannot be empty").addClass("bg-danger");
            $("#efirstname_error").html("");
            $("#elastname_error").html("");
            $("#eemail_error").html("");
            $("#ephone_error").html("");
            $("#eaccount_error").html("");
            $("#edesignation_error").html("");
            $("#edepartment_error").html("");
            $("#eregion_error").html("");
            $("#egrade_error").html("");
            $("#elocation_error").html("");
        }
        return error;
    }


    $('.tbl_employees').DataTable({
        "ordering": false,
        lengthMenu: [[5, 20, 50, -1], ['5 Records', '20 Records', '50 Records', 'ALL']],
        pageLength: 10,
        "language": {
            "search": "_INPUT_", // Removes the 'Search' field label
            "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addEmployee" id="submitEmployee" type="button"> <div id="spinner"></div>Add Employee</button><p class="ml-3 mr-1">Total Records:' + "${totalEmployee}" + '</p> </div>');
</script>