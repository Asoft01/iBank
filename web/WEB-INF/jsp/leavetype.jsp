<%-- 
    Document   : fundtransfer
    Created on : Jun 17, 2020, 2:33:46 PM
    Author     : Habeeb O. Lawal
--%>
<%-- 
    Document   : airtimeanddata
    Created on : Jun 16, 2020, 9:50:42 AM
    Author     : Habeeb O. Lawal
--%>

<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
    .effect{
        margin-left : -500px;
        /*        background-color: #808080;*/
    }
</style>



<div class="container effect" style="width: 600px;">
    <div class="row">
        <div id="" class="col-md-12 effect tablediv" style="padding-top: 30px;">


            <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
                <div class="card mx-1 warning-color white-text px-2">
                    <div class="d-flex align-items-center"><h5 class="bg">Leave Types</h5>
                          <!--<h1>${companyCode}</h1>-->

                        <div class="d-flex align-items-center">

                            <div id="table_export_btns" hidden></div>
                            <div class="dropdown" style="left: 640px; ">
                            </div>
                        </div>
                    </div>
                    <div>
                        <input id="lowerDate" hidden /><input id="upperDate" hidden />
                    </div>
                </div>

                <div class="mt-3">
                    <table id="" class="table table-hover table-sm tbl_leave_type tbl_leave_type_download">
                        <thead style="background-color: #F05E23; color: white;">
                            <tr>
                                <th class="text-center">S/N</th>
                                <th>Leave Type</th>
                                <th class="d-none">Id</th>
                               
                            </tr>
                        </thead>
                        <tbody>
                        <c:choose>
                            <c:when test="${leavetype.length() > 0}">
                                <c:forEach var="i" begin="0" end="${leavetype.length() - 1}">
                                    <tr class="add-cursor view-single-merchant tr_${i}" id="">
                                        <td class="text-center">${i + 1}</td>
                                        <td class="m_id">${leavetype.getJSONObject(i).getString("numberofDays")} days</td>
                                        <td class="d-none">${leavetype.getJSONObject(i).getString("id")} </td>

                                    </tr>
                                </c:forEach>
                            </c:when>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </div>
</div>



<script>
    $(document).ready(function () {
        $('.effect').animate({'margin-left': '50px'}, 1000, 'linear');
    });
//          $('.select-employee').on('change', function() {
//            alert( this.value );
//          });

    $('.tbl_leave_type').DataTable({
        "ordering": false,
        lengthMenu: [[5, 20, 50, -1], ['5 Records', '20 Records', '50 Records', 'ALL']],
        pageLength: 10,
        "language": {
            "search": "_INPUT_", // Removes the 'Search' field label
            "searchPlaceholder": "Search"   // Placeholder for the search box
        },
        dom: '<"pime-grid-filter"><"pime-grid-button"l>frtip'
    });
//    $("div.pime-grid-filter").html('<div class="d-flex mr-4"><button class="btn bg orange darken-4 btn-sm mr-auto text-white" data-toggle="modal" data-toggle="modal" data-target="#requestLeave" id="submitRequest" type="button"> <div id="spinner"></div> Request Leave </button><p class="ml-3 mr-1">Total Records:' + "${totalClient}" + '</p> </div>');

    function reloadPage(pagemapping) {
        let urlU = "${pageContext.request.contextPath}/" + pagemapping;
        $.post(urlU, function (res) {
            $(".page").html(res);
        });
    }
</script>


