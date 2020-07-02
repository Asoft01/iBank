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
        
        <form id="bulkFundTransfer" name="bulkFundTransfer" enctype="multipart/form-data" style="color:" action="#!">
            <div class="card effect" style="width: 35rem;">
                <div class="card-body"> 
                    <div class="border">
                        <div class="mx-3">
                        <p><label for="image">Choose File</label></p> 
                        <input type="hidden" name="uploader" id="uploader" value="${username}" />
                        <input type="hidden" name="uploader" id="companycode" value="${companycode}" />
                        <p><input name="file" accept=".csv" id="fileToUpload" type="file" /></p>  
                        <p><input type="button" id="upload_btn" value="Upload"></p>
                        </div>
                    </div>
                    <span class="responseStatus"></span>    
            </div>
            </div>
        </form>
    </div>
                        <div class="mt-3 card">
                            <div class="card-body">
                        <table class="table table-striped table-hover tbl_bulkfundtransfer table-sm">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>File Name</th>
                                <th>Uploader</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                                        <tr class="">
                                            <td class="text-center">1</td>
                                            <td class="">bulk.csv</td>
                                            <td>habeeb lawal</td>
                                            <td>2020-04-15</td>
                                        </tr>
                                        
                                <!--<h3 class="mx-2">No Previous Transaction</h3>-->
      
                        </tbody>
                    </table>
                            </div>
                        </div>
</div>
                        
                        
<script>
    $(document).ready(function(){
        $('.effect').animate({'margin-left' : '250px'}, 1000, 'linear');
    });
    
    
    
    $("#upload_btnn").click(function () {
        let file = $('#fileToUpload')[0].files[0];
        let pUrl = 'http://cors-anywhere.herokuapp.com/';
        let apiUrl = 'http://68.169.57.98:80/InternetBankingApp/bulkairtimeupload';
        let result = fetch(apiUrl, {
            method: 'POST', 
            body: new FormData(document.querySelector("#buyBulkAirtimeForm"))
        });
        console.log("fetch " + result);
  
        //let spinner = $(".newfile-spinner");
//        let uploader = $("#uploader").val();
//        let companycode = $("#companycode").val();
//        if (document.getElementById('fileToUpload').files.length !== 0) {
//            let formData = new FormData();
//            formData.append('file', file);
//            formData.append("uploader", uploader);
//            formData.append("companyCode", companycode);
//            
//            
//            $.ajax({
//                type: 'POST',
//                contentType: 'multipart/form-data',
//                processData: false,
//                cache: false,
//                dataType: 'json',
//                url: 'http://68.169.57.98:80/InternetBankingApp/bulkairtimeupload',
//                data: formData,
//                beforeSend: function(xhr) {
//                    console.log(formData);
////                    xhr.setRequestHeader("Authorization", "Authorization");
////                    xhr.setRequestHeader("Header", "Header");
//                },
//                //console.log(Headers);
//                success: function(result){
//                    //spinner.hide();
//                    console.log(result);
//                    if (result.responsecode === "00") {
//                        alert("Questions Uploaded Successfully");
//                    }
//                    else {
//                        alert("Error occured");
//                    }
//                },
//                error: function(err) {
//                    console.log(err);
//                    //spinner.hide();
//                }
//            });
//        }
//        else {
//            alert("Choose a csv file and pick subject");
//        }
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
        formData.append('uploader', uploader);
        formData.append('companycode', companycode);
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
          url: "${pageContext.request.contextPath}/addPost",
          type: 'post',
           cache: false,
           contentType: false,
           processData: false,
           data: formData1,
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
    
    $('.tbl_bulkfundtransfer').DataTable({
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
    $("div.pime-grid-filter").html('<div class="d-flex mr-2"><p class="ml-3 mr-1">Total Records:'+"0"+'</p> </div>');
</script>


