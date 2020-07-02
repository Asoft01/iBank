$(".md-b-outline-app input").focusin(function(){
    $(this).parent("div").find("label").addClass("text-app-main");
    $(this).addClass("border-app-bottom");
});

$(".md-b-outline-app input").focusout(function(){
    $(this).parent("div").find("label").removeClass("text-app-main");
    $(this).removeClass("border-app-bottom");
});

$(".md-b-outline-app select").focusin(function(){
    $(this).parent("div").find("label").addClass("text-app-main");
    $(this).addClass("border-app-bottom");
});

$(".md-b-outline-app select").focusout(function(){
    $(this).parent("div").find("label").removeClass("text-app-main");
    $(this).removeClass("border-app-bottom");
});

$(".md-outline-app input").focusin(function(){
    $(this).parent("div").find("label").addClass("text-app-main");
    $(this).addClass("border-app");
});

$(".md-outline-app input").focusout(function(){
    $(this).parent("div").find("label").removeClass("text-app-main");
    $(this).removeClass("border-app");
});

$(".md-outline-app select").focusin(function(){
    $(this).parent("div").find("label").addClass("text-app-main");
    $(this).addClass("border-app");
});

$(".md-outline-app select").focusout(function(){
    $(this).parent("div").find("label").removeClass("text-app-main");
    $(this).removeClass("border-app");
});

let banklist = [
    { "id": "1", "name": "Access Bank" ,"code":"000044" },
    { "id": "2", "name": "Citibank","code":"023" },
    { "id": "3", "name": "Diamond Bank","code":"000063" },
    { "id": "4", "name": "Dynamic Standard Bank","code":"000223" },
    { "id": "5", "name": "Ecobank Nigeria","code":"000050" },
    { "id": "6", "name": "Fidelity Bank Nigeria","code":"000070" },
    { "id": "7", "name": "First Bank of Nigeria","code":"000011" },
    { "id": "8", "name": "First City Monument Bank","code":"000214" },
    { "id": "9", "name": "Guaranty Trust Bank","code":"000058" },
    { "id": "10", "name": "Heritage Bank Plc","code":"000030" },
    { "id": "11", "name": "Jaiz Bank","code":"000301" },
    { "id": "12", "name": "Keystone Bank Limited","code":"000082" },
    { "id": "13", "name": "Providus Bank Plc","code":"000101" },
    { "id": "14", "name": "Polaris Bank","code":"000076" },
    { "id": "15", "name": "Stanbic IBTC Bank Nigeria Limited","code":"000221" },
    { "id": "16", "name": "Standard Chartered Bank","code":"000068" },
    { "id": "17", "name": "Sterling Bank","code":"000232" },
    { "id": "18", "name": "Suntrust Bank Nigeria Limited","code":"000100" },
    { "id": "19", "name": "Union Bank of Nigeria","code":"000032" },
    { "id": "20", "name": "United Bank for Africa","code":"000033" },
    { "id": "21", "name": "Unity Bank Plc","code":"000215" },
    { "id": "22", "name": "Wema Bank","code":"000035" },
    { "id": "23", "name": "Zenith Bank","code":"000057" }
];
        
let ghanaCities = [
    { "id": "ACCR", "name": "Accra" },
    { "id": "KUMA", "name": "Kumasi" },
    { "id": "TAMA", "name": "Tamale" },
    { "id": "SKTD", "name": "Sekondi-Takoradi" }
];

function showErrorBorder(x) {
    x.addClass("border border-danger");
//    x.focus();
    setTimeout(function(){
        x.removeClass("border border-danger");
    }, 3000);
}

function showErrorBorderBottom(x) {
    x.addClass("border-bottom border-danger");
//    x.focus();
    setTimeout(function(){
        x.removeClass("border-bottom border-danger");
    }, 3000);
}

function printErrorForm(x, y) {
    x.siblings("label").children("small").html(y);
    setTimeout(function(){
        x.siblings("label").children("small").html("");
    }, 3000);
}

function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
}

function validatePWD(password) {
    //var re = /^([a-zA-Z0-9]+)$/;
//    let alph = /[a-z]/g;
//    let num = /[0-9]/g;
//    return alph.test(String(password)) && num.test(String(password));
    return password.length > 5;
}

//let ip = "http://localhost:8084/tamsv2/";
let ip = "http://" + window.location.hostname + ":" + window.location.port + "/TAMSS/";
//let ip = "http://68.169.57.98:80/TAMSS/";

