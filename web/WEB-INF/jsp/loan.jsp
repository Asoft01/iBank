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
       

    
    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
        <div class="card mx-1 warning-color white-text px-2">
            <div class="d-flex align-items-center"><h5 class="bg">Loan</h5>
              
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
        <div class="container">
                                    <div class="mt-3">

                                        <!--<button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitLoan" type="button" style='right:100px'> <div id="spinner"></div> Request Loan</button>-->
                                        
                                        
                                        <div class="mt-3">
                                           <table id="" class="table table-hover table-sm tbl_loan">
                                        <thead style="background-color: #F05E23; color: white;">
                                            <tr>
                                                <th class="text-center">S/N</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Division</th>
                                                <th>Grade</th>
                                                <th>Location</th>
                                                <th>Designation</th>
                                                <th>Days Requested</th>
                                                <th>Date Created</th>
                                                <th class="d-none">Id</th>
                                                <th>Status</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:choose>
                                                <c:when test="${loanrequest.length() > 0}">
                                                    <c:forEach var="i" begin="0" end="${loanrequest.length() - 1}">
                                                        <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                                            <td class="text-center">${i + 1}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("firstname")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("lastname")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("division")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("grade")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("location")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("designation")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("paymentduration")}</td>
                                                            <td class="m_id">${loanrequest.getJSONObject(i).getString("datecreated")}</td>

                                                            <td class="d-none">${loanrequest.getJSONObject(i).getString("id")}</td>
                                                            <c:choose>
                                                                <c:when test="${loanrequest.getJSONObject(i).getString('status') eq 0}">
                                                                    <td><a class="btn btn-danger btn-sm approve_loan_btn" id="approveLoanRequest_${loanrequest.getJSONObject(i).getString("id")}"  data-loanapprove="${loanrequest.getJSONObject(i).getString("id")}"><span>Disapproved</span></a></td>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <td><a class="btn btn-danger btn-success  btn-sm disapprove_loan_btn" id="disapproveLeaveRequest_${loanrequest.getJSONObject(i).getString("id")}"  data-loandisapprove="${leaverequest.getJSONObject(i).getString("id")}"><span>Approved</span></a></td>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                            </c:choose>
                                        </tbody>
                                    </table> 
                                        </div>


                                    </div>
                                </div>

    </div>
</div>
        
<!-- Classic tabs -->

<!-- Classic tabs -->
</div>


<!-- Requesting for Leave form -->
<div class="modal fade" id="requestLeave" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="margin-top: 100px !important;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Request Leave Form</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body mx-3">
                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-barcode prefix text-app-main"></i>
                    <input type="text" id="fname" value="${firstname}" class="form-control" readonly>
                    <label for="firstName"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-signature prefix text-app-main"></i>
                    <input type="text" id="lname" class="form-control" value="${lastname}" readonly>
                    <label for="lastName"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fab fa-accusoft prefix text-app-main"></i>
                    <input type="text" id="grade" class="form-control" value="${grade}" readonly>
                    <label for="grade"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-align-justify prefix text-app-main"></i>
                    <input type="text" id="department" class="form-control" value="${department}"readonly> 
                    <label for="department"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-band-aid prefix text-app-main"></i>
                    <input type="text" id="designation" class="form-control" value="${designation}" readonly>
                    <label for="designation"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="far fa-building prefix text-app-main"></i>
                    <input type="text" id="location" class="form-control" value="${location}" readonly>
                    <label for="location"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-dumbbell prefix text-app-main"></i>
                    <input type="text" id="division" class="form-control" value="${division}" readonly>
                    <label for="division"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fab fa-gitter prefix text-app-main"></i>
                    <input type="text" id="region" class="form-control" value="${region}" readonly>
                    <label for="region"></label>
                </div>

                <div class="md-b-outline-app mb-4">
                    <i class="fas fa-gopuram prefix text-app-main"></i>
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
        </div>
    </div>
