<%-- 
    Document   : modals
    Created on : Mar 20, 2020, 11:18:31 AM
    Author     : softmac
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
    <div class="modal fade" id="modalAddNewMerchant" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top: 100px !important;">
          <div class="modal-content">
            <div class="modal-header text-center">
              <h4 class="modal-title w-100 font-weight-bold">New Merchant</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body mx-3">
              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-barcode prefix text-app-main"></i>
                <input type="text" id="merchant_address" class="form-control">
                <label for="merchant_address">Merchant Name</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-signature prefix text-app-main"></i>
                <input type="text" id="merchant_category" class="form-control">
                <label for="merchant_category">Merchant Category</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-key prefix text-app-main"></i>
                <input type="text" id="merchant_key" class="form-control">
                <label for="merchant_key">Merchant Key</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fab fa-keycdn prefix text-app-main"></i>
                <input type="text" id="merchant_token" class="form-control">
                <label for="merchant_token">Merchant Token</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-money-bill-alt prefix text-app-main"></i>
                <input type="text" id="merchant_currency_code" class="form-control">
                <label for="merchant_currency_code">Currency Code</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-flag prefix text-app-main"></i>
                <input type="text" id="merchant_country_code" class="form-control">
                <label for="merchant_country_code">Country Code</label>
              </div>

              <div class="md-b-outline-app mb-4">
                <i class="fas fa-gopuram prefix text-app-main"></i>
                <label for="merchant_city">City</label>
                <select id="merchant_city" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                </select>
              </div>
              <div class="d-flex justify-content-end">
                  <span class="text-danger" id="msg_merchant_create"></span>
              </div>
            </div>
            <div class="modal-footer d-flex justify-content-end">
              <button class="btn btn-app-main" id="btn_create_merchant">
                  <span>Create</span>
              </button>
            </div>
          </div>
        </div>
    </div>
    <!-- Modal: full merchant details -->
    <div class="modal fade right" id="modalMerchantFull" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document" style="min-width: 1200px !important;">
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header bg-app">
                    <p class="heading lead">
                        Merchant: <span id="modal_merchant_id"></span>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">×</span>
                    </button>
                </div>
                <!--Body-->
                <div class="modal-body">
                    <div class="text-center">
                        <i class="fas fa-object-group text-app fa-4x mb-3 animated rotateIn"></i>
                        <p>
                            <strong style="text-decoration: underline;">Merchant Details</strong>
                        </p>
                        <p>
                            <span class="mr-2 pr-2 border-right"><small class="mr-2 text-app">Location: </small><strong id="m_location"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-2 text-app">Token </small><strong class="text-monospace" id="m_token"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-2 text-app">Key </small><strong class="text-monospace" id="m_key"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-2 text-app">Create On: </small><strong  id="m_creation_date"></strong></span>
                            <span><button class="btn btn-sm btn-danger" id="btn_request_merchant_delete"><span>Request Delete</span></button></span>
                        </p>

