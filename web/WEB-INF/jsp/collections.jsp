<%-- 
    Document   : collections
    Created on : Jun 24, 2020, 4:30:35 PM
    Author     : Habeeb O. Lawal
--%>

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
        <div id="" class="effect tablediv" style="padding-top: 30px;">
       

    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
        <div class="card mx-1 warning-color white-text px-2">
            <div class="d-flex align-items-center"><h5 class="bg">Collections</h5>
              
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
            </span>
            <button class="btn btn-sm orange darken-4 mt-0 text-white ml-auto createVendorModalCaller" data-toggle="modal" data-target="#createVendor">Create Vendor</button>
        </div>-->
        <div class="mt-3">
            <table id="" class="table table-sm tbl_collections tbl_vendors_download">
                
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th>
                        <th>Customer Email</th>
                        <th>Amount</th>
                        <th>Order</th>
                        <th>Date</th>
                        <th class="d-none">id</th>
                    </tr>
                </thead>
                <tbody>
                         <c:choose>
                        <c:when test="${collectionsLength > 0}">
                             <c:forEach var="i" begin="0" end="${collectionsLength - 1}">
                                <tr class="add-cursor view-single-merchant o_tr tr_${i}" id="tr_">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${collections.getJSONObject(i).getString("customeremail")}</td>
                                    <td>${collections.getJSONObject(i).getString("amount")}</td>
                                    <td>${collections.getJSONObject(i).getString("order")}</td>
                                    <td>${collections.getJSONObject(i).getString("datecreated")}</td>
                                    
                                    <td class="d-none">${collections.getJSONObject(i).getString("id")}</td>
                                    
                                </tr>
                                 </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>No Orders</h3>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
  </div>
                                          
            
    <div class="modal fade" id="createOrder" tabindex="-1" role="dialog" aria-labelledby="createVendorTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createVendorTitle">Create Order</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container">
			<form class="text-center" id="addUserForm" style="color: #757575;" action="#!">
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                      <input type="text" id="oname" class="form-control">
                                      <label for="fname" id="oname_L"><i class="far fa-address-card mx-1"></i>Order Name</label>
                                      <div class="text-white" id="oname_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="oamount" class="form-control">
                                    <label for="oamount" id="oamount_L"><i class="far fa-address-card mx-1"></i>Order Amount</label>
                                    <div class="text-white" id="oamount_error"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="md-form col-12 my-1 py-1">
                                    <input type="text" id="cemail" class="form-control">
                                    <label for="cemail" id="cemail_L"><i class="far fa-envelope mx-1"></i>Customer Email</label>
                                    <div class="text-white" id="cemail_error"></div>
                                </div>
                            </div>
                           
                        </form>
                    </div>
		</div>
                <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                      <button type="button" class="btn btn-primary" id="create_order">Create</button><div id="spinner"></div>
                      <!--<button type="button" class="btn btn-primary editOrder_btn" id="editOrder">Update</button><div id="spinner"></div>-->
                      <div class="success_message"></div>
                </div>
            </div>
        </div>
    </div>
            
    
</div>
                                    
<script>
    

    $('#create_order').click(function(e) {
        let url = "${pageContext.request.contextPath}/createorder";
        e.preventDefault();
        let errorcheck = validateOrder();
        if(!(errorcheck.includes("error"))) {
            $("#create_order").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#create_order").html(spinner);
            let oname = $("#oname").val();
            let oamount = $("#oamount").val();
            let cemail = $("#cemail").val();
            let companyCode = "${companycode}";
            let senderFirstname = "${firstname}";
            let senderLastname = "${lastname}";
            
            let credentials = {
                "orderName" : oname,
                "orderAmount" : oamount,
                "customeremail" : cemail,
                "companyCode" : companyCode,
                "senderFirstname" : senderFirstname,
                "senderLastname" : senderLastname
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
                        $("#create_order").html("Create");
                        $("#create_order").attr("disabled", false);
                        $(".success_message").html("Order Created successfully").addClass("alert alert-succes");
                        document.getElementById("addUserForm").reset();
                        setTimeout(function() {
                            $("#createOrder").modal('hide');
                            $("#create_vendo").html("Create");
                            $(".success_message").html("");
                            $("#create_order").attr("disabled", false);
                            reloadPage("collections");
                        }, 4000);   
                    }
                    else{
                        $("#create_order").attr("disabled", false);
                       $("#create_order").html("Create");
                       $(".success_message").html("Error: Couldn't Create order"); 
                    }
                }
            });	
        }
    });
    

    function validateOrder(){
    let error = [];
    let oname = $("#oname").val();
    let oamount = $("#oamount").val();
    let cemail = $("#cemail").val();
    //console.log("fname " + fname +"surname "+ surname);
    if((oname === "" || oname === undefined) && (oamount === "" || oamount === undefined)&& (cemail === "" || cemail === undefined)) {
        error.push("error");
        $("#oname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#oamount_error").html("Field cannot be empty").addClass("bg-danger");
        $("#cemail_error").html("Field cannot be empty").addClass("bg-danger");
    }
    else if(oname === "" || oname === undefined) {
        error.push("error");
        $("#oname_error").html("Field cannot be empty").addClass("bg-danger");
        $("#oamount_error").html(" ");
        $("#cemail_error").html(" ");
    }
    else if(oamount === "" || oamount === undefined) {
        error.push("error");
        $("#oamount_error").html("Field cannot be empty").addClass("bg-danger");
        $("#oname_error").html("");
        $("#cemail_error").html(" ");
    }
    else if(cemail === "" || cemail === undefined) {
        error.push("error");
        $("#cemail_error").html("Field cannot be empty").addClass("bg-danger");
        $("#oname_error").html("");
        $("#oamount_error").html(" ");
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
    
    $('.tbl_collections').DataTable({
        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'  
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn btn-sm orange darken-4 mt-0 text-white ml-auto createVendorModalCaller" onclick="hideandshow()" data-toggle="modal" data-target="#createOrder">Create Order</button><p class="ml-3 mr-1">Total Records:'+"${collectionsLength}"+'</p> </div>');
</script>