let calendarMonths = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
let weekDays = ["Sun", "Mon", "Tues", "Wed", "Thur", "Fri", "Sat"];
let printCounter = 0;
let tableExportImg = "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";

http://localhost:8084/TAMSS/resources/mdb/img/TAMS.png
function exPortToFileCSV(table, filename) {
    table.tableHTMLExport({
        // csv, txt, json, pdf
        type: 'csv',
        // default file name
        filename: filename,
        // for csv
        separator: ',',
        newline: '\r\n',
        trimContent: false,
        quoteFields: true,
        // CSS selector(s)
        ignoreColumns: '',
        ignoreRows: '',
        // your html table has html content?
        htmlContent: true,
        // debug
        consoleLog: false
    });
}

function exPortToFilePDF(table, filename) {
    table.tableHTMLExport({
        // csv, txt, json, pdf
        type: 'pdf',
        // default file name
        filename: filename,
        
        orientation:'l',
        // CSS selector(s)
        ignoreColumns: '',
        ignoreRows: '',
        trimContent: false,
        // your html table has html content?
        htmlContent: true,
        // debug
        consoleLog: false
    });
}

$("#modalMerchantFull").on('hidden.bs.modal', function(){
    $('#tbl_merchant_more').DataTable().destroy();
    $("#tbl_merchant_more tbody").html("");
    $('#tbl_transactions').DataTable().destroy();
    $("#tbl_transactions tbody").html("");
    $("#btn_request_merchant_delete").html('<span>Request Delete</span>');
    $("#btn_request_merchant_delete").addClass("btn-danger");
    $("#btn_request_merchant_delete").removeClass("btn-indigo");
    $("#btn_request_merchant_delete").prop("disabled", false);
});

$("#modalAddNewTerminal").on('hidden.bs.modal', function(){
    $('.tbl_terminals').DataTable().destroy();
    $(".tbl_terminals tbody").html("");
    $(".list-group .active").click();
});

$("#modalTerminalFull").on('hidden.bs.modal', function(){
    $("#btn_request_terminal_delete").html('<span>Request Delete</span>');
    $("#btn_request_terminal_delete").addClass("btn-danger");
    $("#btn_request_terminal_delete").removeClass("btn-indigo");
    $("#btn_request_terminal_delete").prop("disabled", false);
    $(".in_te").removeClass("border-app-bottom");
    $(".in_te").prop("disabled", true);
    $("#btn_edit_terminal_1").show();
    $("#btn_edit_terminal_2").hide();
});

$("#modalAddNewMerchant").on('hidden.bs.modal', function(){
    $(".list-group .active").click();
});

$("#btn_create_merchant").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let merchant_category = $("#merchant_category");
    let merchant_address = $("#merchant_address");
    let merchant_key = $("#merchant_key");
    let merchant_token = $("#merchant_token");
    let merchant_currency_code = $("#merchant_currency_code");
    let merchant_country_code = $("#merchant_country_code");
    let merchant_city = $("#merchant_city");
    let msg_merchant_create = $("#msg_merchant_create");
    
    if (merchant_address.val() === "") {
        showErrorBorderBottom(merchant_address);
    }
    else if (merchant_category.val() === "") {
        showErrorBorderBottom(merchant_category);
    }
    else if (merchant_key.val() === "") {
        showErrorBorderBottom(merchant_key);
    }
    else if (merchant_token.val() === "") {
        showErrorBorderBottom(merchant_token);
    }
    else if (merchant_currency_code.val() === "") {
        showErrorBorderBottom(merchant_currency_code);
    }
    else if (merchant_country_code.val() === "") {
        showErrorBorderBottom(merchant_country_code);
    }
    else if (merchant_city.val() === "") {
        showErrorBorderBottom(merchant_city);
    }
    else {
        btn.prop("disabled", true);
        span.html("Please wait...");
        span.addClass("animated flash infinite slow");
        
        let newMerchantData = {
            "merchantcategory": merchant_category.val(),
            "merchantaddress": merchant_address.val(),
            "merchanttoken": merchant_token.val(),
            "merchantkey": merchant_key.val(),
            "city": merchant_city.val(),
            "countrycode": merchant_country_code.val(),
            "currencycode": merchant_currency_code.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'addmerchant',
            data: JSON.stringify(newMerchantData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                if (data.responsecode === "00") {
                    msg_merchant_create.html('Merchant Created<i class="far fa-thumbs-up ml-1"></i>');
                    msg_merchant_create.addClass('animated wobble slower text-success');
                    merchant_category.val(""); merchant_address.val(""); merchant_token.val(""); merchant_key.val(""); merchant_country_code.val(""); merchant_currency_code.val("");
                }
                else {
                    msg_merchant_create.html('Error Creating Merchant<i class="far fa-thumbs-down ml-1"></i>');
                    msg_merchant_create.addClass('animated shake slower text-danger');
                }
                setTimeout(function(){
                    msg_merchant_create.html("");
                }, 5000);
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                msg_merchant_create.html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                msg_merchant_create.addClass('animated shake slower text-danger');
                setTimeout(function(){
                    msg_merchant_create.html("");
                }, 5000);
            }
        });
    }
});

