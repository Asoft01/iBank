<%-- 
    Document   : vendors.jsp
    Created on : Jun 4, 2020, 11:54:06 AM
    Author     : Habeeb O. Lawal
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div class="container">
    <div class="row">
        <div id="" class="effect tablediv" style="padding-top: 30px;">
       

    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
        <div class="card mx-1 warning-color white-text px-2">
            <div class="d-flex align-items-center"><h5 class="bg">Vendors</h5>
              
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
<!--        <div class="mt-2 d-flex">
            <span>Total Record</span>&nbsp;
            <span class="font-weight-light" id="cm">
               ${vendorLength}
            </span>
            <button class="btn btn-sm orange darken-4 mt-0 text-white ml-auto createVendorModalCaller" data-toggle="modal" data-target="#createVendor">Create Vendor</button>
        </div>-->
        <div class="mt-3">
            <table id="" class="table table-sm tbl_vendors tbl_vendors_download">
                
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Bank</th>
                        <th>Address</th>
                        <th>Account Number</th>
                        <th>Phone Number</th>
                        <th>Category</th>
                        <th>Email</th>
                        <th class="d-none">id</th>
                        <th class="d-none">Bankcode</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                         <c:choose>
                        <c:when test="${vendorLength > 0}">
                             <c:forEach var="i" begin="0" end="${vendorLength - 1}">
                                <tr class="add-cursor view-single-merchant o_tr tr_${i}" id="tr_">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${vendor.getJSONObject(i).getString("firstname")}</td>
                                    <td>${vendor.getJSONObject(i).getString("lastname")}</td>
                                    <td>${vendor.getJSONObject(i).getString("bank")}</td>
                                    <td>${vendor.getJSONObject(i).getString("address")}</td>
                                    <td>${vendor.getJSONObject(i).getString("accountnumber")}</td>
                                    <td>${vendor.getJSONObject(i).getString("phonenumber")}</td>
                                    <td>${vendor.getJSONObject(i).getString("category")}</td>
                                    <td>${vendor.getJSONObject(i).getString("email")}</td>
                                    <td class="d-none">${vendor.getJSONObject(i).getString("id")}</td>
                                    <td class="d-none">${vendor.getJSONObject(i).getString("bankcode")}</td>
                                    <td><a class="btn btn-sm btn-amber btn_payvendor payVendor_${i}">Pay</a></td>
                                    <td class="editor"><a  id="edit_" class="btn btn-amber btn-sm  btn-edit edit_${i} mb-1" data-no="${i}"><i class="fas fa-edit"></i></a><a class="btn btn-danger btn-sm" onclick=deleteUser("${vendor.getJSONObject(i).getString("id")}")><i class="fas fa-trash-alt"></i></a></td>
                                </tr>
                                 </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>No Vendors</h3>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
  </div>
                                          
    </div>
            
    <div class="modal fade" id="createVendor" tabindex="-1" role="dialog" aria-labelledby="createVendorTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createVendorTitle">Create Vendor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
			<form class="text-center" id="addUserForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-6">
                                      <input type="text" id="fname" class="form-control">
                                      <label for="fname" id="fname_L"><i class="far fa-address-card mx-1"></i>First Name</label>
                                      <div class="text-white" id="fname_error"></div>
                                </div>

                                <div class="md-form col-6">
                                      <input type="text" id="surname" class="form-control">
                                      <label for="surname" id="surname_L"><i class="far fa-address-card mx-1"></i>Surname</label>
                                      <div class="text-white" id="surname_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-6">
                                    <input type="text" id="email" class="form-control">
                                    <label for="email" id="email_L"><i class="far fa-envelope mx-1"></i>Email</label>
                                    <div class="text-white" id="email_error"></div>
                                </div>
                                <div class="md-form col-6">
                                    <input type="text" id="phone" class="form-control">
                                    <label for="phone" id="phone_L"><i class="fas fa-phone-alt mx-1"></i>Phone Number</label>
                                    <div class="text-white" id="phone_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-6">
