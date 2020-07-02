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
        <title>Login</title>
        <link href="<spring:url value="https://use.fontawesome.com/releases/v5.11.2/css/all.css"/>" rel="stylesheet">
        <link href="<spring:url value="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/mdb/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/mdb/css/mdb.min.css"/>" rel="stylesheet">
        <link href="<spring:url value="/resources/mdb/css/style.css"/>" rel="stylesheet">
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/jquery.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/popper.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/bootstrap.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/mdb.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/jquery.dataTables.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/dataTables.bootstrap4.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/mdb/js/main2.js"/>"></script>
        
        <script>
            $(document).ready(function () {
                $(document).on('click', '.link', function (e) {
                    e.preventDefault();
                    url = $(this).attr('href');
                    var location = url.split('/');
                    location = location[location.length - 1];
                    //$('#result').html(spinner);
                    if (location !== "home")
                        $.get(url, function (result) {
                            $('.page').html(result);
                        });
                    else {
                        window.location.reload();
                    }
                });
            });   
        </script>

    </head>

    <body style="font-family: 'lato', sans-serif;">
	<div class="view" style="background-image: url(<spring:url value="/resources/mdb/img/bg.png"/>); background-repeat: no-repeat; background-size: cover; background-position: center;">
            <div class="text-center text-danger">   
                <nav class="navbar navbar-expand-lg navstyle">
			<a class="navbar-brand text-primary mx-3" href="#"><strong><img class="d-inline-block align-top" src="<spring:url value="/resources/mdb/img/HUB-logo.png"/>"  height="35" /></strong></a>

			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav ml-auto">
					<li class="nav-item">
						<a class="nav-link text-white" href="#"><i class="fab fa-facebook-f"></i></a>
					</li>
					<li class="nav-item">
						<a class="nav-link text-white" href="#"><i class="fab fa-twitter"></i></a>
					</li>
				</ul>
			</div>
		</nav>
            </div>
                        <div class="container">
                            <div class="row">
<!--                                <h1>MANAGE POS TERMINALS EASILY!</h1>-->
                            </div>
                        </div>
            <div class="row mt-3 mx-1">
                <div class="mask flex-center">  
                    <div class="col-xl-5 col-lg-6 col-md-10 col-sm-12">
			<form class="loginForm" style="color:" action="#!">
                            <div class="card lgin">
                                <div class="cardtitle">Hello, Welcome Back...</div>
				<div class="card-body">
                                    <div class="md-form text-center">
<!--                                        <h3 style="color:orange"><i class="fa fa-lock"></i> Login:</h3>-->
                                        <hr class="mt-2 mb-2">
                                    </div>
                                    
                                     <div class="md-form"> 
    
                                   
<!--					<i class="fas fa-envelope prefix" style="color:orange"></i>-->
					<input type="text" placeholder="Username" id="username" name="username" class="mb-4 txt-input">
					  </div>
                                        <div class="text-white" id="username_error"></div>
                                    
                                      <div class="md-form"> 
<!--					<i class="fas fa-lock prefix" style="color:orange"></i>-->
					<input type="password" placeholder="Password" id="pass" name="pass" class="mb-4 txt-input">
					   <div class="md-form"> 
                                        <div class="text-white" id="password_error"></div>
                                    
                                    <div class="text-center">
					<button class="btn btn-outline-orange" id="login_btn">Login</button>
                                        <div class="" id="spinner"></div>
                                        
                                         <a href="#" class="linkStyle" id="forgotPass_btn"><p>Forgot Password?</p></a>
                                    </div>
                                    <a href="${contextRoot}/setup_user" class="linkStyle text-primary ml-auto" id=""><p>Setup Company?</p></a>
				</div>
				<div class="">
                                    <div class="options">
                                       
                                    </div>
				</div>
                            </div>
			</form>
                        <form class="forgotPasswordForm d-none mt-3" style="color:" action="#!">
                            <div class="card border-0 lgin">
				<div class="card-body">
                                    <div class="md-form text-center">
