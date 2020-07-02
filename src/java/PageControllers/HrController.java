/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PageControllers;


import java.io.IOException;
import java.net.MalformedURLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.RestCall;


/**
 *
 * @author Supersoft
 */
@Controller
public class HrController {
    RestCall restCall = new RestCall();
     JSONObject session;
    String companyCode;
    List<String> payrollRecord = new ArrayList<>();
    @RequestMapping({"/humanresources"})
    public ModelAndView HumanResources() throws JSONException{
        
       ModelAndView mv = new ModelAndView("humanresources");
        
       JSONObject js = new JSONObject();
       js.put("companyCode", "1");
       String api_method="getleaverequest";
       String api_methods= "getloanrequest";
       String approvedleaverequests= "getapprovedleaverequest";
       String approvedloanrequests= "getapprovedloanrequest";
       String getemployee = "getemployee";
       
       
       
       JSONArray leaverequest = new JSONArray(restCall.executeRequest(api_method, js));
       JSONArray loanrequest = new JSONArray(restCall.executeRequest(api_methods, js));
       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(approvedleaverequests, js));
       JSONArray approvedloanrequest = new JSONArray(restCall.executeRequest(approvedloanrequests, js));
       JSONArray gettingemployee  = new JSONArray(restCall.executeRequest(getemployee, js));
       
       
       System.out.println("Leave requests");
       System.out.println("Loan requests");
       
       int recordLength = leaverequest.length();
       mv.addObject("leaverequest", leaverequest);
       mv.addObject("totalLeaveRequest",recordLength);
       
       int recordLoanLength= loanrequest.length();
       mv.addObject("loanrequest", loanrequest);
       mv.addObject("totalLoanRequest", recordLoanLength);
       
       int recordApprovedLeaveLength= approvedrequests.length();
       mv.addObject("approvedrequests", approvedrequests);
       mv.addObject("totalApprovedLeaveRequest", recordApprovedLeaveLength);
       
       int recordApprovedLoanLength= approvedloanrequest.length();
       mv.addObject("approvedloanrequest", approvedloanrequest);
       mv.addObject("recordApprovedLoanLength", recordApprovedLoanLength);
       
       // Employee Details
       
       int recordGetEmployee= gettingemployee.length();
       mv.addObject("gettingemployee", gettingemployee);
       mv.addObject("recordGetEmployeeLength", recordGetEmployee);
       
       
//        int recordLength = approvedleaverequest.length();
//       mv.addObject("approvedLeaveRequest", approvedleaverequest);
//       mv.addObject("totalLeaveRequest",recordLength);
       
       // Default values to be added into the form before sent to the database
        mv.addObject("firstname", "Hammed");
        mv.addObject("lastname", "Adeleke");
        mv.addObject("grade", "Grade 1");
        mv.addObject("department", "Accounting");
        mv.addObject("designation", "Designation");
        mv.addObject("division", "Division 2");
        mv.addObject("location", "Lekki");
        mv.addObject("region", "na");
        return mv;
    }
    
     @RequestMapping({"/leave"})
    public ModelAndView Leave() throws JSONException{
        
       ModelAndView mv = new ModelAndView("leave");
        
       JSONObject js = new JSONObject();
       js.put("companyCode", "1");
       String api_method="getleaverequest";
       String api_methods= "getloanrequest";
       String approvedleaverequests= "getapprovedleaverequest";
       String approvedloanrequests= "getapprovedloanrequest";
       String getemployee = "getemployee";
       
       
       JSONArray leaverequest = new JSONArray(restCall.executeRequest(api_method, js));
       JSONArray loanrequest = new JSONArray(restCall.executeRequest(api_methods, js));
       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(approvedleaverequests, js));
       JSONArray approvedloanrequest = new JSONArray(restCall.executeRequest(approvedloanrequests, js));
       JSONArray gettingemployee  = new JSONArray(restCall.executeRequest(getemployee, js));
       
       
       System.out.println("Leave requests");
       System.out.println("Loan requests");
       
       int recordLength = leaverequest.length();
       mv.addObject("leaverequest", leaverequest);
       mv.addObject("totalLeaveRequest",recordLength);
       
       int recordLoanLength= loanrequest.length();
       mv.addObject("loanrequest", loanrequest);
       mv.addObject("totalLoanRequest", recordLoanLength);
       
       int recordApprovedLeaveLength= approvedrequests.length();
       mv.addObject("approvedrequests", approvedrequests);
       mv.addObject("totalApprovedLeaveRequest", recordApprovedLeaveLength);
       
       int recordApprovedLoanLength= approvedloanrequest.length();
       mv.addObject("approvedloanrequest", approvedloanrequest);
       mv.addObject("recordApprovedLoanLength", recordApprovedLoanLength);
       
       // Employee Details
       
       int recordGetEmployee= gettingemployee.length();
       mv.addObject("gettingemployee", gettingemployee);
       mv.addObject("recordGetEmployeeLength", recordGetEmployee);
       
       
