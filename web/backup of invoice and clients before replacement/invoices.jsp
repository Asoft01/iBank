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

            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
<div class="card mx-1 warning-color white-text px-2">
            <div class="d-flex align-items-center"><h5 class="bg">Invoices</h5>
              
                <div class="d-flex align-items-center">
                   
                    <div id="table_export_btns" hidden></div>
                   <div class="dropdown" style="left: 640px; ">
  </div>
</div>
</div>
    <!--<h1>${companyCode}</h1>-->
                    <div>
                        <input id="lowerDate" hidden /><input id="upperDate" hidden />
                    </div>
                </div>
                
                <div class="mt-3">
                    <table id="" class="table table-hover table-sm tbl_invoices tbl_invoice_download">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>Client Name</th>
                                <th>E-mail</th>
                                <th>Phone Number</th>
                                <th>Address</th>
                                <th>Amount</th>
                                <th>Calculated Tax</th>
                                <th>Total Amount</th>
                                <th>Date Created</th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th class="d-none"></th>
                                <th>Actions</th>
                                <th></th>
                              
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${invoice.length() > 0}">
                                    <c:forEach var="i" begin="0" end="${invoice.length() - 1}">
                                        <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                            <td class="text-center">${i + 1}</td>
                                            <td class="m_id">${invoice.getJSONObject(i).getString("clientName")}</td>
                                            <td class="m_id">${invoice.getJSONObject(i).getString("clientEmail")}</td>
                                            <td class="m_id">${invoice.getJSONObject(i).getString("clientPhonenumber")}</td>
                                            <td class="m_id">${invoice.getJSONObject(i).getString("address")}</td>
                                            <td class="m_id convertint">${invoice.getJSONObject(i).getString("amount")}</td>
                                            <td class="m_id convertint">${invoice.getJSONObject(i).getString("calculatedTax")}</td>
                                            <td class="convertint">${invoice.getJSONObject(i).getString("totalamount")}</td>

                                            <td class="m_key">${invoice.getJSONObject(i).getString("datecreated")}</td>
                                            <td class="d-none">${invoice.getJSONObject(i).getString("id")}</td>
                                            <td class="d-none">${invoice.getJSONObject(i).getString("clientPhonenumber")}</td>
                                            <td class="d-none">${invoice.getJSONObject(i).getString("address")}</td>
                                            
                                            <td> <a class="btn btn-sm btn-amber viewinvoice_${i}" id="edit_${i}"><i class="fas fa-edit"></i></a> </td>
                                            <td><a class="btn btn-danger btn-sm" id="delete_invoice" onclick=deleteInvoice("${invoice.getJSONObject(i).getString('id')}")><i class="fas fa-trash-alt"></i></a></td>
                                            <!--<td> <button class="btn btn-sm btn-amber invoiceinfo_${i}" data-toggle="modal" id="SubmitInvoice" type="button">Generate Invoice</button></td>-->
                                    
        <!--                                    <a id="edit_" class="btn btn-primary btn-sm edit_${i}"><i class="fas fa-edit"></i></a>-->
        <!--                                    <td> <button class="btn btn-sm btn-amber invoiceinfo_${i}" data-toggle="modal" data-target="#addInvoice" id="SubmitInvoice" type="button">Generate Invoice</button></td>-->
<!--                                            <td><a class="btn btn-danger btn-sm" id="delete_invoice" onclick=deleteInvoice("${invoice.getJSONObject(i).getString('id')}")><i class="fas fa-trash-alt"></i></a><div class="success_message"></div></td>-->

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
                    