<!--                                    <input type="text" id="bank" class="form-control">
                                    <label for="bank" id="bank_L"><i class="fas fa-university mx-1"></i>Bank</label>
                                    <div class="text-white" id="bank_error"></div>-->
                                    <select class="browser-default custom-select usertypes mb-2" id="bank" selected>
                                        <option value="" disabled>SELECT BANK</option>
                                        <c:forEach begin="0" end="${getFinancialInstitutionLength -1}" var="i">
                                            <option value="${getFinancialInstitution.getJSONObject(i).get("bankcode")}" id="bankbankcode">${getFinancialInstitution.getJSONObject(i).getString("bankname")}</option>
                                        </c:forEach>
                                    </select>
                                    <div class="text-white" id="bank_error"></div>
                                </div>
                                <div class="md-form col-6">
                                    <input type="text" id="accountnumber" class="form-control">
                                    <label for="accountnumber" id="accountnumber_L"><i class="fas fa-money-check mx-1"></i>Account Number</label>
                                    <div class="text-white" id="accountnumber_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-6" id="addressDiv">
                                    <input type="text" id="address" class="form-control">
                                    <label for="address" id="address_L"><i class="far fa-address-card mx-1"></i>Address</label>
                                    <div class="text-white" id="address_error"></div>
                                </div>
                                <div class="md-form col-6">
                                    <input type="text" id="category" class="form-control">
                                    <label for="category" id="category_L"><i class="fas fa-money-check mx-1"></i>Category</label>
                                    <div class="text-white" id="category_error"></div>
                                </div>
                            </div>
                            <div class="md-form col-6 d-none">
                                <input type="hidden" id="id" class="form-control">
                                <label for="id" id="id_L">id</label>
<!--                                <div class="text-white" id="fname_error"></div>-->
                            </div>
                        </form>
                    </div>
		</div>
                <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary" id="create_vendor">Create</button><div id="spinner"></div>
                      <button type="button" class="btn btn-primary editUser_btn" id="editUser">Update</button><div id="spinner"></div>
                      <div class="success_message"></div>
                </div>
            </div>
        </div>
    </div>
            
    
    <div class="modal fade" id="payVendor" tabindex="-1" role="dialog" aria-labelledby="payVendorTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="payVendorTitle">Pay Vendor</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
			<form class="text-center" id="payVendorForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-6 my-1 py-1">
                                      <input type="hidden" id="src_accountnumber" value="${walletNumber}" class="form-control">
                                      <!--<label for="src_accountnumber" id="src_accountnumber_L"><i class="far fa-address-card mx-1"></i>Src Accountannt Number</label>-->
                                      <div class="text-white" id="src_accountnumber_error"></div>
                                </div>
                                <div class="md-form col-6 my-1 py-1">
                                    <input type="hidden" id="src_accountname" value="${firstname} ${lastname}" class="form-control">
                                    <!--<label for="src_accountname" id="src_accountname_L"><i class="far fa-user mx-1"></i>Src Account Name</label>-->
                                    <div class="text-white" id="src_accountname_error"></div>
                                </div>
                            </div>
                  
                            <div class="row">
                                <div class="md-form col-6 my-1 py-1">
                                      <input type="text" id="vendor_accountnumber" class="form-control">
                                      <label for="vendor_accountnumber" id="vendor_accountnumber_L"><i class="fas fa-money-check mx-1"></i>Account Number</label>
                                      <div class="text-white" id="vendor_accountnumber_error"></div>
                                </div>
                                <div class="md-form col-6 my-1 py-1">
                                    <input type="text" id="vendor_accountname" class="form-control">
                                    <label for="vendor_accountname" id="vendor_accountname_L"><i class="far fa-user mx-1"></i>Vendor Account Name</label>
                                    <div class="text-white" id="vendor_accountname_error"></div>
                                </div>
                            </div>
                            
                            
                            <div class="row">
                                <div class="md-form col-6 my-1 py-1">
                                    <input type="text" id="vendor_phonenumber" class="form-control">
                                    <label for="vendor_phonenumber" id="vendor_phonenumber_L"><i class="fas fa-phone-alt mx-1"></i>Vendor Number</label>
                                    <div class="text-white" id="vendor_phonenumber_error"></div>
                                </div>
                                <div class="md-form col-6 my-1 py-1">
                                    <input type="text" id="vendor_institution" class="form-control">
                                    <label for="vendor_institution" id="vendor_institution_L"><i class="far fa-address-card mx-1"></i>Institution Code</label>
                                    <div class="text-white" id="vendor_institution_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="amount" class="form-control">
                                    <label for="amount" id="amount_L"><i class="fas fa-money-check mx-1"></i>Amount</label>
                                    <div class="text-white" id="amount_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="narration" class="form-control">
                                    <label for="narration" id="narration_L"><i class="far fa-envelope mx-1"></i>Narration</label>
                                    <div class="text-white" id="narration_error"></div>
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
</div>
                                    
