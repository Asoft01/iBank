<%-- 
    Document   : home
    Created on : Mar 13, 2020, 12:13:43 PM
    Author     : Habeeb O. Lawal
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Home</title>
        <link href="<spring:url value="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>" rel="stylesheet">
        <link href="<spring:url value="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/mdb/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/mdb/css/dataTables.bootstrap4.css"/>" rel="stylesheet">
<!--        <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/mdb/css/addons/datatables.min.css"/>">-->
        <link href="<spring:url value="/resources/mdb/css/mdb.min.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/mdb/css/style.css"/>" rel="stylesheet">
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/jquery.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/popper.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/bootstrap.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/mdb.min.js"/>"></script>
<!--        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/addons/datatables.min.js"/>"></script>-->
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/jquery.dataTables.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/dataTables.bootstrap4.js"/>"></script>

        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/tableHTMLExport.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/main2.js"/>"></script>
        
        
        
        <script>
            
            $(document).ready(function(){
                let preloader = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`;
                let page = $(".page");
                $(".side-link").click(function(e){
                    e.preventDefault();
                    page.html(preloader);
                    $(this).parent("div").children("a").removeClass("active");
                    $(this).addClass("active");
                    let a = $(this).data("href");
                    console.log(a);
                    let url = "${contextRoot}/" + a;
                    console.log(url);
                    //window.history.pushState("", "Settings Page", a);
                    let data = {

                    };

                    $.post(url, data, function(res){
                        page.html(res);
                        $(".current_pagee").html(a.toUpperCase());
                    });
                });
            });
        </script>

        <style>
            .dropdown-container {
            display: none;
            background-color: #262626; 
            }
        </style>
    </head>

    <body style="font-family: 'lato', sans-serif;">
        
<!--            <div class="page-content-wrapper" style="background-image: url(<spring:url value="/resources/mdb/img/bg_layer2.jpg"/>); background-repeat: no-repeat; background-size: cover; background-position: center;">   -->
<!--                <nav class="">
                 <div class="" style= "margin-left: 40px; padding-top:60px;">       
                     <button class="" style="width: 50px; height: 50px; color: #F05E23; background-color: grey;" id="menu-toggle"><i class="fas fa-bars"></i></button>
  </div>

    
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
			</button>

			<div class="" style="margin-left: 1210px; position:relative; top:-80px;" id="navbarSupportedContent">
                            <ul class="">
                                <li class="nav-item dropdown">
                                    <a class="aclass dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#"><i class="fas fa-user"></i>${session}</a>
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="#">Profile</a>
                                        <a class="dropdown-item" href="#">Settings</a>
                                        <div class="dropdown-divider"></div>
                                        <a class="dropdown-item bg-danger" href="${contextRoot}/logout"><strong>LogOut</strong></a>
                                    </div>
                                </li>
                            </ul>
			</div>
            </nav> 
                               -->
<!--</div> -->
                                  
    <div class="d-flex" id="wrapper" style="background-image: url(<spring:url value="/resources/mdb/img/bg.png"/>); background-repeat: no-repeat; background-size: cover; background-position: center;">
                
                
                <c:if test = "${companycode eq '0'}">
                <div class="" style="position: absolute; z-index: 1001; left: 28%; top: 9%">
                    <button class="btn btn-blue heartBeat" style="width: 700px" data-toggle="modal" data-target="#createUser">SET UP COMPANY</button>
                </div>
                <div class="" id="cover" style="background-color: orange; opacity: 0.5; height: 100vh; width: 100%; position: absolute; z-index: 1000">
                    
                </div>
                </c:if>
 		<div class="" id="sidebar-wrapper" > 
                    <div class="sidebar-heading"><span class="navbar-brand text-primary" href="#"><strong><img class="d-inline-block align-top" src="<spring:url value="/resources/mdb/img/HUB-logo.png"/>"  height="35" /></strong></span> 
<!--                       <button class="" style="color: #F05E23; background-color: white;" id="menu-toggle"><i class="fas fa-bars"></i></button>-->
                    </div>
                    <div class="list-group list-group-flush sidebar">
                       
                        <a href="" data-href="test" class="active"><i class="far fa-user iclass"></i>&nbsp;My Account</a>
                        <a data-toggle="collapse" href="#collapseExample" aria-expanded="false" aria-controls="collapseExample"><i class="far fa-credit-card iclass"></i>&nbsp;Payments</a>
                        <div class="collapse" id="collapseExample">
                            <div class="">
                                <a href="fundtransfer" data-href="fundtransfer" class="side-link">&nbsp;&nbsp;&nbsp;<i class="far fa-credit-card iclass"></i>&nbsp;Fund Transfer</a>
                                <a href="fundtransfer" data-href="fundtransfer" class="side-link">&nbsp;&nbsp;&nbsp;<i class="far fa-credit-card iclass"></i>&nbsp;Schedule Transfer</a>
                            </div>
                        </div>
                        <a href="airtimeanddata" data-href="airtimeanddata" class="side-link"><i class="far fa-credit-card iclass"></i>&nbsp;Airtime</a>
                        <a href="" data-href="users" class=" "><i class="fas fa-user iclass"></i>&nbsp;Bills Payment</a>
                        <a href="balanceenquiry.html" class=" "><i class="fas fa-book-open iclass"></i>&nbsp;Collections</a>
<!--                        <br><br><br>
                        
                        <p style="font-size: 15px; color: white; padding-left: 10px;">Business</p>-->
                        <a class="dropdown-btn"><i class="fas fa-lock iclass"></i>&nbsp;Payroll</a>
                            <div class="dropdown-container">
                                <a href="payroll" data-href="payroll" class="side-link">Manage Payroll</a>
                                <a href="employee" data-href="employee" class="side-link">Manage Employees</a>
                                <a href="grade" data-href="grade" class="side-link">Manage Grade</a>
                                <a href="designation" data-href="designation" class="side-link">Manage Designation</a>
                                <a href="department" data-href="department" class="side-link">Manage Department</a>
                                <a href="division" data-href="division" class="side-link">Manage Division</a>
                                <a href="location" data-href="location" class="side-link">Manage Location</a>
                                <a href="region" data-href="region" class="side-link">Manage Region</a>
                                <a href="deduction" data-href="deduction" class="side-link">Create Deduction</a>
                           </div>  
<!--                        <a href="payroll" data-href="payroll" class="side-link"><i class="fas fa-lock iclass"></i>&nbsp;Payroll</a> -->
                        <a href="client" data-href="client" class="side-link"><i class="fas fa-lock iclass"></i>&nbsp;Clients</a>
                        <a href="vendors" data-href="vendors" class="side-link"><i class="fas fa-lock iclass"></i>&nbsp;Vendors</a>
                        <a href="usermangement" data-href="usermanagement" class="side-link"><i class="fas fa-lock iclass"></i>&nbsp;Users</a>
                        <a href="invoice" data-href="invoice" class="side-link"><i class="fas fa-lock iclass"></i>&nbsp;Invoice</a>
                        <a href="humanresources" data-href="humanresources" class="side-link"><i class="fas fa-lock iclass"></i>&nbsp;Human Resources</a>
                        
                        <a href="" data-href="stats" class=" "><i class="fas fa-sign-out-alt iclass"></i>&nbsp;Loyalty</a>
                        <a href="${contextRoot}/logout" class=" "><i class="fas fa-sign-out-alt iclass"></i>&nbsp;LogOut</a>
                    </div>
		</div>
                <div class="page container" id="page">
                    
                     <div class="current_pagee"></div> 
                    
                            <%@include file="menu.jsp" %>
                       
                </div>
	</div>
        <div class="modal fade" id="createUser" tabindex="-1" role="dialog" aria-labelledby="createUserTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createVendorTitle">Set up Form</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
			<form class="text-center" id="createUserForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="text" id="companyname" class="form-control">
                                      <label for="companyname" id="companyname_L"><i class="far fa-user mx-1"></i>Company Name</label>
                                      <div class="text-white" id="companyname_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="address" class="form-control">
                                    <label for="address" id="address_L"><i class="far fa-address-card mx-1"></i>Address</label>
                                    <div class="text-white" id="address_error"></div>
                                </div>
                            </div>
                 
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="rc_number" class="form-control">
                                    <label for="rc_number" id="rc_number_L"><i class="fas fa-bars mx-1"></i>RC Number</label>
                                    <div class="text-white" id="rc_number_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <select class="browser-default custom-select usertypes mb-2" id="subscription">
                                    <option value="" disabled selected>Select Subscription</option>
                                    <c:forEach begin="0" end="${subscriptionpackageLength - 1}" var="i">
                                        <option value="${subscriptionpackage.getJSONObject(i).getString("id")}">${subscriptionpackage.getJSONObject(i).getString("item")}</option>
                                    </c:forEach>
                                </select>
                                <div class="text-white" id="subscription_error"></div>
                            </div>
                            <input type="hidden" id="firstname" class="form-control" value="${LoggedinuserDetails.getJSONObject(0).getString("firstname")}">
                            <input type="hidden" id="lastname" class="form-control" value="${LoggedinuserDetails.getJSONObject(0).getString("lastname")}">
                            <input type="hidden" id="creator" class="form-control" value="${LoggedinuserDetails.getJSONObject(0).getString("username")}">
                        </form>
                    </div>
		</div>
                <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary" id="setup_company">Set Up</button><div id="spinner"></div>
                      <div class="success_message"></div>
                </div>
            </div>
        </div>
    </div>            
	 
        <footer class="page-footer font-small bg deep-orange pt-0">
            <div class="footer-copyright text-center py-3">© 2020 Copyright:
                <a href="https://supersoft.com.ng"> Supersoft.com</a>
            </div>
        </footer>
	<script>
		$("#menu-toggle").click(function(e) {
		  e.preventDefault();
		  $("#wrapper").toggleClass("toggled");
		});
                
                var dropdown = document.getElementsByClassName("dropdown-btn");
                var i;

                for (i = 0; i < dropdown.length; i++) {
                  dropdown[i].addEventListener("click", function() {
                  this.classList.toggle("active");
                  var dropdownContent = this.nextElementSibling;
                  if (dropdownContent.style.display === "block") {
                  dropdownContent.style.display = "none";
                  } else {
                  dropdownContent.style.display = "block";
                  }
                  });
                }
                
                $('#setup_company').click(function(e) {
                    let url = "${pageContext.request.contextPath}/createcompany";
                    e.preventDefault();
                    let errorcheck = validateCopmanySetup();
                    if(!(errorcheck.includes("error"))) {
                        $("#setup_company").attr("disabled", true);
                        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
                        $("#setup_company").html(spinner);
                        let companyName = $("#companyname").val();
                        let address = $("#address").val();
                        let rc_number = $("#rc_number").val();
                        let subscriptionId = $("#subscription").val();
                        let creatorFirstname = $("#firstname").val();
                        let creatorLastname = $("#lastname").val();
                        let creator = $("#creator").val();
                        
                        let credentials = {
                            "companyName" : companyName,
                            "address" : address,
                            "rc_number" : rc_number,
                            "subscriptionId" : subscriptionId,
                            "creator" : creator,
                            "creatorFirstname" : creatorFirstname,
                            "creatorLastname" : creatorLastname
                        };

                        $.ajax({
                            method: "POST",
                            url: url,
                            data: credentials,
                            beforeSend: function (xhr) {
                                    console.log(credentials);
                            },
                            success: function(response){
                                if(response === "00"){
                                    $("#setup_company").html("Set Up");
                                    $("#setup_company").attr("disabled", false);
                                    $(".success_message").html("Company Set up successfully").addClass("alert alert-succes");
                                    window.location.href = "${pageContext.request.contextPath}/dashboard";
//                                        $("#createUser").modal('hide');
//                                        $("#setup_company").html("Set Up");
//                                        $(".success_message").html("");
//                                        $("#setup_company").attr("disabled", false);
                                        
                                       
                                }
                                else{
                                    $("#setup_company").attr("disabled", false);
                                    $("#setup_company").html("Set Up");
                                    $(".success_message").html("Error: Couldn't Set Up company"); 
                                }
                            }
                        });	
                    }
            });
            
            
            function validateCopmanySetup(){
                let error = [];
                let companyName = $("#companyname").val();
                let address = $("#address").val();
                let rc_number = $("#rc_number").val();
                let subscriptionId = $("#subscription").val();

                if((companyName === "" || companyName === undefined) && (rc_number === "" || rc_number === undefined) && (subscriptionId === "" || subscriptionId === undefined) && (address === "" || address === undefined)) {
                    error.push("error");
                    $("#companyName_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#adress_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#rc_number_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#subscription_error").html("Field cannot be empty").addClass("bg-danger");
                }
                else if(companyName === "" || companyName === "undefined") {
                    error.push("error");
                    $("#companyName_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#address_error").html(" ");
                    $("#rc_number_error").html(" ");
                    $("#subscription_error").html(" ");
                }
                else if(address === "" || address === undefined) {
                    error.push("error");
                    $("#address_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#companyName_error").html(" ");
                    $("#rc_number_error").html(" ");
                    $("#subscription_error").html(" ");
                }
                else if(rc_number === "" || rc_number === undefined) {
                    error.push("error");
                    $("#rc_number_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#companyName_error").html("");
                    $("#address_error").html(" ");
                    $("#subscription_error").html(" ");
                }
                else if(subscriptionId === "" || subscriptionId === undefined || subscriptionId === null ) {
                    error.push("error");
                    $("#subscription_error").html("Field cannot be empty").addClass("bg-danger");
                    $("#companyName_error").html("");
                    $("#address_error").html(" ");
                    $("#rc_number_error").html(" ");
                }
                return error;
            }
                
	</script>
	<script type="text/javascript" src="<spring:url value="/resources/mdb/js/script.js"/>"></script>
        
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.flash.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.53/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.6.1/js/buttons.print.min.js"></script>
        
        
    </body>
</html>

