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
            <div class="d-flex align-items-center"><h5 class="bg">Payroll</h5>
              
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

        <div class="mt-3">
            <table id="tbl_payroll" class="table table-hover table-sm tbl_payroll tbl_payroll_download">
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th>
                        <th>Payroll Name</th>
                        <th>Date Created</th>
                        <th class="d-none"></th>
                        <th>Action</th>
<!--                        <th>Generate</th>-->
                        
                    </tr>
                </thead>
                <tbody>
                         <c:choose>
                        <c:when test="${payroll.length() > 0}">
                             <c:forEach var="i" begin="0" end="${payroll.length() - 1}">
                                <tr class="add-cursor view-single-merchant tr_view_${i}" id="">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${payroll.getJSONObject(i).getString("payrollname")}</td>
                                    <td>${payroll.getJSONObject(i).getString("datecreated")}</td>
                                    <td class="d-none">${payroll.getJSONObject(i).getString("id")}</td>
                                    <td> <button class="btn btn-sm btn-amber" id="view_${i}" data-id="${payroll.getJSONObject(i).getString("id")}" type="button">View</button><div id="spinner_div_${i}"></div></td>
                                </tr>
                                 </c:forEach>
                        </c:when>
                                 <c:when test="${payroll.length() <= 0}">
                                     <tr>
                                         No Payroll Data!
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td class="d-none"></td>
                                         <td></td>
                                     </tr>
                                 </c:when>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
  </div>
                            
    </div>
</div>
   

<div class="modal fade right modal-payroll-preview" id="payrollSingle" tabindex="-1" role="dialog" aria-labelledby="exampleModalPreviewLabel" aria-hidden="true">
    <div class="modal-dialog-full-width modal-dialog momodel modal-fluid" role="document">
        <div class="modal-content-full-width modal-content ">
            <div class=" modal-header-full-width   modal-header text-center">
                <h5 class="modal-title w-100" id="exampleModalPreviewLabel">Payroll Information </h5>
                <button type="button" class="close " data-dismiss="modal" aria-label="Close">
                    <span style="font-size: 1.3em;" aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">

                <!--<h1 class="section-heading text-center wow fadeIn my-5 pt-3">Invoice Sent out </h1>-->
                <div class="container" style="margin-top: -40px;">
                    <div class="row">
                        <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">



                            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                                <div class="card mx-1 warning-color white-text px-2">
                                    <div class="d-flex align-items-center"><h5 class="bg"> Payroll </h5>

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
                                               Total Clients: 
                                            </h3>
                                        </div>-->
                                <div class="mt-3">
                                    <table id="tbl_payroll_items" class="table table-hover table-sm tbl_payroll_items tbl_payroll_items_download">
                                        <thead style="background-color: #F05E23; color: white;">
                                            <tr>
                                                <th class="text-center">S/N</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Grade</th>
                                                <th>Department</th>
                                                <th>Designation</th>
                                                 <th>Account Number</th>
                                                <th>Amount</th>
                                                <th>Net Amount</th>
<!--                                                <th>Deductions</th>-->
                                                <th class="d-none">Phone Number</th>
                                                <th class="d-none">Division</th>
                                                <th class="d-none">Bank</th>
                                                <th class="d-none">Location</th>
                                                <th class="d-none">Region</th>
                                                <th class="d-none">Email</th>
                                                <th class="d-none">Id</th>
                                                <th class="d-none">Date Created</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody id="t_body">
                                                
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


<div class="modal fade" id="addEmployeeToPayroll" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog-full-width modal-dialog momodel modal-fluid" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Employee Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
         <div class="mt-3">
                                    <table id="tbl_employee_list" class="table table-hover table-sm tbl_employee_list tbl_employee_list_download">
                                        <thead style="background-color: #F05E23; color: white;">
                                            <tr>
                                                <th><input type="checkbox" class="masterCheck"></th>
                                                <th class="text-center">S/N</th>
                                                <th>First Name</th>
                                                <th>Last Name</th>
                                                <th>Grade</th>
                                                <th>Department</th>
                                                <th>Designation</th>
                                                 <th>Account Number</th>
                                                <th>Amount</th>
