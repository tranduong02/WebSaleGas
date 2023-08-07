<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <h3 class="title-5 m-b-35">data table</h3>
                                    <div class="table-data__tool">
                                        <div class="table-data__tool-left">
                                            <form name="ff" action="liststatisticuser"> 
                                                <div class="rs-select2--light rs-select2--md">

                                                    <select class="js-select2" name="status">
                                                        <option <c:if test="${requestScope.listnew != null}">selected="selected"</c:if> value="0">Khách hàng mới</option>
                                                        <option <c:if test="${requestScope.listusing != null}">selected="selected"</c:if> value="1">Khách Hàng Đang Sử Dụng</option>
                                                        <option <c:if test="${requestScope.listused != null}">selected="selected"</c:if> value="2">Khách Hàng Đã Sử Dụng</option>
                                                        </select>
                                                        <div class="dropDownSelect2"></div>
                                                    </div>
                                                    <button class="au-btn-filter" type="submit"><i class="fa fa-filter"></i>Lọc</button>
                                                </form>
                                            </div>
                                        </div>
                                        <div class="table-responsive m-b-40">
                                            <table class="table table-borderless table-data3">
                                                <thead>
                                                    <tr>
                                                        <th>UserName</th>
                                                        <th>Email</th>
                                                        <th>HọTên</th>
                                                        <th>Điện Thoại</th>
                                                        <th>TrạngThái</th>
                                                        <th>ĐịaChỉ</th>
                                                        <th></th>

                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${requestScope.listused}" var="lud">
                                                    <tr class="tr-shadow">
                                                        <td>${lud.username}</td>
                                                        <td>
                                                            <span class="block-email">${lud.email}</span>
                                                        </td>
                                                        <td class="desc">${lud.firstName} ${lud.lastName}</td>
                                                        <td>${lud.phoneNumber}</td>
                                                        <td>
                                                            <span class="status--denied">Đã Sử Dụng</span>
                                                        </td>
                                                        <td>${lud.address}</td>
                                                        <td>
                                                            <div class="table-data-feature">
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                                    <i class="zmdi zmdi-mail-send"></i>
                                                                </button>
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                                    <i class="zmdi zmdi-edit"></i>
                                                                </button>

                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Call">
                                                                    <i class="zmdi zmdi-phone"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>

                                                <tr class="spacer"></tr>
                                                <c:forEach items="${requestScope.listnew}" var="ln">
                                                    <tr class="tr-shadow">
                                                        <td>${ln.username}</td>
                                                        <td>
                                                            <span class="block-email">${ln.email}</span>
                                                        </td>
                                                        <td class="desc">${ln.firstName} ${ln.lastName}</td>
                                                        <td>${ln.phoneNumber}</td>
                                                        <td>
                                                            <span class="status--process">Khách hàng mới</span>
                                                        </td>
                                                        <td>${ln.address}</td>
                                                        <td>
                                                            <div class="table-data-feature">
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                                    <i class="fa fa-comments"></i>
                                                                </button>
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                                    <i class="fa fa-edit"></i>
                                                                </button>

                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Call">
                                                                    <i class="fa fa-phone"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                                <tr class="spacer"></tr>
                                                <c:forEach items="${requestScope.listusing}" var="lsi">
                                                    <tr class="tr-shadow">
                                                        <td>${lsi.username}</td>
                                                        <td>
                                                            <span class="block-email">${lsi.email}</span>
                                                        </td>
                                                        <td class="desc">${lsi.firstName} ${lsi.lastName}</td>
                                                        <td>${lsi.phoneNumber}</td>
                                                        <td>
                                                            <span class="status--process">Đang Sử Dụng</span>
                                                        </td>
                                                        <td>${lsi.address}</td>
                                                        <td>
                                                            <div class="table-data-feature">
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Send">
                                                                    <i class="zmdi zmdi-mail-send"></i>
                                                                </button>
                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Edit">
                                                                    <i class="zmdi zmdi-edit"></i>
                                                                </button>

                                                                <button class="item" data-toggle="tooltip" data-placement="top" title="Call">
                                                                    <i class="zmdi zmdi-phone"></i>
                                                                </button>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- END DATA TABLE -->
                                </div>
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
