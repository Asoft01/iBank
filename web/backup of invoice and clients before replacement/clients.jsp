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
                    <div class="d-flex align-items-center"><h5 class="bg">Clients</h5>
                          <!--<h1>${companyCode}</h1>-->

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
                <!--        <div class="row">
                          <button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div> 
                          <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addClient" id="submitClient" type="button"> <div id="spinner"></div> Add Client</button>
                                                    
                        </div>-->

                <!--        <div class="mt-2">
                            <h3 class="font-weight-light" id="cm">
                               Total Clients: ${totalClient}
                            </h3>
                        </div>-->
                <div class="mt-3">
                    <table id="tbl_client " class="table table-hover table-sm tbl_client tbl_client_download">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>Phone Number</th>
                                <th>Date</th>
                                <th class="d-none"></th>
                                <th>Action</th>
                                <th></th>
                                <th></th>


                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${client.length() > 0}">
                                    <c:forEach var="i" begin="0" end="${client.length() - 1}">
                                        <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                            <td class="text-center">${i + 1}</td>
                                            <td class="m_id">${client.getJSONObject(i).getString("clientName")}</td>
                                            <td class="tdclientEmail">${client.getJSONObject(i).getString("clientEmail")}</td>
                                            <td>${client.getJSONObject(i).getString("address")}</td>
                                            <td class="m_token">${client.getJSONObject(i).getString("clientPhonenumber")}</td>
                                            <td class="m_key">${client.getJSONObject(i).getString("datecreated")}</td>
                                            <td class="d-none">${client.getJSONObject(i).getString("id")}</td>
                                            <td> <a class="btn btn-sm btn-amber editting_client" id="edit_${i}" data-no="${i}"><i class="fas fa-edit"></i></a></td>
                                            <td><a class="btn btn-danger btn-sm" id="delete_client" onclick=deleteClient("${client.getJSONObject(i).getString('id')}")><i class="fas fa-trash-alt"></i></a></td>
                                            
        <!--                                    <a id="edit_" class="btn btn-primary btn-sm edit_${i}"><i class="fas fa-edit"></i></a>-->
                                            <!--<td> <button class="btn btn-sm btn-amber invoiceinfo_${i}" data-toggle="modal" data-target="#addInvoice" id="SubmitInvoice" type="button">Invoice</button></td>-->
                                            
                                            <!--<td> <button class="btn btn-sm btn-amber" data-toggle="modal" data-target="#viewInvoicePreview" id="SubmitInvoiceInfo" type="button">View</button></td>-->
                                            
                                            <!--<td> <button class="btn btn-sm btn-amber viewinvoiceperclient_${i}" data-toggle="modal" href="#myModalInvoiceView" type="button">Invoice</button></td>-->
                                            
                                            <td> <a class="btn btn-sm btn-amber viewinvoiceperclient"><i class="fas fa-arrow-alt-circle-right"></i></a></td>

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


<!-- Adding Client Information Here -->



<div class="modal fade" id="addClient" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Client Information</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>



            </div>
            <div class="modal-body">
                <!-- Beginning of Modal Body -->
                <div class="container">
                    <form class="text-center" id="addClientForm" style="color: #757575;" action="#!">
                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="cName" class="form-control">
                                <input type="hidden" id="cCode" value="${companyCode}">
                                <label for="fname" id="fname_L">Client Name</label>
                                <div class="text-white" id="cname_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="cEmail" class="form-control">
                                <label for="surname" id="surname_L">Email</label>
                                <div class="text-white" id="cemail_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="cAddress" class="form-control">
                                <label for="caddress" id="fname_L">Address</label>
                                <div class="text-white" id="caddress_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="cPhone" class="form-control">
                                <label for="phone" id="surname_L">Phone Number</label>
                                <div class="text-white" id="cphone_error"></div>
                            </div>
                        </div>

                    </form>				
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="create_client">Save</button>
                <div class="success_message"></div>
            </div>
        </div>
    </div>
</div>

<!-- Editting Client Information here -->

