<%-- 
    Document   : fundtransfer
    Created on : Jun 17, 2020, 2:33:46 PM
    Author     : Habeeb O. Lawal
--%>
<%-- 
    Document   : airtimeanddata
    Created on : Jun 16, 2020, 9:50:42 AM
    Author     : Habeeb O. Lawal
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .effect{
        margin-left : -500px;
        /*        background-color: #808080;*/
    }
</style>



<div class="container effect">
    <div class="row">
        <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">


            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                <div class="card mx-1 warning-color white-text px-2">
                    <div class="d-flex align-items-center"><h5 class="bg">Requests</h5>
                          <!--<h1>${companyCode}</h1>-->

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

                <div class="mt-3">
                    <c:choose>
                        <c:when test="${session.getString('usertype') eq 'authorizer'}">
                            <table id="" class="table table-hover table-sm tbl_leave tbl_payroll_download">
                                <thead style="background-color: #F05E23; color: white;">
                                    <tr>
                                        <th class="text-center">S/N</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Days Requested</th>
                                        <th class="d-none">Id</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${leaverequest.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${leaverequest.length() - 1}">
                                                <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                                    <td class="text-center">${i + 1}</td>
                                                    <td class="m_id">${leaverequest.getJSONObject(i).getString("firstname")}</td>
                                                    <td class="m_id">${leaverequest.getJSONObject(i).getString("lastname")}</td>
                                                    <td class="m_id">${leaverequest.getJSONObject(i).getString("daysrequested")}</td>
                                                    <td class="d-none">${leaverequest.getJSONObject(i).getString("id")}</td>

                                                    <c:choose>
                                                        <c:when test="${leaverequest.getJSONObject(i).getString('status') eq 0}">
                                                            <td><a class="btn btn-danger btn-sm approve_btn" id="approveLeaveRequest_${leaverequest.getJSONObject(i).getString("id")}"  data-approve="${leaverequest.getJSONObject(i).getString("id")}"><span>Disapproved</span></a></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><a class="btn btn-danger btn-success  btn-sm disapprove_btn" id="disapproveLeaveRequest_${leaverequest.getJSONObject(i).getString("id")}"  data-disapprove="${leaverequest.getJSONObject(i).getString("id")}"><span>Approved</span></a></td>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </tr>
                                            </c:forEach>
                                        </c:when>

                                    </c:choose>
                                </tbody>
                            </table>
                        </c:when>
                        <c:otherwise>
                            <table id="" class="table table-hover table-sm tbl_leave tbl_payroll_download">
                                <thead style="background-color: #F05E23; color: white;">
                                    <tr>
                                        <th class="text-center">S/N</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Days Requested</th>
                                        <th class="d-none">Id</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${leaverequest.length() > 0}">
                                            <c:forEach var="i" begin="0" end="${leaverequest.length() - 1}">
                                                <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                                    <td class="text-center">${i + 1}</td>
                                                    <td class="m_id">${leaverequest.getJSONObject(i).getString("firstname")}</td>
                                                    <td class="m_id">${leaverequest.getJSONObject(i).getString("lastname")}</td>
                                                    <td class="m_id">${leaverequest.getJSONObject(i).getString("daysrequested")}</td>
                                                    <td class="d-none">${leaverequest.getJSONObject(i).getString("id")}</td>

                                                    <c:choose>
                                                        <c:when test="${leaverequest.getJSONObject(i).getString('status') eq 0}">
                                                            <td><a style='color: red;' id="approveLeaveRequest_${leaverequest.getJSONObject(i).getString("id")}"  data-approve="${leaverequest.getJSONObject(i).getString("id")}"><span>Disapproved</span></a></td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><a style='color: green' id="disapproveLeaveRequest_${leaverequest.getJSONObject(i).getString("id")}"  data-disapprove="${leaverequest.getJSONObject(i).getString("id")}"><span>Approved</span></a></td>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </tr>
                                            </c:forEach>
                                        </c:when>

                                    </c:choose>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

    </div>
</div>


<!-- Requesting for Leave form -->
<div class="modal fade" id="requestLeave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="margin-top: 100px !important;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Request Leave Form</h4>
                <!--<h1>${companyCode}</h1>-->
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <!--Fetching Details of Employee-->

            <div class="modal-body mx-3">
                <c:choose>
                    <c:when test="${session.getString('usertype') eq 'Employee'}">
                        <div></div>
                    </c:when>
                    <c:otherwise>
                        <select class="browser-default custom-select select-employee mb-2" id="select-employee">
                            <option value="" disabled selected>Select Employee</option>
                            <c:choose>
                                <c:when test="${EmployeeLength > 0}">
                                    <c:forEach begin="0" end="${EmployeeLength -1}" var="i">
                                        <option id='fname' data-lastname='${employeeDetail.getJSONObject(i).getString("lastname")}' data-grade='${employeeDetail.getJSONObject(i).getString("grade")}' data-department='${employeeDetail.getJSONObject(i).getString("department")}' data-designation='${employeeDetail.getJSONObject(i).getString("designation")}' data-location='${employeeDetail.getJSONObject(i).getString("location")}' data-division='${employeeDetail.getJSONObject(i).getString("division")}'  data-region='${employeeDetail.getJSONObject(i).getString("region")}' value="${employeeDetail.getJSONObject(i).getString("firstname")}">${employeeDetail.getJSONObject(i).getString("firstname")}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="${Empty}" selected disabled>${Empty}</option>
                                    <!--<option value=''>Empty</option>-->
                                </c:otherwise>
                            </c:choose>
                        </select>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="fas fa-signature prefix text-app-main"></i>-->
                            <input type="hidden" id="ccode" class="form-control" value="${companyCode}">
                            <input type="text" id="lname" class="form-control" readonly>
                            <label for="lastName"></label>
                        </div>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="fab fa-accusoft prefix text-app-main"></i>-->
                            <input type="hidden" id="grade"  class="form-control"  readonly>
                            <label for="grade"></label>
                        </div>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="fas fa-align-justify prefix text-app-main"></i>-->
                            <input type="hidden" id="department" class="form-control" readonly> 
                            <label for="department"></label>
                        </div>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="fas fa-band-aid prefix text-app-main"></i>-->
                            <input type="hidden" id="designation" class="form-control" readonly>
                            <label for="designation"></label>
                        </div>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="far fa-building prefix text-app-main"></i>-->
                            <input type="hidden" id="location" class="form-control" readonly>
                            <label for="location"></label>
                        </div>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="fas fa-dumbbell prefix text-app-main"></i>-->
                            <input type="hidden" id="division" class="form-control" readonly>
                            <label for="division"></label>
                        </div>

                        <div class="md-form md-b-outline-app mb-4">
                            <!--<i class="fab fa-gitter prefix text-app-main"></i>-->
                            <input type="hidden" id="region" class="form-control" readonly>
                            <label for="region"></label>
                        </div>

                        <div class="md-b-outline-app mb-4">
                            <!--<i class="fas fa-gopuram prefix text-app-main"></i>-->
                            <label for="days">Select number of days</label>
                            <select id="days" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                                <option value="6">6</option>
                                <option value="7">7</option>
                                <option value="8">8</option>
                                <option value="9">9</option>
                                <option value="10">10</option>
                                <option value="11">11</option>
                                <option value="12">12</option>
                                <option value="13">13</option>
                                <option value="14">14</option>
                                <option value="15">15</option>
                                <option value="16">16</option>
                                <option value="17">17</option>
                                <option value="18">18</option>
                                <option value="19">19</option>
                                <option value="20">20</option>
                                <option value="21">21</option>
                                <option value="22">22</option>
                                <option value="23">23</option>
                                <option value="24">24</option>
                                <option value="25">25</option>
                                <option value="26">26</option>
                                <option value="27">27</option>
                                <option value="28">28</option>
                                <option value="29">29</option>
                                <option value="30">30</option>

                            </select>
                        </div>


                        <div class="d-flex justify-content-end">
                            <span class="text-danger msg_request_leave" id=""></span>
                        </div>
                    </div>

                    <div class="modal-footer d-flex justify-content-end">
                        <button class="btn btn-app-main" id="btn_request_leave" type="button">
                            <span>Request</span>
                        </button>
                        <!--<button type="button" class="btn btn-primary" id="create_client">Save</button>-->
                    </div>
                </c:otherwise>
            </c:choose>
            <!--                <div class="md-form md-b-outline-app mb-4">
                                <i class="fas fa-barcode prefix text-app-main"></i>
                                <input type="text" id="fname" class="form-control" readonly>
                                <label for="firstName"></label>
                            </div>-->
            <c:choose>
                <c:when test="${session.getString('usertype') eq 'Employee'}">
                    <div class="md-form md-b-outline-app mb-4">
                        <i class="fas fa-barcode prefix text-app-main"></i>
                            <!--<input type="hidden" id="ccode" class="form-control" value="${companyCode}">-->
                        <input type="text" id="fname" value="${employeeDetails.getJSONObject(0).getString("firstname")}" class="form-control" readonly>
                        <label for="firstName"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <i class="fas fa-signature prefix text-app-main"></i>
                        <input type="hidden" id="ccode" class="form-control" value="${companyCode}">
                        <input type="text" id="lname" value="${employeeDetails.getJSONObject(0).getString("lastname")}" class="form-control" readonly>
                        <label for="lastName"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <!--<i class="fab fa-accusoft prefix text-app-main"></i>-->
                        <input type="hidden" id="grade" value="${employeeDetails.getJSONObject(0).getString("grade")}"  class="form-control"  readonly>
                        <label for="hidden"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <!--<i class="fas fa-align-justify prefix text-app-main"></i>-->
                        <input type="hidden" id="department" value="${employeeDetails.getJSONObject(0).getString("department")}" class="form-control" readonly> 
                        <label for="department"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <!--<i class="fas fa-band-aid prefix text-app-main"></i>-->
                        <input type="hidden" id="designation" value="${employeeDetails.getJSONObject(0).getString("designation")}" class="form-control" readonly>
                        <label for="designation"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <!--<i class="far fa-building prefix text-app-main"></i>-->
                        <input type="hidden" id="location" value="${employeeDetails.getJSONObject(0).getString("location")}" class="form-control" readonly>
                        <label for="location"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <!--<i class="fas fa-dumbbell prefix text-app-main"></i>-->
                        <input type="hidden" id="division" value="${employeeDetails.getJSONObject(0).getString("division")}" class="form-control" readonly>
                        <label for="division"></label>
                    </div>

                    <div class="md-form md-b-outline-app mb-4">
                        <!--<i class="fab fa-gitter prefix text-app-main"></i>-->
                        <input type="hidden" id="region" value="${employeeDetails.getJSONObject(0).getString("region")}" class="form-control" readonly>
                        <label for="region"></label>
                    </div>

                    <div class="md-b-outline-app mb-4">
                        <!--<i class="fas fa-gopuram prefix text-app-main"></i>-->
                        <label for="days">Select number of days</label>
                        <select id="days" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                            <option value="6">6</option>
                            <option value="7">7</option>
                            <option value="8">8</option>
                            <option value="9">9</option>
                            <option value="10">10</option>
                            <option value="11">11</option>
                            <option value="12">12</option>
                            <option value="13">13</option>
                            <option value="14">14</option>
                            <option value="15">15</option>
                            <option value="16">16</option>
                            <option value="17">17</option>
                            <option value="18">18</option>
                            <option value="19">19</option>
                            <option value="20">20</option>
                            <option value="21">21</option>
                            <option value="22">22</option>
                            <option value="23">23</option>
                            <option value="24">24</option>
                            <option value="25">25</option>
                            <option value="26">26</option>
                            <option value="27">27</option>
                            <option value="28">28</option>
                            <option value="29">29</option>
                            <option value="30">30</option>

                        </select>
                    </div>


                    <div class="d-flex justify-content-end">
                        <span class="text-danger msg_request_leave" id=""></span>
                    </div>
                </div>

                <div class="modal-footer d-flex justify-content-end">
                    <button class="btn btn-app-main" id="btn_request_leave" type="button">
                        <span>Request</span>
                    </button>
                    <!--<button type="button" class="btn btn-primary" id="create_client">Save</button>-->
                </div>
            </c:when>
            <c:otherwise>
                Not employee
            </c:otherwise>
        </c:choose>
    </div>
</div>
</div>


<script>
    $(document).ready(function () {
        $('.effect').animate({'margin-left': '0px'}, 1000, 'linear');
    });
//          $('.select-employee').on('change', function() {
//            alert( this.value );
//          });

    $("#select-employee").change(function () {
        let option = $("#select-employee option:selected");
        let lastname = option.data("lastname");
        let grade = option.data("grade");
        let department = option.data("department");
        let designation = option.data("designation");
        let location = option.data("location");
        let division = option.data("division");
        let region = option.data("region");

//            let addr = option.data("addr");

        $("#lname").val(lastname);
        $("#grade").val(grade);
        $("#department").val(department);
        $("#designation").val(designation);
        $("#location").val(location);
        $("#division").val(division);
        $("#region").val(region);

//            alert(lastname);
//            $("#iEmail").val(email);
    });

    $('#btn_request_leave').click(function (e) {
//            alert("How are you");
        let url = "${pageContext.request.contextPath}/requestleave";
        e.preventDefault();
//        let errorcheck = validate();
//        if (!(errorcheck.includes("error"))) {
        $("#btn_request_leave").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
        $("#btn_request_leave").html(spinner);

        let companyCode = $("#ccode").val();
        let firstname = $("#fname").val();
        let lastname = $("#lname").val();
        let gradeId = $("#grade").val();
        let departmentId = $("#department").val();
        let designationId = $("#designation").val();
        let locationId = $("#location").val();
        let divisionId = $("#division").val();
        let regionId = $("#region").val();
        let daysRequest = $("#days").val();

        let credentials = {
            "companyCode": companyCode,
            "firstname": firstname,
            "lastname": lastname,
            "gradeId": gradeId,
            "departmentId": departmentId,
            "designationId": designationId,
            "locationId": locationId,
            "divisionId": divisionId,
            "regionId": regionId,
            "daysRequest": daysRequest,
        };

        $.ajax({
            method: "POST",
            url: url,
            data: credentials,
            beforeSend: function (xhr) {
                console.log(credentials);
            },
            success: function (response) {
                if (response === "00") {
                    $("#btn_request_leave").html("Request");
                    $(".msg_request_leave").html("Request sent Successfully").addClass("alert alert-success");
//                        document.getElementById("addClientForm").reset();
                    setTimeout(function () {
                        $("#requestLeave").modal('hide');
                        $("#btn_request_leave").html("Request");
                        $(".msg_request_leave").html("");
                        $("#requestLeave").attr("disabled", false);
                        reloadPage("request");
                    }, 3000);
                } else {
                    $("#spinner").html("");
                    $(".success_message").html("Error: Couldn't Request for Leave");
                }
            }
        })
//        }
    });

//    Approve Leave Request

    $(".approve_btn").click(function () {
        let id = $(this).data("approve");
//       alert(current_id);
        let url = "${pageContext.request.contextPath}/approveLeaveRequest";
        let spinner = `<i class="fa fa-spinner fa-spin text-white" aria-hidden="true" style="font-size:20px;"></i>`;
        $(this).html(spinner);
        let credentials = {
            "id": id
        };
        $.ajax({
            method: "POST",
            url: url,
            data: credentials,
            success: function (response) {
                if (response === "00") {
                    $("#approveLeaveRequest_" + id).html("Approved").addClass("btn-success");

                } else {
                    $("#approveLeaveRequest_" + id).html("Failed");

                }
            }
        });
    });


    $('.tbl_leave').DataTable({
        "ordering": false,
        lengthMenu: [[5, 20, 50, -1], ['5 Records', '20 Records', '50 Records', 'ALL']],
        pageLength: 10,
        "language": {
            "search": "_INPUT_", // Removes the 'Search' field label
            "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#requestLeave" id="submitRequest" type="button"> <div id="spinner"></div> Request Leave </button><p class="ml-3 mr-1">Total Records:' + "${totalClient}" + '</p> </div>');

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/" + pagemapping;
        $.post(urlU, function (res) {
            $(".page").html(res);
        });
    }
</script>