<!--                                                <th>Net Amount</th>-->
                                        
                                                <th class="d-none">Phone Number</th>
                                                <th class="d-none">Division</th>
                                                <th class="d-none">Bank</th>
                                                <th class="d-none">Location</th>
                                                <th class="d-none">Region</th>
                                                <th class="d-none">Email</th>
                                                <th class="d-none">Id</th>
                                                <th class="d-none">Date Created</th>
                                                <th class="d-none">Financial Institution</th>
                                            </tr>
                                        </thead>
                                        <tbody id="t_body">
                                            <c:choose>
                      <c:when test="${employee.length() > 0}">
                             <c:forEach var="i" begin="0" end="${employee.length() - 1}">
                                            <tr class="add-cursor tr_${i}">
                                                 <td>
                            <input type="checkbox" class="approvalBox">
                            <input type="hidden" value="${employee.getJSONObject(i).getString("id")}">
                                                </td>
                                                <td>${i + 1}</td>
                                                <td>${employee.getJSONObject(i).getString("firstname")}</td>
                                                <td>${employee.getJSONObject(i).getString("lastname")}</td>
                                                <td>${employee.getJSONObject(i).getString("grade")}</td>
                                                <td>${employee.getJSONObject(i).getString("department")}</td>
                                                <td>${employee.getJSONObject(i).getString("designation")}</td>
                                                <td>${employee.getJSONObject(i).getString("accountnumber")}</td>
                                                <td>${employee.getJSONObject(i).getString("amount")}</td>

                                               
                                                <td>${employee.getJSONObject(i).getString("phonenumber")}</td>
                                                <td>${employee.getJSONObject(i).getString("division")}</td>
                                                <td>${employee.getJSONObject(i).getString("bank")}</td>
                                                <td>${employee.getJSONObject(i).getString("location")}</td>
                                                <td>${employee.getJSONObject(i).getString("region")}</td>
                                                <td>${employee.getJSONObject(i).getString("email")}</td>
                                                <td>${employee.getJSONObject(i).getString("id")}</td>
                                                <td>${employee.getJSONObject(i).getString("datecreated")}</td>
                                                <td>${employee.getJSONObject(i).getString("financialinstitutioncode")}</td>
                                            </tr>  
                                            </c:forEach>
                                </c:when>
                                 <c:when test="${employee.length() <= 0}">
                                     <tr>
                                         No Employee Data!
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                         <td></td>
                                     </tr>
                                     
                                 </c:when>
                                </c:choose>
                                        </tbody>
                                    </table>
                                </div>			
        </div>
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_add_employee">Add</button>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>







                                    
<div class="modal fade" id="addPayroll" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Payroll Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
             <form class="text-center" id="addPayrollForm" style="color: #757575;" action="#!">

        <div class="row">
      <div class="md-form col-12">
        <input type="text" name="payrollName" id="payrollName" class="form-control">
        <label for="payroll">Payroll Name</label>
        <div class="text-white" id="payroll_error"></div>
      </div>
        </div>
        
   
                 

    </form>			
        </div>
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_create_payroll">Save</button>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>



<script>
    
    for(let i = 0; i<${payroll.length()}; i++) {
            $("#view_"+(i)).click(function() {
                   let payrollID = ($(this).data("id"));
                   let url = "${pageContext.request.contextPath}/getPayrollItems";
                   $("#t_body").html(" ");
                   let spinner = `<i class="fa fa-spinner fa-spin text-orange" aria-hidden="true" style="font-size:40px;"></i>`;
                   $('#spinner_div_'+(i)).html(spinner);
                    let res;
                    let company = ${companyCode};
                    let credentials = {
                  "companycode" : company.toString(),
                  "payrollId" : payrollID.toString()
              };
              
//             let credentials = {
//                    "payrollId": "4",
//                    "firstname": "Taiwo",
//                    "lastname": "Kasumu",
//                    "email": "tkass2014@gmail.com",
//                    "phonenumber": "08135490459",
//                    "financialinstitutioncode": "044",
//                    "accountnumber": "1122334455"",
//                    "gradename": "GRade1",
//                    "department ": "Software Development",
//                    "designation": "Application Tester",
//                    "location": "Lagos",
//                    "division": "Lagos island",
//                    "region": "South West",
//                    "companyCode": "1",
//                    "amount": "17000",
//                    "deduction": "218",
//                    "netamount": "16782",
//                    "divisionId": "1"
//                     };

              
               $.ajax({
                type: "POST",
                dataType: "json",
                contentType: 'application/json',
                url: url,
                data: JSON.stringify(credentials),
                beforeSend: function (xhr) {
                    console.log(credentials);
                },
                success: function(response) {
//                    console.log(JSON.parse(response).length);
                    if(response.length > 0){
                    for(let i = 0; i<JSON.parse(response).length; i++) {
                        res = JSON.parse(response)[i];
                        console.log(res.labeltitle);
                        let tr = '<tr>';
                            tr = tr + ('<td>' + (i + 1) + '</td>');
                            tr = tr + ('<td class="px-4">' + res.firstname + '</td>');
                            tr = tr + ('<td>' + res.lastname + '</td>');
                            tr = tr + ('<td>' + res.gradename + '</td>');
                            tr = tr + ('<td>' + res.departmentname + '</td>');
                            tr = tr + ('<td>' + res.designationname + '</td>');
                            tr = tr + ('<td>' + res.accountnumber + '</td>');
                            tr = tr + ('<td>' + res.amount + '</td>');
                            tr = tr + ('<td>' + res.netamount + '</td>');
                            tr = tr + ('<td class="d-none">' + res.phonenumber + '</td>');
                            tr = tr + ('<td class="d-none">' + res.division + '</td>');
                            tr = tr + ('<td class="d-none">' + res.bank + '</td>');
                            tr = tr + ('<td class="d-none">' + res.location + '</td>');
                            tr = tr + ('<td class="d-none">' + res.region + '</td>');
                            tr = tr + ('<td class="d-none">' + res.email + '</td>');
                            tr = tr + ('<td class="d-none">' + res.id + '</td>');
                            tr = tr + ('<td class="d-none">' + res.datecreated + '</td>');
                            tr = tr + ('<td><button  id="remove'+res.pageid+'" class="btn btn-danger btn-sm btn_del" onclick=removeRole('+res.id+')><i class="fas fa-trash-alt"></i></button></td>');
                            
                            tr = tr + ('</tr>');
                            
                            console.log(tr);
                            $("#t_body").append(tr);
                    }
                } else {
                     let tr = '<tr>';
                            tr = tr + 'No Employee Data!';
                            tr = tr + ('<td>' +  '</td>');
                            tr = tr + ('<td class="px-4">' + '</td>');
                            tr = tr + ('<td>' +'</td>');
                            tr = tr + ('<td>' + '</td>');
                            tr = tr + ('<td>' + '</td>');
                            tr = tr + ('<td>' + '</td>');
                            tr = tr + ('<td>' +  '</td>');
                            tr = tr + ('<td>' +  '</td>');
                            tr = tr + ('<td>' + '</td>');
                            tr = tr + ('<td class="d-none">' + '</td>');
                            tr = tr + ('<td class="d-none">' +  '</td>');
                            tr = tr + ('<td class="d-none">' +  '</td>');
                            tr = tr + ('<td class="d-none">' +  '</td>');
                            tr = tr + ('<td class="d-none">' + '</td>');
                            tr = tr + ('<td class="d-none">' + '</td>');
                            tr = tr + ('<td class="d-none">' + '</td>');
                            tr = tr + ('<td class="d-none">' +  '</td>');
                            tr = tr + ('<td class="d-none"><button  id="" class="btn btn-danger btn-sm btn_del"><i class="fas fa-trash-alt"></i></button></td>');
                            
                            tr = tr + ('</tr>');
                            
                            console.log(tr);
                            $("#t_body").append(tr);
        }
                    $('#payrollSingle').modal('show');
                    $('#spinner_div_'+(i)).html("");
                }
              });
               
                //console.log(values);
                //$('#payrollSingle').modal('show');
                
            });
        }
  