<div class="modal fade" id="editClient" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Edit Details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>



            </div>
            <div class="modal-body">
                <!-- Beginning of Modal Body -->
                <div class="container">
                    <form class="text-center" id="editClientForm" style="color: #757575;" action="#!">
                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="ceditName" class="form-control">
                                <label for="fname" id="leditName"></label>
                                <div class="text-white" id="cname_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="ceditEmail" class="form-control">
                                <label for="surname" id="leditEmail"></label>
                                <div class="text-white" id="cemail_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="ceditAddress" class="form-control">
                                <label for="caddress" id="leditAddress"></label>
                                <div class="text-white" id="caddress_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="ceditPhone" class="form-control">
                                <label for="phone" id="leditPhone"></label>
                                <div class="text-white" id="cphone_error"></div>
                            </div>
                            <input type="hidden" id="id" class="form-control">
                        </div>

                    </form>				
                </div>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="edit_client">Save Changes</button><div id="spinner"></div>
                <div class="success_message"></div>

            </div>
        </div>
    </div>
</div>


<!-- Generate Invoice -->
<!--<div class="modal fade" id="addInvoice" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                 Beginning of Modal Body 
                <div class="container">
                    <form class="text-center" id="addInvoiceForm" style="color: #757575;" action="#!">
                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="iName" class="form-control" readonly>
                                <label for="iname" id="iname_L"></label>
                                <div class="text-white" id="iname_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="iEmail" class="form-control" readonly>
                                <label for="isurname" id="iemail_L"></label>
                                <div class="text-white" id="iemail_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="iPhone" class="form-control" readonly>
                                <label for="iphone" id="iphone_L"></label>
                                <div class="text-white" id="iphone_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="iAddress" class="form-control" readonly>
                                <label for="iaddress" id="iaddress_L"></label>
                                <div class="text-white" id="iaddress_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-6">
                                <input type="text" id="iAmount" class="form-control">
                                <label for="iamount" id="iamount_L">Amount</label>
                                <div class="text-white" id="iamount_error"></div>
                            </div>

                            <div class="md-form col-6">
                                <input type="text" id="iTax" class="form-control" value="7.5" readonly>
                                <input type="hidden" id="iTaxConvert" class="form-control" value="7.5" placeholder="Fixed tax (7.5%)">
                                <label for="itax" id="itax_L"></label>
                                <div class="text-white" id="itax_error"></div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="md-form col-12">
                                                        <div class="form-group">
                                                            <label for="exampleFormControlTextarea2">Narration</label>
                                                            <textarea class="form-control rounded-0" id="iNarration" rows="3" required></textarea>
                                                        </div>
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
</div>-->


<div class="modal fade modal-invoice" id="addInvoice" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
                        <input type="text" id="iName" class="form-control">
                        <input type="hidden" id="icCode" class="form-control" value="${companyCode}">
                        <label for="iname" id="iname_L"><i class="far fa-address-card mx-1"></i>Client Name</label>
                        <div class="text-white" id="iname_error"></div>
                    </div>

                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iEmail" class="form-control">
                        <label for="isurname" id="iemail_L"><i class="far fa-envelope mx-1"></i>Client Email</label>
                        <div class="text-white" id="iemail_error"></div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iPhone" class="form-control">
                        <label for="iphone" id="iphone_L"><i class="fas fa-phone-alt mx-1"></i>Client Phone</label>
                        <div class="text-white" id="iphone_error"></div>
                    </div>

                   <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iAddress" class="form-control">
                        <label for="iaddress" id="iaddress_L"><i class="fas fa-address-card mx-1"></i>Client Address</label>
                        <div class="text-white" id="iaddress_error"></div>
                    </div>
                </div>
                
                <div class="row">
                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iAmount" class="form-control">
                        <label for="iamount" id="iamount_L"><i class="fas fa-money-check mx-1"></i>Amount</label>
                        <div class="text-white" id="iamount_error"></div>
                    </div>

                    <div class="md-form col-6 py-1 my-1">
                        <input type="text" id="iTax" class="form-control">
                        <label for="itax" id="itax_L"><i class="fas fa-money-check mx-1"></i>Tax</label>
                        <div class="text-white" id="itax_error"></div>
                        <input type="hidden" id="iTaxConvert" class="form-control" value="7.5" placeholder="Fixed tax (7.5%)">
                       
                    </div>
                </div>
                
                <div class="row">
                    <div class="md-form col-12">
<!--                        <div class="form-group">
                            <label for="exampleFormControlTextarea2">Narration</label>
                            <textarea class="form-control rounded-0" id="iNarration" rows="3" required></textarea>
                        </div>-->

                        <input type="text" id="iNarration" class="form-control" >
                        <label for="inarration" id="inarration_L"><i class="fas fa-address-card mx-1"></i>Narration</label>
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


