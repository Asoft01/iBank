
<%-- 
    Document   : usersmanagement
    Created on : Jun 9, 2020, 10:40:17 AM
    Author     : Habeeb O. Lawal
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div class="container">
    
        <div id="" class="effect tablediv" style="padding-top: 30px;">
            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                <div class="card mx-1 warning-color white-text px-2">
                    <div class="d-flex align-items-center"><h5 class="bg">User Management</h5>
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
<!--                <div class="mt-2 d-flex">
                    <span>Total Record</span>&nbsp;
                    <span class="font-weight-light" id="cm">
                       1
                    </span>
                    <button class="btn btn-sm orange darken-4 mt-0 text-white ml-auto createUserModalCaller" data-toggle="modal" data-target="#createUser">Create Users</button>
                </div>-->
                <div class="mt-3">
                    <table id="" class="table tbl_users tbl_users_download">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>Username</th>
                                <th>Company Email</th>
                                <th>Usertype</th>
                                <th>Date created</th>
                                <th class="d-none">id</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                                <c:choose>
                                <c:when test="${usersLength > 0}">
                                     <c:forEach var="i" begin="0" end="${usersLength -1}">
                                        <tr class="add-cursor view-single-merchant tr_${i}" id="tr_">
                                            <td class="text-center">${i + 1}</td>
                                            <td class="m_id">${users.getJSONObject(i).getString("username")}</td>
                                            <td>${users.getJSONObject(i).getString("companyemail")}</td>
                                            <td>${users.getJSONObject(i).getString("usertype")}</td>
                                            <td>${users.getJSONObject(i).getString("datecreated")}</td>
                                            <td class="d-none">${users.getJSONObject(i).getString("id")}</td>
                                            <td><a id="edit_" class="btn btn-amber btn-sm edit_${i}"><i class="fas fa-edit"></i></a>&nbsp;<a class="btn btn-danger btn-sm"><i class="fas fa-trash-alt"></i></a></td>
                                        </tr>
                                         </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <h3>No Users</h3>
                                </c:otherwise>
                            </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>                                    
    
            
    <div class="modal fade" id="createUser" tabindex="-1" role="dialog" aria-labelledby="createUserTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createVendorTitle">Create User</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
			<form class="text-center" id="createUserForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="text" id="name" class="form-control">
                                      <label for="name" id="name_L"><i class="far fa-user mx-1"></i>Name</label>
                                      <div class="text-white" id="name_error"></div>
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
                                      <input type="email" id="email" class="form-control">
                                      <label for="email" id="email_L"><i class="far fa-envelope mx-1"></i>Email</label>
                                      <div class="text-white" id="email_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="rc_number" class="form-control">
                                    <label for="rc_number" id="rc_number_L"><i class="fas fa-bars mx-1"></i>Reference Number</label>
                                    <div class="text-white" id="rc_number_error"></div>
                                </div>
                            </div>
<!--                            <div class="row">
                                <select class="browser-default custom-select usertypes mb-2" id="role">
                                    <option value="" disabled selected>Select User</option>
                                    <option value="operator">Operator</option>
                                    <option value="approval">Approval</option>
                                </select>
                            </div>-->
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="phone" class="form-control">
                                    <label for="phone" id="phone_L"><i class="far fa-envelope mx-1"></i>Phone</label>
                                    <div class="text-white" id="phone_error"></div>
                                </div>
                            </div>
                            <div class="border">    
                                <div class="mt-2 justify-content-around">
                                    <span>Select Usertypes</span>
                                    <c:forEach begin="0" end="${usertypeLength - 1}" var="i">
                                        <div class="d-flex flex-column">
                                            <label for="usertype_${i}">
                                            <input type="checkbox" name="acs${i}" id="usertype_${i}" value="${usertype.getJSONObject(i).get("usertype")}"  /><span class="ml-1">${usertype.getJSONObject(i).getString("usertype")}</span></label>
                                        </div>
                                        <div class="">
                                            <div class="row d-none mx-2 the_form_${i}">
                                                <div class="md-form col-12 mb-1 pb-1">
                                                    <input type="text" id="user_username_${i}" class="form-control">
                                                    <label for="user_username_${i}" id="user_username_L_${i}"><i class="far fa-envelope mx-1"></i>Username</label>
                                                    <div class="text-white" id="user_username_error_${i}"></div>
                                                </div>
                                                <div class="md-form col-6">
                                                    <input type="password" id="password_${i}" class="form-control">
                                                    <label for="password_${i}" id="password_L_${i}"><i class="far fa-envelope mx-1"></i>Operator Password</label>
                                                    <div class="text-white" id="password_error_${i}"></div>
                                                </div>
                                                <div class="md-form col-6">
                                                    <input type="password" id="c_password_${i}" class="form-control">
                                                    <label for="c_password_${i}" id="c_password_L_${i}"><i class="far fa-envelope mx-1"></i>Confirm Password</label>
                                                    <div class="text-white" id="c_password_error_${i}"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>   
                            
                            
                        </form>
                    </div>
		</div>
                <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary" id="create_user">Create</button><div id="spinner"></div>
