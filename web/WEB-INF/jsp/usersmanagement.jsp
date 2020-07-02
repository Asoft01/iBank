<%-- 
    Document   : usersmanagement
    Created on : Jun 9, 2020, 10:40:17 AM
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
        <title>Set </title>
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
<div class="d-flex" id="wrapper" style="background-image: url(<spring:url value="/resources/mdb/img/bg2.png"/>); background-repeat: no-repeat; background-size: cover; background-position: center;">
        <div class="container row">
    <div class="col-2"></div>
    <div class="offset-1 col-8 mt-4">
        
        <div class="row">
            <div class="col-2"></div>
    <div class="col-8 my-2">
    <div class="card">
                <div class="card-header">
                    <h5 class="card-title" id="createVendorTitle">Create User</h5>
                </div>
                <div class="card-body">
                    <div class="container">
			<form class="text-center" id="addUserForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="text" id="name" class="form-control">
                                      <label for="name" id="name_L"><i class="far fa-user mx-1"></i>First Name</label>
                                      <div class="text-white" id="name_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="text" id="l_name" class="form-control">
                                      <label for="l_name" id="name_L"><i class="far fa-user mx-1"></i>Last Name</label>
                                      <div class="text-white" id="l_name_error"></div>
                                </div>
                            </div>
<!--                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="address" class="form-control">
                                    <label for="address" id="address_L"><i class="far fa-address-card mx-1"></i>Address</label>
                                    <div class="text-white" id="address_error"></div>
                                </div>
                            </div>-->
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="email" id="email" class="form-control">
                                      <label for="email" id="email_L"><i class="far fa-envelope mx-1"></i>Email</label>
                                      <div class="text-white" id="email_error"></div>
                                </div>
                            </div>
<!--                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="rc_number" class="form-control">
                                    <label for="rc_number" id="rc_number_L"><i class="fas fa-bars mx-1"></i>Reference Number</label>
                                    <div class="text-white" id="rc_number_error"></div>
                                </div>
                            </div>-->
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="phone" class="form-control">
                                    <label for="phone" id="phone_L"><i class="fas fa-phone-alt mx-1"></i>Phone</label>
                                    <div class="text-white" id="phone_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="password" id="password" class="form-control">
                                    <span id="show_password" style="position: relative; bottom: 30px; left: 180px;" onclick="myFunction()"><i class="fas fa-eye"></i></span>
                                    <label for="password" id="password_L"><i class="fas fa-lock mx-1"></i>Password</label>
                                    <div class="text-white" id="password_error"></div>
                                </div>
                            </div>
<!--                            <div class="border">    
                                <div class="mt-2 justify-content-around">
                                    <span>Select Usertypes</span>
                                    
                                        <div class="d-flex flex-column">
                                            <label for="usertype_${i}">
                                            <input type="checkbox" name="acs${i}" id="usertype_${i}" value="${usertype.getJSONObject(i).get("usertype")}"  /><span class="ml-1">${usertype.getJSONObject(i).getString("usertype")}</span></label>
                                        </div>
                                        <div class="">
                                            <div class="row d-none mx-2 the_form_${i}">
                                                <div class="md-form col-12 my-1 py-1">
                                                    <input type="text" id="user_username_${i}" class="form-control">
                                                    <label for="user_username_${i}" id="user_username_L_${i}"><i class="far fa-user mx-1"></i>Username</label>
                                                    <div class="text-white" id="user_username_error_${i}"></div>
                                                </div>
                                                <div class="md-form col-6 my-1 py-1">
                                                    <input type="password" id="password_${i}" class="form-control">
                                                    <label for="password_${i}" id="password_L_${i}"><i class="fas fa-key mx-1"></i>Operator Password</label>
                                                    <div class="text-white" id="password_error_${i}"></div>
                                                </div>
                                                <div class="md-form col-6 my-1 py-1">
                                                    <input type="password" id="c_password_${i}" class="form-control">
                                                    <label for="c_password_${i}" id="c_password_L_${i}"><i class="fas fa-key mx-1"></i>Confirm Password</label>
                                                    <div class="text-white" id="c_password_error_${i}"></div>
                                                </div>
                                            </div>
                                        </div>
                                    
                                </div>
                            </div>   
                            -->
                            
                        </form>
                    </div>
		</div>
                <div class="modal-footer">
                      
                    <button type="button" class="btn btn-primary" id="create_user">Create</button><div id="spinner"></div>
<!--                <button type="button" class="btn btn-primary" id="editUser">Update</button><div id="spinner"></div>-->
                    <a href="${contextRoot}/">Back To Login</a>
                    <div class="success_message"></div>
                </div>
            </div>
    </div>
            <div class="col-2"></div>
    </div>
</div>
    <div class="col-2"></div>
</div>
</div>                                    
<script>
    
