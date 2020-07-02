<%-- 
    Document   : billspayment
    Created on : Jun 25, 2020, 10:51:11 AM
    Author     : Habeeb O. Lawal
--%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="container">
    <div style="padding-top: 30px;">
    <div class="card mx-3 px-3 py-2 mt-5" style="top: -48px;">
        <div class="card mx-1 warning-color white-text px-2">
                    <div class="d-flex align-items-center"><h5 class="bg">Bills Payment</h5>
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
            <div class="mt-3 row mx-2">
                <c:forEach var="i" begin="0" end="${billersLength -1}">
                <div class="card col-3 mx-2 mb-2">
                    <img src="http://68.169.57.98:80/img/${billers.getJSONObject(i).getString("imagepath")}">
                    <h3>${billers.getJSONObject(i).getString("biller_name")}</h3>
                </div>
                </c:forEach>
            </div>
    </div>
    </div>
</div>
