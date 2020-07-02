<%-- 
    Document   : employees
    Created on : 01-Jun-2020, 08:45:48
    Author     : Tayo
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<div class="container">
  <div class="row">
  
        <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;"> 
            <div id="result"></div>
 

     <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
        <div class="card mx-1 warning-color white-text px-2">
            <div class="d-flex align-items-center"><h5 class="bg">Grades</h5>
              
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
            <table id="tbl_grade" class="table table-hover table-sm tbl_grade tbl_grade_download">
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th> 
                        <th>Grade Name</th> 
                        <th>Amount</th>
                        <th>Date Created</th>  
                        <th class="d-none"></th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody> <c:choose>
                      <c:when test="${grade.length() > 0}">
                             <c:forEach var="i" begin="0" end="${grade.length() - 1}">
                                <tr class="add_cursor tr_${i}" id="">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${grade.getJSONObject(i).getString("gradename")}</td> 
                                    <td>${grade.getJSONObject(i).getString("amount")}</td>
                                    <td>${grade.getJSONObject(i).getString("datecreated")}</td> 
                                    <td class="d-none">${grade.getJSONObject(i).getString("id")}</td>
                                    <td> <button class="btn btn-sm btn-amber edit_grade" id="edit_${i}" data-no="${i}" type="button">Edit</button></td>
                                </tr>
                                 </c:forEach>
                                 </c:when>
              <c:when test="${grade.length() <= 0}">
               <tr class="" id="">
                   No Grade Data!
                                    <td class="text-center"></td>
                                    <td class="m_id"></td> 
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
        </div> </div></div>

   <div class="modal fade" id="addGrade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Grade Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
            <form class="text-center" id="addGradeForm" style="color: #757575;" action="#!">

      <!-- Email -->
      <div class="md-form">
        <input type="text" name="grade" id="grade" class="form-control">
        <label for="grade">Grade Name</label>
        <div class="text-white" id="gname_error"></div>
      </div>
      
      <div class="md-form">
        <input type="number" name="amount" id="amount" class="form-control">
        <label for="amount">Amount</label>
        <div class="text-white" id="amount_error"></div>
      </div>
      
       

      <div class="d-flex justify-content-around">
        <div>
          
        </div>
      </div>

      <!-- Sign in button -->
    
    </form>		
        </div>
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_create_grade">Save</button><div id="spinner"></div>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>                 
  
            <!-- Edit Modal Div -->
  <div class="modal fade" id="editGrade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
            <form class="text-center" id="editGradeForm" style="color: #757575;" action="#!">
                <div class="row">
                    <div class="md-form col-12">
                        <input type="text" id="gradeName" class="form-control">
                        <label for="grade" id="LabelgradeName"></label>
                        <div class="text-white" id="egname_error"></div>
                    </div>
                    
                    <input type="hidden" name="id" id="id">
                </div>
                <div class="row">
                    <div class="md-form col-12">
                        <input type="text" id="eAmount" class="form-control">
                        <label for="amount" id="LabelAmount"></label>
                        <div class="text-white" id="eamount_error"></div>
                    </div>
                </div>
            </form>				
        </div>
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_edit_grade">Save Changes</button><div id="spinner"></div>
        <div class="success_message"></div>
        
      </div>
    </div>
  </div>
