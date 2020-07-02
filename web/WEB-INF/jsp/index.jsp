<%-- 
    Document   : inline
    Created on : Feb 26, 2020, 11:14:15 AM
    Author     : softmac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TAMS</title>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css">
        <!-- Bootstrap core CSS -->
        <link href="<spring:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <!-- Material Design Bootstrap -->
        <link href="<spring:url value="/resources/css/mdb.min.css"/>" rel="stylesheet">
        <!-- Your custom styles (optional) -->
        <link href="<spring:url value="/resources/css/style.css"/>" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/css/addons/datatables.min.css"/>">
        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
        
        <style>
            #tbl_merchants_length select {
                height: 35px !important;
            }
        </style>
    </head>
    <body style="">
        <!--Main Navigation-->
        <header>
            <%@include file = "./components/navbar.jsp" %>
            <%@include file = "./components/sidebar.jsp" %>
        </header>
        <main class="pt-5 pl-0" style="padding-left: 250px !important;">
            <div class="view">
                <img src="<spring:url value="/resources/img/bg-img.jpg"/>" class="img-fluid" alt="sample image">
                <div class="mask rgba-app-light py-2" id="page" style="overflow-y: scroll !important;">
                    
                </div>
            </div>
        </main>
                            
        <%@include file = "./components/modals.jsp" %>
        <!-- JQuery -->
        <script type="text/javascript" src="<spring:url value="/resources/js/jquery-3.4.1.min.js"/>"></script>
        <!-- Bootstrap tooltips -->
        <script type="text/javascript" src="<spring:url value="/resources/js/popper.min.js"/>"></script>
        <!-- Bootstrap core JavaScript -->
        <script type="text/javascript" src="<spring:url value="/resources/js/bootstrap.min.js"/>"></script>
        <!-- MDB core JavaScript -->
        <script type="text/javascript" src="<spring:url value="/resources/js/mdb.min.js"/>"></script>
        <!-- Initializations -->
        <script type="text/javascript" src="<spring:url value="/resources/js/script.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/js/addons/datatables.min.js"/>"></script>
        <script type="text/javascript" src="<spring:url value="/resources/js/modules/chart.js"/>"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.4.1/jspdf.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf-autotable/2.3.5/jspdf.plugin.autotable.min.js"></script>
        <script type="text/javascript" src="<spring:url value="/resources/js/tableHTMLExport.js"/>"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
        <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
        
        <script type="text/javascript">
            // Animations initialization
            new WOW().init();

        </script>
        
        <script type="text/javascript">
            $(document).ready(function(){
                
                let preloader = `<div class="text-center p-5"><i class="fa fa-spinner fa-spin text-app-main" aria-hidden="true" style="font-size:100px;"></i></div>`;
                let page = $("#page");
                $(".side-link").click(function(e){
                    e.preventDefault();
                    page.html(preloader);
                    $(this).parent("div").children("a").removeClass("active");
                    $(this).addClass("active");
                    let a = $(this).data("href");
                    let title = $(this).attr("title");
                    let url = "${pageContext.request.contextPath}/" + a;
                    //window.history.pushState("", "Settings Page", a);

                    let data = {

                    };

                    $.post(url, data, function(res){
                        $("#current_page").html(title.toUpperCase());
                        page.html(res);
                    });
                });
                
            });
        </script>
    </body>
</html>