<!--                      <button type="button" class="btn btn-primary" id="editUser">Update</button><div id="spinner"></div>-->
                      <div class="success_message"></div>
                </div>
            </div>
        </div>
    </div>
</div>
                                    
<script>
    for(let i=0; i<${usertypeLength}; i++) {
        $('input[name="acs'+(i)+'"]').click(function(){
            if($(this).prop("checked") === true){
                console.log("Checkbox is checked.");
                $(".the_form_"+(i)).removeClass("d-none").slideDown();
                
            }
            else if($(this).prop("checked")=== false){
                console.log("Checkbox is unchecked.");
                $(".the_form_"+(i)).addClass("d-none").slideUp();
            }
        });
    }
    
    
    $('#create_user').click(function(e) {
        let url = "${pageContext.request.contextPath}/createuser";
        e.preventDefault();
                    let usertypes = [];
                    for(let i=0; i<${usertypeLength}; i++) {
                        var optionss = $("input[name='acs"+(i) +"']:checked").val();
                        let username = $("#user_username_"+(i)).val();
                        let password = $("#password_"+(i)).val();
                        let c_password = $("#c_password_"+(i)).val();
                        
                        let values = {
                            "usertype" : optionss,
                            "username" : username,
                            "password" : password
                        };
                        
                        if(values["usertype"] != undefined) {
                            usertypes.push(values);
                        }
                        
                        //usertypes = usertypes.filter(value => Object.values(value) !== "" || Object.values(value) !== null);
                    }
                    console.log(usertypes);

        let errorcheck = validateCreateUser();
        //if(!(errorcheck.includes("error"))) {
            $("#create_user").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#create_user").html(spinner);
            let name = $("#name").val();
            let address = $("#address").val();
            let email = $("#email").val();
            let phone = $("#phone").val();
            let rc_number = $("#rc_number").val();
            
            //let companycode = "${companycode}";
            let credentials = {
                "name" : name,
                "address" : address,
                "email" : email,
                "phone" : phone,
                "rc_number" : rc_number,
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
                        document.getElementById("createUserForm").reset();
                        setTimeout(function() {
                            $("#createUser").modal('hide');
                            $("#create_user").html("Create");
                            $(".success_message").html("");
                            $("#create_user").attr("disabled", false);
                            reloadPage("usermanagement");
                        }, 3000);   
                    }
                    else{
                       $("#create_user").html("Create");
                       $(".success_message").html("Error: Couldn't Register user"); 
                    }
                }
            });	
        
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
                        document.getElementById("createUser").reset();
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
    let address = $("#address").val();
    let email = $("#email").val();
    let phone = $("#phone").val();
    let rc_number = $("#rc_number").val();
    let password = $("#password").val();
    let c_password = $("#c_password").val();
    let role = $("#role").val();
    
    console.log("hello" +name + "" + rc_number + "" + address + "" + email + "" + phone + "" + password + "" + c_password + "" + role);
    
    if((name === "" || name === "undefined") && (rc_number === "" || rc_number === undefined)&& (email === "" || email === "undefined") && (phone === "" || phone === undefined) && (password === "" || password === undefined)&& (c_password === "" || c_password === undefined)&& (address === "" || address === undefined) && (role === "" || role === undefined || role === null)) {
        error.push("error");
        $("#name_error").html("Field cannot be empty").addClass("bg-danger");
        $("#adress_error").html("Field cannot be empty").addClass("bg-danger");
        $("#email_error").html("Field cannot be empty").addClass("bg-danger");
        $("#phone_error").html("Field cannot be empty").addClass("bg-danger");
        $("#rc_number_error").html("Field cannot be empty").addClass("bg-danger");
        $("#password_error").html("Field cannot be empty").addClass("bg-danger");
        $("#c_password_error").html("Field cannot be empty").addClass("bg-danger");
        $("#role_error").html("Field cannot be empty").addClass("bg-danger");
        //return error;
    }
    else if(name === "" || name === "undefined") {
        error.push("error");
        $("#name_error").html("Field cannot be empty").addClass("bg-danger");
        $("#address_error").html(" ");
        $("#email_error").html(" ");
        $("#phone_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#password_error").html(" ");
        $("#c_password_error").html(" ");
        $("#role_error").html(" ");
        //return error;
    }
    else if(address === "" || address === undefined) {
        error.push("error");
        $("#address_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html(" ");
        $("#email_error").html(" ");
        $("#phone_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#password_error").html(" ");
        $("#c_password_error").html(" ");
        $("#role_error").html(" ");
        //return error;
    }
    else if(email === "" || email === undefined) {
        error.push("error");
        $("#email_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#address_error").html(" ");
        $("#phone_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#password_error").html(" ");
        $("#c_password_error").html(" ");
        $("#role_error").html(" ");
        //return error;
    }
    else if(phone === "" || phone === "undefined") {
        error.push("error");
        $("#phone_error").html("Phone number cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#address_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#password_error").html(" ");
        $("#c_password_error").html(" ");
        $("#role_error").html(" ");
    }
    else if(rc_number === "" || rc_number === undefined) {
        error.push("error");
        $("#rc_number_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#address_error").html(" ");
        $("#phone_error").html(" ");
        $("#password_error").html(" ");
        $("#c_password_error").html(" ");
        $("#role_error").html(" ");   
    }
    else if(password === "" || password === undefined) {
        error.push("error");
        $("#password_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#address_error").html(" ");
        $("#phone_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#c_password_error").html(" ");
        $("#role_error").html(" ");
    }
    else if(c_password !== password) {
        error.push("error");
        $("#c_password_error").html("Password does not match").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#address_error").html(" ");
        $("#phone_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#password_error").html("Password does not match").addClass("bg-danger");
        $("#role_error").html(" ");
    }
    else if(role === "" || role === undefined || role === null) {
        error.push("error");
        $("#role_error").html("Field cannot be empty").addClass("bg-danger");
        $("#name_error").html("");
        $("#email_error").html(" ");
        $("#address_error").html(" ");
        $("#phone_error").html(" ");
        $("#rc_number_error").html(" ");
        $("#password_error").html(" ");
        $("#c_password_error").html(" ");
    }
    return error;
}

    function validatePaymentForm(){
    let error = [];
    let srcAccountNumber = $("#src_accountnumber").val();
    let srcAccountName = $("#src_accountname").val();
    let beneficiaryAccountNumber = $("#vendor_accountnumber").val();
    let beneficiaryAccountName = $("#vendor_accountname").val();
    let amount = $("#amount").val();
    let narration = $("#narration").val();
    let beneficiaryPhoneNumber = $("#vendor_phonenumber").val();
    let beneficiaryFinancialInstitutionCode = $("#vendor_institution").val();
   
    if((srcAccountNumber === "" || srcAccountNumber === undefined) && (srcAccountName === "" || srcAccountName === undefined)&& (beneficiaryAccountNumber === "" || beneficiaryAccountNumber === undefined) && (beneficiaryAccountName === "" || beneficiaryAccountName === undefined) && (amount === "" || amount === undefined)&& (narration === "" || narration === undefined)&& (beneficiaryPhoneNumber === "" || beneficiaryPhoneNumber === undefined)&& (beneficiaryFinancialInstitutionCode === "" || beneficiaryFinancialInstitutionCode === undefined)) {
        error.push("error");
        $("#src_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#amount_error").html("Field cannot be empty").addClass("bg-danger");
        $("#narration_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_phonenumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_institution_error").html("Field cannot be empty").addClass("bg-danger");
        //return error;
    }
    else if(srcAccountNumber === "" || srcAccountNumber === undefined) {
        error.push("error");
        $("#src_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountname_error").html(" ");
        $("#vendor_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
        //return error;
    }
    else if(srcAccountName === "" || srcAccountName === undefined) {
        error.push("error");
        $("#src_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountnumber_error").html("");
        $("#vendor_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
        //return error;
    }
    else if(beneficiaryAccountNumber === "" || beneficiaryAccountNumber === undefined) {
        error.push("error");
        $("#vendor_accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#src_accountname_error").html("");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
        //return error;
    }
    else if(amount === "" || amount === "undefined") {
        error.push("error");
        $("#amount_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("");
        $("#src_accountname_error").html("");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#narration_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");
    }
    else if(narration === "" || narration === undefined) {
        error.push("error");
        $("#narration_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("");
        $("#src_accountnumber_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#amount_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#vendor_institution_error").html(" ");   
    }
    else if(beneficiaryPhoneNumber === "" || beneficiaryPhoneNumber === undefined || beneficiaryPhoneNumber.length < 10) {
        error.push("error");
        $("#vendor_phonenumber_error").html("Phonenumber not valid").addClass("bg-danger");
        $("#narration_error").html("");
        $("#vendor_accountnumber_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#narration_error").html(" ");
        $("#src_accountnumber_error").html(" ");
        $("#amount_error").html(" ");
        $("#vendor_institution_error").html(" ");
    }
    else if(beneficiaryFinancialInstitutionCode === "" || beneficiaryFinancialInstitutionCode === undefined) {
        error.push("error");
        $("#vendor_institution_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_accountnumber_error").html("");
        $("#vendor_phonenumber_error").html(" ");
        $("#narration_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#vendor_accountname_error").html(" ");
        $("#src_accountnumber_error").html(" ");
        $("#amount_error").html(" ");
    }
    else if(beneficiaryAccountName === "" || beneficiaryAccountName === undefined) {
        error.push("error");
        $("#vendor_accountname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#vendor_institution_error").html("");
        $("#vendor_accountnumber_error").html(" ");
        $("#vendor_phonenumber_error").html(" ");
        $("#src_accountnumber_error").html(" ");
        $("#narration_error").html(" ");
        $("#src_accountname_error").html(" ");
        $("#amount_error").html(" ");
    }
    return error;
}

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }
    
    $('.tbl_users').DataTable({
        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        "search": {
            "addClass": 'form-control input-lg col-1'
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-2"><button class="btn btn-sm orange darken-4 mt-0 text-white ml-auto createUserModalCaller" data-toggle="modal" data-target="#createUser">Create Users</button><p class="ml-3 mr-1">Total Records:'+"${usersLength}"+'</p> </div>');
</script>