</div>
                
 <script>
     for(let i = 0; i<${grade.length()}; i++) {
            $("#edit_"+(i)).click(function() {
                values = [];
                $(".tr_"+(i)).children().each(function() {
                   var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
//                   $("#leditName").html(values[1]); 
                   $("#gradeName").val(values[1]); 
                   $("#id").val(values[4]);
                   $("#eAmount").val(values[2]);
                   values.push(cellText);
                }); 
                //console.log(values);
                $('#editGrade').modal('show');
                
            });
        }             
    
      $("#btn_create_grade").click(function(e){
        e.preventDefault();
    let btn = $(this);
    let span = btn.children("span");
    let grade = $("#grade"); 
    let amount = $("#amount"); 
    let url3 = "${pageContext.request.contextPath}/createGrade"; 
     let errorcheck= validate2();
            if(!(errorcheck.includes("error"))){
        $("#btn_create_grade").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
       $("#btn_create_grade").html(spinner);
        let company = ${companyCode};
        let newGradeData = {
            "gradeName": grade.val(), 
            "amount": amount.val(), 
            "companyCode": company.toString()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: url3,
            data: JSON.stringify(newGradeData),
            beforeSend: function() {
                console.log(newGradeData);
            },
            success: function(data){ 
                if (data.responsecode === "00") {
                  $("#spinner").html("");
                            $(".success_message").html("Grade Updated Successfully").addClass("alert alert-success");
                            document.getElementById("addGradeForm").reset();
                            setTimeout(function(){
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_create_grade").attr("disabled", false);
                                $("#addGrade").modal('hide');
                                reloadPage("grade");
                            }, 3000);
                }
                else {
                    $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Grade"); 
                } 
            },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Grade:" + err);  
            }
        }); 
    }
}); 
    
    
    
    $("#btn_edit_grade").click(function(e){
            let url= "${pageContext.request.contextPath}/updateGradeDetail";
            e.preventDefault();
            console.log("Editing in progress");
             let errorcheck= validate();
            if(!(errorcheck.includes("error"))){
            $("#btn_edit_grade").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#btn_edit_grade").html(spinner);
            
             let gradeName= $("#gradeName").val(); 
             let amount = $("#eAmount").val();
             let id= $("#id").val();
             
             console.log(gradeName); 
             let credentials= {
             "gradeName": gradeName,
             "amount": amount,
             "id" : id
              };
              
              $.ajax({
                    type: "POST",
                    dataType: 'json',
                    contentType: 'application/json',
                    url: url,
                    data: JSON.stringify(credentials),
                    beforeSend: function(xhr){
                        console.log(credentials);
                    },
                    success: function(data){
                        if(data.responsecode === "00"){
                            $("#spinner").html("");
                            $(".success_message").html("Grade Updated Successfully").addClass("alert alert-success");
                            document.getElementById("editGradeForm").reset();
                            setTimeout(function(){
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_edit_grade").attr("disabled", false);
                                $("#editGrade").modal('hide');
                                reloadPage("grade");
                            }, 3000);
                        } else{
                           $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Edit Grade"); 
                           setTimeout(function(){
                               $("#btn_edit_grade").attr("disabled", false);
                               $(".success_message").html("");
                               $("#editGrade").modal('hide');
                            }, 3000);
                        }
                    },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Edit Grade:" + err);  
                           setTimeout(function(){
                               $("#btn_edit_grade").attr("disabled", false);
                               $("#editGrade").modal('hide');
                            }, 3000);
            }
                    
                });
            }
        });
        
         function validate(){
        let error = [];
        let gName = $("#gradeName").val(); 
        let Amount = $("#eAmount").val(); 
        
          if((gName === "" || gName === "undefined") && (Amount === "" || Amount === "undefined")) {
            error.push("error");
            $("#egname_error").html("Grade Name cannot be empty").addClass("bg-danger");
            $("#eamount_error").html("Amount cannot be empty").addClass("bg-danger");
        }
        else if((gName === "" || gName === "undefined")) {
            error.push("error");
            $("#egname_error").html("Grade Name cannot be empty").addClass("bg-danger");  
            $("#eamount_error").html("");
        }
        else if((Amount === "" || Amount === "undefined")) {
            error.push("error");
            $("#eamount_error").html("Amount cannot be empty").addClass("bg-danger");  
            $("#egname_error").html("");
        }
        return error;
         }
         
         function validate2(){
        let error = [];
        let grade = $("#grade").val(); 
        let amount = $("#amount").val();
         if((grade === "" || grade === "undefined") && (amount === "" || amount === "undefined")){
            error.push("error");
            $("#gname_error").html("Grade Name cannot be empty").addClass("bg-danger");    
            $("#amount_error").html("Amount cannot be empty").addClass("bg-danger");  
        }
        else if(grade === "" || grade === "undefined"){
            $("#gname_error").html("Grade Name cannot be empty").addClass("bg-danger");
            $("#amount_error").html("");
        }
        else if(amount === "" || amount === "undefined"){
            $("#amount_error").html("Amount cannot be empty").addClass("bg-danger");
            $("#grade_error").html("");
        }
        return error;
        }
        
      function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }  
        
        
      $('.tbl_grade').DataTable({
//        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addGrade" id="submitGrade" type="button"> <div id="spinner"></div> Add Grade</button><p class="ml-3 mr-1">Total Records:'+"${totalGrade}"+'</p> </div>');
 </script>               
            
            