$("#btn_create_terminal").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let terminal_merchant = $("#terminal_merchant");
    let terminal_port = $("#terminal_port");
    let session_master_key = $("#session_master_key");
    let session_master_check_value = $("#session_master_check_value");
    let session_two_key = $("#session_two_key");
    let route_mode = $("#route_mode");
    let a_ins_id = $("#a_ins_id");
    let cbn_code = $("#cbn_code");
    let terminal_type = $("#terminal_type");
    let terminal_time_out = $("#terminal_time_out");
    let terminal_call_home = $("#terminal_call_home");
    let msg_terminal_create = $("#msg_terminal_create");
    
    if (terminal_merchant.val() === "") {
        showErrorBorderBottom(terminal_merchant);
    }
    else if (terminal_port.val() === "") {
        showErrorBorderBottom(terminal_port);
    }
    else if (session_master_key.val() === "") {
        showErrorBorderBottom(session_master_key);
    }
    else if (session_master_check_value.val() === "") {
        showErrorBorderBottom(session_master_check_value);
    }
    else if (session_two_key.val() === "") {
        showErrorBorderBottom(session_two_key);
    }
    else if (route_mode.val() === "") {
        showErrorBorderBottom(route_mode);
    }
    else if (a_ins_id.val() === "") {
        showErrorBorderBottom(a_ins_id);
    }
    else if (cbn_code.val() === "") {
        showErrorBorderBottom(cbn_code);
    }
    else if (terminal_type.val() === "") {
        showErrorBorderBottom(terminal_type);
    }
    else if (terminal_time_out.val() === "") {
        showErrorBorderBottom(terminal_time_out);
    }
    else if (terminal_time_out.val() > 300) {
        printErrorForm(terminal_time_out, "Can't be more than 300 secs");
    }
    else if (terminal_call_home.val() === "") {
        showErrorBorderBottom(terminal_call_home);
    }
    else {
        btn.prop("disabled", true);
        span.html("Please wait...");
        span.addClass("animated flash infinite slow");
        
        let newMerchantData = {
            "merchantid": terminal_merchant.val(),
//            "local_port": terminal_port.val(),
//            "session_master_key": session_master_key.val(),
//            "session_master_check_value": session_master_check_value.val(),
//            "session2_key": session_two_key.val(),
//            "route_mode": route_mode.val(),
//            "acquiring_institution_id": a_ins_id.val(),
//            "cbn_bank_code": cbn_code.val(),
//            "terminal_type": terminal_type.val(),
            "timeout": terminal_time_out.val(),
            "callhome": terminal_call_home.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'addterminal',
            data: JSON.stringify(newMerchantData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                if (data.responsecode === "00") {
                    msg_terminal_create.html('Terminal Created with Id - ' + data.terminalid + '<i class="far fa-thumbs-up ml-1"></i>');
                    msg_terminal_create.addClass('animated wobble slower text-success');
                    terminal_merchant.val(""); terminal_time_out.val(""); terminal_call_home.val("");// cbn_code.val(""); a_ins_id.val(""); session_two_key.val(""); session_master_check_value.val(""); session_master_key.val(""); terminal_port.val("");
                }
                else {
                    msg_terminal_create.html('Error Creating Terminal<i class="far fa-thumbs-down ml-1"></i>');
                    msg_terminal_create.addClass('animated shake slower text-danger');
                }
                setTimeout(function(){
                    msg_terminal_create.html("");
                }, 5000);
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                msg_terminal_create.html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                msg_terminal_create.addClass('animated shake slower text-danger');
                setTimeout(function(){
                    msg_terminal_create.html("");
                }, 5000);
            }
        });
    }
});

