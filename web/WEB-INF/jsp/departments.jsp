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
            <div class="d-flex align-items-center"><h5 class="bg">Department</h5>
              
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
            <table id="tbl_department" class="table table-hover table-sm tbl_department tbl_grade_department">
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th> 
                        <th>Department Name</th> 
                        <th>Date Created</th>  
                        <th class="d-none"></th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                      <c:when test="${department.length() > 0}">
                             <c:forEach var="i" begin="0" end="${department.length() - 1}">
                                <tr class="add_cursor tr_${i}" id="">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${department.getJSONObject(i).getString("departmentname")}</td> 
                                    <td>${department.getJSONObject(i).getString("datecreated")}</td> 
                                    <td class="d-none">${department.getJSONObject(i).getString("id")}</td>
                                    <td> <button class="btn btn-sm btn-amber edit_grade" id="edit_${i}" data-no="${i}" type="button">Edit</button></td>
                                </tr>
                                 </c:forEach>
                                  </c:when>
                                 <c:when test="${department.length() <= 0}">
                                   <tr class="" id="">
                                       No Department Data!
                                    <td class="text-center"></td>
                                    <td class="m_id"></td> 
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

   <div class="modal fade" id="addDepartment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Department Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
            <form class="text-center" id="addDepartmentForm" style="color: #757575;" action="#!">

      <!-- Email -->
      <div class="md-form">
        <input type="text" name="department" id="department" class="form-control">
        <label for="grade">Department Name</label>
        <div class="text-white" id="dname_error"></div>
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
        <button type="button" class="btn btn-primary" id="btn_create_department">Save</button><div id="spinner"></div>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>                 
  
            <!-- Edit Modal Div -->
  <div class="modal fade" id="editDepartment" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
            <form class="text-center" id="editDepartmentForm" style="color: #757575;" action="#!">
                <div class="row">
                    <div class="md-form col-12">
                        <input type="text" id="departmentName" class="form-control">
                        <label for="grade" id="LabeldepartmentName"></label>
                        <div class="text-white" id="edname_error"></div>
                    </div>
                    
                    <input type="hidden" name="id" id="id">
                </div>
            </form>				
        </div>
             
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="btn_edit_department">Save Changes</button><div id="spinner"></div>
        <div class="success_message"></div>
        
      </div>
    </div>
  </div>
</div>
                
 <script>
     for(let i = 0; i<${department.length()}; i++) {
            $("#edit_"+(i)).click(function() {
                values = [];
                $(".tr_"+(i)).children().each(function() {
                   var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
//                   $("#leditName").html(values[1]); 
                   $("#departmentName").val(values[1]); 
                   $("#id").val(values[3]);
                   values.push(cellText);
                }); 
                //console.log(values);
                $('#editDepartment').modal('show');
                
            });
        }             
    
      $("#btn_create_department").click(function(e){
        e.preventDefault();
    let btn = $(this);
    let span = btn.children("span");
    let department = $("#department");
    let company = ${companyCode};
    let url3 = "${pageContext.request.contextPath}/createDepartment"; 
     let errorcheck= validate2();
            if(!(errorcheck.includes("error"))){
        $("#btn_create_department").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
       $("#btn_create_department").html(spinner);
        
        let newDepartmentData = {
            "departmentName": department.val(), 
            "companyCode": company.toString()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: url3,
            data: JSON.stringify(newDepartmentData),
            beforeSend: function() {
                console.log(newDepartmentData);
            },
            success: function(data){ 
                if (data.responsecode === "00") {
                  $("#spinner").html("");
                            $(".success_message").html("Department Added Successfully").addClass("alert alert-success");
                            document.getElementById("addDepartmentForm").reset();
                            setTimeout(function(){
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_create_department").attr("disabled", false);
                                $("#addDepartment").modal('hide');
                                reloadPage("department");
                            }, 3000);
                }
                else {
                    $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Department"); 
                } 
            },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Department:" + err);  
            }
        }); 
    }
}); 
    
    
    
    $("#btn_edit_department").click(function(e){
            let url= "${pageContext.request.contextPath}/updateDepartmentDetail";
            e.preventDefault();
            console.log("Editing in progress");
             let errorcheck= validate();
            if(!(errorcheck.includes("error"))){
            $("#btn_edit_grade").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#btn_edit_department").html(spinner);
            
             let departmentName= $("#departmentName").val();
             let id= $("#id").val();
             
             console.log(departmentName); 
             let credentials= {
             "departmentName": departmentName,
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
                            $(".success_message").html("Department Updated Successfully").addClass("alert alert-success");
                            document.getElementById("editDepartmentForm").reset();
                            setTimeout(function(){
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_edit_department").attr("disabled", false);
                                $("#editDepartment").modal('hide');
                                reloadPage("department");
                            }, 3000);
                        } else{
                           $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Edit Department"); 
                           setTimeout(function(){
                               $("#btn_edit_department").attr("disabled", false);
                               $(".success_message").html("");
                               $("#editDepartment").modal('hide');
                            }, 3000);
                        }
                    },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Edit Department:" + err);  
                           setTimeout(function(){
                               $("#btn_edit_department").attr("disabled", false);
                               $("#editDepartment").modal('hide');
                            }, 3000);
            }
                    
                });
            }
        });
        
         function validate(){
        let error = [];
        let dName = $("#departmentName").val(); 
        
          if((dName === "" || dName === "undefined")) {
            error.push("error");
            $("#edname_error").html("Department Name cannot be empty").addClass("bg-danger");
        }
        return error;
         }
         
         function validate2(){
        let error = [];
        let dept = $("#department").val();
         if((dept === "" || dept === "undefined")){
            error.push("error");
            $("#dname_error").html("Department Name cannot be empty").addClass("bg-danger");    
        }
        return error;
        }
        
      function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }  
        
        
      $('.tbl_department').DataTable({
//        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addDepartment" id="submitDepartment" type="button"> <div id="spinner"></div> Add Department</button><p class="ml-3 mr-1">Total Records:'+"${totalDepartment}"+'</p> </div>');
 </script>               
            
            