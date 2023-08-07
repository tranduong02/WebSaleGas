<%-- 
    Document   : statisticchart
    Created on : Jun 16, 2023, 8:41:03 PM
    Author     : duykh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/cssdashboard/customer.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <!-- Custom CSS -->
        <link href="css/cssdashboard/style.min.css" rel="stylesheet">

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                ['Date', 'Money'],
            <c:if test="${requestScope.datachartfilter == null}">
                <c:forEach items="${requestScope.datachart}" var="dc">
                ['${dc.date}',${dc.money}],
                </c:forEach></c:if>
            <c:if test="${requestScope.datachartfilter != null}">
                <c:forEach items="${requestScope.datachartfilter}" var="dcf">
                //hien theo ngay/thang/nam
                    <c:if test="${requestScope.sendformatshow eq 'ngay'}">
                        <c:set var="formattedDate">
                            <fmt:formatDate value="${dcf.date}" pattern="dd/MM/yyyy" />
                        </c:set>
                    </c:if>
                //hien theo thang/nam
                    <c:if test="${requestScope.sendformatshow eq 'thang'}">
                        <c:set var="formattedDate">
                            <fmt:formatDate value="${dcf.date}" pattern="MM/yyyy" />
                        </c:set>
                    </c:if>
                //hien theo nam
                    <c:if test="${requestScope.sendformatshow eq 'nam'}">
                        <c:set var="formattedDate">
                            <fmt:formatDate value="${dcf.date}" pattern="yyyy" />
                        </c:set>
                    </c:if>

                ['${formattedDate}',${dcf.money}],
                </c:forEach>
            </c:if>
                ]);

                var options = {
                    title: 'VND',
                    //              curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

                chart.draw(data, options);
            }
        </script>
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
       
        <!-- ============================================================== -->
        <%@include file="component/leftpanel.jsp" %>
        <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">

            <aside class="left-sidebar" data-sidebarbg="skin6">

            </aside>

            <div class="page-wrapper">
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><p class="page-title">Products Sales</p></li>
                                </ol>

                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- ============================================================== -->
                <!-- End Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <!-- SALES chart-->
                            <div class="white-box">
                                <h3 class="box-title">Products Sales</h3>
                                <div class="d-md-flex">
                                    <!--                                    <form action="downloadstatistic" method="get">
                                                                            <input type="submit" value="Tải xuống" />
                                                                        </form-->
                                    <div class="container">
                                        <form name="fc" method="post" action="statisticproduct">
                                            <div class="form-group">
                                                <label for="date-input">Từ Ngày:</label>
                                                <input type="text" name="bedate" value="${requestScope.sendbedate}" placeholder="DD-MM-YYYY" required pattern="[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[2]{1}[0]{1}[0-9]{1}[0-9]{1}" title="Vui lòng nhập đúng định dạng ngày"/>
                                                <label for="date-input">Đến Ngày:</label>
                                                <input type="text" name="endate" value="${requestScope.sendendate}" placeholder="DD-MM-YYYY" required pattern="[0-3]{1}[0-9]{1}-[0-1]{1}[0-9]{1}-[2]{1}[0]{1}[0-9]{1}[0-9]{1}" title="Vui lòng nhập đúng định dạng ngày"/>
                                            </div>
                                            <div class="form-group row">
                                                <label for="select-input" class="col-3">Hiện thông tin theo:</label>
                                                <div class="col-4">
                                                    <select id="select-input" name="formatshow" class="form-control">
                                                        <option value="ngay" ${requestScope.sendformatshow eq 'ngay' ? 'selected' : ''}>Ngày</option>
                                                        <option value="thang" ${requestScope.sendformatshow eq 'thang' ? 'selected' : ''}>Tháng</option>
                                                        <option value="nam" ${requestScope.sendformatshow eq 'nam' ? 'selected' : ''}>Năm</option>
                                                    </select>
                                                </div>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Lọc</button>
                                        </form>
                                    </div>

                                </div>
                                <div id="curve_chart" style="width: 100%; height: 500px"></div>
                            </div>
                            <!--list doanh so start-->
                            <div class="white-box">                 
                                <div class="">
                                    <div class="card">
                                        <div class="card-header">
                                            <h4><strong>Doanh số</strong></h4>
                                        </div>
                                        <div class="d-md-flex">
                                            <div class="container">
                                                <form name="fsp" method="post" action="statisticproduct">
                                                    <div class="form-group row">
                                                        <div class="col-6">
                                                            <label for="date-input">Từ Ngày:</label>
                                                            <input type="date" name="bedatesp" value="${requestScope.sendbedatesp}">
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="date-input">Đến Ngày:</label>
                                                            <input type="date" name="endatesp" value="${requestScope.sendendatesp}">
                                                        </div>
                                                    </div>
                                                    <div class="form-group row">

                                                        <div class="col-6">
                                                            <label for="select-input">Danh Mục:</label>
                                                            <div>
                                                                <input type="checkbox"/>
                                                                <label>All</label>
                                                            </div>
                                                            <c:forEach items="${requestScope.datac}" var="dac">
                                                                <div>
                                                                    <input type="checkbox" name="categoryID" value="${dac.categoryID}" />
                                                                    <label>${dac.categoryName}</label>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                        <div class="col-6">
                                                            <label for="select-input">Thương Hiệu:</label>
                                                            <div>
                                                                <input type="checkbox"/>
                                                                <label>All</label>
                                                            </div>
                                                            <c:forEach items="${requestScope.datas}" var="das">
                                                                <div>
                                                                    <input type="checkbox" name="supplierID" value="${das.supplierID}" />
                                                                    <label>${das.supplierName}</label>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Lọc</button>
                                                </form>
                                            </div>

                                        </div>
                                        <div class="card-body">
                                            <table class="table">
                                                <thead class="thead-dark">
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">Product Name</th>
                                                        <th scope="col">Supplier Name</th>
                                                        <th scope="col">Category Name</th>
                                                        <th scope="col">Quantity</th>
                                                        <th scope="col">Price</th>
                                                        <th scope="col">Total Price</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:set var="t" value="0"/>
                                                    <c:forEach items="${requestScope.dataStatisticProduct}" var="lsp">
                                                        <c:set var="t" value="${t+1}"/>      
                                                        <tr>
                                                            <th scope="row">${t}</th>
                                                            <th>${lsp.productName}</th>
                                                            <td>${lsp.supplierName}</td>
                                                            <td>${lsp.categoryName}</td>
                                                            <td>${lsp.quantity}</td>
                                                            <td><fmt:formatNumber  type = "currency" value="${lsp.price}"/></td>
                                                            <td><fmt:formatNumber  type = "currency" value="${lsp.totalPrice}"/></td>
                                                        </tr>
                                                    </c:forEach>

                                                </tbody>
                                            </table>
                                            <hr>
                                            <c:set var="totalPrices" value="0" />
                                            <c:set var="totalQuantities" value="0" />

                                            <c:forEach items="${dataStatisticProduct}" var="product">
                                                <c:set var="totalPrices" value="${totalPrices + product.totalPrice}" />
                                                <c:set var="totalQuantities" value="${totalQuantities + product.quantity}" />
                                            </c:forEach>

                                            <strong>Tổng Doanh Thu: <fmt:formatNumber  type = "currency" value="${totalPrices}"/></strong><br>
                                            <strong>Tổng Sản Phẩm Bán Ra: ${totalQuantities} Sản Phẩm</strong>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>

                    </div>

                </div>
                <!-- ============================================================== -->
                <!-- End Container fluid  -->
                <!-- ============================================================== -->
                <!-- ============================================================== -->

                <!-- ============================================================== -->
            </div>
            <!-- ============================================================== -->
            <!-- End Page wrapper  -->
            <!-- ============================================================== -->
        </div>
        <!-- ============================================================== -->
        <!-- End Wrapper -->
        <!-- ============================================================== -->
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="js/jsdashboard/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="js/jsdashboard/bootstrap.bundle.min.js"></script>
        <script src="js/jsdashboard/app-style-switcher.js"></script>
        <script src="js/jsdashboard/jquery.sparkline.min.js"></script>
        <!--Wave Effects -->
        <script src="js/jsdashboard/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/jsdashboard/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="js/jsdashboard/custom.js"></script>
        <!--This page JavaScript -->
        <!--chartis chart-->
        <script src="js/jsdashboard/dashboard1.js"></script>

    </body>

</html>