<!--View Invoice Details of Specific Client-->
<!--<button id="modalActivate" type="button" class="btn btn-danger" data-toggle="modal" data-target="#viewInvoicePreview">
    View Invoice Info
</button>-->
<!-- Modal -->
<div class="modal fade right modal-invoice-preview" id="myModalInvoiceView" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
    <div class="modal-dialog-full-width modal-dialog momodel modal-fluid" role="document">
        <div class="modal-content-full-width modal-content ">
            <div class=" modal-header-full-width   modal-header text-center">
                <h5 class="modal-title w-100" id="exampleModalPreviewLabel">Invoice Information </h5>
                <button type="button" class="close " data-dismiss="modal" aria-label="Close">
                    <span style="font-size: 1.3em;" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <!--<h1 class="section-heading text-center wow fadeIn my-5 pt-3">Invoice Sent out </h1>-->
                <div class="container" style="margin-top: -40px;">
                    <div class="row">
                        <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">


                            <!--<h1>${companyCode}</h1>-->
                            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                                <div class="card mx-1 warning-color white-text px-2">
                                    <div class="d-flex align-items-center"><h5 class="bg"> Invoices </h5>

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
                                <!--        <div class="row">
                                          <button type="button" class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-target="#addClient" id="addClient">Add Client</button> <div id="spinner"></div> 
                                          <button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addClient" id="submitClient" type="button"> <div id="spinner"></div> Add Client</button>
                                                                    
                                        </div>-->

                                <!--        <div class="mt-2">
                                            <h3 class="font-weight-light" id="cm">
                                               Total Clients: ${totalClient}
                                            </h3>
                                        </div>-->
                                <div class="mt-3">
                                    <table id="tbl_invoice_sent" class="table table-hover table-sm tbl_invoice_sent tbl_invoice_sent_download" cellspacing="0" width="100%">
                                        <thead style="background-color: #F05E23; color: white;">
                                            <tr>
                                                <th class="text-center">S/N</th>
                                                <th class="th-sm">Name</th>
                                                <th class="th-sm">Email</th>
                                                <th class="th-sm">Address</th>
                                                <th class="th-sm">Phone Number</th>
                                                <th class="th-sm">Total Amount</th>
                                                <th class="th-sm"> Date Created</th>
                                                
                                                <!--<th>Status</th>-->
<!--                                                <th class="d-none"></th>
                                                <th>Action</th>-->
                                            </tr>
                                        </thead>
                                        <tbody id="tinvoicegeneratedperclient">
                                            
<!--                                            <tr class="add-cursor view-single-merchant" id="">
                                                <td>1</td>
                                                <td>Adeleke Hammed</td>
                                                <td>supersoft19@gmail.com</td>
                                                <td>08029009959</td>
                                                <td>LEKKI</td>
                                                <td>#2,000</td>
                                                <td>#200</td>
                                                <td>#2,200</td>
                                                <td>Sent</td>
                                                <td></td>
                                                 <td><a class="btn btn-sm btn-amber btn_view_invoice"><i class="fas fa-edit"></i></a></td>
                                                 <td></td>
                                                <td></td>
                                                
                                            </tr>-->

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="modal-footer-full-width  modal-footer">
                <button type="button" class="btn btn-danger btn-md btn-rounded" data-dismiss="modal">Close</button>
                <!--<button type="button" class="btn btn-primary btn-md btn-rounded">Save changes</button>-->
            </div>
        </div>
    </div>
</div>

<script>
//     function showEdit(data_no) {
//            alert(data_no);
//        }
//        $('.editting_client').click(function(){
//           let data_no = $(this).data('no');
//           showEdit(data_no);
//        }); 


//    $(".editting_client").click(function(){
//        alert("Hello");
//    });
//    $(document).ready(function(){