//    $("#password").focus(function() {
//        let input = document.getElementById("password");
//        if(input.type === "password") {
//            $("#show_password").html('<i class="fas fa-eye"></i>');
//        }
//        else {
//            $("#show_password").html('<i class="fas fa-eye-slash"></i>');
//        }
//    });
    
    function myFunction() {
        var x = document.getElementById("password");
        if (x.type === "password") {
          $("#show_password").html('<i class="fas fa-eye-slash"></i>');
          x.type = "text";
        } else {
          $("#show_password").html('<i class="fas fa-eye"></i>');
          x.type = "password";
        }
    }

//    for(let i=0; i<${usertypeLength}; i++) {
//        $('input[name="acs'+(i)+'"]').click(function(){
//            if($(this).prop("checked") === true){
//                console.log("Checkbox is checked.");
//                $(".the_form_"+(i)).removeClass("d-none").slideDown();            
//            }
//            else if($(this).prop("checked")=== false){
//                console.log("Checkbox is unchecked.");
//                $(".the_form_"+(i)).addClass("d-none").slideUp();
//            }
//        });
//    }
    
    
    $('#create_user').click(function(e) {
        let url = "${pageContext.request.contextPath}/createuser";
        e.preventDefault();
                    let usertypes = [];
//                    for(let i=0; i<${usertypeLength}; i++) {
//                        var optionss = $("input[name='acs"+(i) +"']:checked").val();
//                        let username = $("#user_username_"+(i)).val();
//                        let password = $("#password_"+(i)).val();
//                        let c_password = $("#c_password_"+(i)).val();
//                        
//                        let values = {
//                            "usertype" : optionss,
//                            "username" : username,
//                            "password" : password
//                        };
//                        
//                        if(values["usertype"] != undefined) {
//                            usertypes.push(values);
//                        }
//                        
//                        //usertypes = usertypes.filter(value => Object.values(value) !== "" || Object.values(value) !== null);
//                    }
//                    console.log(usertypes);

        let errorcheck = validateCreateUser();
        if(!(errorcheck.includes("error"))) {
            $("#create_user").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#create_user").html(spinner);
            let name = $("#name").val();
            let lastname = $("#l_name").val();
            let email = $("#email").val();
            let phone = $("#phone").val();
            let password = $("#password").val();
            let values = {
                "usertype" : "authorizer",
                "email" : email,
                "password" : password
            };
            usertypes.push(values);
            console.log(usertypes);
            let credentials = {
                "firstname" : name,
                "lastname" : lastname,
                "email" : email,
                "phone" : phone,
                "password" : password,
                "usertype" : JSON.stringify(usertypes)
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
                        $("#create_user").html("Create");
                        $(".success_message").html("User Added successfully").addClass("alert alert-succes");
                        document.getElementById("addUserForm").reset();
                        setTimeout(function() {
                            //$("#createUser").modal('hide');
                            $("#create_user").html("Create");
                            $(".success_message").html("");
                            $("#create_user").attr("disabled", false);
                            gotoDashboard(email, password);
//                            window.location.href = "${pageContext.request.contextPath}/login";
//                            reloadPage("usermanagement");
                        }, 2000);   
                    }
                    else if(response === "03") {
                        $("#create_user").html("Create");
                        $(".success_message").html("Email or Phonenumber already exists").addClass("alert alert-succes");
                    }
                    else{
                        $("#create_user").attr("disabled", false);
                       $("#create_user").html("Create");
                       $(".success_message").html("Error: Couldn't Create user"); 
                    }
                }
            });	
        }
    });
    
    $(".createVendorModalCaller").click(function() {
                $("#fname_L").html("<i class='far fa-address-card mx-1'></i>First Name");
                $("#fname").val("");
                $("#surname_L").html("<i class='far fa-address-card mx-1'></i>Surname");
                $("#surname").val("");
                $("#email_L").html("<i class='far fa-envelope mx-1'></i>Email");
                $("#email").val("");
                $("#phone_L").html("<i class='fas fa-phone-alt mx-1'></i>Phone Number");
                $("#phone").val("");
                $("#address_L").html("<i class='far fa-address-card mx-1'></i>Address");
                $("#address").val("");
                $("#accountnumber_L").html("<i class='fas fa-money-check mx-1'></i>Account Number");
                $("#accountnumber").val("");
                //$("#id_L").html("");
                $("#id").val("");
//                //$("#vendor_accountnumber_L").html("");
//                $("#phonenumber").val(values[4]);
                $("#category_L").html("<i class='fas fa-money-check mx-1'></i>Category");
                $("#category").val("");
                $("#create_vendor").show();
                $("#editUser").hide();
    });
    
    $('#editUser').click(function(e) {
        let url = "${pageContext.request.contextPath}/updatevendor";
        e.preventDefault();
        let errorcheck = validate();
        if(!(errorcheck.includes("error"))) {
            $("#editUser").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#editUser").html(spinner);
            let fname = $("#fname").val();
            let surname = $("#surname").val();
            let email = $("#email").val();
            let phone = $("#phone").val();
            let bank = $("#bank").val();
            let accountnumber = $("#accountnumber").val();
            let address = $("#address").val();
            let category = $("#category").val();
            let id = $("#id").val();
            let companycode = "${companycode}";
            let credentials = {
                "fname" : fname,
                "surname" : surname,
                "email" : email,
                "phone" : phone,
                "bank" : bank,
                "accountnumber" : accountnumber,
                "address" : address,
                "category" : category,
                "id" : id,
                "companycode" : companycode
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
                        $("#editUser").html("Update");
                        $(".success_message").html("Update successfully").addClass("alert alert-succes");
                        document.getElementById("addUserForm").reset();
                        setTimeout(function() {
                            $("#createVendor").modal('hide');
                            $("#editUser").html("Update");
                            $(".success_message").html("");
                            $("#editUser").attr("disabled", false);
                        }, 3000);   
                    }
                    else{
                       $("#editUser").html("");
                       $("#editUser").html("Update");
                       $(".success_message").html("Error: Couldn't Register user"); 
                    }
                }
            });	
        }
    });
    
    
    
    
    for(let i = 0; i<2; i++) {
        $(".edit_"+(i)).click(function() {
            values = [];
            $(".tr_"+(i)).children().each(function() {
               var cellText = $(this).html();
                $("#fname_L").html("");
                $("#fname").val(values[1]);
                $("#surname_L").html("");
                $("#surname").val(values[2]);
                $("#email_L").html("");
                $("#email").val(values[7]);
                $("#phone_L").html("");
                $("#phone").val(values[5]);
                $("#address_L").html("");
                $("#address").val(values[3]);
                $("#accountnumber_L").html("");
                $("#accountnumber").val(values[4]);
                //$("#id_L").html("");
                $("#id").val(values[8]);
//                //$("#vendor_accountnumber_L").html("");
//                $("#phonenumber").val(values[4]);
                $("#category_L").html("");
                $("#category").val(values[6]);
                $("#create_vendor").hide();
                $("#editUser").show();

               values.push(cellText);
            }); 
            $('#createVendor').modal('show');
        });
    }
    
    function validateCreateUser(){
    let error = [];
    let name = $("#name").val();
    let lastname = $("#l_name").val();
    let email = $("#email").val();
    let phone = $("#phone").val();
    let password = $("#password").val();
    
    
    if((name === "" || name === undefined) && (lastname === "" || lastname === undefined) && (email === "" || email === "undefined") && (phone === "" || phone === undefined) && (password === "" || password === undefined)) {
        error.push("error");
        $("#name_error").html("Field cannot be empty").addClass("bg-danger");
        $("#l_name_error").html("Field cannot be empty").addClass("bg-danger");
        $("#email_error").html("Field cannot be empty").addClass("bg-danger");
        $("#phone_error").html("Field cannot be empty").addClass("bg-danger");
        $("#password_error").html("Field cannot be empty").addClass("bg-danger");
       
    }
    else if(name === "" || name === "undefined") {
        error.push("error");
        $("#name_error").html("Field cannot be empty").addClass("bg-danger");
        $("#l_name_error").html(" ");
        $("#email_error").html(" ");
        $("#phone_error").html(" ");
        $("#password_error").html(" ");
    }
    else if(lastname === "" || lastname === undefined) {
        error.push("error");
        $("#l_name_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html(" ");
        $("#email_error").html(" ");
        $("#phone_error").html(" ");
        $("#password_error").html(" ");
    }
    else if(email === "" || email === undefined) {
        error.push("error");
        $("#email_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#l_name_error").html(" ");
        $("#phone_error").html(" ");
        $("#password_error").html(" ");
    }
    else if((phone === "" || phone === undefined) || isNaN(phone)) {
        error.push("error");
        $("#phone_error").html("Phone number not valid").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#l_name_error").html(" ");
        $("#password_error").html(" ");
    }
    else if(password === "" || password === undefined) {
        error.push("error");
        $("#password_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#l_name_error").html(" ");
        $("#phone_error").html(" ");
    }
    return error;
}

    function gotoDashboard(email, password) {
        let urlU = "${pageContext.request.contextPath}/login?username="+email+"&password="+password+"";
        $.post(urlU, function(res){
            if(res === "success") {
                window.location.href = "${pageContext.request.contextPath}/dashboard";
            }
            else {
                $("#create_user").attr("disabled", false);
                $("#create_user").html("Create");
                $(".success_message").html("Account created successfully but couldn't log you in automatically. Go back to login");
            }
        });
    }

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }
    
    
</script>

	
    </body>
</html>


