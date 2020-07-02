/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

// Micheal methods started from line 697 to 946
// Hammed methods Started from 956
package PageControllers;


import com.oracle.jrockit.jfr.ContentType;
import java.io.File;
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
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.HttpMultipartMode;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.DefaultHttpClient;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import static org.springframework.http.MediaType.APPLICATION_OCTET_STREAM;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.RestCall;

/**
 *
 * @author Habeeb O. Lawal
 */

@Controller
public class PageControllers {
    
    RestCall restCall = new RestCall();
    
    List<String> payrollRecord = new ArrayList<>();
    
    JSONObject session;
    JSONArray LoggedinuserDetails = new JSONArray();
    String checker;
    String companyCode;
    String companyName;
    String username;
    String walletNumber;
    String firstname, lastname;
    String userID;
    
    @RequestMapping({"/", "/login"})
    public ModelAndView login(){
        ModelAndView mv = new ModelAndView("login");
        return mv;
    }
    
    @RequestMapping({"/dashboard"})
    public ModelAndView home(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        checker = (String)request.getSession().getAttribute("loggedIn");
        session = (JSONObject) request.getSession().getAttribute("LoggedinuserDetails");
        if(session != null) {
            //JSONArray LoggedinuserDetails = new JSONArray();
            LoggedinuserDetails.put(session);
            companyCode = session.getString("companycode");
            if(companyCode.equals("0")) {
                companyName = "null";
            }
            else {
            companyName = session.getString("companyName");
            }
            username = session.getString("username");
            firstname = session.getString("firstname");
            lastname = session.getString("lastname");
            userID = session.getString("userid");
            System.out.println("session"+ session);
            System.out.println("Loggedin"+ LoggedinuserDetails);
            JSONArray subscriptionpackage = new JSONArray(restCall.executeGet("getsubscription"));
            System.out.println("getsubscription " + subscriptionpackage);
            ModelAndView mv = new ModelAndView();
            mv.addObject("session", session);
            mv.addObject("LoggedinuserDetails", LoggedinuserDetails);
            mv.addObject("companycode", companyCode);
            mv.addObject("companyName", companyName);
            mv.addObject("firstname", firstname);
            mv.addObject("LoggedinuserDetailsLength", LoggedinuserDetails.length());        
            mv.addObject("subscriptionpackage", subscriptionpackage);
            mv.addObject("subscriptionpackageLength", subscriptionpackage.length());
            mv.setViewName("home");

           return mv;
        }else{
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
    }
    
    @RequestMapping({"/accountstatement"})
    public ModelAndView accountStatement(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String api_method = "getvendor";
        //JSONArray LoggedinuserDetails = new JSONArray();
        //LoggedinuserDetails.put(session);
        if(session != null) {
            mv.setViewName("accountstatement");
            mv.addObject("session", session);
            mv.addObject("companycode", companyCode);
            mv.addObject("userid", userID);
            mv.addObject("walletNumber", session.getString("walletnumber"));
            mv.addObject("firstname", firstname);
            mv.addObject("lastname", lastname);
            return mv;
        }
            request.getSession().invalidate();
            return new ModelAndView("login");
    }
    
    @RequestMapping({"/profile"})
    public ModelAndView profile(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String api_method = "getvendor";
//        JSONArray LoggedinuserDetails = new JSONArray();
//        LoggedinuserDetails.put(session);
        
        if(session != null) {
            mv.setViewName("profile");
            mv.addObject("companycode", companyCode);
            mv.addObject("userid", userID);
            mv.addObject("walletNumber", session.getString("walletnumber"));
            mv.addObject("firstname", firstname);
            mv.addObject("companyName", companyName);
            mv.addObject("lastname", lastname);
            mv.addObject("username", username);
            return mv;
        }
        else{
            request.getSession().invalidate();
            return new ModelAndView("login");
        }
    }
    
    @RequestMapping({"/collections"})
    public ModelAndView collections(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String api_method = "getvendor";
//        JSONArray LoggedinuserDetails = new JSONArray();
//        LoggedinuserDetails.put(session);
        String api_method = "getcollectionorder";
        if(session != null) {
            JSONObject js = new JSONObject();
            js.put("companyCode", companyCode);
            System.out.println("vendor companycode "+ companyCode);

            JSONArray collections = new JSONArray(restCall.executeRequest(api_method, js));
            mv.addObject("companycode", companyCode);
            mv.addObject("userid", userID);
            mv.addObject("walletNumber", session.getString("walletnumber"));
            mv.addObject("firstname", firstname);
            mv.addObject("companyName", companyName);
            mv.addObject("lastname", lastname);
            mv.addObject("username", username);
            mv.addObject("collections", collections);
            mv.addObject("collectionsLength", collections.length());
            mv.setViewName("collections");
            
            return mv;
        }
        else{
            request.getSession().invalidate();
            return new ModelAndView("login");
        }
    }
    
    @RequestMapping(value  = {"/createorder"}, method = RequestMethod.POST)
    @ResponseBody
    public String createVendor(@RequestParam("orderName") String orderName, @RequestParam("orderAmount") String orderAmount, 
            @RequestParam("customeremail") String customeremail, @RequestParam("senderFirstname") String senderFirstname, 
            @RequestParam("senderLastname") String senderLastname,
            @RequestParam("companyCode") String companyCode
            ) throws JSONException{
            JSONObject js = new JSONObject();

            try{
                js.put("orderName", orderName);
                js.put("orderAmount", orderAmount);
                js.put("customerEmail", customeremail);
                js.put("senderFirstname", senderFirstname);
                js.put("senderLastname", senderLastname);
                js.put("companyCode", companyCode);
                js.put("link", "");
                String url = "createcollectionorder";
                
                JSONObject res = new JSONObject(restCall.executeRequest(url, js));
                
                System.out.println("neow now colections"+ res);
                
                String resp = res.getString("responsecode");
                
                return resp;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping(value  = {"/changepassword"}, method = RequestMethod.POST)
    @ResponseBody
    public String createCompany(@RequestParam("username") String username, @RequestParam("oldpassword") String oldpassword, 
            @RequestParam("newpassword") String newpassword) throws JSONException{
            JSONObject js = new JSONObject();
            try{
                js.put("username", username);
                js.put("oldpassword", oldpassword);
                js.put("newpassword", newpassword);
                String url = "changepassword";
                JSONObject res = new JSONObject(restCall.executeRequest(url, js));
                System.out.println("neow now "+ res);
                String resp = res.getString("responsecode");
                return resp;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping(value  = {"/createcompany"}, method = RequestMethod.POST)
    @ResponseBody
    public String createCompany(@RequestParam("companyName") String companyName, @RequestParam("address") String address, 
            @RequestParam("rc_number") String rc_number, @RequestParam("subscriptionId") String subscriptionId, 
            @RequestParam("creator") String creator, @RequestParam("creatorFirstname") String creatorFirstname,
            @RequestParam("creatorLastname") String creatorLastname
            ) throws JSONException{
            JSONObject js = new JSONObject();

            try{
                
                js.put("companyName", companyName);
                js.put("address", address);
                js.put("rcnumber", rc_number);
                js.put("subcriptionId", subscriptionId);
                js.put("creator", creator);
                js.put("creatorFirstname", creatorFirstname);
                js.put("creatorLastname", creatorLastname);
                
                String url = "createorganization";
                
                JSONObject res = new JSONObject(restCall.executeRequest(url, js));
                
                System.out.println("neow now "+ res);
                
                String resp = res.getString("responsecode");
                
                return resp;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
        
    @RequestMapping({"/vendors"})
    public ModelAndView vendors(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        String api_method = "getvendor";
//        JSONArray LoggedinuserDetails = new JSONArray();
//        LoggedinuserDetails.put(session);
        
        if(session != null) {
            mv.setViewName("vendors");
            JSONObject js = new JSONObject();
            js.put("companyCode", companyCode);
            System.out.println("vendor companycode "+ companyCode);

            JSONArray vendor = new JSONArray(restCall.executeRequest(api_method, js));
            JSONArray getFinancialInstitution = new JSONArray(restCall.executeGet("getfinancialinstitution"));
            System.out.println("vendor "+ vendor);
            System.out.println("getFinancialInstitution "+ getFinancialInstitution);
            mv.addObject("vendor", vendor);
            mv.addObject("companycode", companyCode);
            mv.addObject("userid", userID);
            mv.addObject("vendorLength",vendor.length());
            mv.addObject("getFinancialInstitution", getFinancialInstitution);
            mv.addObject("getFinancialInstitutionLength", getFinancialInstitution.length());
            mv.addObject("walletNumber", session.getString("walletnumber"));
            mv.addObject("firstname", firstname);
            mv.addObject("lastname", lastname);
            return mv;
        }
        else {
            request.getSession().invalidate();
            return new ModelAndView("login");
        }
    }
    
    @RequestMapping(value  = {"/createvendor"}, method = RequestMethod.POST)
    @ResponseBody
    public String createVendor(@RequestParam("fname") String vendorFirstname, @RequestParam("surname") String vendorLastname, 
            @RequestParam("email") String vendorEmail, @RequestParam("phone") String vendorPhonenumber, 
            @RequestParam("bank") String vendorBank, @RequestParam("accountnumber") String vendorAccountnumber,
            @RequestParam("address") String vendorAddress, @RequestParam("category") String vendorCategory,
            @RequestParam("companycode") String vendorCompanycode
            ) throws JSONException{
            JSONObject js = new JSONObject();

            try{
                js.put("vendorFirstname", vendorFirstname);
                js.put("vendorLastname", vendorLastname);
                js.put("vendorEmail", vendorEmail);
                js.put("vendorPhonenumber", vendorPhonenumber);
                js.put("vendorAddress", vendorAddress);
                js.put("vendorBank", vendorBank);
                js.put("vendorAccountnumber", vendorAccountnumber);
                js.put("vendorCategory", vendorCategory);
                js.put("vendorCompanycode", vendorCompanycode);
                
                String url = "createVendor";
                
                JSONObject res = new JSONObject(restCall.executeRequest(url, js));
                
                System.out.println("neow now "+ res);
                
                String resp = res.getString("responsecode");
                
                return resp;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping(value  = {"/updatevendor"}, method = RequestMethod.POST)
    @ResponseBody
    public String updateVendor(@RequestParam("fname") String vendorFirstname, @RequestParam("surname") String vendorLastname, 
            @RequestParam("email") String vendorEmail, @RequestParam("phone") String vendorPhonenumber, 
            @RequestParam("bank") String vendorBank, @RequestParam("accountnumber") String vendorAccountnumber,
            @RequestParam("address") String vendorAddress, @RequestParam("category") String vendorCategory,
            @RequestParam("id") String id, @RequestParam("companycode") String vendorCompanycode
            ) throws JSONException{
            
            JSONObject js = new JSONObject();

            try{
                js.put("vendorFirstname", vendorFirstname);
                js.put("vendorLastname", vendorLastname);
                js.put("vendorEmail", vendorEmail);
                js.put("vendorPhonenumber", vendorPhonenumber);
                js.put("vendorAddress", vendorAddress);
                js.put("vendorBank", vendorBank);
                js.put("vendorAccountnumber", vendorAccountnumber);
                js.put("vendorCategory", vendorCategory);
                js.put("id", id);
                js.put("vendorCompanycode", vendorCompanycode);
                
                String url = "updatevendordetail";
                
                JSONObject res = new JSONObject(restCall.executeRequest(url, js));
                
                System.out.println("neow now "+ res);
                
                String resp = res.getString("responsecode");
                
                return resp;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping("/deleteVendor")
    @ResponseBody
    public String deleteUser(HttpServletRequest request, @RequestParam("id") String id) {
        try{
            if(session != null) {
                JSONObject js = new JSONObject();
                js.put("vendorId", id);
                
                String url = "deletevendor";
                JSONObject response = new JSONObject(restCall.executeRequest(url, js));
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
    
    @RequestMapping(value  = {"/payvendor"}, method = RequestMethod.POST)
    @ResponseBody
    public String payVendor(@RequestParam("srcAccountNumber") String srcAccountNumber, @RequestParam("srcAccountName") String srcAccountName, 
            @RequestParam("beneficiaryAccountNumber") String beneficiaryAccountNumber, @RequestParam("beneficiaryAccountName") String beneficiaryAccountName, 
            @RequestParam("amount") String amount, @RequestParam("narration") String narration,
            @RequestParam("beneficiaryPhoneNumber") String beneficiaryPhoneNumber, @RequestParam("beneficiaryFinancialInstitutionCode") String beneficiaryFinancialInstitutionCode,
            @RequestParam("companycode") String vendorCompanycode
            ) throws JSONException{
            
            System.out.println("Here");
            JSONObject js = new JSONObject();
            JSONArray jss = new JSONArray();

            try{
                js.put("srcAccountNumber", srcAccountNumber);
                js.put("srcAccountName", srcAccountName);
                js.put("beneficiaryAccountNumber", beneficiaryAccountNumber);
                js.put("beneficiaryAccountName", beneficiaryAccountName);
                js.put("amount", amount);
                js.put("narration", narration);
                js.put("beneficaryPhoneNumber", beneficiaryPhoneNumber);
                js.put("beneficaryFinancialInstitutionCode", beneficiaryFinancialInstitutionCode);
                js.put("companycode", vendorCompanycode);
                
                jss.put(js);
                System.out.println("jsss " + jss);
                String url = "payvendor";
                
                String res = (restCall.executeRequestJSONArray(url, jss));
                
                return res;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping({"/usermanagement"})
    public ModelAndView usersManagement(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        String api_method = "getusertype";
        String get_users = "getuser";
        
        if(session != null) {
            mv.setViewName("users");
            JSONObject js = new JSONObject();
            js.put("companyCode", companyCode);
            System.out.println("usermanagement companyCode "+ companyCode);

            JSONArray users = new JSONArray(restCall.executeRequest(get_users, js));
            JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
            System.out.println("users " + users);
            mv.addObject("usertype", usertype);
            mv.addObject("usertypeLength", usertype.length());
            mv.addObject("users", users);
            mv.addObject("usersLength", users.length());

            return mv;
        }
        else {
            request.getSession().invalidate();
            return new ModelAndView("login");
        }
    }
    
    @RequestMapping(value  = {"/createuser"}, method = RequestMethod.POST)
    @ResponseBody
    public String createUser(@RequestParam("firstname") String name, @RequestParam("lastname") String lastname, 
        @RequestParam("email") String email, @RequestParam("phone") String phonenumber, 
        @RequestParam("password") String password, @RequestParam("usertype") String usertype
        ) throws JSONException{
        JSONObject js = new JSONObject();
        try{
            js.put("firstname", name);
            js.put("lastname", lastname);
            js.put("email", email);
            js.put("usertype", usertype);
            js.put("phonenumber", phonenumber);
            js.put("password", password);
            System.out.println("sjdsj" + js);
            String url = "createcompanyuser";

            JSONObject res = new JSONObject(restCall.executeRequest(url, js));

            System.out.println("neow now "+ res);

            String resp = res.getString("responsecode");

            return resp;
        }
        catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping({"/airtimeanddata"})
    public ModelAndView airtAndData(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        String api_method = "getusertype";
        String get_users = "getuser";
//        JSONArray LoggedinuserDetails = new JSONArray();
//        LoggedinuserDetails.put(session);
        try {
           
            if(session != null) {
                JSONObject js = new JSONObject();
                js.put("companyCode", companyCode);
                JSONArray getLast5Transaction = new JSONArray(restCall.executeRequest("getairtimevendtransaction", js));
                System.out.println("usernameeee "+ username);
                mv.addObject("username", username);
                mv.addObject("companycode", companyCode);
                mv.addObject("walletBalance", session.getString("balance"));
                mv.addObject("Last5Transaction", getLast5Transaction);
                mv.addObject("Last5TransactionLength", getLast5Transaction.length());
                mv.setViewName("airtimeanddata");
                //JSONArray users = new JSONArray(restCall.executeRequest(get_users, js));
                //JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
            }
            else {
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    
    @RequestMapping({"/bulkairtime"})
    public ModelAndView bulkairtAndData(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String userEmail = (String)request.getSession().getAttribute("username");
        //String companycode = (String)request.getSession().getAttribute("companycode");
        String api_method = "getusertype";
        String get_users = "getuser";
        //String companyCode = (String)request.getSession().getAttribute("companycode");
        try {
            
            if(session != null) {
            JSONObject js = new JSONObject();
            js.put("companyCode", companyCode);
            
            //mv.addObject("username", userEmail);
            mv.addObject("companycode", companyCode);
            mv.setViewName("bulkairtimeupload");
            //JSONArray users = new JSONArray(restCall.executeRequest(get_users, js));
            //JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
            }
            else {
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    
    @RequestMapping(value  = {"/buyairtime"}, method = RequestMethod.POST)
    @ResponseBody
    public String buyAirTime(@RequestParam("username") String username, @RequestParam("network") String network, 
            @RequestParam("phonenumber") String phonenumber, @RequestParam("amount") String amount,
            @RequestParam("walletBalance") String walletBalance, @RequestParam("companycode") String companycode
            ) throws JSONException{
            JSONObject js = new JSONObject();
            try{
                js.put("username", username);
                js.put("network", network);
                js.put("phonenumber", phonenumber);
                js.put("amount", amount);
                js.put("walletBalance", walletBalance);
                js.put("companycode", companycode);
                
                System.out.println("Airtime purchase" + js);
                String url = "singleairtimevend";
                
                JSONObject res = new JSONObject(restCall.executeRequest(url, js));
                
                System.out.println("neow now "+ res);
                
                String resp = res.getString("responsecode");
                
                return resp;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping(value = {"/addPost"}, method=RequestMethod.POST)
    @ResponseBody
    public String addPost(HttpServletRequest request, @RequestParam("file") MultipartFile file, @RequestParam("value2") String uploader, @RequestParam("value1") String companycode) throws IOException, JSONException {
        String fileName = file.toString();
        String c = file.getContentType();
        byte[] filePath = file.getBytes();
        
        System.out.println("filename "+ fileName + "uploader" + uploader + "companycode" + companycode + "c " + c);
        
//        CloseableHttpClient client = HttpClients.createDefault();
//        HttpPost httpPost = new HttpPost("http://68.169.57.98:80/InternetBankingApp/bulkairtimeupload");
//
//        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
//        builder.addTextBody("username", "John");
//        builder.addTextBody("password", "pass");
//        builder.addBinaryBody(
//          "file", file, ContentType.APPLICATION_OCTET_STREAM, "file.ext");
//
//        HttpEntity multipart = builder.build();
//        httpPost.setEntity(multipart);
//
//        CloseableHttpResponse response = client.execute(httpPost);
//        assertThat(response.getStatusLine().getStatusCode(), equalTo(200));
//        client.close();
        DefaultHttpClient client = new DefaultHttpClient();
        File filee = new File(file.getOriginalFilename());
        HttpPost post = new HttpPost("http://68.169.57.98:80/InternetBankingApp/bulkairtimeupload");
        FileBody fileBody = new FileBody(filee);
        StringBody stringBody1 = new StringBody("Message 1");
        StringBody stringBody2 = new StringBody("Message 2");
        // 
        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
        builder.setMode(HttpMultipartMode.BROWSER_COMPATIBLE);
        builder.addPart("file", fileBody);
        builder.addPart("text1", stringBody1);
        builder.addPart("text2", stringBody2);
        HttpEntity entity = builder.build();
        //
        post.setEntity(entity);
        
        System.out.println("Done done");
        HttpResponse response = client.execute(post);
        System.out.println("response " + response);

//        String response = restCall.executeMultipartUpload("http://68.169.57.98:80/InternetBankingApp/bulkairtimeupload", "POST", file, companycode, uploader);
//        System.out.println("response "+ response);
//        MultipartEntityBuilder builder = MultipartEntityBuilder.create();
//        builder.addTextBody("uploader", uploader);
//        builder.addTextBody("companycode", companycode);
//        System.out.println("multipartbuilder " + "here");
//        builder.addBinaryBody("file", (File) file);
//        
//        System.out.println("multipartbuilder " + "");
//
//        builder.build();
//        
//        System.out.println("multipart " + "here3");
        //String response = restCall.multipost("bulkairtimeupload", builder);
       // System.out.println("bulk response " + response);

//        if(fileName != "null") {
//                imageUploads.uploadFile(request, file);
//        }
//        String addTopic_url = "http://localhost:8080/MedForumRestServices/json/data/topics";
//
//        JSONObject js = new JSONObject();
//
//        js.put("category_id", category_id);
//        js.put("subcategory_id", subcategory_id);
//        js.put("author", author);
//        js.put("title", title);
//        js.put("content", content);
//        js.put("image_path", (String)fileName);
//
//        try {
//                JSONObject addRes = new JSONObject(restCall.processRequest(addTopic_url, js));
//                //responsecode = addRes.getString("responsecode");
//                return addRes.toString();
//
//        } catch (JsonParseException e) {
//                e.printStackTrace();
//        }

        return null;
    }
    
    @RequestMapping({"/fundtransfer"})
    public ModelAndView fundTransfer(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String userEmail = (String)request.getSession().getAttribute("username");
        //String companycode = (String)request.getSession().getAttribute("companycode");
        String api_method = "getusertype";
        String get_users = "getuser";
        //String companyCode = (String)request.getSession().getAttribute("companycode");
//        JSONArray LoggedinuserDetails = new JSONArray();
//        LoggedinuserDetails.put(session);
        try {
            
            if(session != null) {
                JSONArray getFinancialInstitution = new JSONArray(restCall.executeGet("getfinancialinstitution"));

                JSONObject js = new JSONObject();
                js.put("companyCode", companyCode);

                JSONArray getLast5Transaction = new JSONArray(restCall.executeRequest("getfundtransfertransaction", js));

                System.out.println("getLst5Transaction "+ getLast5Transaction);

                mv.addObject("username", username);
                mv.addObject("companycode", companyCode);
                mv.addObject("walletNumber", session.getString("walletnumber"));
                mv.addObject("walletBalance", session.getString("balance"));
                mv.addObject("firstname", firstname);
                mv.addObject("lastname", lastname);
                mv.addObject("getFinancialInstitution", getFinancialInstitution);
                mv.addObject("getFinancialInstitutionLength", getFinancialInstitution.length());
                mv.addObject("Last5Transaction", getLast5Transaction);
                mv.addObject("Last5TransactionLength", getLast5Transaction.length());
                mv.setViewName("fundtransfer");
                //JSONArray users = new JSONArray(restCall.executeRequest(get_users, js));
                //JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
            }
            else {
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    
    @RequestMapping({"/bulkfundtransfers"})
    public ModelAndView bulkfundTransfer(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String userEmail = (String)request.getSession().getAttribute("username");
        //String companycode = (String)request.getSession().getAttribute("companycode");
        String api_method = "getusertype";
        String get_users = "getuser";
        //String companyCode = (String)request.getSession().getAttribute("companycode");
        try {
            
            if(session != null) {
                JSONArray getFinancialInstitution = new JSONArray(restCall.executeGet("getfinancialinstitution"));

                 JSONObject js = new JSONObject();
                 js.put("companyCode", companyCode);

                 //mv.addObject("username", userEmail);
                 mv.addObject("companycode", companyCode);
                 mv.addObject("getFinancialInstitution", getFinancialInstitution);
                 mv.addObject("getFinancialInstitutionLength", getFinancialInstitution.length());
                 mv.setViewName("bulkfundtransfer");
                 //JSONArray users = new JSONArray(restCall.executeRequest(get_users, js));
                 //JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
            }
            else {
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    
    @RequestMapping({"/scheduletransfer"})
    public ModelAndView schedulefundTransfer(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        //String userEmail = (String)request.getSession().getAttribute("username");
        //String companycode = (String)request.getSession().getAttribute("companycode");
        String api_method = "getusertype";
        String get_users = "getuser";
        //String companyCode = (String)request.getSession().getAttribute("companycode");
//        JSONArray LoggedinuserDetails = new JSONArray();
//        LoggedinuserDetails.put(session);
        try {
            
            if(session != null) {
                JSONArray getFinancialInstitution = new JSONArray(restCall.executeGet("getfinancialinstitution"));

                JSONObject js = new JSONObject();
                js.put("companyCode", companyCode);

                mv.addObject("username", username);
                mv.addObject("companycode", companyCode);
                mv.addObject("walletNumber", session.getString("walletnumber"));
                mv.addObject("firstname", firstname);
                mv.addObject("lastname", lastname);
                mv.addObject("getFinancialInstitution", getFinancialInstitution);
                mv.addObject("getFinancialInstitutionLength", getFinancialInstitution.length());
                mv.setViewName("scheduletransfer");
                //JSONArray users = new JSONArray(restCall.executeRequest(get_users, js));
                //JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
            }
            else {
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    
    @RequestMapping(value  = {"/sendfundtransfer"}, method = RequestMethod.POST)
    @ResponseBody
    public String fundTransfer(@RequestParam("sourceAccountNumber") String sourceAccountNumber, @RequestParam("sourceAccountName") String sourceAccountName, 
            @RequestParam("beneficiaryAccountNumber") String beneficiaryAccountNumber, @RequestParam("username") String username, 
            @RequestParam("amount") String amount, @RequestParam("narration") String narration,
            @RequestParam("beneficiaryDestinationInstitutionCode") String beneficiaryDestinationInstitutionCode,
            @RequestParam("walletBalance") String walletBalance, @RequestParam("companycode") String companyCode
            ) throws JSONException{
            
            System.out.println("Here");
            JSONObject js = new JSONObject();
            //JSONArray jss = new JSONArray();

            try{
                js.put("username", username);
                js.put("sourceAccountNumber", sourceAccountNumber);
                js.put("sourceAccountName", sourceAccountName);
                js.put("beneficiaryAccountNumber", beneficiaryAccountNumber);
                js.put("amount", amount);
                js.put("narration", narration);
                js.put("beneficiaryDestinationInstitutionCode", beneficiaryDestinationInstitutionCode);
                js.put("walletBalance", walletBalance);
                js.put("companyCode", companyCode);
                
                //jss.put(js);
                System.out.println("jsss " + js);
                String url = "fundtransfer";
                
                JSONObject res = new JSONObject(restCall.executeRequestJSONObject(url, js));
                
                String ress = (new JSONObject(res.getString("response")).getString("responsecode"));
                
                System.out.println("response " + new JSONObject(res.getString("response")).getString("responsecode"));
                
                System.out.println("neow now "+ res);
                
                //String resp = res.getString("responsecode");
                
                return ress;
            }
            catch(Exception e){
                e.printStackTrace();
            }
        return null;
    }
    
    @RequestMapping({"/billspayments"})
    public ModelAndView billsPayments(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        String api_method = "getbiller";
        try {
            
            if(session != null) {
                 JSONObject js = new JSONObject();
                 js.put("companyCode", companyCode);
                 
                 JSONArray billers = new JSONArray(restCall.executeGet(api_method));
                 
                 System.out.println("billers "+ billers);
                 System.out.println("billers length"+ billers.length());
                 
                 mv.addObject("companycode", companyCode);
                 mv.addObject("billers", billers);
                 mv.addObject("billersLength", billers.length());
                 mv.setViewName("billspayment");
            }
            else {
                request.getSession().invalidate();
                return new ModelAndView("login");
            }
        }
        catch(Exception e) {
            e.printStackTrace();
        }
        return mv;
    }
    
    @RequestMapping(value  = {"/login"}, method = RequestMethod.POST)
    @ResponseBody
    public String userLogin(HttpServletRequest request, HttpServletResponse response, @RequestParam("username") String username, @RequestParam("password") String password){

        JSONObject[] obj;
        System.out.println("username "+ username +"password"+ password);
        try{
            String url = "userlogin";
            
            String first_timer = "firsttimelogin";
            
            JSONObject js = new JSONObject();
            
            js.put("username", username);
            js.put("password", password);
            
            JSONObject res = new JSONObject(restCall.executeRequest(url, js));
            
            String responsecode = res.getString("responsecode");
            System.out.println("userlogin " + res);
            //request.getSession().setAttribute("merchant_username", res.getString("username"));
            if(responsecode .equals("00")){
                request.getSession().setAttribute("loggedusername", username);
                request.getSession().setAttribute("loggedpassword", password);
                List LoggedinuserDetailss = new ArrayList<>();
                LoggedinuserDetailss.add(res);
                System.out.println("LoggedinuserDetails "+ LoggedinuserDetailss);
                System.out.println("LoggedinuserDetailss "+ LoggedinuserDetailss);
                request.getSession().setAttribute("LoggedinuserDetails", res);
                request.getSession().setAttribute("companycode", res.getString("companycode"));
                request.getSession().setAttribute("loggedIn", res.getString("firstname"));
                String usertype = res.getString("usertype");
                if(usertype.equals("Employee")) {
                    JSONObject empJS = new JSONObject();
                    empJS.put("username", res.getString("username"));
                    JSONArray empDetails = new JSONArray(restCall.executeRequest("eachemployeedetail", empJS));
                    System.out.println("this are the empDetails "+ empDetails);
                    request.getSession().setAttribute("EmployeeDetails", empDetails);
                }

                return "success";
            }
            else{
                return "failed";
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping(value  = {"/relogin"}, method = RequestMethod.POST)
    @ResponseBody
    public String userReLogin(HttpServletRequest request, HttpServletResponse response){
        
        String  loggedusername = (String) request.getSession().getAttribute("loggedusername");
        String loggedpassword  = (String) request.getSession().getAttribute("loggedpassword"); 
        
        System.out.println("loggedusername "+ loggedusername + "loggedpassword " + loggedpassword);

        JSONObject[] obj;

        try{
            String url = "userlogin";
            
            String first_timer = "firsttimelogin";
            
            JSONObject js = new JSONObject();
            
            js.put("username", loggedusername);
            js.put("password", loggedpassword);
            
            JSONObject res = new JSONObject(restCall.executeRequest(url, js));
            
            String responsecode = res.getString("responsecode");
            System.out.println("userlogin " + res);
            if(responsecode .equals("00")){
                request.getSession().removeAttribute("loggedusername");
                request.getSession().removeAttribute("loggedpassword");
                List LoggedinuserDetails = new ArrayList<>();
                LoggedinuserDetails.add(res);
                System.out.println("LoggedinuserDetails "+ LoggedinuserDetails);
                request.getSession().setAttribute("LoggedinuserDetails", res);
                request.getSession().setAttribute("companycode", res.getString("companycode"));
                request.getSession().setAttribute("loggedIn", res.getString("firstname"));
                String usertype = res.getString("usertype");
//                if(usertype.equals("Employee")) {
//                    JSONObject empJS = new JSONObject();
//                    empJS.put("username", res.getString("username"));
//                    JSONArray empDetails = new JSONArray(restCall.executeRequest("eachemployeedetail", empJS));
//                    System.out.println("this are the empDetails "+ empDetails);
//                    request.getSession().setAttribute("EmployeeDetails", empDetails);
//                }

                //response.sendRedirect("dashboard");
                return "redirect:/dashboard";
            }
            else{
                return "failed";
            }

        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    
    @RequestMapping({"/setup_user"})
    public ModelAndView setUpUser(HttpServletRequest request, HttpServletResponse response) throws JSONException {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("usersmanagement");
        //String api_method = "getusertype";

        //JSONArray usertype = new JSONArray(restCall.executeGet(api_method));
        //System.out.println("setup "+ usertype);

        //mv.addObject("usertype", usertype);
        //mv.addObject("usertypeLength", usertype.length());
     
       return mv;
    }
    
    @RequestMapping("/logout")
    public String logOut(HttpServletRequest request, HttpServletResponse response) throws IOException{
        request.getSession().invalidate();
        //response.sendRedirect("/login");
        
        return "redirect:/login";
    }
    
    
}
