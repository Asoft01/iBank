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
        margin-left : -600px;
        /*        background-color: #808080;*/
    }
</style>
<div>


    <div class="mt-3"> 
        <form id="fundTransferForm" style="color:" action="#!">
            <div class="row">
                <div class="card effect" style="width: 35rem;">
                    <div class="card-header">Disburse Loan Form</div>
                    <div class="card-body">

                        <div class="md-form">
                            <!--                        <i class="fas fa-user prefix" style="color:orange"></i>-->
                             <select class="browser-default custom-select select-employee mb-2" id="select-employee">
                            <option value="" disabled selected>Select of Approved Employees Loan</option>
                            <c:choose>
                                <c:when test="${listofapprovedloanforemployee.length()> 0}">
                                    <c:forEach begin="0" end="${listofapprovedloanforemployee.length() -1 }" var="i">
                                        <option id='fname' data-email='${listofapprovedloanforemployee.getJSONObject(i).getString("employeeEmail")}' value="${listofapprovedloanforemployee.getJSONObject(i).getString("firstname")}">${listofapprovedloanforemployee.getJSONObject(i).getString("firstname")} ${listofapprovedloanforemployee.getJSONObject(i).getString("lastname")}</option>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <option value="${Empty}" selected disabled>${Empty}</option>
                                    <!--<option value=''>Empty</option>-->
                                </c:otherwise>
                            </c:choose>
                        </select>
                        </div>
                            

                        <div class="md-form">
                            <!--                        <i class="fas fa-user prefix" style="color:orange"></i>-->
                            <input type="hidden" id="companycode" name="companycode" value="${companycode}" class="form-control" disabled>
                            <label for="companycode"></label>
                            <div class="text-danger" id="companycode_error"></div>
                        </div>

                        <div class="md-form col-12">
                            <input type="hidden" id="src_accountnumber" value="" class="form-control">
                            <!--<label for="src_accountnumber" id="src_accountnumber_L"><i class="far fa-address-card mx-1"></i>Src Account Number</label>-->
                            <div class="text-white" id="src_accountnumber_error"></div>
                        </div>
                        <div class="md-form col-12">
                            <input type="hidden" id="src_accountname" value="" class="form-control">
                            <!--<label for="src_accountname" id="src_accountname_L"><i class="far fa-user mx-1"></i>Src Account Name</label>-->
                            <div class="text-white" id="src_accountname_error"></div>
                        </div>



                        <div class="md-form col-12 my-1 py-1">
                            <input type="text" id="beneficiary_accountnumber" class="form-control">
                            <label for="beneficiary_accountnumber" id="beneficiary_accountnumber_L"><i class="fas fa-money-check mx-1"></i>Beneficiary Account Number</label>
                            <div class="text-white" id="beneficiary_accountnumber_error"></div>
                        </div>


                        <div class="md-form col-12 my-1 py-1">
                            <input type="text" id="amount" class="form-control">
                            <label for="amount" id="amount_L"><i class="fas fa-money-check mx-1"></i>Amount</label>
                            <div class="text-white" id="amount_error"></div>
                        </div>


                        <div class="md-form col-12 my-1 py-1">
                            <input type="text" id="narration" class="form-control">
                            <label for="narration" id="narration_L"><i class="far fa-envelope mx-1"></i>Beneficiary Destination</label>
                            <div class="text-white" id="narration_error"></div>
                        </div>
                        
                            
                        <div class="md-form col-12 my-1 py-1">
                            <input type="text" id="narration" class="form-control">
                            <label for="narration" id="narration_L"><i class="far fa-envelope mx-1"></i>Account Number</label>
                            <div class="text-white" id="narration_error"></div>
                        </div>
                            
                            
                        <div class="md-form col-12 my-1 py-1">
                            <input type="text" id="narration" class="form-control">
                            <label for="narration" id="narration_L"><i class="far fa-envelope mx-1"></i>Narration</label>
                            <div class="text-white" id="narration_error"></div>
                        </div>

                    </div>
                    <div class="card-footer">
                        <div class="row">
                            <button type="button" class="btn btn-primary fund_transfer" style="margin-left: 200px" id="">Disburse</button><div id="spinner"></div>
                            <div class="transfer_success_message"></div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        
    </div>
</div>


