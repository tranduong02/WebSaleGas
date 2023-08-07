<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<!DOCTYPE html>
<html lang="en">


    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Tables</title>
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">
        <!-- Fontfaces CSS-->
        <link href="vendor/font-awesome-5/css/fontawesome-all.min.css" rel="stylesheet" media="all">
        <!-- Main CSS-->
        <link href="css/cssliststatisticuser/theme.css" rel="stylesheet" media="all">
        <style>
            .table-data__tool-left {
                display: flex;
                align-items: center;
            }

            .rs-select2--light.rs-select2--md {
                margin-right: 10px;
            }

            .js-select2 {
                width: 200px;
                padding: 6px 10px;
                border-radius: 20px;
                border: 1px solid #ccc;
                font-size: 14px;
                outline: none;
            }

            .au-btn-filter {
                background-color: #67c2ef;
                color: #fff;
                border: none;
                padding: 8px 20px;
                border-radius: 20px;
                cursor: pointer;
                font-size: 14px;
            }

            .au-btn-filter:hover {
                background-color: #4faee8;
            }

        </style>
    </head>

    <body class="animsition">
        <div class="page-wrapper">


            <!-- PAGE CONTAINER-->
            <div class="page-container">
                <%@include file="component/leftpanel.jsp" %>
                <!-- MAIN CONTENT-->
                <div class="main-content">
                    <div class="section__content section__content--p30">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-md-12">
                                    <!-- DATA TABLE -->
                                    <h3 class="title-5 m-b-35">Lịch Sử Mua Hàng</h3>
                                    <div class="table-data__tool">
                                        <div class="table-data__tool-left">
                                            <form name="ff" action="statisticorder" method="get"> 
                                                <div class="rs-select2--light rs-select2--md">

                                                    <select class="js-select2" name="status">
                                                        <option <c:if test="${requestScope.listConfirmationWaiting != null}">selected="selected"</c:if> value="1">Đang Chờ Xác Nhận</option>
                                                        <option <c:if test="${requestScope.listPrepare != null}">selected="selected"</c:if> value="2">Đang Chuẩn Bị Hàng</option>
                                                        <option <c:if test="${requestScope.listShipping != null}">selected="selected"</c:if> value="3">Đang Giao</option>
                                                        <option <c:if test="${requestScope.listComplete != null}">selected="selected"</c:if> value="4">Hoàn Thành</option>
                                                        <option <c:if test="${requestScope.listCanceled != null}">selected="selected"</c:if> value="5">Đã Hủy</option>
                                                        </select>
                                                        <div class="dropDownSelect2"></div>
                                                    </div>
                                                    <button class="au-btn-filter" type="submit"><i class="zmdi zmdi-filter-list"></i>Lọc</button>
                                                </form>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <div class="row m-t-30">
                                <div class="col-md-12">
                                    <!-- DATA TABLE-->
                                    <div class="table-responsive m-b-40">
                                        <table class="table table-borderless table-data3">
                                            <thead>
                                                <tr>
                                                    <th>Mã đơn hàng</th>
                                                    <th>Ngày đặt hàng</th>
                                                    <th>Địa Chỉ Nhận Hàng</th>
                                                    <th>Thành Tiền</th>
                                                    <th>Chi Tiết Đơn Hàng</th>
                                                    <th></th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <!--Đang Chờ Xác Nhận-->
                                                
                                            <c:forEach items="${requestScope.listConfirmationWaiting}" var="l">
                                                <tr>
                                                    <td>${l.orderID}</td>
                                                    <td>${l.orderDate}</td>
                                                    <td>${l.deliveryAddress}</td>
                                                    <td><fmt:formatNumber  type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td><a href="orderdetail?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td>
                                                        <a href="statisticorder?action=accept&orderID=${l.orderID}&status=1" class="process">XácNhận</a>
                                                    </td>
                                                    <td>
                                                        <a href="statisticorder?action=cancel&orderID=${l.orderID}&status=1" class="denied">Hủy</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!--Đang Chuẩn Bị-->
                                            <c:forEach items="${requestScope.listPrepare}" var="l">
                                                <tr>
                                                    <td>${l.orderID}</td>
                                                    <td>${l.orderDate}</td>
                                                    <td>${l.deliveryAddress}</td>
                                                    <td><fmt:formatNumber  type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td><a href="orderdetail?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td>
                                                        <a href="statisticorder?action=transport&orderID=${l.orderID}&status=2" class="process">Xác Nhận Đã Giao Cho Đơn Vị Vận Chuyển</a>
                                                    </td>
                                                     <td>
                                                        <a href="statisticorder?action=cancel&orderID=${l.orderID}&status=2" class="denied">Hủy</a>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                            <!--Đang Giao-->
                                            <c:forEach items="${requestScope.listShipping}" var="l">
                                                <tr>
                                                    <td>${l.orderID}</td>
                                                    <td>${l.orderDate}</td>
                                                    <td>${l.deliveryAddress}</td>
                                                    <td><fmt:formatNumber  type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td><a href="orderdetail?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td>
                                                        <a href="statisticorder?action=done&orderID=${l.orderID}&status=3" class="process">Xác Nhận Hoàn Thành</a>
                                                    </td>
                                                    <td>
                                                        <a href="statisticorder?action=cancel&orderID=${l.orderID}&status=3" class="denied">Hủy</a>
                                                    </td>
                                                    
                                                </tr>
                                            </c:forEach>
                                            <!--Hoàn Thành-->
                                            <c:forEach items="${requestScope.listComplete}" var="l">
                                                <tr>
                                                    <td>${l.orderID}</td>
                                                    <td>${l.orderDate}</td>
                                                    <td>${l.deliveryAddress}</td>
                                                    <td><fmt:formatNumber  type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td><a href="orderdetail?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </c:forEach>
                                            <!--Đã Hủy-->
                                            <c:forEach items="${requestScope.listCanceled}" var="l">
                                                <tr>
                                                    <td>${l.orderID}</td>
                                                    <td>${l.orderDate}</td>
                                                    <td>${l.deliveryAddress}</td>
                                                    <td><fmt:formatNumber  type = "currency" value="${(l.totalMoney)}"/></td>
                                                    <td><a href="orderdetail?orderID=${l.orderID}">Xem Chi Tiết</a></td>
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                            </c:forEach>

                                        </tbody>
                                    </table>
                                </div>
                                <!-- END DATA TABLE-->
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!-- Jquery JS-->
        <script src="vendor/jquery-3.2.1.min.js"></script>
        <!-- Main JS-->
        <script src="js/jsliststatisticuser/main.js"></script>
        <script type="text/javascript">
            !(function (e, t, a) {
                function r() {
                    for (var e = 0; e < o.length; e++)
                        o[e].alpha <= 0
                                ? (t.body.removeChild(o[e].el), o.splice(e, 1))
                                : (o[e].y--,
                                        (o[e].scale += 0.004),
                                        (o[e].alpha -= 0.013),
                                        (o[e].el.style.cssText =
                                                "left:" +
                                                o[e].x +
                                                "px;top:" +
                                                o[e].y +
                                                "px;opacity:" +
                                                o[e].alpha +
                                                ";transform:scale(" +
                                                o[e].scale +
                                                "," +
                                                o[e].scale +
                                                ") rotate(45deg);background:" +
                                                o[e].color +
                                                ";z-index:99999"));
                    requestAnimationFrame(r);
                }
                function n(e) {
                    var a = t.createElement("div");
                    (a.className = "heart"),
                            o.push({el: a, x: e.clientX - 5, y: e.clientY - 5, scale: 1, alpha: 1, color: "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"}),
                            t.body.appendChild(a);
                }
                var o = [];
                (e.requestAnimationFrame =
                        e.requestAnimationFrame ||
                        e.webkitRequestAnimationFrame ||
                        e.mozRequestAnimationFrame ||
                        e.oRequestAnimationFrame ||
                        e.msRequestAnimationFrame ||
                        function (e) {
                            setTimeout(e, 1e3 / 60);
                        }),
                        (function (e) {
                            var a = t.createElement("style");
                            a.type = "text/css";
                            try {
                                a.appendChild(t.createTextNode(e));
                            } catch (t) {
                                a.styleSheet.cssText = e;
                            }
                            t.getElementsByTagName("head")[0].appendChild(a);
                        })(
                        ".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}",
                        ),
                        (function () {
                            var t = "function" == typeof e.onclick && e.onclick;
                            e.onclick = function (e) {
                                t && t(), n(e);
                            };
                        })(),
                        r();
            })(window, document);
        </script>
    </body>

</html>
<!-- end document-->