//    });
//    for (let j= 0; i< ${client.length()}; i++){
//        $(".viewinvoiceperclient").click(function() {
//        values= [];
////        let tr = $(this).parent();
//        $(".tr_" + (i)).children().each(function () {
//            let email = $("#tdclientEmail").html();
//            var cellText= $(this).html();
////            alert(cellText[1]);
//              alert(email);
//            });
//        });
//    }
//    let chosenEmail;
//    let url = "${pageContext.request.contextPath}/createclient";
    $(".viewinvoiceperclient").click(function() {
        $("#tinvoicegeneratedperclient").html(" ");
       let url = "${pageContext.request.contextPath}/getgeneratedinvoiceperclient";
//        let email = $(this).siblings(".tdclientEmail");
//        alert(email);
        let tr = $(this).parent();
        let tr2= tr.parent();
        let values = [];
        tr2.children().each(function() {
            let cellText = $(this).html();
//            let cellText= $(this).siblings(".tdclientEmail");
            values.push(cellText);
//            alert(cellText);
            chosenEmail = values[2];
            
//            alert(values[2]);
//            let email = values[2];
//            alert
        });
//        alert(chosenEmail);
        console.log("this is choosen mail " + chosenEmail);
        let clientEmail= chosenEmail;
        let credentials= {
            "clientEmail": clientEmail
        };
         $.ajax({
                method: "POST",
                url: url,
                data: credentials,
                beforeSend: function (xhr) {
                    console.log(credentials);
                },
                success: function(response){
                    console.log(JSON.parse(response).length);
                    for(let i=0; i< JSON.parse(response).length; i++){
                        res= JSON.parse(response)[i];
                        console.log(res.clientPhonenumber);
                        let tr= '<tr>';
                            tr= tr + ('<td>' + (i + 1) + '</td>');
                            tr= tr + ('<td class="px-4">' + res.clientName + '</td>');
                            tr= tr + ('<td class="px-4">' + res.clientEmail + '</td>');
                            tr= tr + ('<td class="px-4">' + res.address + '</td>');
                            tr= tr + ('<td class="px-4">' + res.clientPhonenumber + '</td>');
                            tr= tr + ('<td class="px-4">' + res.totalamount + '</td>');
                            tr= tr + ('<td class="px-4">' + res.datecreated + '</td>');
                            tr = tr + ('</tr>');
                            console.log(tr);
                            $("#tinvoicegeneratedperclient").append(tr);
                            
                            
                    }
                      $("#myModalInvoiceView").modal("show");
                    
//                    for(let i = 0; i<JSON.parse(response).length; i++) {
//                        res = JSON.parse(response)[i];
//                        console.log(res.labeltitle);
//                        let tr = '<tr>';
//                            tr = tr + ('<td>' + (i + 1) + '</td>');
//                            tr = tr + ('<td class="px-4">' + res.label + '</td>');
//                            tr = tr + ('<td>' + res.pageid + '</td>');
////                            tr = tr + ('<td class="px-4">' + res.lebeltitle + '</td>');
//                            tr = tr + ('<td><button class="btn btn-success btn-sm" id="add'+res.pageid+'" onclick=addRole('+res.pageid+","+id+')>Add</button></td>');
//                            
//                            tr = tr + ('</tr>');
//                            console.log(tr);
//                            $("#t_body").append(tr);
//                    }
                    
                }
            });	
    });

    for (let i = 0; i <${client.length()}; i++) {
        $("#edit_" + (i)).click(function () {
            values = [];
            $(".tr_" + (i)).children().each(function () {
                var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
//                   $("#leditName").html(values[1]); 
                $("#ceditName").val(values[1]);
//                   $("#leditEmail").html(values[2]); 
                $("#ceditEmail").val(values[2]);
//                   $("#leditAddress").html(values[3]); 
                $("#ceditAddress").val(values[3]);
//                   $("#leditPhone").html(values[4]); 
                $("#ceditPhone").val(values[4]);
                $("#id").val(values[6]);
//                   $("#username_L").html(""); 
//                   $("#username").val(values[4]).addClass("disabled");
//                   $("#role").val(values[5]);
//                   $("#id").val(values[6]);
                //$("#password").val(values[7]);
//                   $("#c_passwordDiv").hide();
//                   $("#addUser").hide();
//                   $("#editUser").show();
                values.push(cellText);
            });
            //console.log(values);
            $('#editClient').modal('show');

        });
    }


    $('#create_client').click(function (e) {
//            alert("How are you");
        let url = "${pageContext.request.contextPath}/createclient";
        e.preventDefault();
        let errorcheck = validate();
        if (!(errorcheck.includes("error"))) {
            $("#create_client").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
            $("#create_client").html(spinner);
            let companyCode= $("#cCode").val();
            let companyName = $("#cName").val();
            let companyEmail = $("#cEmail").val();
            let companyPhonenumber = $("#cPhone").val();
            let companyLocation = $("#cAddress").val();

            let credentials = {
                "companyCode": companyCode,
                "companyName": companyName,
                "companyEmail": companyEmail,
                "companyPhonenumber": companyPhonenumber,
                "companyLocation": companyLocation
            };

            $.ajax({
                method: "POST",
                url: url,
                data: credentials,
                beforeSend: function (xhr) {
                    console.log(credentials);
                },
                success: function (response) {
                    if (response === "00") {
                        $("#create_client").html("Create");
                        $("#create_client").attr("disabled", false);
                        $(".success_message").html("Client Added Successfully").addClass("alert alert-success");
                        document.getElementById("addClientForm").reset();
                        setTimeout(function () {
                            $("#addClient").modal('hide');
                            $("#create_client").html("Create");
                            $(".success_message").html("");
                            $("#addClient").attr("disabled", false);
                            $("#create_client").attr("disabled", false);
                            reloadPage("client");
                        }, 3000);
                    } else {
                        $("#create_client").html("Create");
                        $(".success_message").html("Error: Couldn't Register user");
                    }
                }
            });
        }
    });

    // Generating the clients information into the database