<!--                                        <h3 style="color:orange"><i class="fa fa-lock"></i> Forgot Password:</h3>-->
                                        <hr class="mt-2 mb-2">
                                    </div>
                                  
<!--					<i class="fas fa-envelope prefix" style="color:orange"></i>-->
					<input type="text" id="forgotP_username" placeholder="Username" name="username" class="mb-4 txt-input">
					
                                        <div class="text-white" id="forgotP_username_error"></div>
                                    
                                    
<!--					<i class="fas fa-lock prefix" style="color:orange"></i>-->
					<input type="text" id="forgotP_phone" placeholder="Phone" name="phone" class="mb-4 txt-input">
					
                                        <div class="text-white" id="forgotP_phone_error"></div>
                                   
                                 
<!--					<i class="fas fa-lock prefix" style="color:orange"></i>-->
					<input type="password" id="forgotP_pass" placeholder="Password" name="pass" class="mb-4 txt-input">
					
                                        <div class="text-white" id="forgotP_password_error"></div>
                                  
                                    <div class="text-center">
					<button class="btn btn-outline-orange" id="forgotPasswordSave_btn">Reset</button>
                                        <p><a href="#" class="linkStyle" id="backToLogin">Back to Login</a></p>
                                        <div class="" id="forgotP_spinner"></div>
                                    </div>
				</div>
				<div class="">
                                    <div class="options">
<!--					<p><a href="#" id="backToLogin">Back to Login</a></p>-->
                                    </div>
				</div>
                            </div>
			</form>
                    </div>
		</div>
            </div>
	</div>	
	
