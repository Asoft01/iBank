/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package PageControllers;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.RestCall;

/**
 *
 * @author SuperSoft
 */
@Controller
public class PayrollController {
     RestCall restCall = new RestCall();
    JSONObject session;
    String companyCode;
    List<String> payrollRecord = new ArrayList<>();
    
    
    @RequestMapping({"/payroll"})
    public ModelAndView payroll(HttpServletRequest request, HttpServletResponse response) throws JSONException {
       ModelAndView mv = new ModelAndView();
       String api_method = "getpayrollname";
       session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
       JSONArray LoggedinuserDetails = new JSONArray();
       LoggedinuserDetails.put(session);
       companyCode = session.getString("companycode");
       System.out.println("companyCode is:" +companyCode);
       mv.setViewName("payrolls");
       JSONObject js = new JSONObject();
       js.put("companyCode", companyCode);
       JSONArray employee = new JSONArray(restCall.executeRequest("getemployee", js));
       JSONArray payroll = new JSONArray(restCall.executeRequest("getpayrollname", js));
       int recordLength = payroll.length();
       mv.addObject("companyCode", companyCode);
       mv.addObject("payroll", payroll);
       mv.addObject("employee", employee);
       mv.addObject("totalPayroll",recordLength);
      return mv;
    
}
     
     @RequestMapping(value = {"/createPayroll"}, method = RequestMethod.POST)
    public @ResponseBody String createPayroll(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        JSONObject doAction = new JSONObject (restCall.executeRequest("createpayroll", new JSONObject(data)));
        return doAction.toString();
    }
    
    
    @RequestMapping(value = {"/getPayrollItems"}, method = RequestMethod.POST)
    public @ResponseBody String getPayrollItems(HttpServletRequest request, 
            HttpServletResponse response,
            @RequestBody String data
            ) throws JSONException {
        String doAction = (restCall.executeRequest("getpayroll", new JSONObject(data)));
        return doAction;
    }
}