$("#btn_login_to_account").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let loginEmail = $("#loginEmail");
    let loginPassword = $("#loginPassword");
    
    if (loginEmail.val() === "") {
        showErrorBorder(loginEmail);
    }
    else if (loginPassword.val() === "") {
        showErrorBorder(loginPassword);
    }
    else {
        btn.prop("disabled", true);
        span.html("Please wait...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "username": loginEmail.val(),
            "password": loginPassword.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'userlogin',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                if (data[0].responsecode === "00") {
                    if (data[0].cc === true)
                        window.location.href = ip + "dashboard";
                    else
                        window.location.href = ip + "complete_registration";
                }
                else {
                    $("#log_error").html("Invalid login");
                    setTimeout(function(){
                        
                    }, $("#log_error").html(""));
                    btn.prop("disabled", false);
                    span.html("Login");
                    span.removeClass("animated flash infinite slow");
                }
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Login");
                span.removeClass("animated flash infinite slow");
            }
        });
    }
});

$("#btn_complete_reg").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let firstName = $("#firstName");
    let lastName = $("#lastName");
    let businessName = $("#businessName");
    let pNo = $("#pNo");
    let bizIndustry = $("#bizIndustry");
    let bizRole = $("#bizRole");
    let bizRegStatus = $("#bizRegStatus");
    let regCountry = $("#regCountry");
    
    if (firstName.val() === "") {
        showErrorBorder(firstName);
    }
    else if (lastName.val() === "") {
        showErrorBorder(lastName);
    }
    else if (pNo.val() === "") {
        showErrorBorder(pNo);
    }
    else if (businessName.val() === "") {
        showErrorBorder(businessName);
    }
    else {
        btn.prop("disabled", true);
        span.html("Completing registration...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "firstName": firstName.val(),
            "lastName": lastName.val(),
            "phoneNumber": pNo.val(),
            "businessName": businessName.val(),
            "businessIndustry": bizIndustry.val(),
            "businessRole": bizRole.val(),
            "registrationStatus": bizRegStatus.val(),
            "country": regCountry.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'createmerchantstep2',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                if (data.responsecode === "00") {
                    window.location.href = ip + "dashboard";
                }
                else {
                    btn.prop("disabled", false);
                    span.html("Create Account");
                    span.removeClass("animated flash infinite slow");
                }
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Create Account");
                span.removeClass("animated flash infinite slow");
            }
        });
    }
});

$("#btn_login_to_account_admin").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let loginEmail = $("#loginEmail");
    let loginPassword = $("#loginPassword");
    
    if (loginEmail.val() === "") {
        showErrorBorder(loginEmail);
    }
    else if (loginPassword.val() === "") {
        showErrorBorder(loginPassword);
    }
    else {
        btn.prop("disabled", true);
        span.html("Please wait...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "username": loginEmail.val(),
            "password": loginPassword.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'admin/adminlogin',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                if (data.responsecode === "00") {
                    window.location.href = ip + "admin";
                }
                else {
                    $("#log_error").html("Invalid login");
                    setTimeout(function(){
                        
                    }, $("#log_error").html(""));
                    btn.prop("disabled", false);
                    span.html("Login");
                    span.removeClass("animated flash infinite slow");
                }
            },
            error: function(err) {
                window.location.href = ip + "admin";
                console.log(err);
                btn.prop("disabled", false);
                span.html("Login");
                span.removeClass("animated flash infinite slow");
            }
        });
    }
});


$("#btn_create_institutions").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let institionName = $("#instition_name");
    let institionCode = $("#instition_code");
    let institionAesKey = $("#instition_aes_key");
    let institionIvKey = $("#instition_iv_key");
    let msg_ins_create = $("#msg_ins_create");
    msg_ins_create.html("");
    msg_ins_create.removeClass('animated wobble shake slower text-success text-danger');
    
    if (institionName.val() === "") {
        showErrorBorderBottom(institionName);
    }
    else if (institionCode.val() === "") {
        showErrorBorderBottom(institionCode);
    }
    else if (institionAesKey.val() === "") {
        showErrorBorderBottom(institionAesKey);
    }
    else if (institionIvKey.val() === "") {
        showErrorBorderBottom(institionIvKey);
    }
    else {
        btn.prop("disabled", true);
        span.html("Please wait...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "name": institionName.val(),
            "code": institionCode.val(),
            "aeskey": institionAesKey.val(),
            "ivkey": institionIvKey.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'admin/createinstitution',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                if (data.responsecode === "00") {
                    msg_ins_create.html('Institution Created<i class="far fa-thumbs-up ml-1"></i>');
                    msg_ins_create.addClass('animated wobble slower text-success');
                    institionName.val(""); institionCode.val(""); institionAesKey.val(""); institionIvKey.val("");
                    setTimeout(function(){
                        msg_ins_create.html("");
                    }, 5000);
                }
                else {
                    msg_ins_create.html('Error Creating Institution<i class="far fa-thumbs-down ml-1"></i>');
                    msg_ins_create.addClass('animated shake slower text-danger');
                    setTimeout(function(){
                        msg_ins_create.html("");
                    }, 5000);
                }
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                msg_ins_create.html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                msg_ins_create.addClass('animated shake slower text-danger');
                setTimeout(function(){
                    msg_ins_create.html("");
                }, 5000);
            }
        });
    }
});