</div>

<!--Request Loan Form-->
<div class="modal fade" id="requestLoan" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document" style="margin-top: 100px !important;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Request Loan Form</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <div class="modal-body mx-3">
                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-barcode prefix text-app-main"></i>
                    <input type="text" id="lfname" value="${firstname}" class="form-control" readonly>
                    <label for="firstName"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-signature prefix text-app-main"></i>
                    <input type="text" id="llname" class="form-control" value="${lastname}" readonly>
                    <label for="lastName"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fab fa-accusoft prefix text-app-main"></i>
                    <input type="text" id="lgrade" class="form-control" value="${grade}" readonly>
                    <label for="grade"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-align-justify prefix text-app-main"></i>
                    <input type="text" id="ldepartment" class="form-control" value="${department}"readonly> 
                    <label for="department"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-band-aid prefix text-app-main"></i>
                    <input type="text" id="ldesignation" class="form-control" value="${designation}" readonly>
                    <label for="designation"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="far fa-building prefix text-app-main"></i>
                    <input type="text" id="llocation" class="form-control" value="${location}" readonly>
                    <label for="location"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fas fa-dumbbell prefix text-app-main"></i>
                    <input type="text" id="ldivision" class="form-control" value="${division}" readonly>
                    <label for="division"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fab fa-gitter prefix text-app-main"></i>
                    <input type="text" id="lregion" class="form-control" value="na" readonly>
                    <label for="region"></label>
                </div>

                <div class="md-form md-b-outline-app mb-4">
                    <i class="fab fa-gitter prefix text-app-main"></i>
                    <input type="text" id="lamount" class="form-control" value="${amount}" >
                    <label for="amount">Enter Amount</label>
                </div>

                <div class="md-b-outline-app mb-4">
                    <i class="fas fa-gopuram prefix text-app-main"></i>
                    <label for="days">Select Duration</label>
                    <select id="ldays" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
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
                    <span class="text-danger msg_request_loan" id=""></span>
                </div>
            </div>

            <div class="modal-footer d-flex justify-content-end">
                <button class="btn btn-app-main" id="btn_request_loan" type="button">
                    <span>Request</span>
                </button>
                <!--<button type="button" class="btn btn-primary" id="create_client">Save</button>-->
            </div>
        </div>
    </div>
</div>

<!--Promotion Form--> 
<div class="modal fade" id="promoteEmployee" tabindex="-1" role="dialog" aria-labelledby="promoteEmployeeTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="promoteEmployeeTitle">Promote Employee</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container">
                    <form class="text-center" id="addUserForm" style="color: #757575;" action="#!">

                        <div class="row">
                            <div class="md-form col-12">
                                <input type="text" id="email" class="form-control">
                                <select class="browser-default custom-select custom-select-lg md-3" id="gradeId">
                                    <option value="" disabled selected>SELECT LEVEL</option>
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="2">5</option>
                                </select>

                                <!--                                    <label for="grade" id="email_L"><i class="far fa-envelope mx-1"></i>Grade Level</label>
                                                                    <div class="text-white" id="grade_error"></div>-->
                            </div>

                            <!--                                 <div class="md-form col-12">
                                                            <input type="text" id="gradeId" class="form-control" value="2">
                                                            <label for="id" id="gradeId2">id</label>
                                                            <div class="text-white" id="gradeid_error"></div>
                                                        </div>-->
                        </div>

                       
                        <div class="md-form col-6 d-none">
                            <input type="text" id="employeeId" class="form-control" value="4">
                            <label for="id" id="employeeId2">id</label>
                            <div class="text-white" id="fname_error"></div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <!--<button type="button" class="btn btn-primary" id="create_vendor">Create</button><div id="spinner"></div>-->
                <button type="button" class="btn btn-primary promoteEmployee_btn" id="promoteUser">Promote</button><div id="spinner"></div>
                <div class="success_message"></div>
            </div>
        </div>
    </div>