$("#btn_create_payroll").click(function(e){
     e.preventDefault();
    let btn = $(this);
    let span = btn.children("span");
    let payroll = $("#payrollName");
    let company = ${companyCode};
    let preloader = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`;
    let url3 = "${pageContext.request.contextPath}/createPayroll"; 
    let errorcheck1= validate();
  if(!(errorcheck1.includes("error"))){
    $("#btn_create_payroll").attr("disabled", true);
    let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
    $("#btn_create_payroll").html(spinner);
        
        let newPayrollData = {
            "payrollName": payroll.val(),
            "companyCode": company.toString()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: url3,
            data: JSON.stringify(newPayrollData),
            beforeSend: function() {
                console.log(newPayrollData);
            },
            success: function(data){ 
                if (data.responsecode === "00") {
                            $("#btn_create_payroll").html("Create");
                            document.getElementById("addPayrollForm").reset();
                            $("#btn_create_payroll").attr("disabled", false);
                            $(".success_message").html("Payroll Added Successfully").addClass("alert alert-success");
                            setTimeout(function(){
                                $(".success_message").html("");
                                 $("#addPayroll").modal('hide');
                                reloadPage("payroll");
                            }, 3000);
                        } else{
                           $("#btn_create_payroll").html("Create");
                           $("#btn_create_payroll").attr("disabled", false);
                           $(".success_message").html("Error: Couldn't Create Payroll: " + data.responsecode); 
                        } 
            },
            error: function(err) {
                console.log(err);
                     $("#btn_create_payroll").html("Create");
                     $("#btn_create_payroll").attr("disabled", false);
                     $(".success_message").html("Error: Couldn't Create Payroll: "+err );
            }
        });
    }
}); 
        
function validate(){
        let error = [];
        let payrollname = $("#payrollName").val();
       if((payrollname === "" || payrollname === "undefined")) {
             error.push("error");
            $("#payroll_error").html("Payroll name cannot be empty").addClass("bg-danger");
       }
        return error;
   }
   
    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }
      $('.tbl_payroll_items').DataTable({
        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filtera"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filtera").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white"  id="" data-toggle="modal" data-target="#addEmployeeToPayroll" type="button"> <div id="spinner"></div>Add Employee</button><p class="ml-3 mr-1">Total Records:</p> </div>');
    
    $('.tbl_payroll').DataTable({
        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white"  id="" data-toggle="modal" data-target="#addPayroll" type="button"> <div id="spinner"></div>Create Payroll</button><p class="ml-3 mr-1">Total Records:'+"${totalPayroll}"+'</p> </div>');
</script>tn-sm mr-auto text-white"  id="" data-toggle="modal" data-target="#addPayroll" type="button"> <div id="spinner"></div>Create Payroll</button><p class="ml-3 mr-1">Total Records:'+"${totalPayroll}"+'</p> </div>');
</script>