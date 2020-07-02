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
public class ClientsController {
    RestCall restCall = new RestCall();
    
    List<String> payrollRecord = new ArrayList<>();
    JSONObject session;
     @RequestMapping({"/client"})
    public ModelAndView client(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
       String api_method = "getclient";
       
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
//       GlobalVaraibles p = new GlobalVaraibles();
       
       String companyCode = session.getString("companycode");
       
       String companyName = "ChamsSwitch";
       String companyEmail= "chamsswitch@group.com";
//       String companyCode= "00109";
       
       String companyPhonenumber= "07036937763";
       String companyLocation= "Victoria Island, Lagos";
       
       mv.setViewName("clients");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);
       js.put("companyName", companyName);
       js.put("companyEmail", companyEmail);
       js.put("companyPhonenumber", companyPhonenumber);
       js.put("companyLocation", companyLocation);
       

       JSONArray client = new JSONArray(restCall.executeRequest(api_method, js));
//        JSONArray payroll= new JSONArray(restCall.executeRequest(api_method));

       int recordLength = client.length();
       mv.addObject("client", client);
       mv.addObject("totalClient",recordLength);
        mv.addObject("companyCode", companyCode);
       return mv;   
    }
    
    

    
     @RequestMapping(value  = {"/createclient"}, method = RequestMethod.POST)
    @ResponseBody 
    public String addUser(@RequestParam("companyName") String companyName, @RequestParam("companyCode") String companyCode,
            @RequestParam("companyEmail") String companyEmail, 
            @RequestParam("companyPhonenumber") String companyPhonenumber,
            @RequestParam("companyLocation") String companyLocation) throws JSONException{
        JSONObject js = new JSONObject();
        try{
//            String companyCode= "00109";
            js.put("companyName", companyName);
            js.put("companyEmail", companyEmail);
            js.put("companyPhonenumber", companyPhonenumber);
            js.put("companyLocation", companyLocation);
            js.put("companyCode", companyCode);
            
            String url= "createclient";
            
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
    
    
    @RequestMapping(value  = {"/updateclientdetail"}, method = RequestMethod.POST)
    @ResponseBody
    public String editUser(@RequestParam("companyName") String companyName, @RequestParam("companyEmail") String companyEmail, @RequestParam("companyPhonenumber") String companyPhonenumber,  @RequestParam("id") String id,
            @RequestParam("companyLocation") String companyLocation) throws JSONException{
        System.out.println(id + companyName + companyEmail  + companyPhonenumber + companyLocation);
        
        JSONObject js = new JSONObject();
         try{
            System.out.println("Hello");
            String companyCode = "109099";
            js.put("companyName", companyName);
            js.put("companyEmail", companyEmail);
            js.put("companyPhonenumber", companyPhonenumber);
            js.put("companyLocation", companyLocation);
            js.put("companyCode", companyCode);
            js.put("id", id);
            System.out.println("Client Updated"+ js);
            
            String url= "updateclientdetail";
            
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
    
    @RequestMapping("/deleteClient")
    @ResponseBody
    public String deleteUser(HttpServletRequest request, @RequestParam("id") String id) {
        
        System.out.println("id "+ id);
        
        
        try{
            if(session != null) {
                JSONObject js = new JSONObject();

                js.put("clientId", id);
                
                String url = "deleteclient";
                
                JSONObject response = new JSONObject(restCall.executeRequest(url, js));
                
                System.out.println("resposne" + response);
                
                String responsecode = response.getString("responsecode");
                
                if(responsecode .equals("00")) { 
                    return "success";  
                }
                else{
                    return "failed";
                }
            }
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
//    @RequestMapping("/deleteInvoice")
//    @ResponseBody
//    public String deleteUser(HttpServletRequest request, @RequestParam("id") String id) {
//        
//        System.out.println("id "+ id);
//        
//        
//        try{
//            if(session != null) {
//                JSONObject js = new JSONObject();
//
//                js.put("invoiceId", id);
//                
//                String url = "deleteinvoice";
//                
//                JSONObject response = new JSONObject(restCall.executeRequest(url, js));
//                
//                System.out.println("resposne" + response);
//                
//                String responsecode = response.getString("responsecode");
//                
//                if(responsecode .equals("00")) { 
//                    return "success";  
//                }
//                else{
//                    return "failed";
//                }
//            }
//        }
//        catch(Exception e){
//            e.printStackTrace();
//        }
//        return null;
//    }
}