//        $('.editting_client').click(function(){
//            alert("Hello");
//        })
//        $('table#datatable tbody').on('click', 'tr td a.view-detail', function(){});

//   

    // Generating Customer Information into the invoice 

    for (let i = 0; i <${client.length()}; i++) {
        $(".invoiceinfo_" + (i)).click(function () {
            values = [];
            $(".tr_" + (i)).children().each(function () {
                var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
//                   $("#leditName").html(values[1]); 
                $("#iName").val(values[1]);
//                   $("#leditEmail").html(values[2]); 
                $("#iEmail").val(values[2]);
//                   $("#leditAddress").html(values[3]); 
                $("#iAddress").val(values[3]);
//                   $("#leditPhone").html(values[4]); 
                $("#iPhone").val(values[4]);
                $("#id").val(values[6]);
//                   $("#username_L").html(""); 
//                   $("#username").val(values[4]).addClass("disabled");
//                   $("#role").val(values[5]);
//                   $("#id").val(values[6]);
                //$("#password").val(values[7]);
//                   $("#c_passwordDiv").hide();
//                   $("#addUser").hide();
//                   $("#editUser").show();
                values.push(cellText);
            });
            //console.log(values);
            $('#addInvoice').modal('show');

        });
    }

    $("#edit_client").click(function (e) {
        let url = "${pageContext.request.contextPath}/updateclientdetail";
        e.preventDefault();
        console.log("Editting in progress");
        $("#edit_client").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
        $("#edit_client").html(spinner);

        let companyName = $("#ceditName").val();
        let companyEmail = $("#ceditEmail").val();
        let companyPhonenumber = $("#ceditPhone").val();
        let companyLocation = $("#ceditAddress").val();
        let id = $("#id").val();

        console.log(companyName + companyEmail + companyPhonenumber + companyLocation);
//             alert("Here");
        let credentials = {
            "companyName": companyName,
            "companyEmail": companyEmail,
            "companyPhonenumber": companyPhonenumber,
            "companyLocation": companyLocation,
            "id": id
        };

        $.ajax({
            method: "POST",
            url: url,
            data: credentials,
            beforeSend: function (xhr) {
                console.log(credentials);
            },
            success: function (response) {
                if (response === "00") {
                    $("#spinner").html("");
                    $(".success_message").html("Client Updated Successfully").addClass("alert alert-success");
                    document.getElementById("editClientForm").reset();
                    setTimeout(function () {
                        $("#editClient").modal('hide');
                        $("#spinner").html("");
                        $(".success_message").html("");
                        $("#editClient").attr("disabled", false);
                        reloadPage("client");
                    }, 3000);
                } else {
                    $("#spinner").html("");
                    $(".success_message").html("Error: Couldn't Edit user");
                }
            }

        });

    });