$("#btn_update_institutions").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let institionName = $("#instition_name_edit");
    let institionCode = $("#instition_code_edit");
    let tempName = $("#hold_ins_name").val();
    let tempCode = $("#hold_ins_code").val();
    let msg_ins_edit = $("#msg_ins_edit");
    msg_ins_edit.html("");
    msg_ins_edit.removeClass('animated wobble shake slower text-success text-danger');
    
    if (institionName.val() === "") {
        showErrorBorderBottom(institionName);
    }
    else if (institionCode.val() === "") {
        showErrorBorderBottom(institionCode);
    }
    else if (institionName.val() !== tempName || institionCode.val() !== tempCode) {
        btn.prop("disabled", true);
        span.html("Updating...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "name": institionName.val(),
            "code": institionCode.val(),
            "id": $("#hold_ins_id").val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'admin/updateinstitution',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                btn.prop("disabled", false);
                span.html("Update");
                span.removeClass("animated flash infinite slow");
                if (data.responsecode === "00") {
                    msg_ins_edit.html('Institution Details Updated<i class="far fa-thumbs-up ml-1"></i>');
                    msg_ins_edit.addClass('animated wobble slower text-success');
                    institionName.val(""); institionCode.val(""); $("#hold_ins_id").val("");
                    setTimeout(function(){
                        msg_ins_edit.html("");
                    }, 5000);
                }
                else {
                    msg_ins_edit.html('Error Updating Institution Details<i class="far fa-thumbs-down ml-1"></i>');
                    msg_ins_edit.addClass('animated shake slower text-danger');
                    setTimeout(function(){
                        msg_ins_edit.html("");
                    }, 5000);
                }
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                msg_ins_edit.html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                msg_ins_edit.addClass('animated shake slower text-danger');
                setTimeout(function(){
                    msg_ins_edit.html("");
                }, 5000);
            }
        });
    }
});

$("#btn_create_user").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let enuserName = $("#enusername");
    let enPwd = $("#enpwd");
    let confPwd = $("#confPwd");
    let insCode = $("#ins_code");
    let msg_ins_create = $("#msg_user_create");
    msg_ins_create.html("");
    msg_ins_create.removeClass('animated wobble shake slower text-success text-danger');
    
    if (enuserName.val() === "") {
        showErrorBorderBottom(enuserName);
    }
    else if (!validateEmail(enuserName.val())){
        printErrorForm(enuserName, "Invalid Email Address");
    }
    else if (enPwd.val() === "") {
        showErrorBorderBottom(enPwd);
    }
    else if (confPwd.val() === "") {
        showErrorBorderBottom(confPwd);
    }
    else if (enPwd.val() !== confPwd.val()) {
        printErrorForm(confPwd, "Password mismatch");
    }
    else if (insCode.val() === "") {
        showErrorBorderBottom(insCode);
    }
    else {
        btn.prop("disabled", true);
        span.html("Please wait...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "institutionid": insCode.val(),
            "username": enuserName.val(),
            "password": enPwd.val()
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'admin/createuser',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                if (data.responsecode === "00") {
                    msg_ins_create.html('User Created<i class="far fa-thumbs-up ml-1"></i>');
                    msg_ins_create.addClass('animated wobble slower text-success');
                    enuserName.val(""); enPwd.val(""); confPwd.val("");
                    setTimeout(function(){
                        msg_ins_create.html("");
                    }, 5000);
                }
                else {
                    msg_ins_create.html('Error Creating User<i class="far fa-thumbs-down ml-1"></i>');
                    msg_ins_create.addClass('animated shake slower text-danger');
                    setTimeout(function(){
                        msg_ins_create.html("");
                    }, 5000);
                }
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Create");
                span.removeClass("animated flash infinite slow");
                msg_ins_create.html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                msg_ins_create.addClass('animated shake slower text-danger');
                setTimeout(function(){
                    msg_ins_create.html("");
                }, 5000);
            }
        });
    }
});