<!--                      <p>Have some ideas how to improve our product?
                <strong>Give us your feedback.</strong>
              </p>-->
            </div>

            <hr>

            <div id="">
                <p>
                    <strong style="text-decoration: underline;">Terminals</strong>
                </p>
                <table id="tbl_merchant_more" class="table table-hover table-sm">
                    <thead>
                        <tr>
                            <th class="text-center">S/N</th>
                            <th class="px-4">Terminal ID</th>
                            <th>Currency</th>
                            <th class="px-4">Country Code</th>
                            <th>Key</th>
                            <th>Token</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <div id="t_more_loader" class="text-center"></div>
            </div>
            
            <hr>
            
            <div id="mt-2">
                <p>
                    <strong style="text-decoration: underline;">Transactions</strong>
                </p>
                <table id="tbl_transactions" class="table table-hover table-sm">
                    <thead>
                        <tr>
                            <th class="text-center">S/N</th>
                            <th class="text-center">Status</th>
                            <th>MTI</th>
                            <th>Merchant Type</th>
                            <th>Amount</th>
                            <th>Processing Code</th>
                            <th>Currency</th>
                            <th>STAN</th>
                            <th>RRN</th>
                            <th>Card Acceptor Name/Location</th>
                            <th>Card Acceptor Terminal ID</th>
                            <th>Card Acceptor ID</th>
                            <th>POS.E.M</th>
                            <th>P.Acct.N</th>
                            <th>Transaction Date</th>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <div id="transactions_loader" class="text-center"></div>
            </div>
          </div>

          <!--Footer-->
          <div class="modal-footer justify-content-center">

          </div>
        </div>
      </div>
    </div>
    <!-- Modal: full merchant details -->
    
    <!-- Modal: full terminal details -->
    
    <div class="modal fade right" id="modalTerminalFull" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="false">
        <div class="modal-dialog modal-full-height modal-right modal-notify modal-info" role="document" style="min-width: 1200px !important;">
            <div class="modal-content">
                <!--Header-->
                <div class="modal-header bg-app">
                    <p class="heading lead">
                        Terminal: <span id="modal_terminal_id"></span>
                    </p>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true" class="white-text">×</span>
                    </button>
                </div>
                <!--Body-->
                <div class="modal-body">
                    <div id="tttt_more_loader" class="text-center"></div>
                    <div class="text-center" id="terminal_more_info_div">
                        <span id="up_terminal_msg" style="position: absolute; right: 50px; top: 60px;"></span>
                        <i class="fas fa-stream text-app fa-4x mb-3 animated rotateIn"></i>
                        <p>
                            <strong style="text-decoration: underline;">Terminal Details</strong>
                            <span style="position: absolute; right: 20px;">
                                <button class="btn btn-sm btn-purple btn_update_terminal_info" id="btn_edit_terminal_1"><span>Edit Terminal</span></button>
                                <button class="btn btn-sm btn-success btn_update_terminal_info" id="btn_edit_terminal_2" style="display: none;"><span>Update Info</span></button>
                                <button class="btn btn-sm btn-danger" id="btn_request_terminal_delete"><span>Request Delete</span></button>
                                <strong id="mm_creation_date"></strong>
                            </span>
                        </p>
                        <div class="row mt-1 mb-3">
                            <div class="col-md-4">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Merchant: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_id" disabled style="background: #fff !important;" />
                                    </li>
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Merchant Category: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_cat" disabled style="background: #fff !important;" />
                                    </li>
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Location: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_location" disabled style="background: #fff !important;" />
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Currency Code: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_c_code" disabled style="background: #fff !important;" />
                                    </li>
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Country Code: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_country_code" disabled style="background: #fff !important;" />
                                    </li>
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Token: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_token" disabled style="background: #fff !important;" />
                                    </li>
                                </ul>
                            </div>
                            <div class="col-md-4">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Key: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_key" disabled style="background: #fff !important;" />
                                    </li>
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Working Check Value: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_wcv" disabled style="background: #fff !important;" />
                                    </li>
                                    <li class="list-group-item text-left" style="border: none !important;">
                                        <small class="mr-1 text-app">Session Master Check Value: </small>
                                        <br/>
                                        <input class="form-control in_te border-0 rounded-0" id="mm_smcv" disabled style="background: #fff !important;" />
                                    </li>
                                </ul>
                            </div>
                        </div>
<!--                        <p class="mt-1 d-block">
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Merchant: </small><strong id="mm_id"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Merchant Category: </small><strong id="mm_cat"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Location: </small><strong id="mm_location"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Currency Code: </small><strong id="mm_c_code"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Session Master Check Value: </small><strong class="text-monospace" id="mm_smcv"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Working Check Value: </small><strong class="text-monospace" id="mm_wcv"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Token: </small><strong class="text-monospace" id="mm_token"></strong></span>
                            <span class="mr-2 pr-2 border-right"><small class="mr-1 text-app">Key: </small><strong class="text-monospace" id="mm_key"></strong></span>
                            <span class=""><small class="mr-1 text-app">Create On: </small><strong  id="mm_creation_date"></strong></span>
                        </p>-->

<!--                      <p>Have some ideas how to improve our product?
                <strong>Give us your feedback.</strong>
              </p>-->
            </div>

            <hr>

            <div id="" class="mt-4">
                <p>
                    <strong style="text-decoration: underline;">Transactions</strong>
                </p>
                <table id="" class="table table-hover table-sm tbl_terminal_more">
                    <thead>
                        <tr>
                            <tr>
                                <th class="text-center">S/N</th>
                                <th class="text-center">Status</th>
                                <th>MTI</th>
                                <th>Terminal</th>
                                <th>Amount</th>
                                <th>Processing Code</th>
                                <th>Currency</th>
                                <th>STAN</th>
                                <th>RRN</th>
                                <th>Card Acceptor Name/Location</th>
                                <th>Card Acceptor Terminal ID</th>
                                <th>Card Acceptor ID</th>
                                <th>POS.E.M</th>
                                <th>P.Acct.N</th>
                                <th>Transaction Date</th>
                            </tr>
                        </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <div id="tt_more_loader" class="text-center"></div>
            </div>

          </div>

          <!--Footer-->
          <div class="modal-footer justify-content-center">

          </div>
        </div>
      </div>
    </div>
    <!-- Modal: full terminal details -->
    
    
    <!--- Modal: Add Teminal -->
    <div class="modal fade" id="modalAddNewTerminal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top: 100px !important;">
          <div class="modal-content">
            <div class="modal-header text-center">
              <h4 class="modal-title w-100 font-weight-bold">New Terminal</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body mx-3">
              <div class="md-b-outline-app mb-4">
                <i class="fas fa-signature prefix text-app-main"></i>
                <label for="terminal_merchant">Merchant</label>
                <select id="terminal_merchant" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                    <c:forEach var="i" begin="0" end="${listOfMerchants.length() - 1}">
                        <option value="${listOfMerchants.getJSONObject(i).getString("merchantid")}">${listOfMerchants.getJSONObject(i).getString("merchant_location_name_address")} - ${listOfMerchants.getJSONObject(i).getString("merchantid")}</option>
                    </c:forEach>
                </select>
              </div>
                
