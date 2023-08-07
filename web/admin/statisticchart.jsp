<!DOCTYPE html>
<%-- 
    Document   : homeadmin.jsp
    Created on : May 22, 2023, 6:38:33 PM
    Author     : duykh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Admin</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
        -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Date', 'Money'],
            <c:forEach items="${requestScope.datachart}" var="dc">
                    ['<fmt:formatDate type="date" value="${dc.date}"/>',${dc.money}],

            </c:forEach>
                ]);
                var options = {
                    title: 'Sales Statistics',
<!--  curveType: 'function' -->
                    legend: {position: 'bottom'},
                     hAxis: {
          title: 'Time'
        },
        vAxis: {
          title: 'Total Money (VND)'
        },
        colors: ['#a52714', '#097138'],
        crosshair: {
          color: '#000',
          trigger: 'selection'
        }
            };

   var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

       chart.draw(data, options);
            }
        </script>
    </head>

    <body id="reportsPage">
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="homeadmin">
                        <h1 class="tm-site-title mb-0">Admin</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

           <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav mx-auto h-100">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <i class="fas fa-tachometer-alt"></i>
                                    Dashboard
                                    <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item dropdown">

           <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    <i class="far fa-file-alt"></i>
                                    <span>
                                        Reports <i class="fas fa-angle-down"></i>
                                    </span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Daily Report</a>
                                    <a class="dropdown-item" href="#">Weekly Report</a>
                                    <a class="dropdown-item" href="#">Yearly Report</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="listproduct">
                                    <i class="fas fa-shopping-cart"></i>
                                    Products
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                   aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-cog"></i>
                                    <span>
                                        Settings <i class="fas fa-angle-down"></i>
                                    </span>
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Profile</a>
                                    <a class="dropdown-item" href="#">Billing</a>
                                    <a class="dropdown-item" href="#">Customize</a>
                                </div>
                            </li>
                            <li class="nav-item">

           <c:if test="${sessionScope.employeeinfo==null}">
            <a class="nav-link" href="login">
                <i class="far fa-user"></i>
                Account
            </a>
        </c:if>
        <c:if test="${sessionScope.employeeinfo != null}">
            <a class="nav-link" href="infoadmin">
                <i class="far fa-user"></i>
                ${sessionScope.employeeinfo.username}
            </a>
        </c:if>


    </li>

</ul>
<ul class="navbar-nav">
    <li class="nav-item">
        <form class="nav-link d-block" action="infoadmin" method="post"> 
            <button type="submit" name="logout" value="out">Logout</button> 
        </form>
    </li>
</ul>
</div>
</div>

</nav>
<div id="curve_chart" style="width: 100%; height: 500px"></div>

<footer class="tm-footer row tm-mt-small">
</footer>
</div>

<script src="js/jquery-3.3.1.min.js"></script>
<!-- https://jquery.com/download/ -->
<script src="js/moment.min.js"></script>
<!-- https://momentjs.com/ -->
<script src="js/Chart.min.js"></script>
<!-- http://www.chartjs.org/docs/latest/ -->
<script src="js/bootstrap.min.js"></script>
<!-- https://getbootstrap.com/ -->
<script src="js/tooplate-scripts.js"></script>
<script>
            Chart.defaults.global.defaultFontColor = 'white';
            let ctxLine,
                    ctxBar,
                    ctxPie,
                    optionsLine,
                    optionsBar,
                    optionsPie,
                    configLine,
                    configBar,
                    configPie,
                    lineChart;
            barChart, pieChart;
            // DOM is ready
            $(function () {
                drawLineChart(); // Line Chart
                drawBarChart(); // Bar Chart
                drawPieChart(); // Pie Chart

                $(window).resize(function () {
                    updateLineChart();
                    updateBarChart();
                });
            })
            </script>
    </body>

</html>