<script>
    $(document).ready(function () {
        $('.effect').animate({'margin-left': '250px'}, 1000, 'linear');
    });
    $("#buyTransferForm").hide();
    $(".singleFundTransfer").click(function () {
        $(".singleFundTransfer").removeClass("bg-white").addClass("bg-light");
        $(".bulkFundTransfer").removeClass("bg-light").addClass("bg-white");
        $("#buyTransferForm").hide();
        $("#fundTransferForm").show();
    });
    $(".bulkFundTransfer").click(function () {
        $(".singleFundTransfer").removeClass("bg-light").addClass("bg-white");
        $(".bulkFundTransfer").removeClass("bg-white").addClass("bg-light");
        $("#buyTransferForm").show();
        $("#fundTransferForm").hide();
    });



    function validateTransferForm() {
        let error = [];
        let srcAccountNumber = $("#src_accountnumber").val();
        let srcAccountName = $("#src_accountname").val();
        let beneficiaryAccountNumber = $("#beneficiary_accountnumber").val();
        let username = $("#username").val();
        let amount = $("#amount").val();
        let narration = $("#narration").val();
        let companyCode = $("#companycode").val();
        let beneficiaryFinancialInstitutionCode = $("#bank").val();

        if ((srcAccountNumber === "" || srcAccountNumber === undefined) && (srcAccountName === "" || srcAccountName === undefined) && (beneficiaryAccountNumber === "" || beneficiaryAccountNumber === undefined) && (beneficiaryAccountName === "" || beneficiaryAccountName === undefined) && (amount === "" || amount === undefined) && (narration === "" || narration === undefined) && (beneficiaryPhoneNumber === "" || beneficiaryPhoneNumber === undefined) && (beneficiaryFinancialInstitutionCode === "" || beneficiaryFinancialInstitutionCode === undefined)) {
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
        } else if (srcAccountNumber === "" || srcAccountNumber === undefined) {
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
        } else if (srcAccountName === "" || srcAccountName === undefined) {
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
        } else if (beneficiaryAccountNumber === "" || beneficiaryAccountNumber === undefined) {
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
        } else if (amount === "" || amount === "undefined") {
            error.push("error");
            $("#amount_error").html("Field cannot be empty").addClass("bg-danger");
            $("#vendor_accountnumber_error").html("");
            $("#src_accountname_error").html("");
            $("#src_accountnumber_error").html(" ");
            $("#vendor_accountname_error").html(" ");
            $("#narration_error").html(" ");
            $("#vendor_phonenumber_error").html(" ");
            $("#vendor_institution_error").html(" ");
        } else if (narration === "" || narration === undefined) {
            error.push("error");
            $("#narration_error").html("Field cannot be empty").addClass("bg-danger");
            $("#vendor_accountnumber_error").html("");
            $("#src_accountnumber_error").html(" ");
            $("#vendor_accountname_error").html(" ");
            $("#src_accountname_error").html(" ");
            $("#amount_error").html(" ");
            $("#vendor_phonenumber_error").html(" ");
            $("#vendor_institution_error").html(" ");
        } else if (beneficiaryPhoneNumber === "" || beneficiaryPhoneNumber === undefined || beneficiaryPhoneNumber.length < 10) {
            error.push("error");
            $("#vendor_phonenumber_error").html("Phonenumber not valid").addClass("bg-danger");
            $("#narration_error").html("");
            $("#vendor_accountnumber_error").html(" ");
            $("#src_accountname_error").html(" ");
            $("#narration_error").html(" ");
            $("#src_accountnumber_error").html(" ");
            $("#amount_error").html(" ");
            $("#vendor_institution_error").html(" ");
        } else if (beneficiaryFinancialInstitutionCode === "" || beneficiaryFinancialInstitutionCode === undefined) {
            error.push("error");
            $("#vendor_institution_error").html("Field cannot be empty").addClass("bg-danger");
            $("#vendor_accountnumber_error").html("");
            $("#vendor_phonenumber_error").html(" ");
            $("#narration_error").html(" ");
            $("#src_accountname_error").html(" ");
            $("#vendor_accountname_error").html(" ");
            $("#src_accountnumber_error").html(" ");
            $("#amount_error").html(" ");
        } else if (beneficiaryAccountName === "" || beneficiaryAccountName === undefined) {
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
        let urlU = "${pageContext.request.contextPath}/" + pagemapping;
        $.post(urlU, function (res) {
            $(".page").html(res);
        });
    }
</script>