// Code to Generate Invoice //
    $('#generate_invoice').click(function (e) {
//            alert("How are you");
        let url = "${pageContext.request.contextPath}/generateinvoice";
        e.preventDefault();
//            let errorcheck= validate();
//            if(!(errorcheck.includes("error"))){
        $("#generate_invoice").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:50px;"></i>`;
        $("#generate_invoice").html(spinner);
        
        let companyCode= $("#icCode").val();
        let companyName = $("#iName").val();
        let companyEmail = $("#iEmail").val();
        let companyPhonenumber = $("#iPhone").val();
        let narration = $("#iNarration").val();
        let amount = $("#iAmount").val();
        let tax = $("#iTaxConvert").val();
        let companyLocation = $("#iAddress").val();


        let credentials = {
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
            beforeSend: function (xhr) {
                console.log(credentials);
            },
            success: function (response) {
                if (response === "00") {
                    $("#spinner").html("");
                    $(".success_message").html("Invoice Generated Successfully").addClass("alert alert-success");
                    document.getElementById("addInvoiceForm").reset();
                    setTimeout(function () {
                        $("#addInvoice").modal('hide');
                        $("#spinner").html("");
                        $(".success_message").html("");
                        $("#addInvoice").attr("disabled", false);
                        $("#myModalInvoiceView").modal('hide');
                        reloadPage("client");
                    }, 3000);
                } else {
                    $("#spinner").html("");
                    $(".success_message").html("Error: Couldn't Register user");
                }
            }
        })
//            }
    });
    
    // Deleting Invoice
    function deleteClient(data) {
	    let strconfirm = confirm("Are you sure you want to delete?");
            let url = "${pageContext.request.contextPath}/deleteClient";
	    if (strconfirm == true) {
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
                            reloadPage("client");
                        }
                        else{
                            alert("failed");
                        }
                    }
                });	
	    }   
	}
        
//$('.modal-invoice').click(function(){
//    $(event.target).modal('hide');
//    });

//$(".modal-invoice-preview").on('show.bs.modal', function (e) {
//    $(".modal-invoice").modal("hide");
//});


    function validate() {
        let error = [];
        let cName = $("#cName").val();
        let cEmail = $("#cEmail").val();
        let cPhone = $("#cPhone").val();
        let cAddress = $("#cAddress").val();


        if ((cName == "" || cName == "undefined") && (cEmail == "" || cEmail == "undefined") && (cPhone == "" || cPhone == "undefined") && (cAddress == "" || cAddress == "undefined")) {
            error.push("error");
            $("#cname_error").html("Full Name cannot be empty").addClass("bg-danger");
            $("#cemail_error").html("Email cannot be empty").addClass("bg-danger");
            $("#caddress_error").html("Address number cannot be empty").addClass("bg-danger");
            $("#cphone_error").html("Phone number cannot be empty").addClass("bg-danger");

            //return error;
        } else if (cName == "" || cName == "undefined") {
            error.push("error");
            $("#cname_error").html("Name name cannot be empty").addClass("bg-danger");
            $("#cemail_error").html("");
            $("#caddress_error").html("");
            $("#cphone_error").html("");

            //return error;
        } else if (cEmail == "" || cEmail == "undefined") {
            error.push("error");
            $("#cemail_error").html("Email cannot be empty").addClass("bg-danger");
            $("#cname_error").html("");
            $("#caddress_error").html("");
            $("#cphone_error").html("");

            //return error;
        } else if (cAddress == "" || cAddress == "undefined") {
            error.push("error");
            $("#caddress_error").html("Address number cannot be empty").addClass("bg-danger");
            $("#cname_error").html("");
            $("#cemail_error").html("");
            $("#cphone_error").html("");

        } else if (cPhone == "" || cPhone == "undefined") {
            error.push("error");
            $("#cphone_error").html("Phone cannot be empty").addClass("bg-danger");
            $("#cname_error").html("");
            $("#cemail_error").html("");
            $("#caddress_error").html("");
        }

        return error;
    }

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/" + pagemapping;
        $.post(urlU, function (res) {
            $(".page").html(res);
        });
    }
    $('.tbl_client').DataTable({
        "ordering": false,
        lengthMenu: [[5, 20, 50, -1], ['5 Records', '20 Records', '50 Records', 'ALL']],
        pageLength: 10,
        "language": {
            "search": "_INPUT_", // Removes the 'Search' field label
            "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addClient" id="submitClient" type="button"> <div id="spinner"></div> Add Client</button><p class="ml-3 mr-1">Total Records:' + "${totalClient}" + '</p> </div>');
    
    
    $('.tbl_invoice_sent').DataTable({
        "ordering": false,
        lengthMenu: [[5, 20, 50, -1], ['5 Records', '20 Records', '50 Records', 'ALL']],
        pageLength: 10,
        "language": {
            "search": "_INPUT_", // Removes the 'Search' field label
            "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filterr"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filterr").html('<div class="d-flex mr-4"><button class="btn btn-sm btn-amber" data-toggle="modal" id="SubmitInvoice" data-target="#addInvoice" type="button">Generate Invoice</button> <div id="spinner"></div> <p class="ml-3 mr-1"></div>');
    
    
</script>