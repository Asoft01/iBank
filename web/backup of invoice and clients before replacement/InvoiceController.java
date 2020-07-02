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
public class InvoiceController {
    
    RestCall restCall = new RestCall();
    
    
    List<String> payrollRecord = new ArrayList<>();
    JSONObject session;
//    String companyCode;
    
    @RequestMapping({"/invoices"})
    public ModelAndView getGeneratedInvoice(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
       String api_method = "getgeneratedinvoice";
       
//        System.out.println("jhsfsfhjshjdfs "+ p.getCc());
        
        
//        PageControllers bb= new PageControllers();
        
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray employeeDetails= (JSONArray) request.getSession().getAttribute("EmployeeDetails");
        System.out.println("Employee Details"+ employeeDetails);
        System.out.println("Session Details"+session);
       
       String companyCode = session.getString("companycode");
//       String companyCode = "00109";
//       p.setCompanyCode(companyCode);
//       
////        System.out.println("Sess");
//       System.out.println("The Company Code Session in invoice is"+p.getCompanyCode());
//        
       mv.setViewName("invoices");
       
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);

       JSONArray invoice = new JSONArray(restCall.executeRequest(api_method, js));
       int recordLength = invoice.length();
       mv.addObject("invoice", invoice);
       mv.addObject("totalInvoice",recordLength);
       mv.addObject("companyCode", companyCode);
      return mv;
    }
    
    @RequestMapping(value  = {"/generateinvoice"}, method = RequestMethod.POST)
    @ResponseBody 
    public String generatedInvoice(@RequestParam("companyName") String companyName, @RequestParam("companyCode") String companyCode, @RequestParam("companyEmail") String companyEmail, 
            @RequestParam("companyPhonenumber") String companyPhonenumber, @RequestParam("narration") String narration,
            @RequestParam("amount") String amount, @RequestParam("tax") String tax, @RequestParam("companyLocation") String companyLocation) throws JSONException{
        JSONObject js = new JSONObject();
        try{
       
      
            System.out.println("Hello");
//            String companyCode= "5";
            
//            p.setCompanyCode(companyCode);
//            System.out.println("The Company Code Session in invoice is"+p.getCompanyCode());

            js.put("companyName", companyName);
            js.put("companyEmail", companyEmail);
            js.put("companyCode", companyCode);
            js.put("companyPhonenumber", companyPhonenumber);
            js.put("narration", narration);
            js.put("amount", amount);
            js.put("tax", tax);
            js.put("companyLocation", companyLocation);
          
            System.out.println("Invoice Generated"+ js);
            
            String url= "generateinvoice";
            
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
    
    @RequestMapping(value  = {"/getgeneratedinvoiceperclient"}, method = RequestMethod.POST)
    @ResponseBody
    public String getgeneratedinvoiceperclient(@RequestParam("clientEmail") String clientEmail
            ) throws JSONException{
            JSONObject js = new JSONObject();
            System.out.println("email:"
                    + "" + clientEmail);
            try{
//                Model mv= new ModelAndView();
                js.put("clientEmail", clientEmail);

                String url = "getgeneratedinvoiceperclient";
                
                String res = (restCall.executeRequest(url, js));
                
//                int recordLengthPerClient = res.length();
//                mv.addObject("invoice", invoice);
//                mv.addObject("totalInvoice",recordLength);
//      return mv;
                
                System.out.println("response"+res);
                return res;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping("/deleteInvoice")
    @ResponseBody
    public String deleteUser(HttpServletRequest request, @RequestParam("id") String id) {
        
        System.out.println("id "+ id);
        
        
        try{
            if(session != null) {
                JSONObject js = new JSONObject();

                js.put("invoiceId", id);
                
                String url = "deleteinvoice";
                
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
    
//    @RequestMapping(value  = {"/deleteinvoice"}, method = RequestMethod.POST)
//    @ResponseBody
//    public String deleteInvoice(@RequestParam("invoiceId") String invoiceId
//            ) throws JSONException{
//            JSONObject js = new JSONObject();
//            System.out.println("Invoice to be deleted:"
//                    + "" + invoiceId);
//            try{
////                Model mv= new ModelAndView();
//                js.put("invoiceId", invoiceId);
//                
//                
//                
//                String url = "deleteinvoice";
//                
//                String res = (restCall.executeRequest(url, js));
//                
////                int recordLengthPerClient = res.length();
////                mv.addObject("invoice", invoice);
////                mv.addObject("totalInvoice",recordLength);
////      return mv;
//                
//                System.out.println("The response to be deleted"+res);
//                if(res .equals("00")) { 
//                    return "success";  
//                }
//                else{
//                    return "failed";
//                }
//                 
//            }
//            catch(Exception e){
//                e.printStackTrace();
//            }
//        return null;
//    }
}
