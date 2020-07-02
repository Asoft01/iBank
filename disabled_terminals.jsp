<%-- 
    Document   : merchantsview
    Created on : Mar 18, 2020, 3:47:29 PM
    Author     : softmac
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div id="disabledterminalsview">
<!--    <div class="mb-2 wow fadeIn mx-3">
        <form class="form-inline d-flex">
            <div class="md-form md-b-outline-app mr-0" style="flex-grow: 1">
                <input type="text" id="inputpaycode" class="form-control w-100 text-white">
                <label for="inputpaycode" class="text-white">Enter Pay Code</label>
            </div>
            <button class="btn btn-app-main btn-sm border-r-t-b ml-0" type="button" style="width: 200px;" data-toggle="modal" data-target="#gtbswitchmodal">
                Confirm
            </button>
        </form>
    </div>-->

    <div class="card mx-3 px-3 py-2 mt-5" style="margin-right: 10px;">
        <div class="card mx-1 px-2">
            <div class="d-flex justify-content-between align-middle">
                <div class="mr-auto" id="transaction_days_sort">
<!--                                    <button class="btn btn-sm btn-flat px-0">Today</button>
                    <button class="btn btn-sm btn-flat active px-0">Last 7 Days</button>
                     <button class="btn btn-sm btn-flat px-0">Last 30 Days</button>
                    <button class="btn btn-sm btn-flat px-0" id="btn_filter_tnx_date_range"></button>
                    <input style="display: none;" id="filter_tnx_date_range" type="text" name="daterange" value="01/01/2018 - 01/15/2018" /> 
                    <button id="btn_more_filter_tnx_date_range" class="btn btn-sm btn-flat px-0"><span>More Filter</span><i class="fas fa-caret-down ml-1"></i></button>-->
                </div>
                <div>
                    <button class="btn btn-sm btn-indigo" id="btn_add_new_terminal" type="button" data-toggle="modal" data-target="#modalAddNewTerminal">Add Terminal</button>
                    <button class="btn btn-sm btn-app-main" type="button" id="btn_export_csv" data-filename="merchants_csv">Export CSV</button>
                    <span class="add-cursor icon_export_range"><i class="fas fa-ellipsis-v text-black-50"></i></span>
                </div>
            </div>
        </div>
        <div class="mt-4 d-flex justify-content-between">
            <div class="d-flex">
                <span>Total Disabled Terminals</span>
                <h3 class="font-weight-light ml-2" id="cdt">
                    ${totalDisabledTerminal}
                </h3>
            </div>
            <div class="d-flex">
                <select id="terminal_id_to_disable" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                    <c:choose>
                        <c:when test="${listOfTerminal.length() > 0}">
                            <c:forEach var="i" begin="0" end="${listOfTerminal.length() - 1}">
                                <option value="${listOfTerminal.getJSONObject(i).getString("terminalid")}">${listOfTerminal.getJSONObject(i).getString("terminalid")}</option>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </select>
                <button class="btn btn-sm btn-danger" id="btn_disable_terminal" data-toggle="modal" data-target="#confirmTerminalDisable">Disable</button>
            </div>
        </div>
        <div class="mt-3">
            <table id="" class="table table-hover table-sm tbl_terminals tbl_merchants_download">
                <thead>
                    <tr>
                        <th class="text-center">S/N</th>
                        <th>Terminal ID</th>
                        <th>Local Port</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${disabledTerminal.length() > 0}">
                            <c:forEach var="i" begin="0" end="${disabledTerminal.length() - 1}">
                                <tr class="add-cursor view-single-terminal hoveR py-3">
                                    <td class="text-center">${i + 1}</td>
                                    <td class="t_id">${disabledTerminal.getJSONObject(i).getString("terminal_id")}</td>
                                    <td class="port_id">${disabledTerminal.getJSONObject(i).getString("local_port")}</td>
                                    <td>
                                        <button class="btn btn-sm btn-app-main ml-5 btn_enable_terminal my-0" data-id="${disabledTerminal.getJSONObject(i).getString("terminal_id")}" data-port="${disabledTerminal.getJSONObject(i).getString("local_port")}"><span>Enable</span></button>                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:when>
                    </c:choose>
                </tbody>
            </table>
        </div>
    </div>
    
     
    <script type="text/javascript">
        $(document).ready(function(){
            
            $("#modalTerminalFull").on('hidden.bs.modal', function(){
                $('.tbl_terminal_more').DataTable().destroy();
                $(".tbl_terminal_more tbody").html("");
            });

            let preloader = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`;
                
            $("#btn_disable_terminal").click(function(){
                let terminalid = $("#terminal_id_to_disable").val();
                $("#confirmTerminalDisable_P").html("Are you sure you want to disable terminal - " + terminalid);
                $("#t_id_disable").val(terminalid);
            });
            
            $("#proceedToDisableTerminal").click(function(){
                let btn = $(this);
                let span = btn.children("span");
                let dismissThis = $("#dismissThis");
                dismissThis.prop("disabled", true);
                btn.prop("disabled", true);
                span.html("Please wait...");
                span.addClass("animated flash infinite slow");
                let disbableId = $("#t_id_disable").val();
                let data = {
                    "terminalid": disbableId
                };
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: ip + 'disableterminal',
                    data: JSON.stringify(data),
                    beforeSend: function() {
                        //console.log("about to send");
                    },
                    success: function(data){
                        btn.prop("disabled", false);
                        dismissThis.prop("disabled", false);
                        span.html("Yes");
                        span.removeClass("animated flash infinite slow");
                        if (data.responsecode === "00") {
                            dismissThis.click();
                            $("#t_id_disable").val("");
                            setTimeout(function(){
                                $('.tbl_terminals').DataTable().destroy();
                                $("#link_disabled_terminals").click();
                            }, 1000);
                        }
                        else {
                            $("#confirmTerminalDisable_P").html('Error Disabling Terminal<i class="far fa-thumbs-down ml-1"></i>');
                        }
                        setTimeout(function(){
                            $("#confirmTerminalDisable_P").html("");
                        }, 5000);
                    },
                    error: function(err) {
                        console.log(err);
                        btn.prop("disabled", false);
                        dismissThis.prop("disabled", false);
                        span.html("Yes");
                        span.removeClass("animated flash infinite slow");
                        $("#confirmTerminalDisable_P").html('Request could not be handled<i class="far fa-thumbs-down ml-1"></i>');
                        setTimeout(function(){
                            $("#confirmTerminalDisable_P").html("");
                        }, 5000);
                    }
                });
            });
            
            $("#btn_export_csv").click(function(){
                let fileName = $(this).data("filename") + '.csv';
                let table = $(".tbl_merchants_download");
                exPortToFile(table, fileName, 'csv');
            });
            
            for (let i = 0; i < ghanaCities.length; i++) {
                $("#merchant_city").append('<option value="' + ghanaCities[i].id + '">' + ghanaCities[i].name + '</option>');
            }
                        
//            $(".hoveR").hover(function(){
//                $(".btn_enable_terminal").removeClass("d-none");
//            }, function(){
//                $(".btn_enable_terminal").addClass("d-none");
//            });
            
            $(".btn_enable_terminal").click(function(e){
                e.preventDefault();
                let btn = $(this);
                let span = btn.children("span");
                btn.prop("disabled", true);
                span.html("Please wait...");
                span.addClass("animated flash infinite slow");
                let tid = btn.data("id");
//                let portid = btn.data("port");
                let data = {
                    "terminalid": tid.toString(),
                    "local_port": "9702"
                };
                
                $.ajax({
                    type: 'POST',
                    dataType: 'json',
                    contentType: 'application/json',
                    url: '${pageContext.request.contextPath}/enableterminal',
                    data: JSON.stringify(data),
                    beforeSend: function() {
                        //console.log("about to send");
                    },
                    success: function(data){
                        btn.prop("disabled", false);
                        span.html("Enable");
                        span.removeClass("animated flash infinite slow");
                        if (data.responsecode === "00") {
                            btn.parent("td").parent("tr").remove();
                            let cdt = parseInt($("#cdt").html());
                            cdt = cdt - 1;
                            $("#cdt").html(cdt);
                        }
                    },
                    error: function(err) {
                        console.log(err);
                    }
                });
            });
            
//            $(".view-single-terminal").click(function(){
//                let row = $(this);
//                let selectedTID = row.children(".t_id").text().trim();
//                let tbl_merchant_more_body = $("#tbl_terminal_more tbody");
//                let data = {
//                    "terminalid": selectedTID
//                };
//                $.ajax({
//                    type: 'POST',
//                    dataType: 'json',
//                    contentType: 'application/json',
//                    url: '${pageContext.request.contextPath}/terminalmoredetail',
//                    data: JSON.stringify(data),
//                    beforeSend: function() {
//                        //console.log("about to send");
//                    },
//                    success: function(data){
//                        $("#tt_more_loader").html("");
//                        console.log(data);
//                        $("#mm_id").html(data.detials.merchant_id);
//                        $("#mm_location").html(data.detials.merchant_location_name_address.trim());
//                        $("#mm_cat").html(data.detials.merchant_category);
//                        $("#mm_c_code").html(data.detials.currency_code);
//                        $("#mm_creation_date").html(row.children('.m_creation_date').text());
//                        $("#mm_smcv").html(data.detials.session_master_check_value);
//                        $("#mm_wcv").html(data.detials.working_key_check_value);
//                        $("#mm_token").html(data.detials.token);
//                        $("#mm_key").html(data.detials.key);
//                        $("#tt_more_loader").html(preloader);
//                        for (let i = 0; i < data.transactions.length; i++) {
//                            let tr = '<tr>';
//                            tr = tr + ('<td>' + (i + 1) + '</td>');
//                            tr = tr + ('<td class="px-4">' + data[i].terminalid + '</td>');
//                            tr = tr + ('<td>' + data[i].currency + '</td>');
//                            tr = tr + ('<td class="px-4">' + data[i].country + '</td>');
//                            tr = tr + ('<td>' + data[i].key + '</td>');
//                            tr = tr + ('<td>' + data[i].token + '</td>');
//                            tr = tr + ('</tr>');
//                            tbl_merchant_more_body.append(tr);
//
//                        }
//                        $('.tbl_terminal_more').DataTable({
//        //                    "aaSorting": [],
//        //                    columnDefs: [{
//        //                        orderable: false,
//        //                        targets: 0
//        //                    }]
//                        });
//                        $(".dataTables_filter input").focusin(function(){
//                            $(this).addClass("border-app-bottom");
//                        });
//
//                        $(".dataTables_filter input").focusout(function(){
//                            $(this).removeClass("border-app-bottom");
//                        });
//
//                        $(".dataTables_length select").focusin(function(){
//                            $(this).addClass("border-app");
//                        });
//
//                        $(".dataTables_length select").focusout(function(){
//                            $(this).removeClass("border-app");
//                        });
//                    },
//                    error: function(err) {
//                        console.log(err);
//                    }
//                });
//
//                $("#modal_terminal_id").html("Terminal: " + selectedTID);
//                $("#modalTerminalFull").modal({
//                });
//            });

            $('.tbl_terminals').DataTable({
                "aaSorting": [],
                columnDefs: [{
                    orderable: false,
                    targets: 3
                }]
            });
            $('.dataTables_length').addClass('bs-select');

            $(".dataTables_filter input").attr("placeholder", "Search by terminal id");
            $(".dataTables_filter input").css({"width": "300px"});
            $(".tbl_merchants .dataTables_empty").html("No terminal has been disabled");
            $(".dataTables_filter input").focusin(function(){
                $(this).addClass("border-app-bottom");
            });

            $(".dataTables_filter input").focusout(function(){
                $(this).removeClass("border-app-bottom");
            });

            $(".dataTables_length select").focusin(function(){
                $(this).addClass("border-app");
            });

            $(".dataTables_length select").focusout(function(){
                $(this).removeClass("border-app");
            });
            // $("#btn_filter_tnx_date_range").html($("#filter_tnx_date_range").val());

            // $('input[name="daterange"]').daterangepicker({
     //    	opens: 'center'
     //  	}, function(start, end, label) {
     //    	console.log("A new date selection was made: " + start.format('DD-MM-YYYY') + ' to ' + end.format('DD-MM-YYYY'));
     //  	});

     //  	$("#btn_filter_tnx_date_range").click(function(){
     //  		$("#filter_tnx_date_range").click();
     //  	});

            let start = moment().subtract(7, 'days');
            let end = moment();
            function cb(start, end) {
                $('#btn_more_filter_tnx_date_range span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }

            $('.icon_export_range').daterangepicker({
                opens: 'right',
                startDate: start,
                endDate: end,
                ranges: {
//                   'Today': [moment(), moment()],
//                   'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                   'Last 7 Days': [moment().subtract(6, 'days'), moment()],
                   'Last 30 Days': [moment().subtract(29, 'days'), moment()],
                   'This Month': [moment().startOf('month'), moment().endOf('month')],
                   'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                }
            }, cb);
            cb(start, end);
            
            $(".daterangepicker").find(".applyBtn").html("Export");
            $(".daterangepicker").find(".cancelBtn").prop("hidden", true);
        });
    </script>
</div>