<!--        <footer class="page-footer font-small black pt-0">
            <div class="footer-copyright text-center py-3">© 2019 Copyright:
                <a href="https://supersoft.com.ng"> Supersoft.com</a>
            </div>
        </footer>-->

	<script>
		$("#menu-toggle").click(function(e) {
		  e.preventDefault();
		  $("#wrapper").toggleClass("toggled");
		});
                
                $("#forgotPass_btn").click(function() {
                    $(".loginForm").addClass("d-none");
                    $(".forgotPasswordForm").removeClass("d-none");
                });
                
                $("#backToLogin").click(function() {
                    $(".forgotPasswordForm").addClass("d-none");
                    $(".loginForm").removeClass("d-none");
                });
                
                $("#login_btn").click(function(e) {
                    let url = "${pageContext.request.contextPath}/login";
                    e.preventDefault();
                    let errorcheck = validate();
                    console.log("error" + errorcheck);
                    if(!(errorcheck.includes("error"))) {
                    $("#username_error").html("");
                    $("#password_error").html("");
                    $("#login_btn").attr("disabled", true);
                    let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
                    $("#spinner").html(spinner);
                    
                    let username = $("#username").val();
                    let password = $("#pass").val();
                    
                    let credentials = {
                        "username" : username,
                        "password" : password
                    };
                    
                    $.ajax({
                    method: "POST",
                    url: url,
                    data: credentials,
                    beforeSend: function (xhr) {
                            console.log(credentials);
                        },
                    success: function(response){
                        console.log(response);
                        if(response === "firstTimer") {
                            console.log("firstTimer");
                            window.location.href = "${pageContext.request.contextPath}/firsttimer";
                        }
                        else if(response === "success") {
                            window.location.href = "${pageContext.request.contextPath}/dashboard";
                        }
                        else{
                            $("#spinner").html("There is an error! Try again").addClass("text-danger");
                            $("#login_btn").attr("disabled", false);
                        } 
                    }
                });
                }
                });
                
              
                $("#forgotPasswordSave_btn").click(function(e) {
                    let url = "${pageContext.request.contextPath}/forgotPassword";
                    e.preventDefault();
                    let errorcheck = validateForgotP();
                    console.log("error" + errorcheck);
                    if(!(errorcheck.includes("error"))) {
                    $("#forgotP_username_error").html("");
                    $("#forgotP_password_error").html("");
                    $("#forgotP_phone_error").html("");
                    $("#forgotPasswordSave_btn").attr("disabled", true);
                    let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
                    $("#forgotP_spinner").html(spinner);
                    
                    let username = $("#forgotP_username").val();
                    let phone = $("#forgotP_phone").val();
                    let password = $("#forgotP_pass").val();
                    
                    let credentials = {
                        "username" : username,
                        "phone" : phone,
                        "password" : password
                    };
                    console.log(credentials);
                    $.ajax({
                    method: "POST",
                    url: url,
                    data: credentials,
                    beforeSend: function (xhr) {
                            console.log(credentials);
                        },
                    success: function(response){
                        console.log(response);
                        if(response === "00") {
                            $("#forgotP_spinner").html('Password reset successfull<i class="far fa-thumbs-up ml-1"></i>').addClass("animated wobble slower text-success");
                            $("#forgotPasswordSave_btn").attr("disabled", false);                           
                            setTimeout(function() {
                               window.location.href = "${pageContext.request.contextPath}/login";
                        }, 3000); 
                        }
                        else{
                            console.log("not here");
                            $("#forgotP_spinner").html('Password reset failed<i class="far fa-thumbs-up ml-1"></i>').addClass("animated wobble slower text-danger");
                            $("#forgotPasswordSave_btn").attr("disabled", false);
                        } 
                    }
                });
                }
                });
                
                
                function validate(){
                    let error = [];
                    let username = $("#username").val();
                    let password = $("#pass").val();
                    let phone = $("#phone").val();
//                    if((username == "" || username == "undefined") && (password == "" || password == "undefined")) {
//                        error.push("error");
//                        $("#username_error").html("username cannot be empty").addClass("bg-danger");
//                        $("#password_error").html("password cannot be empty").addClass("bg-danger");
//                        //return error;
//                    }
                        if(username == "" || username == "undefined") {
                        error.push("error");
                        $("#username_error").html("Field cannot be empty").addClass("text-danger");
                        $("#password_error").html("");
                        //return error;
                        }
                      else if(password == "" || password == "undefined") {
                        error.push("error");
                        $("#password_error").html("Field cannot be empty").addClass("text-danger");
                        $("#password_error").focus();
                        $("#username_error").html("");
                        //return error;
                    }
                    else if(phone == "" || phone == "undefined") {
                        error.push("error");
                        $("#phone_error").html("Field cannot be empty").addClass("text-danger");
                        $("#phone_error").focus();
                    }
                    return error;
                }
                
                function validateForgotP(){
                    let error = [];
                    let username = $("#forgotP_username").val();
                    let password = $("#forgotP_pass").val();
                    let phone = $("#forgotP_phone").val();
//                    if((username == "" || username == "undefined") && (password == "" || password == "undefined")) {
//                        error.push("error");
//                        $("#username_error").html("username cannot be empty").addClass("bg-danger");
//                        $("#password_error").html("password cannot be empty").addClass("bg-danger");
//                        //return error;
//                    }
                        if(username == "" || username == "undefined") {
                        error.push("error");
                        $("#forgotP_username_error").html("Field cannot be empty").addClass("text-danger");
                        $("#forgotP_password_error").html("");
                        //return error;
                        }
                        else if(phone == "" || phone == "undefined") {
                        error.push("error");
                        $("#forgotP_phone_error").html("Field cannot be empty").addClass("text-danger");
                        $("#forgotP_password_error").html("");
                        $("#forgotP_username_error").html("");
                    }
                      else if(password == "" || password == "undefined") {
                        error.push("error");
                        $("#forgotP_password_error").html("Field cannot be empty").addClass("text-danger");
                        $("#forgotP_phone_error").html("");
                        $("#forgotP_username_error").html("");
                        //return error;
                    }
                    return error;
                }
                
	</script>
	
    </body>
</html>
