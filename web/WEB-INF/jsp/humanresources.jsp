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

            <div class="card mx-3 px-3 py-2 mt-5 success" style="top: -48px;">
                <!--                <div class="row">
                                    <button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div> 
                                    <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLeave" id="submitClient" type="button"> <div id="spinner"></div> Request Leave</button>
                                    <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitLoan" type="button" style='right:100px'> <div id="spinner"></div> Request Loan</button>
                
                                </div>-->


                <ul class="nav nav-tabs nav-justified md-tabs orange" id="myTabJust" role="tablist">
                    <li class="nav-item">
                        <a class="nav-link active" id="home-tab-just" data-toggle="tab" href="#home-just" role="tab" aria-controls="home-just"
                           aria-selected="true" style="color: black">Leave Management</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" id="profile-tab-just" data-toggle="tab" href="#profile-just" role="tab" aria-controls="profile-just"
                           aria-selected="false">Loan Management</a>
                    </li>
                    <!--  <li class="nav-item">
                        <a class="nav-link" id="contact-tab-just" data-toggle="tab" href="#contact-just" role="tab" aria-controls="contact-just"
                          aria-selected="false">Loan Requests</a>
                      </li>-->
                </ul>
                <div class="tab-content card pt-5" id="myTabContentJust">
                    <div class="tab-pane fade show active" id="home-just" role="tabpanel" aria-labelledby="home-tab-just">
<!--                        <div class="mt-2">
                            <span>Total Record</span>
                            <h3 class="font-weight-light" id="cm">
                                Total Leave Request : ${totalLeaveRequest}
                            </h3>
                        </div>
                        -->
                       <!-- Nav tabs -->
<ul class="nav nav-tabs md-tabs nav-justified orange" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#panel555" role="tab">
      <i class="fas fa-user pr-2"></i>List of Leave Requests</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#panel666" role="tab">
      <i class="fas fa-heart pr-2"></i>Approved Leave Request</a>
  </li>
</ul>
<!-- Nav tabs -->

<!-- Tab panels -->
<div class="tab-content">

  <!-- Panel 1 -->
  <div class="tab-pane fade in show active" id="panel555" role="tabpanel">
      <div class="container">
           <div class="mt-3">

                            <!--<button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitLoan" type="button" style='right:100px'> <div id="spinner"></div> Request Loan</button>-->
                            <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLeave" id="submitClient" type="button"> <div id="spinner"></div> Request Leave</button>

                            <div class="mt-2">
                    <!--<span>Total Record</span>-->
                    <h3 class="font-weight-light" id="cm">
                        Total Leave Request : ${totalLeaveRequest}
                    </h3>
                </div>
                <div class="mt-3">
                            <table id="" class="table table-hover table-sm tbl_humanresources tbl_payroll_download">
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
                        </div>
<!--
                            <table id="" class="table table-hover table-sm tbl_humanloan_resources">
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
                            </table> -->

                        </div>
      </div>
     
  </div>
  <!-- Panel 1 -->

  <!-- Panel 2 -->
  <div class="tab-pane fade" id="panel666" role="tabpanel">
      <div class="container">
                            <div class="row">
                                <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">

                                    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                                        <div class="row">
                                            <!--<button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div>--> 
                                            <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLeave" id="submitClient" type="button"> <div id="spinner"></div> Request Leave</button>

                                        </div>

                                        <div class="mt-2">
                                            <!--<span>Total Record</span>-->
                                            <h3 class="font-weight-light" id="cm">
                                                Total Approved Leave Request : ${totalApprovedLeaveRequest}
                                            </h3>
                                        </div>
                                        <div class="mt-3">
                                            <table id="" class="table table-hover table-sm tbl_humanresources tbl_payroll_download">
                                                <thead style="background-color: #F05E23; color: white;">
                                                    <tr>
                                                        <th class="text-center">S/N</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Days Requested</th>


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:choose>
                                                        <c:when test="${approvedrequests.length() > 0}">
                                                            <c:forEach var="i" begin="0" end="${approvedrequests.length() - 1}">
                                                                <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                                                    <td class="text-center">${i + 1}</td>
                                                                    <td class="m_id">${approvedrequests.getJSONObject(i).getString("firstname")}</td>
                                                                    <td class="m_id">${approvedrequests.getJSONObject(i).getString("lastname")}</td>
                                                                    <td class="m_id">${approvedrequests.getJSONObject(i).getString("daysrequested")}</td>
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
  </div>
  <!-- Panel 2 -->

</div>
<!-- Tab panels -->
                    </div>
                    <div class="tab-pane fade" id="profile-just" role="tabpanel" aria-labelledby="profile-tab-just">
                        <!-- Nav tabs -->
<ul class="nav nav-tabs md-tabs nav-justified orange" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" data-toggle="tab" href="#panel888" role="tab">
      <i class="fas fa-user pr-2"></i>List of Loans</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" data-toggle="tab" href="#panel777" role="tab">
      <i class="fas fa-heart pr-2"></i>Approved Loan Request</a>
  </li>