<!-- Generate Invoice -->
<div class="modal fade" id="addInvoice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Please enter invoice information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
            <form class="text-center" id="addInvoiceForm" style="color: #757575;" action="#!">
                <div class="row">
                    <div class="md-form col-6 py-1 my-1">
                        <input type="hidden" id="cCode" class="form-control" value="${companyCode}">
                        <input type="text" id="iName" class="form-control">
                        <label for="iname" id="iname_L"><i class="far fa-address-card mx-1"></i>Client Name</label>
                        <div class="text-white" id="iname_error"></div>
                    </div>

                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iEmail" class="form-control">
                        <label for="isurname" id="iemail_L"> <i class="far fa-envelope mx-1"></i> Client Email</label>
                        <div class="text-white" id="iemail_error"></div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iPhone" class="form-control">
                        <label for="iphone" id="iphone_L"> <i class="fas fa-phone-alt mx-1"></i> Client Phone</label>
                        <div class="text-white" id="iphone_error"></div>
                    </div>

                   <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iAddress" class="form-control">
                        <label for="iaddress" id="iaddress_L"> <i class="fas fa-address-card mx-1"></i> Client Address</label>
                        <div class="text-white" id="iaddress_error"></div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iAmount" class="form-control">
                        <label for="iamount" id="iamount_L"> <i class="fas fa-money-check mx-1"></i> Amount</label>
                        <div class="text-white" id="iamount_error"></div>
                    </div>

                    <div class="md-form col-6 py-1 my-1">
                        <!--<input type="text" id="iTax" class="form-control" value="7.5" readonly>-->
                        <input type="text" id="iTax" class="form-control">
                        <input type="hidden" id="iTaxConvert" class="form-control" value="7.5" placeholder="Fixed tax (7.5%)">
                        <label for="itax" id="itax_L"> <i class="fas fa-money-check mx-1"></i> Tax</label>
                        <div class="text-white" id="itax_error"></div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="md-form col-12 py-1 my-1">
<!--                        <div class="form-group">
                            <label for="exampleFormControlTextarea2">Narration</label>
                            <textarea class="form-control rounded-0" id="iNarration" rows="3" required></textarea>
                        </div>-->
                        <input type="text" id="iNarration" class="form-control" >
                        <label for="inarration" id="inarration_L">Narration</label>
                        <div class="text-white" id="inarration_error"></div>
                    </div>
                </div>
                 <input type="hidden" id="id" class="form-control">
                
            </form>				
        </div>
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="generate_invoice">Save</button>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>