//        int recordLength = approvedleaverequest.length();
//       mv.addObject("approvedLeaveRequest", approvedleaverequest);
//       mv.addObject("totalLeaveRequest",recordLength);
       
       // Default values to be added into the form before sent to the database
        mv.addObject("firstname", "Hammed");
        mv.addObject("lastname", "Adeleke");
        mv.addObject("grade", "Grade 1");
        mv.addObject("department", "Accounting");
        mv.addObject("designation", "Designation");
        mv.addObject("division", "Division 2");
        mv.addObject("location", "Lekki");
        mv.addObject("region", "na");
        return mv;
    }
    
    
     @RequestMapping({"/loan"})
    public ModelAndView Loan() throws JSONException{
        
       ModelAndView mv = new ModelAndView("loan");
        
       JSONObject js = new JSONObject();
       js.put("companyCode", "1");
       String api_method="getleaverequest";
       String api_methods= "getloanrequest";
       String approvedleaverequests= "getapprovedleaverequest";
       String approvedloanrequests= "getapprovedloanrequest";
       String getemployee = "getemployee";
       
       
       JSONArray leaverequest = new JSONArray(restCall.executeRequest(api_method, js));
       JSONArray loanrequest = new JSONArray(restCall.executeRequest(api_methods, js));
       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(approvedleaverequests, js));
       JSONArray approvedloanrequest = new JSONArray(restCall.executeRequest(approvedloanrequests, js));
       JSONArray gettingemployee  = new JSONArray(restCall.executeRequest(getemployee, js));
       
       
       System.out.println("Leave requests");
       System.out.println("Loan requests");
       
       int recordLength = leaverequest.length();
       mv.addObject("leaverequest", leaverequest);
       mv.addObject("totalLeaveRequest",recordLength);
       
       int recordLoanLength= loanrequest.length();
       mv.addObject("loanrequest", loanrequest);
       mv.addObject("totalLoanRequest", recordLoanLength);
       
       int recordApprovedLeaveLength= approvedrequests.length();
       mv.addObject("approvedrequests", approvedrequests);
       mv.addObject("totalApprovedLeaveRequest", recordApprovedLeaveLength);
       
       int recordApprovedLoanLength= approvedloanrequest.length();
       mv.addObject("approvedloanrequest", approvedloanrequest);
       mv.addObject("recordApprovedLoanLength", recordApprovedLoanLength);
       
       // Employee Details
       
       int recordGetEmployee= gettingemployee.length();
       mv.addObject("gettingemployee", gettingemployee);
       mv.addObject("recordGetEmployeeLength", recordGetEmployee);
       
       