<script>
    

    $('#create_vendor').click(function(e) {
        let url = "${pageContext.request.contextPath}/createvendor";
        e.preventDefault();
        let errorcheck = validateVendor();
        if(!(errorcheck.includes("error"))) {
            $("#create_vendor").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#create_vendor").html(spinner);
            let fname = $("#fname").val();
            let surname = $("#surname").val();
            let email = $("#email").val();
            let phone = $("#phone").val();
            let bank = $("#bank").val();
            let accountnumber = $("#accountnumber").val();
            let address = $("#address").val();
            let category = $("#category").val();
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
                        $("#create_vendor").html("Create");
                        $("#create_vendor").attr("disabled", false);
                        $(".success_message").html("Vendor Added successfully").addClass("alert alert-succes");
                        document.getElementById("addUserForm").reset();
                        setTimeout(function() {
                            $("#createVendor").modal('hide');
                            $("#create_vendo").html("Create");
                            $(".success_message").html("");
                            $("#create_vendor").attr("disabled", false);
                            reloadPage("vendors");
                        }, 4000);   
                    }
                    else{
                        $("#create_vendor").attr("disabled", false);
                       $("#create_vendor").html("Create");
                       $(".success_message").html("Error: Couldn't Register user"); 
                    }
                }
            });	
        }
    });
    
        function hideandshow() {
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
    };
    
    $('.btn-edit').click(function(){
        values = [];
        let parent1 = $(this).parent();
        let parent2 = parent1.parent();
        parent2.children().each(function() {
           let cellText = $(this).html();
           values.push(cellText);
            $("#fname_L").html("");
            $("#fname").val(values[1]);
            $("#surname_L").html("");
            $("#surname").val(values[2]);
            $("#email_L").html("");
            $("#email").val(values[8]);
            $("#phone_L").html("");
            $("#phone").val(values[6]);
            $("#bankbankcode").html(values[3]);
            $("#bankbankcode").val(values[3]);
            $("#address_L").html("");
            $("#address").val(values[4]);
            $("#accountnumber_L").html("");
            $("#accountnumber").val(values[5]);
            //$("#id_L").html("");
            $("#id").val(values[9]);
            //$("#vendor_accountnumber_L").html("");
            $("#phonenumber").val(values[4]);
            $("#category_L").html("");
            $("#category").val(values[7]);
            $("#create_vendor").hide();
            $("#editUser").show();    
        });
        $('#createVendor').modal('show');
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
                            reloadPage("vendors");
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
    
    //for(let i = 0; i<${vendorLength}; i++) {
        $(".btn_payvendor").click(function() {
            values = [];
            let parent1 = $(this).parent();
            let parent2 = parent1.parent();
            parent2.children().each(function() {
               let cellText = $(this).html();
                 //$("#src_accountnumber_L").html("");
//                 $("#src_accountnumber").val("").addClass("disabled");
                 //$("#src_accountname_L").html("");
//                 $("#src_accountname").val("").addClass("disabled");
                 //$("#vendor_accountname_L").html("");
                 $("#vendor_accountname").val(values[1]).addClass("disabled");
//               $("#amount_L").html("");
                 $("#amount").val("");
//               $("#vendor_institution_L").html("");
                //$("#vendor_institution").val("");
//               $("#narration_L").html("");
                $("#narration").val("");
               //$("#vendor_accountnumber_L").html("");
               $("#vendor_accountnumber").val(values[5]).addClass("disabled");
               //$("#vendor_phonenumber_L").html("");
               $("#vendor_phonenumber").val(values[6]).addClass("disabled");
               $("#vendor_institution").val(values[10]).addClass("disabled");
               //$("#vendor_institution_L").html("");
               

               values.push(cellText);
            }); 
            $('#payVendor').modal('show');
        });
    //}
    
    $('.pay_vendor').click(function(e) {
        let url = "${pageContext.request.contextPath}/payvendor";
        e.preventDefault();
        let errorcheck = validatePaymentForm();
        if(!(errorcheck.includes("error"))) {
            $(".pay_vendor").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $(".pay_vendor").html(spinner);
            let srcAccountNumber = $("#src_accountnumber").val();
            let srcAccountName = $("#src_accountname").val();
            let beneficiaryAccountNumber = $("#vendor_accountnumber").val();
            let beneficiaryAccountName = $("#vendor_accountname").val();
            let amount = $("#amount").val();
            let narration = $("#narration").val();
            let beneficiaryPhoneNumber = $("#vendor_phonenumber").val();
            let beneficiaryFinancialInstitutionCode = $("#vendor_institution").val();
            let companycode = "${companycode}";
            let credentials = {
                "srcAccountNumber" : srcAccountNumber,
                "srcAccountName" : srcAccountName,
                "beneficiaryAccountNumber" : beneficiaryAccountNumber,
                "beneficiaryAccountName" : beneficiaryAccountName,
                "amount" : amount,
                "narration" : narration,
                "beneficiaryPhoneNumber" : beneficiaryPhoneNumber,
                "beneficiaryFinancialInstitutionCode" : beneficiaryFinancialInstitutionCode,
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
                        $(".pay_vendor").html("Pay");
                        $(".pay_success_message").html("Payment successfully").addClass("alert alert-succes");
                        //document.getElementById("addUserForm").reset();
                        setTimeout(function() {
                            $("#payVendor").modal("hide");
                            $(".pay_vendor").html("Pay");
                            $(".pay_success_message").html("");
                            $(".pay_vendor").attr("disabled", false);
                        }, 3000);   
                    }
                    else{
                       $(".pay_vendor").attr("disabled", false);
                       $(".pay_vendor").html("Pay");
                       $(".pay_success_message").html("Error: Couldn't Pay Vendor"); 
                    }
                }
            });	
        }
    });
