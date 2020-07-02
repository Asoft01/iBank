<%-- 
    Document   : profile
    Created on : Jun 22, 2020, 4:55:09 PM
    Author     : Habeeb O. Lawal
--%>

<div class="container">
    <div id="" class="" style="padding-top: 30px;">
        <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
            <div class="card mx-1 warning-color white-text px-2">
                <div class="d-flex align-items-center"><h5 class="bg">Profile</h5>

                </div> 
            </div> 
            <div class="card-body ml-2 border col-6">
                <input type="hidden" id="username" name="username" value="${username}" class="form-control">
                <input class="mb-2 form-control" value="${firstname} ${lastname}" disabled>
                <input class="mb-2 form-control" value="${companyName}" disabled>
                <button class="btn orange darken-4 mx-0 text-white btn-sm" id="changePasswordDivtoggle">Change Password</button>
                <div class="changePassword border mb-1">
                    <div class="md-form mx-2">
                        <input type="text" id="c_password" name="c_password" class="form-control">
                        <label for="c_password">Current Password</label>
                    </div>
                    <span id="c_password_error"></span>
                    <div class="md-form mx-2">
                        <input type="text" id="n_password" name="n_password" class="form-control">
                        <label for="n_password">New Password</label>
                    </div>
                    <div class="md-form mx-2">
                        <input type="text" id="c_n_password" name="c_n_password" class="form-control">
                        <label for="c_n_password">Confirm New Password</label>
                    </div>
                    <span id="c_n_password_error"></span>
                    <div class="ml-2">
                        <button class="btn btn-sm btn-success ml-auto" id="change_password_btn">Save</button>
                    </div>
                    <div class="change_password_success"></div>
                </div>
                <!--<button class="btn orange darken-4 mx-0 text-white btn-sm" id="changeSubscriptionDivtoggle">Change Subscription Package</button>-->
            </div>
        </div>
    </div>
</div>
<script>

    $(".changePassword").hide();
    $("#changePasswordDivtoggle").click(function() {
       $(".changePassword").slideToggle("slow"); 
    });

    $("#change_password_btn").click(function(e) {
        e.preventDefault();
        let url = "${pageContext.request.contextPath}/changepassword";
        let errorcheck = validatePasswordField();
        if(!(errorcheck.includes("error"))) {
            $("#change_password_btn").attr("disabled", true);
            let spinner = `<i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:20px;"></i>`;
            $("#change_password_btn").html(spinner);
            let username = $("#username").val();
            let currentPassword = $("#c_password").val();
            let newPassword = $("#n_password").val();
            let credentials = {
                "username":username,
                "oldpassword":currentPassword,
                "newpassword":newPassword
            };
            
            $.ajax({
                method: "POST",
                url: url,
                data: credentials,
                beforeSend: function (xhr) {
                        console.log(credentials);
                },
                success: function(response){
                    if(response === "00"){
                        $("#change_password_btn").html("Chane Password");
                        $(".change_password_success").html("Password changed successfully").addClass("alert alert-succes");
                        //document.getElementById("createUserForm").reset();
                        setTimeout(function() {
                            $(".changePassword").slideUp('slow');
                            $("#change_password_btn").html("Change Password");
                            $(".change_password_success").html("");
                            $(".change_password_btn").attr("disabled", false);
                        }, 3000);   
                    }
                    else{
                        $("#change_password_btn").attr("disabled", false);
                        $("#change_password_btn").html("Chane Password");
                        $(".change_password_success").html("Error: Couldn't Change Password"); 
                    }
                }
            });
        }
    });
    function validatePasswordField(){
        let error = [];
        let currentPassword = $("#c_password").val();
        let newPassword = $("#n_password").val();
        let confirmPassword = $("#c_n_password").val();

        if((currentPassword === "" || currentPassword === undefined) && (newPassword === "" || newPassword === undefined)&& (confirmPassword === "" || confirmPassword === undefined)) {
            error.push("error");
            $("#c_password_error").html("Field cannot be empty").addClass("bg-danger");
            $("#n_password_error").html("Field cannot be empty").addClass("bg-danger");
            $("#c_n_password_error").html("Field cannot be empty").addClass("bg-danger");
        }
        else if(currentPassword === "" || currentPassword === undefined) {
            error.push("error");
            $("#c_password_error").html("Field cannot be empty").addClass("bg-danger");
            $("#n_password_error").html("");
            $("#c_n_password_error").html("");
        }
        else if(newPassword === "" || newPassword === undefined) {
            error.push("error");
            $("#n_password_error").html("Field cannot be empty").addClass("bg-danger");
            $("#c_password_error").html("");
            $("#c_n_password_error").html("");
        }
        else if(newPassword !== confirmPassword) {
            error.push("error");
            $("#n_password_error").html("Password does not match").addClass("bg-danger");
            $("#c_password_error").html("");
            $("#c_n_password_error").html("Password does not match").addClass("bg-danger");
        }
        return error;
    }
</script>