</div>


<!--Query Form--> 

 <div class="modal fade" id="queryEmployee" tabindex="-1" role="dialog" aria-labelledby="queryEmployeeTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="queryEmployeeTitle">Query Employee Form</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
			<form class="text-center" id="payVendorForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-6 my-1 py-1">
                                      <input type="text" id="src_accountnumber" class="form-control">
                                      <label for="src_accountnumber" id="src_accountnumber_L"><i class="far fa-address-card mx-1"></i>Src Account Number</label>
                                      <div class="text-white" id="src_accountnumber_error"></div>
                                </div>
                                <div class="md-form col-6 my-1 py-1">
                                    <input type="text" id="src_accountname" class="form-control">
                                    <label for="src_accountname" id="src_accountname_L"><i class="far fa-user mx-1"></i>Src Account Name</label>
                                    <div class="text-white" id="src_accountname_error"></div>
                                </div>
                                
                                
                                    <div class="md-form col-12">
                                        <input type="text" id="email" class="form-control">
                                        <select class="browser-default custom-select custom-select-lg md-3" id="gradeId">
                                            <option value="" disabled selected>SELECT LEVEL</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="2">5</option>
                                        </select>

                                    </div>
                            </div>
                        </form>
                    </div>
		</div>
                <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary pay_vendor" id="">Pay</button><div id="spinner"></div>
<!--                      <button type="button" class="btn btn-primary" id="editUser">Save</button><div id="spinner"></div>-->
                      <div class="pay_success_message"></div>
                </div>
            </div>
        </div>
    </div>


<!--<script type="text/javascript" src="jquery.numberformatter.js"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js.map"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.1/html2pdf.bundle.min.js"></script>

<script>
//     function showEdit(data_no) {
//            alert(data_no);
//        }
//        $('.editting_client').click(function(){
//           let data_no = $(this).data('no');
//           showEdit(data_no);
//        }); 

//$('.promote_btn').click(function(){
////    alert("Hello");
//let data_no= $(this).data('promote');
//alert(data_no);
//
//});

// Displaying the Employee ID and The grade Level respectively
    for (let i = 0; i < ${gettingemployee.length()}; i++) {
        $(".employeeinfo_" + (i)).click(function () {
            values = [];
            $(".tremployeeinfo_" + (i)).children().each(function () {
                var cellText = $(this).html();
//            alert(cellText);
                $("#empId").val(values[10]);
                values.push(cellText);

            });

            $('#promoteEmployee').modal('show');
        })
    }
//$(".employeeinfo_1").click(function(){
// alert("Hello");   
//});

//
// for(let i = 0; i<${client.length()}; i++) {
//            $(".invoiceinfo_"+(i)).click(function() {
//                values = [];
//                $(".tr_"+(i)).children().each(function() {
//                   var cellText = $(this).html();
////                   alert(cellText);
////                   alert(values[5]);
////                   $("#leditName").html(values[1]); 
//                   $("#iName").val(values[1]);
////                   $("#leditEmail").html(values[2]); 
//                   $("#iEmail").val(values[2]);
////                   $("#leditAddress").html(values[3]); 
//                   $("#iAddress").val(values[3]);
////                   $("#leditPhone").html(values[4]); 
//                   $("#iPhone").val(values[4]);
//                   $("#id").val(values[6]);
////                   $("#username_L").html(""); 
////                   $("#username").val(values[4]).addClass("disabled");
////                   $("#role").val(values[5]);
////                   $("#id").val(values[6]);
//                   //$("#password").val(values[7]);
////                   $("#c_passwordDiv").hide();
////                   $("#addUser").hide();
////                   $("#editUser").show();
//                   values.push(cellText);
//                }); 
//                //console.log(values);
//                $('#addInvoice').modal('show');
//                
//            });
//        }

    $('#promoteUser').click(function (e) {
//            alert("How are you");
        let url = "${pageContext.request.contextPath}/promoteemployee";
        e.preventDefault();
//            let errorcheck= validate();
//            if(!(errorcheck.includes("error"))){
        $("#promoteUser").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
        $("#promoteUser").html(spinner);
        let gradeId = $("#gradeId").val();
        let employeeId = $("#employeeId").val();

        let credentials = {
            "gradeId": gradeId,
            "employeeId": employeeId

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
                    $("#promoteUser").html("Promote");
                    $("#promoteUser").attr("disabled", false);
                    $(".success_message").html("Employee Promoted Successfully").addClass("alert alert-success");
//                            document.getElementById("addClientForm").reset();
                    setTimeout(function () {
                        $("#promoteEmployee").modal('hide');
                        $("#promoteUser").html("Create");
                        $(".success_message").html("");
                        $("#promoteEmployee").attr("disabled", false);
                        $("#promoteUser").attr("disabled", false);
                        reloadPage("promoteemployee");
                    }, 3000);
                } else {
                    $("#promoteUser").html("Promote");
                    $(".success_message").html("Error: Couldn't Promote Employee");
                }
            }
        })
