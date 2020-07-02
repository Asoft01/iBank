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
/*    .effect{
        margin-left : -600px;
        background-color: #808080;
    }*/
</style>
<div>
        
<!--    <div class="mt-2" style="text-align: center;">
        <h5 class="btn btn-sm bg-white text-black singleAirtime">Single Airtime</h5>
        <h5 class="btn btn-sm bg-white text-black bulkAirtime">Bulk Airtime</h5>
    </div>-->
    <div class="mt-3 row">
        <div class="col-6">
        <form id="buyAirtimeForm" style="color:" action="#!">
            <div class="card effect" style="width: 35rem;">
                <div class="card-body">
                   <div class="md-form">
                        <i class="fas fa-user prefix" style="color:orange"></i>
                        <input type="hidden" id="username" name="username" value="${username}" class="form-control" disabled>
                        <label for="username"></label>
                        <div class="text-danger" id="username_error"></div>
                    </div>
                    <div class="md-form">
<!--                        <i class="fas fa-signal" style="color:orange"></i>-->
                        <select class="browser-default custom-select network mb-2" id="network">
                            <option value="" disabled selected>SELECT NETWORK</option>
                            <option value="mtn">MTN</option>
                            <option value="glo">GLO</option>
                            <option value="airtel">AIRTEL</option>
                            <option value="9mobile">9MOBILE</option>
                        </select>
                        <div class="text-danger" id="network_error"></div>
                    </div>
                    <div class="md-form">
                        <i class="fas fa-phone-alt prefix" style="color: orange"></i>
                        <input type="text" id="phonenumber" name="phonenumber" class="form-control">
                        <label for="phonenumber">Phone Number</label>
                        <div class="text-danger" id="phonenumber_error"></div>
                    </div>
                    <div class="md-form">
                        <i class="fas fa-check-double prefix" style="color:orange"></i>
                        <input type="text" id="amount" name="amount" class="form-control">
                        <label for="amount">Amount</label>
                        <div class="text-danger" id="amount_error"></div>
                    </div>
                    <div class="text-center">
                        <button class="btn btn-outline-orange" id="buy_btn">Buy</button>
                        <div class="" id="spinner"></div>
                        <div class="success_message"></div>
                    </div>
            </div>
            </div>
        </form>
        </div>
        <div class="col-6">
            <div class="card">
                    <div class="card-header">Last 5 Recharge</div>
                    <div class="card-body my-1 py-1 mx-0 px-0">
                    <table class="table table-striped table-hover table-sm">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>Phone No.</th>
                                <th>Network</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${Last5TransactionLength > 0}">
                                     <c:forEach var="i" begin="0" end="${Last5TransactionLength -1}">
                                        <tr class="">
                                            <td class="text-center">${i + 1}</td>
                                            <td class="">${Last5Transaction.getJSONObject(i).getString("phonenumber")}</td>
                                            <td>${Last5Transaction.getJSONObject(i).getString("network")}</td>
                                            <td>${Last5Transaction.getJSONObject(i).getString("amount")}</td>
                                            <td>${Last5Transaction.getJSONObject(i).getString("transactiondate")}</td>
                                            <td><button class="btn btn-amber btn-sm btn_repay_recharge">RePay</button></td>
                                        </tr>
                                        </c:forEach>
                                </c:when>
                                <c:otherwise>
                                <h3 class="mx-2">No Previous Transaction</h3>
                                </c:otherwise>
                            </c:choose>         
                        </tbody>
                    </table>
                    </div>
                    </div>
        </div>
    </div>
</div>
                        
                        
<script>
    