<!--              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-door-open prefix text-app-main"></i>
                <input type="text" id="terminal_port" class="form-control">
                <label for="terminal_port">Port No</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-key prefix text-app-main"></i>
                <input type="text" id="session_master_key" class="form-control">
                <label for="session_master_key">Session Master Key</label>
              </div>
                
              <div class="md-form md-b-outline-app mb-4">
                <i class="fab fa-mastodon prefix text-app-main"></i>
                <input type="text" id="session_master_check_value" class="form-control">
                <label for="session_master_check_value">Session Master Check Value</label>
              </div>
              
              <div class="md-form md-b-outline-app mb-4">
                <i class="fab fa-keycdn prefix text-app-main"></i>
                <input type="text" id="session_two_key" class="form-control">
                <label for="session_two_key">Session Two Key</label>
              </div>
              
              <div class="md-b-outline-app mb-4">
                <i class="fas fa-route prefix text-app-main"></i>
                <label for="route_mode">Route Mode</label>
                <select id="route_mode" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                    <option value="mode">Mode</option>
                </select>
              </div>
               
              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-id-badge prefix text-app-main"></i>
                <input type="text" id="a_ins_id" class="form-control">
                <label for="a_ins_id">Acquiring Institution ID</label>
              </div>
                
              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-barcode prefix text-app-main"></i>
                <input type="text" id="cbn_code" class="form-control">
                <label for="cbn_code">Central Bank Code</label>
              </div>
                
              <div class="md-b-outline-app mb-4">
                <i class="fas fa-sitemap prefix text-app-main"></i>
                <label for="terminal_type">Terminal Type</label>
                <select id="terminal_type" class="custom-select rounded-0" style="border-top: 0px !important; border-right: 0px !important; border-left: 0px !important;">
                    <option value="type_1">Type 1</option>
                </select>
              </div>-->
                
              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-stopwatch prefix text-app-main"></i>
                <input type="number" id="terminal_time_out" class="form-control">
                <label for="terminal_time_out">Terminal Timeout (In Seconds)<small class="ml-1 text-danger"></small></label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-igloo prefix text-app-main"></i>
                <input type="text" id="terminal_call_home" class="form-control">
                <label for="terminal_call_home">Call Home</label>
              </div>

              <div class="d-flex justify-content-end">
                  <span class="text-danger" id="msg_terminal_create"></span>
              </div>
            </div>
            <div class="modal-footer d-flex justify-content-end">
              <button class="btn btn-app-main" id="btn_create_terminal">
                  <span>Create</span>
              </button>
            </div>
          </div>
        </div>
    </div>
    
    <!--Modal: Add Teminal End -->
    
    <!--Modal: confirmterminaldisable-->
    <div class="modal fade" id="confirmTerminalDisable" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
      aria-hidden="true">
      <div class="modal-dialog modal-notify modal-danger" role="document">
        <!--Content-->
        <div class="modal-content text-center">
          <!--Header-->
          <div class="modal-header d-flex justify-content-center">
            <p class="heading">Please confirm!</p>
          </div>

          <!--Body-->
          <div class="modal-body">

            <i class="fas fa-times fa-4x animated rotateIn" id="sppp"></i>
            <p id="confirmTerminalDisable_P" class="text-app"></p>
            <input id="t_id_disable" hidden />
          </div>

          <!--Footer-->
          <div class="modal-footer flex-center">
            <a type="button" id="dismissThis" class="btn btn-outline-danger waves-effect" data-dismiss="modal">Close</a>
            <a type="button" id="proceedToDisableTerminal" class="btn btn-danger"><span>Yes</span></a>
          </div>
        </div>
        <!--/.Content-->
      </div>
    </div>
    <!--Modal: confirmterminaldisable-->
    
    <div class="modal fade" id="modalTerminalGlobal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document" style="margin-top: 100px !important;">
          <div class="modal-content">
            <div class="modal-header text-center">
              <h4 class="modal-title w-100 font-weight-bold">Edit Teminal Global Variables</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body mx-3">
              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-barcode prefix text-app-main"></i>
                <input type="text" id="update_terminal_id" class="form-control tle" style="background: #fff;" disabled>
                <label for="update_terminal_id">Terminal Id</label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-stopwatch prefix text-app-main"></i>
                <input type="number" id="update_terminal_time_out" class="form-control tle">
                <label for="update_terminal_time_out">Terminal Timeout (In Seconds)<small class="ml-1 text-danger"></small></label>
              </div>

              <div class="md-form md-b-outline-app mb-4">
                <i class="fas fa-igloo prefix text-app-main"></i>
                <input type="text" id="update_terminal_call_home" class="form-control tle">
                <label for="update_terminal_call_home">Call Home</label>
              </div>

              <div class="d-flex justify-content-end">
                  <span class="text-danger" id="msg_terminal_update_global"></span>
              </div>
            </div>
            <div class="modal-footer d-flex justify-content-end">
              <button class="btn btn-app-main" id="btn_update_terminal_global">
                  <span>Update</span>
              </button>
            </div>
          </div>
        </div>
    </div>
</div>