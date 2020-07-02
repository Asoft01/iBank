<%-- 
    Document   : division
    Created on : 18-Jun-2020, 15:34:51
    Author     : SuperSoft
--%>
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
            <div class="d-flex align-items-center"><h5 class="bg">Division</h5>
              
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
            <table id="tbl_division" class="table table-hover table-sm tbl_division tbl_division_download">
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th> 
                        <th>Division Name</th> 
                        <th>Date Created</th>  
                        <th class="d-none"></th>
                    </tr>
                </thead>
                <tbody>
                     <c:choose>
                      <c:when test="${division.length() > 0}">
                             <c:forEach var="i" begin="0" end="${division.length() - 1}">
                                <tr class="add_cursor tr_${i}" id="">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${division.getJSONObject(i).getString("divisionname")}</td> 
                                    <td>${division.getJSONObject(i).getString("datecreated")}</td> 
                                    <td class="d-none">${division.getJSONObject(i).getString("id")}</td>
                                </tr>
                                 </c:forEach>
                                 </c:when>
                                 <c:when test="${division.length() <= 0}">
                                     <tr class="" id="">
                                    <td class="text-center"></td>
                                    <td class="m_id"></td> 
                                    <td></td> 
                                    <td class="d-none"></td>
                                </tr> 
                                     
                                 </c:when>
                     </c:choose>
                </tbody>
            </table>
        </div>
    </div>
        </div> </div></div>

   <div class="modal fade" id="addDivision" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Division Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
            <form class="text-center" id="addDivisionForm" style="color: #757575;" action="#!">

      <!-- Email -->
      <div class="md-form">
        <input type="text" name="division" id="division" class="form-control">
        <label for="division">Division Name</label>
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
        <button type="button" class="btn btn-primary" id="btn_create_division">Save</button><div id="spinner"></div>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>                 
  

                
 <script>
     for(let i = 0; i<${division.length()}; i++) {
            $("#edit_"+(i)).click(function() {
                values = [];
                $(".tr_"+(i)).children().each(function() {
                   var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
//                   $("#leditName").html(values[1]); 
                   $("#divisionName").val(values[1]); 
                   $("#id").val(values[3]);
                   values.push(cellText);
                }); 
                //console.log(values);
                $('#editDivision').modal('show');
                
            });
        }             
    
      $("#btn_create_division").click(function(e){
        e.preventDefault();
    let btn = $(this);
    let span = btn.children("span");
    let division = $("#division");
    let company = ${companyCode};
    let url3 = "${pageContext.request.contextPath}/createDivision"; 
     let errorcheck= validate2();
            if(!(errorcheck.includes("error"))){
        $("#btn_create_division").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
       $("#btn_create_division").html(spinner);
        
        let newDivisionData = {
            "divisionName": division.val(), 
            "companyCode": company.toString()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: url3,
            data: JSON.stringify(newDivisionData),
            beforeSend: function() {
                console.log(newDivisionData);
            },
            success: function(data){ 
                if (data.responsecode === "00") {
                  $("#spinner").html("");
                            $(".success_message").html("Division Added Successfully").addClass("alert alert-success");
                            document.getElementById("addDivisionForm").reset();
                            setTimeout(function(){
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_create_division").attr("disabled", false);
                                $("#addDivision").modal('hide');
                                reloadPage("division");
                            }, 3000);
                }
                else {
                    $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Division"); 
                } 
            },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Division:" + err);  
            }
        }); 
    }
}); 
    
    
    
         
         function validate2(){
        let error = [];
        let div = $("#division").val();
         if((div === "" || div === "undefined")){
            error.push("error");
            $("#dname_error").html("Division Name cannot be empty").addClass("bg-danger");    
        }
        return error;
        }
        
      function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }  
        
        
      $('.tbl_division').DataTable({
//        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addDivision" id="submitDivision" type="button"> <div id="spinner"></div> Add Division</button><p class="ml-3 mr-1">Total Records:'+"${totalDivision}"+'</p> </div>');
 </script>               
            
            