<div class="modal fade" id="viewInvoice" tabindex="-1" role="dialog"
     aria-labelledby="testModalTitle3" aria-hidden="true">

    <!-- Add .modal-dialog-centered to .modal-dialog to vertically center the modal -->
    <div class="modal-dialog modal-dialog-centered" role="document"
         style="width: 1250px;">

        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="testModalTitle">View Invoice
                    Details</h5>
                <button type="button" class="close" data-dismiss="modal"
                        aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">


                <div class="container ">
                    <div id="HTMLtoPDF">
                        <!--<img src="https://supersoft.com.ng/imgs/supersoftLogo.png" width="50px" height="50px;"/>-->
                        <h2 align="center">Invoice for <span id="viewname"> </span></h2>
                        <u>
                            <h3 class="viewdescription text-center"></h3>
                        </u>
                        <form action="${contextRoot}/invoices" method="POST">
                            <div class="w-100 p-3" align="text-center" id="invoice-table">
                                <input type="hidden" id="viewiddd" class="form-control"
                                       name="id" value="">

                                <table
                                    class="table table-bordered table-striped tbl-invoice w-100">
                                    <thead>
                                        <tr>
                                            <th scope="col"><strong>Customer Mail</strong></th>
                                            <th scope="col"><strong>Date</strong></th>
                                            <th scope="col"><strong>Customer Number</strong></th>
                                            <th scope="col"><strong>Currency</strong></th>

                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><div id="viewmail"></div></td>
                                            <td><div id="viewdate"></div></td>
                                            <td><div id="viewnumber"></div></td>
                                            <th><strong> Naira(N) </strong></th>

                                        </tr>

                                        <tr>
                                            <th colspan="3"><strong>Description</strong></th>
                                            <th><strong> Amount</strong></th>
                                        </tr>

                                        <tr>
                                            <td colspan="3"><div class="viewnarration"></div></td>
                                            <td class="d-flex flex-row">&#8358;<div id="viewamount"></div></td>
                                        </tr>


                                        <tr>
                                            <td colspan="3">
                                                <strong>(TAX 7.5% VAT)
                                                </strong>
                                            </td>
                                            <td class="d-flex flex-row">&#8358;<div id="viewtax"></div> <div id="viewtaxconv"></td>
                                        </tr>

                                        <tr>
                                            <th colspan="3"><strong> TOTAL DUE </strong></th>
                                            <td class="d-flex flex-row">&#8358;<div id="viewtotal"></div></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                        </form>
                       
                    </div>

                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                <!-- <button type="button" class="btn btn-success btn-generate" onclick="generatePDF">Generate Invoice</button> -->
                <button class="btn btn-warning" id="downloadPdf">Download</button>
                <!-- <button type="button" class="btn btn-primary">Send Mail</button>  -->
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
    
    
//    $('.tbl_invoice').on('click', '.viewinvoice_'+(i), function () {
//        alert("you activate the event");
//    });
    
    for(let i = 0; i<${invoice.length()}; i++) {
            $(".viewinvoice_"+(i)).click(function() {
//                alert("Hello");
                values = [];
                $(".tr_"+(i)).children().each(function() {
                   var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
                   $("#viewname").html(values[1]); 
//                   $("#iName").val(values[1]);
                   $("#viewmail").html(values[2]); 
//                   let date = $("#viewdate").html(values[8]);
//                   
//                   let date1= new Date(date);
//                   let dateconv= date1.getFullYear()+ "/" + date1.getMonth() + "/" + date1.getDate();
                   $("#viewdate").html(values[8]);
                   
                   $("#viewnumber").html(values[3]);
                   $("#viewnarration").html(values[4]);
                   $("#viewamount").html(values[5]);
                   
                   let tax= values[6];
                   let amount= values[5];
                   let calculatedTax= (amount* (tax/1000));
                   let calculatedAmount= parseInt(amount) + parseInt(calculatedTax);
                   let doubleTax= calculatedTax.toFixed(2);
                   let doubleAmount= calculatedAmount.toFixed(2);
                   
                    $("#viewtax").html(tax);
                    $("#viewtotal").html(values[7]);
                    
//                   $("#viewtotal").html(values[7]);
                   values.push(cellText);
                }); 
                //console.log(values);
                $('#viewInvoice').modal('show');
                
            });
        }
    
    
     for(let i = 0; i<${invoice.length()}; i++) {
            $(".invoiceinfo_"+(i)).click(function() {
//                alert("Hello");
                values = [];
                $(".tr_"+(i)).children().each(function() {
                   var cellText = $(this).html();
//                   alert(cellText);
                   $("#iName").val(values[1]); 
                   $("#iEmail").val(values[2]); 
                     $("#iPhone").val(values[3]);
                     $("#iAddress").val(values[4]);
                     
                   values.push(cellText);
                }); 
                //console.log(values);
                $('#addInvoice').modal('show');
                
            });
        }
        
        $('#generate_invoice').click(function(e){
//            alert("How are you");
            let url= "${pageContext.request.contextPath}/generateinvoice";
            e.preventDefault();
            let errorcheck= validate();
            if(!(errorcheck.includes("error"))){
                $("#generate_invoice").attr("disabled", true);
                let spinner= `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
                $("#generate_invoice").html(spinner);
                
                let companyCode= $("#cCode").val();
                let companyName= $("#iName").val();
                let companyEmail= $("#iEmail").val();
                let companyPhonenumber= $("#iPhone").val();
                let narration=       $("#iNarration").val();
                let amount=          $("#iAmount").val();
                let tax=             $("#iTaxConvert").val();
                let companyLocation= $("#iAddress").val();
                
                
                let credentials= {
                    "companyCode": companyCode,
                    "companyName": companyName,
                    "companyEmail": companyEmail,
                    "companyPhonenumber": companyPhonenumber,
                    "narration": narration,
                    "amount": amount,
                    "tax": tax,
                    "companyLocation": companyLocation
                };
                
                $.ajax({
                    method: "POST",
                    url: url,
                    data: credentials,
                    beforeSend: function(xhr){
                        console.log(credentials);
                    },
                    success: function(response){
                        if(response=== "00"){
                            $("#spinner").html("");
                            $(".success_message").html("Invoice Generated Successfully").addClass("alert alert-success");
                            document.getElementById("addInvoiceForm").reset();
                            setTimeout(function(){
                                $("#addInvoice").modal('hide');
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#addInvoice").attr("disabled", false);
                               reloadPage("invoices");
                            }, 3000);
                        } else{
                           $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Register user"); 
                        }
                    }       
                })
            }
        });

         function deleteInvoice(data) {
	    let strconfirm = confirm("Are you sure you want to delete?");
            let url = "${pageContext.request.contextPath}/deleteInvoice";
	    if (strconfirm == true) {
                let credentials = {
                   "id" : data 
                };
                $(".page").html(`<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`);                $.ajax({
		method: "POST",
		url: url,
		data: credentials,
                beforeSend: function (xhr) {
                        console.log(credentials);
                    },
		success: function(response){
                     console.log("now now "+ response);
                    if(response === "success"){  
                        reloadPage("invoices");
                    }
                    else{
                        alert("failed");
                    }
                }
            });	
	    }   
	}
        
        
                    document.getElementById("downloadPdf").addEventListener('click',
			function() {
				const element = document.getElementById("HTMLtoPDF");
				html2pdf().from(element).save();

			});

            
            
        function validate(){
        let error = [];
        let iName = $("#iName").val();
        let iEmail = $("#iEmail").val();
        let iPhone = $("#iPhone").val();
        let iAddress = $("#iAddress").val();
        let iAmount= $("#iAmount").val();
        let iNarration= $("#iNarration").val();
        
        if((iName == "" || iName == "undefined") && (iEmail == "" || iEmail == "undefined") && (iPhone == "" || iPhone == "undefined") && (iAddress == "" || iAddress == "undefined") && (iAmount == "" || iAmount == "undefined") && (iNarration == "" || iNarration == "undefined") ) {
            error.push("error");
            $("#iname_error").html("Full Name cannot be empty").addClass("bg-danger");
            $("#iemail_error").html("Email cannot be empty").addClass("bg-danger");
            $("#iaddress_error").html("Address number cannot be empty").addClass("bg-danger");
            $("#iphone_error").html("Phone number cannot be empty").addClass("bg-danger");
            $("#iamount_error").html("Amount cannot be empty").addClass("bg-danger");
            $("#inarration_error").html("Narration cannot be empty").addClass("bg-danger");
            
            //return error;
        }
        else if(iName == "" || iName == "undefined") {
            error.push("error");
            $("#iname_error").html("Name name cannot be empty").addClass("bg-danger");
            $("#iemail_error").html("");
            $("#iaddress_error").html("");
            $("#iphone_error").html("");
            $("#iamount_error").html("");
            $("#inarration_error").html("");
            
            //return error;
        }
        else if(iEmail == "" || iEmail == "undefined") {
            error.push("error");
            $("#iemail_error").html("Email cannot be empty").addClass("bg-danger");
            $("#iname_error").html("");
            $("#iaddress_error").html("");
            $("#iphone_error").html("");
            $("#iamount_error").html("");
            $("#inarration_error").html("");
            
            //return error;
        }
        else if(iAddress == "" || iAddress == "undefined") {
            error.push("error");
            $("#iaddress_error").html("Address number cannot be empty").addClass("bg-danger");
            $("#iname_error").html("");
            $("#iemail_error").html("");
            $("#iphone_error").html("");
           
        }
        else if(iPhone == "" || iPhone == "undefined") {
            error.push("error");
            $("#iphone_error").html("Phone cannot be empty").addClass("bg-danger");
            $("#iname_error").html("");
            $("#iemail_error").html("");
            $("#iaddress_error").html(""); 
        }
        
        return error;
    }
    
           
//            $(".convertint").html(doubleAmount); 
  function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }
    
    $('.tbl_invoices').DataTable({
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
    $("div.pime-grid-filter").html('<div class="d-flex mr-2"><button class="btn btn-sm btn-amber" data-toggle="modal" id="SubmitInvoice" data-target="#addInvoice" type="button">Generate Invoice</button><p class="ml-3 mr-1">Total Records:'+"${totalInvoice}"+'</p> </div>');
            
</script>
