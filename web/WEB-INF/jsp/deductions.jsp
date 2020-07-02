<%-- 
    Document   : deductions
    Created on : 12-Jun-2020, 08:25:51
    Author     : Tayo
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<style>
    .effect{
        margin-left : -600px;
/*        background-color: #808080;*/
    }
</style>
<div>
  <div class="mt-2" style="text-align: center;">
      
  <h5 class="warning-color white-text text-center">
    <strong>Create Deduction</strong>
  </h5> 
  </div>
  <div class="card effect" style="width: 35rem;"> 
  <!--Card content-->
  <div class="card-body">

    <!-- Form -->
    <form class="text-center" name="deductionForm" id="deductionForm" style="color: #757575;" action="#!">

      <!-- Email -->
      <div class="md-form">
        <input type="text" name="dname" id="dname" class="form-control">
        <label for="dname">Deduction Name</label>
        <div class="text-white" id="dname_error"></div>
      </div>
      
      
      <div class="md-form">
        <input type="number" id="amount" name="amount" class="form-control">
        <label for="amount">Amount</label>
        <div class="text-white" id="amount_error"></div>
      </div>
         
      
      <div class="md-form">
          <select name="employee" id="employee" class="form-control">
              <option disabled>- Select Employee -</option>
               <c:choose>
                      <c:when test="${employee.length() > 0}">
              <c:forEach var="i" begin="0" end="${employee.length() - 1}">
                  <option value="${employee.getJSONObject(i).getString("id")}">
                  ${employee.getJSONObject(i).getString("firstname")} ${employee.getJSONObject(i).getString("lastname")}</option>
              </c:forEach>
                  </c:when>
              <c:when test="${location.length() <= 0}">
              
              </c:when>
               </c:choose>
          </select> 
              <div class="text-white" id="empl_error"></div>
      </div>
      
       

      <div class="d-flex justify-content-around">
        <div>
          
        </div>
      </div>

      <!-- Sign in button -->
      <button class="btn btn-outline-warning btn-rounded btn-block my-4 waves-effect z-depth-0" id="btn_create_deduction" type="button">Create</button><div id="spinner"></div>
 <div class="success_message"></div>

    </form>
    <!-- Form -->

  </div>

</div>
      </div> 
              
 <script>              
     
      $(document).ready(function(){
        $('.effect').animate({'margin-left' : '250px'}, 1000, 'linear');
    });
$("#btn_create_deduction").click(function(e){
            let url= "${pageContext.request.contextPath}/createDeduction";
            e.preventDefault();
            console.log("Editing in progress");
             let errorcheck= validate();
            if(!(errorcheck.includes("error"))){
            $("#btn_create_deduction").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#spinner").html(spinner);
            
             let deductionName= $("#dname").val(); 
             let employeeId= $("#employee").val();
             let amount= $("#amount").val();
             let companyCode= "00109";
             
             console.log(deductionName + employeeId + amount + companyCode); 
             let credentials= {
             "deductionName": deductionName, 
             "employeeId": employeeId,
             "amount": amount,
             "companyCode" : companyCode
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
                            document.getElementById("deductionForm").reset();
                            $(".success_message").html("Deduction Created Successfully").addClass("alert alert-success");
                            setTimeout(function(){ 
                                $("#spinner").html("");
                                $(".success_message").html("");
                                $("#btn_create_deduction").attr("disabled", false); 
                            }, 3000);
                        } else{
                           $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Deduction"); 
                        }
                    },
            error: function(err) {
                             $("#spinner").html("");
                           $(".success_message").html("Error: Couldn't Create Deduction:" + err);  
            }
                    
                });
            }
        });
        
         function validate(){
        let error = [];
        let deductionName= $("#dname").val(); 
        let employeeId= $("#employee").val();
        let amount= $("#amount").val(); 
        if((deductionName === "" || deductionName === "undefined") && (employeeId === "" || employeeId === "undefined") && (amount === "" || amount === "undefined") ){
            error.push("error");
            $("#dname_error").html("Deduction Name cannot be empty").addClass("bg-danger");    
            $("#empl_error").html("Employee cannot be empty").addClass("bg-danger"); 
            $("#amount_error").html("Amount cannot be empty").addClass("bg-danger");  
        }
        else if(deductionName === "" || deductionName === "undefined") {
            error.push("error");
            $("#dname_error").html("Deduction Name cannot be empty").addClass("bg-danger"); 
             $("#empl_error").html("");
             $("#amount_error").html("");
        }
        else if(employeeId === "" || employeeId === "undefined"){
             error.push("error");
            $("#empl_error").html("Employee cannot be empty").addClass("bg-danger");
             $("#dname_error").html("");
             $("#amount_error").html("");
        }
        else if(amount === "" || amount === "undefined"){
             error.push("error");
            $("#amount_error").html("Amount cannot be empty").addClass("bg-danger");
            $("#dname_error").html("");
             $("#empl_error").html("");
        }
        return error;
         }
     
</script>        