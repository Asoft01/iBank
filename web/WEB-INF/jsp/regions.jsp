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
            <div class="d-flex align-items-center"><h5 class="bg">Region</h5>
              
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
            <table id="tbl_region" class="table table-hover table-sm tbl_region tbl_region_download">
                <thead style="background-color: #F05E23; color: white;">
                    <tr>
                        <th class="text-center">S/N</th> 
                        <th>Region Name</th> 
                        <th>Date Created</th>  
                        <th class="d-none"></th>
                    </tr>
                </thead>
                <tbody>
                     <c:choose>
                      <c:when test="${region.length() > 0}">
                             <c:forEach var="i" begin="0" end="${region.length() - 1}">
                                <tr class="add_cursor tr_${i}" id="">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="m_id">${region.getJSONObject(i).getString("region")}</td> 
                                    <td>${region.getJSONObject(i).getString("datecreated")}</td> 
                                    <td class="d-none">${region.getJSONObject(i).getString("id")}</td>
                                </tr>
                                 </c:forEach>
                                 </c:when>
                                 <c:when test="${region.length() <= 0}">
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

   <div class="modal fade" id="addRegion" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Region Information</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        
        
        
      </div>
      <div class="modal-body">
        <!-- Beginning of Modal Body -->
        <div class="container">
            <form class="text-center" id="addRegionForm" style="color: #757575;" action="#!">

      <!-- Email -->
      <div class="md-form">
        <input type="text" name="region" id="region" class="form-control">
        <label for="region">Region Name</label>
        <div class="text-white" id="rname_error"></div>
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
        <button type="button" class="btn btn-primary" id="btn_create_region">Save</button><div id="spinner"></div>
        <div class="success_message"></div>
      </div>
    </div>
  </div>
</div>                 
  

                
 <script>
     for(let i = 0; i<${region.length()}; i++) {
            $("#edit_"+(i)).click(function() {
                values = [];
                $(".tr_"+(i)).children().each(function() {
                   var cellText = $(this).html();
//                   alert(cellText);
//                   alert(values[5]);
//                   $("#leditName").html(values[1]); 
                   $("#regionName").val(values[1]); 
                   $("#id").val(values[3]);
                   values.push(cellText);
                }); 
                //console.log(values);
                $('#editRegion').modal('show');
                
            });
        }             
    
      $("#btn_create_region").click(function(e){
        e.preventDefault();
    let btn = $(this);
    let span = btn.children("span");
    let location = $("#region");
    let company = ${companyCode};
    let url3 = "${pageContext.request.contextPath}/createRegion"; 
     let errorcheck= validate2();
            if(!(errorcheck.includes("error"))){
        $("#btn_create_region").attr("disabled", true);
        let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
       $("#btn_create_region").html(spinner);
        
        let newRegionData = {
            "regionName": location.val(), 
            "companyCode": company.toString()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: url3,
            data: JSON.stringify(newRegionData),
            beforeSend: function() {
                console.log(newRegionData);
            },
            success: function(data){ 
                if (data.responsecode === "00") {
                  $("#spinner").html("");
                            $(".success_message").html("Region Added Successfully").addClass("alert alert-success");
                            document.getElementById("addRegionForm").reset();
                            setTimeout(function(){
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_create_region").attr("disabled", false);
                                $("#addRegion").modal('hide');
                                reloadPage("region");
                            }, 3000);
                }
                else {
                    $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Region"); 
                } 
            },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Region:" + err);  
            }
        }); 
    }
}); 
    
    
    
         
         function validate2(){
        let error = [];
        let reg = $("#region").val();
         if((reg === "" || reg === "undefined")){
            error.push("error");
            $("#rname_error").html("Region Name cannot be empty").addClass("bg-danger");    
        }
        return error;
        }
        
      function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/"+pagemapping;
        $.post(urlU, function(res){
            $(".page").html(res);
        });
    }  
        
        
      $('.tbl_region').DataTable({
//        "ordering": false,
        lengthMenu: [[5,20,50,-1], ['5 Records', '20 Records', '50 Records', 'ALL']],
	pageLength: 10,
        "language": {
        "search": "_INPUT_",            // Removes the 'Search' field label
        "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#addRegion" id="submitLocation" type="button"> <div id="spinner"></div> Add Region</button><p class="ml-3 mr-1">Total Records:'+"${totalRegion}"+'</p> </div>');
 </script>               
            
            