//            }
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
                    }, 3000);
                } else {
                    $("#spinner").html("");
                    $(".success_message").html("Error: Couldn't Request for Leave");
                }
            }
        })
//        }
    });


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



    // Request for Loan

    $('#btn_request_loan').click(function (e) {
//            alert("How are you");
        let url = "${pageContext.request.contextPath}/requestloan";
        e.preventDefault();
//        let errorcheck = validate();
//        if (!(errorcheck.includes("error"))) {
        $("#btn_request_loan").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
        $("#btn_request_loan").html(spinner);
        let firstname = $("#lfname").val();
        let lastname = $("#llname").val();
        let gradeId = $("#lgrade").val();
        let departmentId = $("#ldepartment").val();
        let designationId = $("#ldesignation").val();
        let locationId = $("#llocation").val();
        let divisionId = $("#ldivision").val();
        let regionId = $("#lregion").val();
        let Amount = $("#lamount").val();
        let paymentDuration = $("#ldays").val();

        let credentials = {
            "firstname": firstname,
            "lastname": lastname,
            "gradeId": gradeId,
            "departmentId": departmentId,
            "designationId": designationId,
            "locationId": locationId,
            "divisionId": divisionId,
            "regionId": regionId,
            "Amount": Amount,
            "paymentDuration": paymentDuration,
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
                    $("#btn_request_loan").html("Request");
                    $(".msg_request_loan").html("Request sent Successfully").addClass("alert alert-success");
//                        document.getElementById("addClientForm").reset();
                    setTimeout(function () {
                        $("#requestLoan").modal('hide');
                        $("#btn_request_loan").html("Request");
                        $(".msg_request_loan").html("");
                        $("#requestLoan").attr("disabled", false);
                    }, 3000);
                } else {
                    $("#spinner").html("");
                    $(".success_message").html("Error: Couldn't Request for Loan");
                }
            }
        })
//        }
    });

    // Approve Loan Request 
    $(".approve_loan_btn").click(function () {
        let id = $(this).data("loanapprove");
//       alert(current_id);
        let url = "${pageContext.request.contextPath}/approveLoanRequest";
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

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/" + pagemapping;
        $.post(urlU, function (res) {
            $(".page").html(res);
        });
    }

    $('.tbl_humanresources').DataTable({

    });

    $('.tbl_humanloan_resources').DataTable({

    });

    $('#dtHorizontalExample').DataTable({
        "scrollX": true
    });
    $('.dataTables_length').addClass('bs-select');
    
    $('.tbl_loan').DataTable({
        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitClient" type="button"> <div id="spinner"></div> Request Loan</button><p class="ml-3 mr-1">Total Records:'+"${totalLoanRequest}"+'</p> </div>');

</script>
