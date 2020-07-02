<%-- 
    Document   : sidebar
    Created on : Feb 26, 2020, 3:48:11 PM
    Author     : softmac
--%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!-- Sidebar -->
<div class="sidebar-fixed position-fixed">
    <div style="height: 100%; overflow-y: hidden;" class="pb-3">
        <a class="logo-wrapper waves-effect">
            <img src="<spring:url value="/resources/mdb/img/logo.png"/>" class="img-fluid" alt="Logo">
        </a>
        <div class="card bg-app-main mb-4">
            <div class="card-body">
                <h6 class="card-title mb-0">
                    <a style="flex-grow: 1" class="text-white d-flex justify-content-between" data-toggle="collapse" href="#collapseSM" aria-expanded="false" aria-controls="collapseExample">
                        <span class=''>
                            <span>ID: 001</span>
                        </span>
                        <span class="fas fa-angle-down"></span>
                    </a>
                </h6>
                <div class="collapse" id="collapseSM">
                    <div class="mt-1">
    <!--                    <a class="dropdown-item text-white" href="#">Action</a>-->
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item text-white" href="${pageContext.request.contextPath}/logout">Logout<i class="fas fa-sign-out-alt ml-2"></i></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="list-group list-group-flush">
            <a href="" class="active list-group-item list-group-item-action text-white"><i class="far fa-address-card"></i>&nbsp;${userpages.getJSONObject(0).getString("label")}</a>
                        <c:forEach begin="1" end="${userpagesLen - 1}" var="i">
                           <a href="" data-href="${userpages.getJSONObject(i).getString("urlmapping")}" class="list-group-item list-group-item-action side-link text-white">${userpages.getJSONObject(i).getString("labelicon")}&nbsp;${userpages.getJSONObject(i).getString("label")}</a>
                        </c:forEach>
<!--                        <a href="" data-href="test" class="list-group-item list-group-item-action side-link text-white"><i class="far fa-address-card"></i>&nbsp;Terminals</a>
                        <a href="directcredit.html" class="list-group-item list-group-item-action text-white"><i class="far fa-credit-card"></i>&nbsp;Direct Credit</a>
                        <a href="directdebit.html" class="list-group-item list-group-item-action text-white"><i class="far fa-credit-card"></i>&nbsp;Direct Debit</a>
                        <a href="" data-href="users" class="list-group-item list-group-item-action side-link text-white"><i class="fas fa-user"></i>&nbsp;User Management</a>
                        <a href="balanceenquiry.html" class="list-group-item list-group-item-action text-white"><i class="fas fa-book-open"></i>&nbsp;Balance Enquiry</a>-->
                        <a href="${contextRoot}/logout" class="list-group-item list-group-item-action text-white"><i class="fas fa-sign-out-alt"></i>&nbsp;LogOut</a>
        </div>
    </div>
    <div class="">
        <span class="text-white font-weight-lighter">Supersoft.com.ng 2020</span>
    </div>
</div>
<!-- Sidebar -->