</ul>
<!-- Nav tabs -->

<!-- Tab panels -->
<div class="tab-content">

  <!-- Panel 1 -->
  <div class="tab-pane fade in show active" id="panel888" role="tabpanel">

                            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                                        <div class="row">
                                            <!--<button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div>--> 
                                            <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitClient" type="button"> <div id="spinner"></div> Request Loan</button>

                                        </div>

                                        <div class="mt-2">
                                            <!--<span>Total Record</span>-->
                                            <h3 class="font-weight-light" id="cm">
                                                Total Loan Requests : ${totalLoanRequest}
                                            </h3>
                                        </div>
                            <table id="" class="table table-hover table-sm tbl_humanloan_resources">
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
  <!-- Panel 1 -->

  <!-- Panel 2 -->
  <div class="tab-pane fade" id="panel777" role="tabpanel">
        
        <div class="container">
                            <div class="row">
                                <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">

                                    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                                        <div class="row">
                                            <!--<button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div>--> 
                                            <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitClient" type="button"> <div id="spinner"></div> Request Loan</button>

                                        </div>

                                        <div class="mt-2">
                                            <!--<span>Total Record</span>-->
                                            <h3 class="font-weight-light" id="cm">
                                                Total Approved Loan Request : ${recordApprovedLoanLength}
                                            </h3>
                                        </div>
                                        <div class="mt-3">
                                            <table id="" class="table table-hover table-sm tbl_humanresources tbl_payroll_download">
                                                <thead style="background-color: #F05E23; color: white;">
                                                    <tr>
                                                        <th class="text-center">S/N</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Days Requested</th>


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:choose>
                                                        <c:when test="${approvedloanrequest.length() > 0}">
                                                            <c:forEach var="i" begin="0" end="${approvedloanrequest.length() - 1}">
                                                                <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                                                    <td class="text-center">${i + 1}</td>
                                                                    <td class="m_id">${approvedloanrequest.getJSONObject(i).getString("firstname")}</td>
                                                                    <td class="m_id">${approvedloanrequest.getJSONObject(i).getString("lastname")}</td>
                                                                    <td class="m_id">${approvedloanrequest.getJSONObject(i).getString("datecreated")}</td>
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
   
  </div>
  <!-- Panel 2 -->

</div>
<!-- Tab panels -->
<!--                        <div class="container">
                            <div class="row">
                                <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">

                                    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                                        <div class="row">
                                            <button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div> 
                                            <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLeave" id="submitClient" type="button"> <div id="spinner"></div> Request Leave</button>

                                        </div>

                                        <div class="mt-2">
                                            <span>Total Record</span>
                                            <h3 class="font-weight-light" id="cm">
                                                Total Approved Leave Request : ${totalApprovedLeaveRequest}
                                            </h3>
                                        </div>
                                        <div class="mt-3">
                                            <table id="" class="table table-hover table-sm tbl_humanresources tbl_payroll_download">
                                                <thead style="background-color: #F05E23; color: white;">
                                                    <tr>
                                                        <th class="text-center">S/N</th>
                                                        <th>First Name</th>
                                                        <th>Last Name</th>
                                                        <th>Days Requested</th>


                                                    </tr>
                                                </thead>
                                                <tbody>

                                                    <c:choose>
                                                        <c:when test="${approvedrequests.length() > 0}">
                                                            <c:forEach var="i" begin="0" end="${approvedrequests.length() - 1}">
                                                                <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                                                    <td class="text-center">${i + 1}</td>
                                                                    <td class="m_id">${approvedrequests.getJSONObject(i).getString("firstname")}</td>
                                                                    <td class="m_id">${approvedrequests.getJSONObject(i).getString("lastname")}</td>
                                                                    <td class="m_id">${approvedrequests.getJSONObject(i).getString("daysrequested")}</td>
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
                        </div>-->
                    </div>
                                            
<!--                    <div class="tab-pane fade" id="contact-just" role="tabpanel" aria-labelledby="contact-tab-just">
                        <div class="mt-3">

                            <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#requestLoan" id="submitLoan" type="button" style='right:100px'> <div id="spinner"></div> Request Loan</button>


                            <table id="" class="table table-hover table-sm tbl_humanloan_resources">
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
                                            -->
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
                    <label for="days">Payment Duration</label>
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



<!--<script type="text/javascript" src="jquery.numberformatter.js"></script>-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/df-number-format/2.1.6/jquery.number.min.js.map"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.1/html2pdf.bundle.min.js"></script>

<script>

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


    $('.tbl_humanresources').DataTable({

    });

    $('.tbl_humanloan_resources').DataTable({

    });

    $('#dtHorizontalExample').DataTable({
        "scrollX": true
    });
    $('.dataTables_length').addClass('bs-select');
</script>