//    
//    $(document).ready(function() {
////        $(".editor").click(function() {
////            values = [];
////            alert("hello");
////            let a = $(this).parent();
////            a.children().each(function() {
////                var celtt = $(this).html();
////                //alert(celtt);
////                //alert("hello2");
////            });
//    });
//        
////            $(this).siblings().each(function() {
////                var cellText = $(this).html();
////                
////                $('#createVendor').modal('show');
////            });
//            
//            
////            $("this").siblings().each(function() {
////               var cellText = $(this).html();
////               alert(cellText);
//////                $("#fname_L").html("");
//////                $("#fname").val(values[1]);
//////                $("#surname_L").html("");
//////                $("#surname").val(values[2]);
//////                $("#email_L").html("");
//////                $("#email").val(values[8]);
//////                $("#phone_L").html("");
//////                $("#phone").val(values[6]);
//////                $("#address_L").html("");
//////                $("#address").val(values[4]);
//////                $("#accountnumber_L").html("");
//////                $("#accountnumber").val(values[5]);
//////                //$("#id_L").html("");
//////                $("#id").val(values[8]);
////////                //$("#vendor_accountnumber_L").html("");
////////                $("#phonenumber").val(values[4]);
//////                $("#category_L").html("");
//////                $("#category").val(values[6]);
//////                $("#create_vendor").hide();
//////                $("#editUser").show();
//////
//////               values.push(cellText);
////            }); 
////            //$('#createVendor').modal('show');
//        });
    
    
    function validateVendor(){
    let error = [];
    let fname = $("#fname").val();
    let surname = $("#surname").val();
    let email = $("#email").val();
    let phone = $("#phone").val();
    let bank = $("#bank").val();
    let accountnumber = $("#accountnumber").val();
    let address = $("#address").val();
    let category = $("#category").val();
    console.log("fname " + fname +"surname "+ surname);
    if((fname === "" || fname === undefined) && (surname === "" || surname === undefined)&& (email === "" || email === undefined) && (phone === "" || phone === undefined) && (bank === "" || bank === undefined)&& (accountnumber === "" || accountnumber === undefined)&& (address === "" || address === undefined)&& (category === "" || category === undefined)) {
        error.push("error");
        $("#fname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#surname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#email_error").html("Field cannot be empty").addClass("bg-danger");
        $("#phone_error").html("Field cannot be empty").addClass("bg-danger");
        $("#bank_error").html("Field cannot be empty").addClass("bg-danger");
        $("#accountnumber_error").html("Field cannot be empty").addClass("bg-danger");
        $("#address_error").html("Field cannot be empty").addClass("bg-danger");
        $("#category_error").html("Field cannot be empty").addClass("bg-danger");
        //return error;
    }
    else if(fname === "" || fname === "undefined") {
        error.push("error");
        $("#fname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#surname_error").html(" ");
        $("#email_error").html(" ");
        $("#phone_error").html(" ");
        $("#bank_error").html(" ");
        $("#accountnumber_error").html(" ");
        $("#address_error").html(" ");
        $("#category_error").html(" ");
        //return error;
    }
    else if(surname === "" || surname === undefined) {
        error.push("error");
        $("#surname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#fname_error").html("");
        $("#email_error").html(" ");
        $("#phone_error").html(" ");
        $("#bank_error").html(" ");
        $("#accountnumber_error").html(" ");
        $("#address_error").html(" ");
        $("#category_error").html(" ");
        //return error;
    }
    else if(email === "" || email === undefined) {
        error.push("error");
        $("#email_error").html("Field cannot be empty").addClass("bg-danger");
        $("#fname_error").html("");
        $("#surname_error").html(" ");
        $("#phone_error").html(" ");
        $("#bank_error").html(" ");
        $("#accountnumber_error").html(" ");
        $("#address_error").html(" ");
        $("#category_error").html(" ");
        //return error;
    }
    else if(phone === "" || phone === undefined || phone.length < 10) {
        error.push("error");
        $("#phone_error").html("Phone number cannot be empty").addClass("bg-danger");
        $("#fname_error").html("");
        $("#email_error").html(" ");
        $("#surname_error").html(" ");
        $("#bank_error").html(" ");
        $("#accountnumber_error").html(" ");
        $("#address_error").html(" ");
        $("#category_error").html(" ");
    }
    else if(bank === "" || bank === undefined) {
        error.push("error");
        $("#bank_error").html("Field cannot be empty").addClass("bg-danger");
        $("#fname_error").html("");
        $("#email_error").html(" ");
        $("#surname_error").html(" ");
        $("#phone_error").html(" ");
        $("#accountnumber_error").html(" ");
        $("#address_error").html(" ");
        $("#category_error").html(" ");   
    }
    else if(accountnumber === "" || accountnumber === undefined || accountnumber.length < 10) {
        error.push("error");
        $("#accountnumber_error").html("Accountnumber not valid").addClass("bg-danger");
        $("#fname_error").html("");
        $("#email_error").html(" ");
        $("#surname_error").html(" ");
        $("#phone_error").html(" ");
        $("#bank_error").html(" ");
        $("#address_error").html(" ");
        $("#category_error").html(" ");
    }
    else if(address === "" || address === undefined) {
        error.push("error");
        $("#fname_error").html("");
        $("#email_error").html(" ");
        $("#surname_error").html(" ");
        $("#phone_error").html(" ");
        $("#bank_error").html(" ");
        $("#address_error").html("Field cannot be empty").addClass("bg-danger");
        $("#category_error").html(" ");
        $("#accountnumber_error").html(" ");
    }
    else if(category === "" || category === undefined) {
        error.push("error");
        $("#category_error").html("Field cannot be empty").addClass("bg-danger");
        $("#fname_error").html("");
        $("#email_error").html(" ");
        $("#surname_error").html(" ");
        $("#phone_error").html(" ");
        $("#bank_error").html(" ");
        $("#accountnumber_error").html(" ");
        $("#address_error").html(" ");
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

        function deleteUser(data) {
	    let strconfirm = confirm("Are you sure you want to delete?");
            let url = "${pageContext.request.contextPath}/deleteVendor";
	    if (strconfirm === true) {
                let credentials = {
                   "id" : data 
                };
                $(".page").html(`<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`);
                $.ajax({
		method: "POST",
		url: url,
		data: credentials,
                beforeSend: function (xhr) {
                        console.log(credentials);
                    },
		success: function(response){
                    console.log("now now "+ response);
                    if(response === "success"){  
                        reloadPage("vendors");
                    }
                    else{
                        alert("failed");
                    }
                }
            });	
	    }   
	}

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }
    
    function showEdit(data_no) {
        alert(data_no);
    }
    
    $('.tbl_vendors').DataTable({
        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'  
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn btn-sm orange darken-4 mt-0 text-white ml-auto createVendorModalCaller" onclick="hideandshow()" data-toggle="modal" data-target="#createVendor">Create Vendor</button><p class="ml-3 mr-1">Total Records:'+"${vendorLength}"+'</p> </div>');
</script>