//    $("#buyBulkAirtimeForm").hide();
//    $(".singleAirtime").click(function () {
//        $(".singleAirtime").removeClass("bg-white").addClass("bg-light");
//        $(".bulkAirtime").removeClass("bg-light").addClass("bg-white");
//        $("#buyBulkAirtimeForm").hide();
//        $("#buyAirtimeForm").show();
//    });
//    $(".bulkAirtime").click(function () {
//        $(".singleAirtime").removeClass("bg-light").addClass("bg-white");
//        $(".bulkAirtime").removeClass("bg-white").addClass("bg-light");
//        $("#buyBulkAirtimeForm").show();
//       $("#buyAirtimeForm").hide();
//    });
    
    $("#buy_btn").click(function(e) {
        let url = "${pageContext.request.contextPath}/buyairtime";
        e.preventDefault();
        let errorcheck = validate();
        if(!(errorcheck.includes("error"))) {
            $("#buy_btn").attr("disabled", true);
            $("#username_error").html("");
            $("#phonenumber_error").html("");
            $("#amount_error").html("");
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#buy_btn").html(spinner);
            let username = $("#username").val();
            let network = $("#network").val();
            let phonenumber = $("#phonenumber").val();
            let amount = $("#amount").val();

            let credentials = {
                "username" : username,
                "network" : network,
                "phonenumber" : phonenumber,
                "walletBalance" : "${walletBalance}",
                "companycode" : "${companycode}",
                "amount" : amount
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
                    if(response === "00") {
                        $("#buy_btn").html("Buy");
                        document.getElementById("buyAirtimeForm").reset();
                        $(".success_message").html('Airtime purchase successfully<i class="far fa-thumbs-up ml-1"></i>').addClass("animated wobble slower text-success");
                        $("#buy_btn").attr("disabled", false); 
                        setTimeout(function() {
                           $(".success_message").html(""); 
                        }, 2000);
                    }
                    else{
                        $("#buy_btn").html("Buy");
                        $(".success_message").html('Airtime purchase failed<i class="far fa-thumbs-up ml-1"></i>').addClass("animated wobble slower text-danger");
                        $("#buy_btn").attr("disabled", false);
                    }
                }
            });
        }
    });
    
    $(".btn_repay_recharge").click(function() {
        let url = "${pageContext.request.contextPath}/buyairtime";
            values = [];
            let username = $("#username").val();
            let network;
            let phonenumber;
            let amount;
            let parent1 = $(this).parent();
            let parent2 = parent1.parent();
            parent2.children().each(function() {
               let cellText = $(this).html();
               values.push(cellText);
               network = values[2];
               phonenumber = values[1];
               amount = values[3];
            });
            amount = amount.slice(0, -3);
            let spinner = `<i class="fa fa-spinner bg-black fa-spin" aria-hidden="true" style="color:white; font-size:20px;"></i>`;
            $(this).html(spinner);
            console.log("username " + username +"network " + network +"phonenumber "+ phonenumber + "amount "+ amount);
            let credentials = {
                "username" : username,
                "network" : network,
                "phonenumber" : phonenumber,
                "walletBalance" : "${walletBalance}",
                "companycode" : "${companycode}",
                "amount" : amount
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
                    if(response === "00") {
                        alert("Airtime purchased successfully");
                        $(".btn_repay_recharge").html("RePay");
                    }
                    else{
                        $(".btn_repay_recharge").html("RePay");
                        alert("Airtime purchased Failed");
                    }
                }
            });
    });
    
    $("#upload_btn").click(function() {
        let url = "${pageContext.request.contextPath}/addPost";
        let uploader = $("#uploader").val();
        let companycode = $("#companycode").val();
        let file = $('#fileToUpload')[0].files[0];
        let formData = new FormData();
//        if(file !== null) {
//            formData.append('file', file);
//        }
//        else{
//            formData.append('file', new File([""], "null"));
//        }
        formData.append("file", file);
        formData.append('uploader', uploader);
        formData.append('companyCode', companycode);
        let credentials = {
                "uploader" : uploader,
                "companycode" : companycode,
                "file" : file
            };
        //console.log("form_data "+ JSON.stringify(formData));
        var formData1 = new FormData();
        formData1.append('file', file);
        formData1.append('value1', uploader);
        formData1.append('value2', companycode);
        $.ajax({
          url: "${pageContext.request.contextPath}/bulkairtimeupload",
          type: 'post',
           cache: false,
           contentType: false,
           processData: false,
           data: formData,
           success: function (data) {
             // ..... any success code you want
         }
    });
    });


    function validate(){
        let error = [];
        let username = $("#username").val();
        let network = $("#network").val();
        let phonenumber = $("#phonenumber").val();
        let amount = $("#amount").val();
        if(username === "" || username === undefined) {
            error.push("error");
            $("#network_error").html("");
            $("#phonenumber_error").html("");
            $("#amount_error").html("");
            $("#username_error").html("You are not Logged in").addClass("text-danger");
        }
        else if(network === "" ||network === undefined || network === null) {
            error.push("error");
            $("#username_error").html("");
            $("#phonenumber_error").html("");
            $("#amount_error").html("");
            $("#network_error").html("Please select a network").addClass("text-danger");
        }
        else if(phonenumber === "" || phonenumber === undefined || phonenumber.length < 10) {
            error.push("error");
            $("#username_error").html("");
            $("#network_error").html("");
            $("#amount_error").html("");
            $("#phonenumber_error").html("Enter a valid number").addClass("text-danger");
        }
        else if(amount === "" || amount === undefined){
            error.push("error");
            $("#username_error").html("");
            $("#phonenumber_error").html("");
            $("#network_error").html("");
            $("#amount_error").html("Field can not be empty").addClass("text-danger");
        }
        return error;
    }
</script>