$(".btn_del_user").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let dataToDelete = $(this).data("us");
    let userName = btn.parent("td").siblings(".user_name").text().trim();
    
    if (confirm("Are you sure you want to delete " + userName) === true) {
        btn.prop("disabled", true);
        span.html("Deleting...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "id": dataToDelete
        };
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'admin/deleteuser',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                if (data.responsecode === "00") {
                    btn.parent("td").parent("tr").remove();
                }
                else {
                    alert("An unknown error occured!!!");
                    btn.prop("disabled", false);
                    span.html("Delete");
                    span.removeClass("animated flash infinite slow");
                }
            },
            error: function(err) {
                console.log(err);
                alert("Error occured!!!");
                btn.prop("disabled", false);
                span.html("Delete");
                span.removeClass("animated flash infinite slow");
            }
        });
    }
});

$(".btn_edit_user").click(function(){
    let btn = $(this);
    let hold_user_id = btn.data("us");
    $("#hold_user_id").val(hold_user_id);
    let userName = btn.parent("td").siblings(".user_name").text().trim();
    $("#enusername_edit").val(userName).trigger("change");
    $("#modalEditUser").find("h4").html("Update User - " + userName);
    $("#modalEditUser").modal("show").fadeIn(500);
});

$("#btn_update_user").click(function(){
    let btn = $(this);
    let span = btn.children("span");
    let id = $("#hold_user_id").val();
    let enuserName = $("#enusername_edit");
    let enPwd = $("#enpwd_edit");
    let confPwd = $("#confPwd_edit");
    let insCode = $("#ins_code_edit");
    let msg_user_update = $("#msg_user_update");
    msg_user_update.html("");
    msg_user_update.removeClass('animated wobble shake slower text-success text-danger');
    
    if (enuserName.val() === "") {
        showErrorBorderBottom(enuserName);
    }
    else if (!validateEmail(enuserName.val())){
        printErrorForm(enuserName, "Invalid Email Address");
    }
    else if (enPwd.val() === "") {
        showErrorBorderBottom(enPwd);
    }
    else if (confPwd.val() === "") {
        showErrorBorderBottom(confPwd);
    }
    else if (enPwd.val() !== confPwd.val()) {
        printErrorForm(confPwd, "Password mismatch");
    }
    else if (insCode.val() === "") {
        showErrorBorderBottom(insCode);
    }
    else {
        btn.prop("disabled", true);
        span.html("Uppdating...");
        span.addClass("animated flash infinite slow");
        let regData = {
            "institutionid": insCode.val(),
            "username": enuserName.val(),
            "password": enPwd.val(),
            "id": id
        };
        
        $.ajax({
            type: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            url: ip + 'admin/updateuser',
            data: JSON.stringify(regData),
            beforeSend: function() {
                //console.log("about to send");
            },
            success: function(data){
                console.log(data);
                btn.prop("disabled", false);
                span.html("Update");
                span.removeClass("animated flash infinite slow");
                if (data.responsecode === "00") {
                    msg_user_update.html('User Info Updated<i class="far fa-thumbs-up ml-1"></i>');
                    msg_user_update.addClass('animated wobble slower text-success');
                    enuserName.val(""); enPwd.val(""); confPwd.val("");
                    setTimeout(function(){
                        msg_user_update.html("");
                    }, 5000);
                }
                else {
                    msg_user_update.html('Error Updating User Info<i class="far fa-thumbs-down ml-1"></i>');
                    msg_user_update.addClass('animated shake slower text-danger');
                    setTimeout(function(){
                        msg_user_update.html("");
                    }, 5000);
                }
            },
            error: function(err) {
                console.log(err);
                btn.prop("disabled", false);
                span.html("Update");
                span.removeClass("animated flash infinite slow");
                msg_user_update.html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                msg_user_update.addClass('animated shake slower text-danger');
                setTimeout(function(){
                    msg_user_update.html("");
                }, 5000);
            }
        });
    }
    
});