//        int recordLength = approvedleaverequest.length();
//       mv.addObject("approvedLeaveRequest", approvedleaverequest);
//       mv.addObject("totalLeaveRequest",recordLength);
       
       // Default values to be added into the form before sent to the database
        mv.addObject("firstname", "Hammed");
        mv.addObject("lastname", "Adeleke");
        mv.addObject("grade", "Grade 1");
        mv.addObject("department", "Accounting");
        mv.addObject("designation", "Designation");
        mv.addObject("division", "Division 2");
        mv.addObject("location", "Lekki");
        mv.addObject("region", "na");
        return mv;
    }
    
    
     
    //    approveleaverequest
    @RequestMapping("/approveLeaveRequest")
    @ResponseBody
    public String approveLeaveRequest(@RequestParam("id") String id){
        try {
            String url = "approveleaverequest";
            JSONObject js = new JSONObject();
            js.put("id", id);
            
            JSONObject response = new JSONObject(restCall.executeRequest(url, js));
            String responsecode = response.getString("responsecode");
            System.out.println("responsecode "+ response);
            return responsecode;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
 
   
    // Requesting for Leave
    @RequestMapping(value  = {"/requestleave"}, method = RequestMethod.POST)
    @ResponseBody 
    public String requestLeave(@RequestParam("firstname") String firstname, @RequestParam("companyCode") String companyCode, @RequestParam("lastname") String lastname, 
            @RequestParam("gradeId") String gradeId, @RequestParam("departmentId") String departmentId,
            @RequestParam("designationId") String designationId, @RequestParam("locationId") String locationId, @RequestParam("divisionId") String divisionId, @RequestParam("regionId") String regionId, 
            @RequestParam("daysRequest") String daysRequest) throws JSONException{
        
        
        JSONObject js = new JSONObject();
        try{
            System.out.println("Hello");
//            String companyCode= "1";

            js.put("firstname", firstname);
            js.put("lastname", lastname);
            js.put("gradeId", gradeId);
            js.put("departmentId", departmentId);
            js.put("designationId", designationId);
            js.put("locationId", locationId);
            js.put("divisionId", divisionId);
            js.put("regionId", regionId);
            js.put("daysRequest", daysRequest);
            js.put("companyCode", companyCode);
            
            System.out.println("Request Sent! Wait for Approval"+ js);
            
            String url= "requestleave";
            
            JSONObject res= new JSONObject(restCall.executeRequest(url, js));
            System.out.println("The response is "+res);
            String  resp = res.getString("responsecode");
            System.out.println(resp);
            return resp;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
//    Get leave Request 
    
    
    
    
    //    Get Approved Leave Request
    @RequestMapping({"/approvedleaverequest"})
    public ModelAndView getApprovedLeaveRequest(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
       String api_method = "getapprovedleaverequest";
       
       String companyCode = "1";
       mv.setViewName("approvedleaverequests");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray approvedleaverequest = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = approvedleaverequest.length();
       mv.addObject("approvedLeaveRequest", approvedleaverequest);
       mv.addObject("totalLeaveRequest",recordLength);
      return mv; 
      
    }
    
//    Leave Requests 
    @RequestMapping({"/request"})
    public ModelAndView getRequestedLeaves(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
       String api_method = "getleaverequest";
       String api_employeedetail = "getemployee";
       
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
      
        System.out.println("sessionemployeedetails " + employeeDetails);
        
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
        
        
       String companyCode = session.getString("companycode");
//       String companyCode = "2";
       
       mv.setViewName("request");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray leaverequest = new JSONArray(restCall.executeRequest(api_method, js));
       JSONArray employeedetail= new JSONArray(restCall.executeRequest(api_employeedetail, js));
        System.out.println("employe details when an hr logs in "+ employeedetail);
       
       int recordLength = leaverequest.length();
       mv.addObject("leaverequest", leaverequest);
       mv.addObject("totalLeaveRequest",recordLength);
       mv.addObject("companyCode", companyCode);
      
        
        int EmployeeLength= employeedetail.length();
        mv.addObject("employeeDetail", employeedetail);
        mv.addObject("EmployeeLength", EmployeeLength);
        mv.addObject("employeeDetails", employeeDetails);
        mv.addObject("session", session);
        
//        
//        mv.addObject("firstname", "Hammed");
//        mv.addObject("lastname", "Adeleke");
//        mv.addObject("grade", "Grade 1");
//        mv.addObject("department", "Accounting");
//        mv.addObject("designation", "Designation");
//        mv.addObject("division", "Division 2");
//        mv.addObject("location", "Lekki");
//        mv.addObject("region", "na");
        return mv;
    }
    
    
    //  Get Leave Status
    @RequestMapping({"/leavestatus"})
    public ModelAndView getLeaveStatus(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
        String getleavestatus = "getleavestatus";
       
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
       
        
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
        
        
       String companyCode = session.getString("companycode");
//       String companyCode = "2";
       
       mv.setViewName("leavestatus");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray leavestatus = new JSONArray(restCall.executeRequest(getleavestatus, js));
        System.out.println("The leave status is"+leavestatus);
       int recordLength = leavestatus.length();
       mv.addObject("leavestatus", leavestatus);
       mv.addObject("totalLeaveStatus",recordLength);
       mv.addObject("companyCode", companyCode);
       
       JSONArray thisarray = new JSONArray(); 
       for (int i =0; i< leavestatus.length(); i++){
            if ((leavestatus.getJSONObject(i).has("leaveTaken")) && (leavestatus.getJSONObject(i).has("leaveOutstanding"))){
                JSONObject thisjson = new JSONObject();
                  
                  String firstname = leavestatus.getJSONObject(i).getString("firstname");
                  thisjson.put("firstname", firstname);
                  
                  String lastname = leavestatus.getJSONObject(i).getString("lastname");
                  thisjson.put("lastname", lastname);
                  
                  String leaveTaken = leavestatus.getJSONObject(i).getString("leaveTaken");
                  thisjson.put("leaveTaken", leaveTaken);
                  
                  String leaveOutstanding = leavestatus.getJSONObject(i).getString("leaveOutstanding");
                  thisjson.put("leaveOutstanding", leaveOutstanding);
                  
                  String id = leavestatus.getJSONObject(i).getString("id");
                  thisjson.put("id", id);
                  
                  String responsecode = leavestatus.getJSONObject(i).getString("responsecode");
                  thisjson.put("responsecode", responsecode);
                  
                  thisarray.put(thisjson);
                  
            }
            else if (!(leavestatus.getJSONObject(i).has("leaveTaken")) && (leavestatus.getJSONObject(i).has("leaveOutstanding"))){
                JSONObject thisjson = new JSONObject();
                  
                  String firstname = leavestatus.getJSONObject(i).getString("firstname");
                  thisjson.put("firstname", firstname);
                  
                  String lastname = leavestatus.getJSONObject(i).getString("lastname");
                  thisjson.put("lastname", lastname);
                  
                 
                  thisjson.put("leaveTaken", "Undefined");
                  
                  String leaveOutstanding = leavestatus.getJSONObject(i).getString("leaveOutstanding");
                  thisjson.put("leaveOutstanding", leaveOutstanding);
                  
                  String id = leavestatus.getJSONObject(i).getString("id");
                  thisjson.put("id", id);
                  
                  String responsecode = leavestatus.getJSONObject(i).getString("responsecode");
                  thisjson.put("responsecode", responsecode);
                  
                  thisarray.put(thisjson);
                  
            }
            else if ((leavestatus.getJSONObject(i).has("leaveTaken")) && !(leavestatus.getJSONObject(i).has("leaveOutstanding"))){
                JSONObject thisjson = new JSONObject();
                  
                  String firstname = leavestatus.getJSONObject(i).getString("firstname");
                  thisjson.put("firstname", firstname);
                  
                  String lastname = leavestatus.getJSONObject(i).getString("lastname");
                  thisjson.put("lastname", lastname);
                  
                 String leaveTaken = leavestatus.getJSONObject(i).getString("leaveTaken");
                  thisjson.put("leaveTaken", leaveTaken);
                  
                  thisjson.put("leaveOutstanding", "No data");
                  
                  String id = leavestatus.getJSONObject(i).getString("id");
                  thisjson.put("id", id);
                  
                  String responsecode = leavestatus.getJSONObject(i).getString("responsecode");
                  thisjson.put("responsecode", responsecode);
                  
                  thisarray.put(thisjson);
                  
            }
            
            else{
                JSONObject thisjson = new JSONObject(); 
                
                String firstname = leavestatus.getJSONObject(i).getString("firstname");
                  thisjson.put("firstname", firstname);
                  
                  String lastname = leavestatus.getJSONObject(i).getString("lastname");
                  thisjson.put("lastname", lastname);
                  
                  thisjson.put("leaveTaken", "Undefined");
                  
                  thisjson.put("leaveOutstanding", "No data");
                  
                  String id = leavestatus.getJSONObject(i).getString("id");
                  thisjson.put("id", id);
                  
                  String responsecode = leavestatus.getJSONObject(i).getString("responsecode");
                  thisjson.put("responsecode", responsecode);
                  
                  thisarray.put(thisjson);
                  
            }
       }
       mv.addObject("thisarray", thisarray);
       
      return mv;
    }
    
    
     //  Get Leave Type
    @RequestMapping({"/leavetype"})
    public ModelAndView getLeaveType(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
        String getleavetype = "getleavetype";
       
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
       
        
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
        
        
       String companyCode = session.getString("companycode");
//       String companyCode = "2";
       
       mv.setViewName("leavetype");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray leavetype = new JSONArray(restCall.executeGet(getleavetype));
       
       int recordLength = leavetype.length();
       mv.addObject("leavetype", leavetype);
       mv.addObject("totalLeaveStatus", recordLength);
       mv.addObject("companyCode", companyCode);
      
       
      return mv;
    }
    
    
    // Fetching the list of Approved Leave Request
    @RequestMapping({"/getapprovedrequest"})
    public ModelAndView getApprovedLeaveRequests(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
        String getapprovedleaverequests = "getapprovedleaverequest";
       
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
       
        
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
        
        
       String companyCode = session.getString("companycode");
//       String companyCode = "2";
       
       mv.setViewName("approvedleaverequest");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);
       
       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(getapprovedleaverequests, js));
       
       int recordLength = approvedrequests.length();
       mv.addObject("approvedrequests", approvedrequests);
       mv.addObject("totalApprovedRequests", recordLength);
       mv.addObject("companyCode", companyCode);
       
       return mv;
    }
    
    
    // Fetching the list of loan Request
    
     @RequestMapping({"/loanrequest"})
    public ModelAndView getRequestedLoans(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
       String api_method = "getloanrequest";
       String api_employeedetail = "getemployee";
       
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
       
         System.out.println("sessionemployeedetails " + employeeDetails);
         
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
        
        
       String companyCode = session.getString("companycode");
       String username= session.getString("username");
//       String companyCode = "2";
       
       mv.setViewName("loanrequest");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray loanrequest = new JSONArray(restCall.executeRequest(api_method, js));
       JSONArray employeedetail = new JSONArray(restCall.executeRequest(api_employeedetail, js));
       
       
       System.out.println("Hello"+ loanrequest);
       int recordLength = loanrequest.length();
       mv.addObject("loanrequest", loanrequest);
       mv.addObject("totalLoanRequest",recordLength);
       mv.addObject("companyCode", companyCode);
       mv.addObject("username", username);
       
       
         System.out.println("EmployeeDetail"+ employeedetail);
         
        int EmployeeLength= employeedetail.length();
        mv.addObject("employeeDetail", employeedetail);
        mv.addObject("EmployeeLength", EmployeeLength);
        mv.addObject("employeeDetails", employeeDetails);
        mv.addObject("session", session);
        
        
        
        return mv;
    }
    
    // Requesting for loan
    
    @RequestMapping(value  = {"/requestloan"}, method = RequestMethod.POST)
    @ResponseBody 
    public String requestLoan(@RequestParam("firstname") String firstname, @RequestParam("companyCode") String companyCode, 
            @RequestParam("lastname") String lastname, @RequestParam("gradeId") String gradeId, @RequestParam("departmentId") String departmentId,
            @RequestParam("designationId") String designationId, @RequestParam("locationId") String locationId, @RequestParam("divisionId") String divisionId, 
            @RequestParam("regionId") String regionId, @RequestParam("Amount") String Amount, 
            @RequestParam("paymentDuration") String paymentDuration, @RequestParam("username") String username) throws JSONException{
        
        
        JSONObject js = new JSONObject();
        try{
            System.out.println("Hello Man");
//            String companyCode= "1";

            js.put("firstname", firstname);
            js.put("lastname", lastname);
            js.put("gradeId", gradeId);
            js.put("departmentId", departmentId);
            js.put("designationId", designationId);
            js.put("locationId", locationId);
            js.put("divisionId", divisionId);
            js.put("regionId", regionId.trim());
//            js.put("regionId", "na");
            
            js.put("Amount", Amount);
            js.put("paymentDuration", paymentDuration);
            js.put("companyCode", companyCode);
            js.put("username", username);
            
            
            System.out.println("Request Sent! Wait for Approval for Loan"+ js);
            
            String url= "requestloan";
            
            JSONObject res= new JSONObject(restCall.executeRequest(url, js));
            System.out.println("The response for loan is"+res);
            String  resp = res.getString("responsecode");
            System.out.println(resp);
            return resp;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    
     @RequestMapping({"/getapprovedloanrequest"})
    public ModelAndView getApprovedLoan(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
        String getapprovedloanrequest = "getloanrequest";
       
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
       
        
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
        
        
       String companyCode = session.getString("companycode");
//       String companyCode = "2";
       
       mv.setViewName("approvedloanrequest");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", "3");
       
       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(getapprovedloanrequest, js));
       
       int recordLength = approvedrequests.length();
       mv.addObject("approvedloanrequest", approvedrequests);
       mv.addObject("totalApprovedRequests", recordLength);
       mv.addObject("companyCode", companyCode);
         System.out.println("The total Record Length is"+recordLength);
         System.out.println("The Approved Requests is "+approvedrequests);
         
      
//        JSONArray thisarray = new JSONArray(); 
//       for (int i =0; i< approvedrequests.length(); i++){
//            if ((approvedrequests.getJSONObject(i).has("leaveTaken")) && (approvedrequests.getJSONObject(i).has("leaveOutstanding"))){
//                JSONObject thisjson = new JSONObject();
//                  
//                  String firstname = approvedrequests.getJSONObject(i).getString("firstname");
//                  thisjson.put("firstname", firstname);
//                  
//                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
//                  thisjson.put("lastname", lastname);
//                  
//                  String leaveTaken = approvedrequests.getJSONObject(i).getString("leaveTaken");
//                  thisjson.put("leaveTaken", leaveTaken);
//                  
//                  String leaveOutstanding = approvedrequests.getJSONObject(i).getString("leaveOutstanding");
//                  thisjson.put("leaveOutstanding", leaveOutstanding);
//                  
//                  String id = approvedrequests.getJSONObject(i).getString("id");
//                  thisjson.put("id", id);
//                  
//                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
//                  thisjson.put("responsecode", responsecode);
//                  
//                  thisarray.put(thisjson);
//                  
//            }
//            else if (!(approvedrequests.getJSONObject(i).has("leaveTaken")) && (approvedrequests.getJSONObject(i).has("leaveOutstanding"))){
//                JSONObject thisjson = new JSONObject();
//                  
//                  String firstname = approvedrequests.getJSONObject(i).getString("firstname");
//                  thisjson.put("firstname", firstname);
//                  
//                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
//                  thisjson.put("lastname", lastname);
//                  
//                 
//                  thisjson.put("leaveTaken", "Undefined");
//                  
//                  String leaveOutstanding = approvedrequests.getJSONObject(i).getString("leaveOutstanding");
//                  thisjson.put("leaveOutstanding", leaveOutstanding);
//                  
//                  String id = approvedrequests.getJSONObject(i).getString("id");
//                  thisjson.put("id", id);
//                  
//                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
//                  thisjson.put("responsecode", responsecode);
//                  
//                  thisarray.put(thisjson);
//                  
//            }
//            else if ((approvedrequests.getJSONObject(i).has("leaveTaken")) && !(approvedrequests.getJSONObject(i).has("leaveOutstanding"))){
//                JSONObject thisjson = new JSONObject();
//                  
//                  String firstname = approvedrequests.getJSONObject(i).getString("firstname");
//                  thisjson.put("firstname", firstname);
//                  
//                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
//                  thisjson.put("lastname", lastname);
//                  
//                 String leaveTaken = approvedrequests.getJSONObject(i).getString("leaveTaken");
//                  thisjson.put("leaveTaken", leaveTaken);
//                  
//                  thisjson.put("leaveOutstanding", "No data");
//                  
//                  String id = approvedrequests.getJSONObject(i).getString("id");
//                  thisjson.put("id", id);
//                  
//                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
//                  thisjson.put("responsecode", responsecode);
//                  
//                  thisarray.put(thisjson);
//                  
//            }
//            
//            else{
//                JSONObject thisjson = new JSONObject(); 
//                
//                String firstname = approvedrequests.getJSONObject(i).getString("firstname");
//                  thisjson.put("firstname", firstname);
//                  
//                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
//                  thisjson.put("lastname", lastname);
//                  
//                  thisjson.put("leaveTaken", "Undefined");
//                  
//                  thisjson.put("leaveOutstanding", "No data");
//                  
//                  String id = approvedrequests.getJSONObject(i).getString("id");
//                  thisjson.put("id", id);
//                  
//                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
//                  thisjson.put("responsecode", responsecode);
//                  
//                  thisarray.put(thisjson);
//                  
//            }
//       }
//       mv.addObject("thisarray", thisarray);
       
      return mv;
    }
    
    
//    @RequestMapping({"/getapprovedloanrequest"})
//    public ModelAndView getApproveLoanRequests(HttpServletRequest request, HttpServletResponse response) throws JSONException {
//       ModelAndView mv = new ModelAndView();
//        String getapprovedloanrequests = "getapprovedloanrequest";
//       
//       
//       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
//       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
//       
//        
//        System.out.println("Employee Details"+ employeeDetails);
//        System.out.println("Session Details"+session);
//        
//        
//       String companyCode = session.getString("companycode");
////       String companyCode = "2";
//       
//       mv.setViewName("approvedloanrequest");
//       
//       JSONObject js = new JSONObject();
//       js.put("companyCode", companyCode);
//       
//       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(getapprovedloanrequests, js));
//       
//       int recordLength = approvedrequests.length();
//       
//        System.out.println("Approved Loan Requests" + approvedrequests);
//        System.out.println("The numner of Approved Loan requests is"+recordLength);
//        
//       mv.addObject("approvedloanrequests", approvedrequests);
//       mv.addObject("totalApprovedRequests", recordLength);
//       mv.addObject("companyCode", companyCode);
//       
//      
////        JSONArray thisarray = new JSONArray(); 
////       for (int i = 0; i< approvedrequests.length(); i++){
////            if ((approvedrequests.getJSONObject(i).has("leaveTaken")) && (approvedrequests.getJSONObject(i).has("leaveOutstanding"))){
////                JSONObject thisjson = new JSONObject();
////                  
////                  String firstname = approvedrequests.getJSONObject(i).getString("firstname");
////                  thisjson.put("firstname", firstname);
////                  
////                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
////                  thisjson.put("lastname", lastname);
////                  
////                  String companyName = approvedrequests.getJSONObject(i).getString("companyName");
////                  thisjson.put("companyName", companyName);
////                  
////                  String leaveOutstanding = approvedrequests.getJSONObject(i).getString("leaveOutstanding");
////                  thisjson.put("leaveOutstanding", leaveOutstanding);
////                  
////                  String id = approvedrequests.getJSONObject(i).getString("id");
////                  thisjson.put("id", id);
////                  
////                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
////                  thisjson.put("responsecode", responsecode);
////                  
////                  thisarray.put(thisjson);
////                  
////            }
////            else if (!(approvedrequests.getJSONObject(i).has("leaveTaken")) && (approvedrequests.getJSONObject(i).has("leaveOutstanding"))){
////                JSONObject thisjson = new JSONObject();
////                  
////                  String firstname = approvedrequests.getJSONObject(i).getString("firstname");
////                  thisjson.put("firstname", firstname);
////                  
////                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
////                  thisjson.put("lastname", lastname);
////                  
////                 
////                  thisjson.put("leaveTaken", "Undefined");
////                  
////                  String leaveOutstanding = approvedrequests.getJSONObject(i).getString("leaveOutstanding");
////                  thisjson.put("leaveOutstanding", leaveOutstanding);
////                  
////                  String id = approvedrequests.getJSONObject(i).getString("id");
////                  thisjson.put("id", id);
////                  
////                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
////                  thisjson.put("responsecode", responsecode);
////                  
////                  thisarray.put(thisjson);
////                  
////            }
////            else if ((approvedrequests.getJSONObject(i).has("leaveTaken")) && !(approvedrequests.getJSONObject(i).has("leaveOutstanding"))){
////                JSONObject thisjson = new JSONObject();
////                  
////                  String firstname = approvedrequests.getJSONObject(i).getString("firstname");
////                  thisjson.put("firstname", firstname);
////                  
////                  String lastname = approvedrequests.getJSONObject(i).getString("lastname");
////                  thisjson.put("lastname", lastname);
////                  
////                 String leaveTaken = approvedrequests.getJSONObject(i).getString("leaveTaken");
////                  thisjson.put("leaveTaken", leaveTaken);
////                  
////                  thisjson.put("leaveOutstanding", "No data");
////                  
////                  String id = approvedrequests.getJSONObject(i).getString("id");
////                  thisjson.put("id", id);
////                  
////                  String responsecode = approvedrequests.getJSONObject(i).getString("responsecode");
////                  thisjson.put("responsecode", responsecode);
////                  
////                  thisarray.put(thisjson);
////                  
////            }
////            
////            else{
////                JSONObject thisjson = new JSONObject(); 
////                
////                String firstname = leavestatus.getJSONObject(i).getString("firstname");
////                  thisjson.put("firstname", firstname);
////                  
////                  String lastname = leavestatus.getJSONObject(i).getString("lastname");
////                  thisjson.put("lastname", lastname);
////                  
////                  thisjson.put("leaveTaken", "Undefined");
////                  
////                  thisjson.put("leaveOutstanding", "No data");
////                  
////                  String id = leavestatus.getJSONObject(i).getString("id");
////                  thisjson.put("id", id);
////                  
////                  String responsecode = leavestatus.getJSONObject(i).getString("responsecode");
////                  thisjson.put("responsecode", responsecode);
////                  
////                  thisarray.put(thisjson);
////                  
////            }
////       }
////       mv.addObject("thisarray", thisarray);
//       
//      return mv;
//    }
    
    
    // Disburse Loan
    @RequestMapping({"/disburseloan"})
    public ModelAndView DisburseLoan(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv= new ModelAndView();
        String getapprovedloanemployee = "getloanrequest";
        session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
        JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");

        
         System.out.println("Employee Details"+ employeeDetails);
         System.out.println("Session Details"+session);


        String companyCode = session.getString("companycode");
        mv.setViewName("disburseloan");
        JSONObject js = new JSONObject();
        js.put("companyCode", companyCode);
       
        JSONArray listofapprovedloanforemployee= new JSONArray(restCall.executeRequest(getapprovedloanemployee, js));
       
       int recordLength = listofapprovedloanforemployee.length();
       mv.addObject("listofapprovedloanforemployee", listofapprovedloanforemployee);
       mv.addObject("totalApprovedLength", recordLength);
//        System.out.println("List of Approved Loan to be disbursed"+ listofapprovedloanforemployee);
        System.out.println("Total Length of loan to be disbursed"+ recordLength);
        
       mv.addObject("companyCode", companyCode);
       return mv;
    }
    
    
    @RequestMapping({"/promote"})
    public ModelAndView Promote() throws JSONException{
        
       ModelAndView mv = new ModelAndView("promote");
        
       JSONObject js = new JSONObject();
       js.put("companyCode", "1");
       String api_method="getleaverequest";
       String api_methods= "getloanrequest";
       String approvedleaverequests= "getapprovedleaverequest";
       String approvedloanrequests= "getapprovedloanrequest";
       String getemployee = "getemployee";
       
       
       JSONArray leaverequest = new JSONArray(restCall.executeRequest(api_method, js));
       JSONArray loanrequest = new JSONArray(restCall.executeRequest(api_methods, js));
       JSONArray approvedrequests= new JSONArray(restCall.executeRequest(approvedleaverequests, js));
       JSONArray approvedloanrequest = new JSONArray(restCall.executeRequest(approvedloanrequests, js));
       JSONArray gettingemployee  = new JSONArray(restCall.executeRequest(getemployee, js));
       
       
       System.out.println("Leave requests");
       System.out.println("Loan requests");
       
       int recordLength = leaverequest.length();
       mv.addObject("leaverequest", leaverequest);
       mv.addObject("totalLeaveRequest",recordLength);
       
       int recordLoanLength= loanrequest.length();
       mv.addObject("loanrequest", loanrequest);
       mv.addObject("totalLoanRequest", recordLoanLength);
       
       int recordApprovedLeaveLength= approvedrequests.length();
       mv.addObject("approvedrequests", approvedrequests);
       mv.addObject("totalApprovedLeaveRequest", recordApprovedLeaveLength);
       
       int recordApprovedLoanLength= approvedloanrequest.length();
       mv.addObject("approvedloanrequest", approvedloanrequest);
       mv.addObject("recordApprovedLoanLength", recordApprovedLoanLength);
       
       // Employee Details
       
       int recordGetEmployee= gettingemployee.length();
       mv.addObject("gettingemployee", gettingemployee);
       mv.addObject("recordGetEmployeeLength", recordGetEmployee);
       
       
//        int recordLength = approvedleaverequest.length();
//       mv.addObject("approvedLeaveRequest", approvedleaverequest);
//       mv.addObject("totalLeaveRequest",recordLength);
       
       // Default values to be added into the form before sent to the database
        mv.addObject("firstname", "Hammed");
        mv.addObject("lastname", "Adeleke");
        mv.addObject("grade", "Grade 1");
        mv.addObject("department", "Accounting");
        mv.addObject("designation", "Designation");
        mv.addObject("division", "Division 2");
        mv.addObject("location", "Lekki");
        mv.addObject("region", "na");
        return mv;
    }
    
    @RequestMapping(value  = {"/promoteemployee"}, method = RequestMethod.POST)
    @ResponseBody 
    public String promoteEmployee(@RequestParam("gradeId") String gradeId, @RequestParam("employeeId") String employeeId) throws JSONException{
        JSONObject js = new JSONObject();
        try{
//            String companyCode= "00109";
            js.put("gradeId", gradeId);
            js.put("employeeId", employeeId);
            
            String url= "promoteemployee";
            
            JSONObject res= new JSONObject(restCall.executeRequest(url, js));
            System.out.println("The response is "+res);
            String  resp = res.getString("responsecode");
            System.out.println(resp);
            return resp;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    
    
     //    Get Approved Loan Request
//    @RequestMapping({"/getapprovedloanrequest"})
//    public ModelAndView getApprovedLoanRequest(HttpServletRequest request, HttpServletResponse response) throws JSONException {
//       ModelAndView mv = new ModelAndView();
//       String api_method = "getapprovedloanrequest";
//       
//       String companyCode = "1";
//       mv.setViewName("approvedloanrequests");
//       
//       JSONObject js = new JSONObject();
//       js.put("companyCode", companyCode);
//
//       JSONArray approvedloanrequest = new JSONArray(restCall.executeRequest(api_method, js));
//       int recordLength = approvedloanrequest.length();
//       mv.addObject("approvedLoanRequest", approvedloanrequest);
//       mv.addObject("totalLoanRequest",recordLength);
//      return mv; 
//    }
    
    //    approveleaverequest
    @RequestMapping("/approveLoanRequest")
    @ResponseBody
    public String approveLoanRequest(@RequestParam("id") String id){
        try {
            String url = "approveloanrequest";
            JSONObject js = new JSONObject();
            js.put("id", id);
            
            JSONObject response = new JSONObject(restCall.executeRequest(url, js));
            String responsecode = response.getString("responsecode");
            System.out.println("responsecode "+ response);
            return responsecode;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    
    
    
    @RequestMapping({"/employee"})
    public ModelAndView employee(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getemployee";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       System.out.println("companyCode is:" +companyCode);
       mv.setViewName("employees");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);
       JSONArray employee = new JSONArray(restCall.executeRequest(api_method, js));
        JSONArray grade = new JSONArray(restCall.executeRequest("getgrade", js));
       JSONArray department = new JSONArray(restCall.executeRequest("getdepartment", js));
       JSONArray designation= new JSONArray(restCall.executeRequest("getdesignation", js));
       JSONArray region= new JSONArray(restCall.executeRequest("getregion", js));
       JSONArray financialinstitution = new JSONArray(restCall.executeGet("getfinancialinstitution"));
       JSONArray location= new JSONArray(restCall.executeRequest("getlocation", js));
       JSONArray division= new JSONArray(restCall.executeRequest("getdivision", js));
       JSONArray leave = new JSONArray(restCall.executeGet("getleavetype"));
       mv.addObject("companyCode", companyCode);
       mv.addObject("grade", grade);
       mv.addObject("region", region);
       mv.addObject("location", location);
        mv.addObject("division", division);
       mv.addObject("department", department);
       mv.addObject("designation", designation);
       mv.addObject("leave", leave);
       mv.addObject("financialinstitution",financialinstitution);
       int recordLength = employee.length();
        mv.addObject("employee", employee);
       mv.addObject("totalEmployee",recordLength);
       return mv;
}
    
  
    
    
     @RequestMapping(value = {"/createEmployee"}, method = RequestMethod.POST)
    public @ResponseBody String createEmployee(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        try{
        JSONObject doAction = new JSONObject (restCall.executeRequest("createemployee", new JSONObject(data)));
        return doAction.toString();
         }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping({"/grade"})
    public ModelAndView grade(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getgrade";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("grades");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray grade = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = grade.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("grade", grade);
       mv.addObject("totalGrade",recordLength);
       return mv;
}
    
   
    
       @RequestMapping(value = {"/createGrade"}, method = RequestMethod.POST)
    public @ResponseBody String createGrade(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        System.out.println("...sending grade details");
        JSONObject doAction = new JSONObject (restCall.executeRequest("creategrade", new JSONObject(data)));
        System.out.println("doAction response....." + doAction);
        return doAction.toString();
    }
    
    @RequestMapping({"/department"})
    public ModelAndView department(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getdepartment";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("departments");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray department = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = department.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("department", department);
       mv.addObject("totalDepartment",recordLength);
       return mv;
}

    
      @RequestMapping(value = {"/createDepartment"}, method = RequestMethod.POST)
    public @ResponseBody String createDepartment(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("createdepartment", new JSONObject(data)));
        return doAction.toString();
    }
    
    @RequestMapping({"/designation"})
    public ModelAndView designation(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getdesignation";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("designations");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray designation = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = designation.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("designation", designation);
       mv.addObject("totalDesignation",recordLength);
       return mv;
}
  
    
      @RequestMapping(value = {"/createDesignation"}, method = RequestMethod.POST)
    public @ResponseBody String createDesignation(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("createdesignation", new JSONObject(data)));
        return doAction.toString();
    }
    
     @RequestMapping({"/division"})
    public ModelAndView division(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getdivision";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("divisions");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);
       
       JSONArray division = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = division.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("division", division);
       mv.addObject("totalDivision",recordLength);
       return mv;
}
    
    
     @RequestMapping(value = {"/createDivision"}, method = RequestMethod.POST)
    public @ResponseBody String createDivision(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("createdivision", new JSONObject(data)));
        return doAction.toString();
    }
    
    @RequestMapping({"/location"})
    public ModelAndView location(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getlocation";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("locations");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray location = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = location.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("location", location);
       mv.addObject("totalLocation",recordLength);
       return mv;
}
    
   
    
    @RequestMapping(value = {"/createLocation"}, method = RequestMethod.POST)
    public @ResponseBody String createLocation(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("createlocation", new JSONObject(data)));
        return doAction.toString();
    }
    
    @RequestMapping({"/region"})
    public ModelAndView region(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getregion";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("regions");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray region = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = region.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("region", region);
       mv.addObject("totalRegion",recordLength);
       return mv;
}
    
    
    @RequestMapping(value = {"/createRegion"}, method = RequestMethod.POST)
    public @ResponseBody String createRegion(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("createregion", new JSONObject(data)));
        return doAction.toString();
    }
    
     @RequestMapping(value = {"/updateGradeDetail"}, method = RequestMethod.POST)
    public @ResponseBody String updateGradeDetail(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("updategradedetail", new JSONObject(data)));
        System.out.println("Edit Grade Response...." +doAction);
        return doAction.toString();
    }
    
        @RequestMapping(value = {"/updateDepartmentDetail"}, method = RequestMethod.POST)
    public @ResponseBody String updateDepartmentDetail(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("updatedepartmentdetail", new JSONObject(data)));
        return doAction.toString();
    }
    
    @RequestMapping(value = {"/updateDesignationDetail"}, method = RequestMethod.POST)
    public @ResponseBody String updateDesignationDetail(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        try{
        JSONObject doAction = new JSONObject (restCall.executeRequest("updatedesignationdetail", new JSONObject(data)));
        return doAction.toString();
         }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping(value = {"/updateEmployeeDetail"}, method = RequestMethod.POST)
    public @ResponseBody String updateEmployeeDetail(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("updateemployeedetail", new JSONObject(data)));
        return doAction.toString();
    }
    
     @RequestMapping({"/deduction"})
    public ModelAndView deduction(HttpServletRequest request, HttpServletResponse response) throws JSONException {
      ModelAndView mv = new ModelAndView();
       String api_method = "getemployee";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       mv.setViewName("deductions");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);
       JSONArray employee = new JSONArray(restCall.executeRequest(api_method, js)); 
       int totalEmployee = employee.length();
       mv.addObject("companyCode", companyCode);
        mv.addObject("employee", employee); 
        mv.addObject("totalEmployee", totalEmployee);
       return mv;
}
    
     @RequestMapping(value = {"/createDeduction"}, method = RequestMethod.POST)
    public @ResponseBody String createDeduction(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("creatededuction", new JSONObject(data)));
        return doAction.toString();
}
}
