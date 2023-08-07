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
        
        <link href="vendor/font-awesome-4.7/css/font-awesome.min.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="css/cssliststatisticuser/theme.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">
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
                background-color: #00483d;
                color: #fff;
                border: none;
                padding: 8px 20px;
                border-radius: 20px;
                cursor: pointer;
                font-size: 14px;
            }

            .au-btn-filter:hover {
                background-color: #FF8C00;
            }

        </style>
    </head>


    <body class="animsition">
        <!-- Start Main Top -->
        <div class="main-top">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="text-slid-box">
                            <div id="offer-box" class="carouselTicker">
                                <ul class="offer-box">
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 10%! Shop Now Man
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> 50% - 80% off on Fashion
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> 20% off Entire Purchase Promo code: offT20
                                    </li>
                                    <li>
                                        <i class="fab fa-opencart"></i> Off 50%! Shop Now
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
                        <div class="right-phone-box">
                            <p> <i class="fas fa-phone fa-flip-horizontal"></i><a  href="tel: +84966328802"> +84 966 328 802</a></p>
                        </div>
                        <div class="our-link">
                            <ul>
                                <c:if test="${sessionScope.userinfo==null}">
                                    <li><a class="fas fa-sign-in-alt" href="login"> Đăng Nhập </a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.userinfo != null}">
                                    <li><a class="fas fa-user" href="infouser"> ${sessionScope.userinfo.username}</a></li>
                                    </c:if>
                                <li><a class="fas fa-map-marker-alt" href="map.jsp"> Địa Chỉ Đại Lý</a></li>
                                <li><a class="fas fa-envelope" href="contact-us.jsp"> Liên Hệ Chúng Tôi</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Main Top -->

        <!-- Start Main Top -->
        <header class="main-header">
            <!-- Start Navigation -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light navbar-default bootsnav">
                <div class="container">
                    <!-- Start Header Navigation -->
                    <div class="navbar-header">
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbar-menu" aria-controls="navbars-rs-food" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fa fa-bars"></i>
                        </button>
                        <a class="navbar-brand" href="home"><img src="images/logo.png" class="logo" alt=""></a>
                    </div>
                    <!-- End Header Navigation -->

                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="navbar-menu">
                        <ul class="nav navbar-nav ml-auto" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="nav-item active"><a class="nav-link" href="home">Trang Chủ</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">About Us</a></li>
                            <li class="nav-item"><a href="shop" class="nav-link">Sản Phẩm</a></li>

                            <li class="nav-item"><a class="nav-link" href="service.jsp">Our Service</a></li>
                            <li class="dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown"> Tài Khoản</a>
                                <ul class="dropdown-menu">
                                    <li><a href="my-account.jsp">Thông Tin Tài Khoản</a></li>
                                    <li><a href="wishlist.jsp">Danh Sách Yêu Thích</a></li>
                                    <li><a href="cart.jsp">Giỏ Hàng</a></li>
                                    <li><a href="checkout">Thanh Toán</a></li>
                                        <c:if test="${sessionScope.userinfo != null}" >
                                        <li><a href="logout?logout=out"><i class="fas fa-sign-out-alt"></i>Đăng Xuất</a></li>
                                        </c:if>
                                </ul>
                            </li>
                        </ul>
                    </div>
                    <!-- /.navbar-collapse -->

                    <!-- Start Atribute Navigation -->
                    <div class="attr-nav">
                        <ul>
                            <li class="side-menu"><a href="#">
                                    <li class="search"><a href="#"><i class="fa fa-search"></i></a></li>
                                    <li class="side-menu"><a href="#">
                                            <i class="fa fa-shopping-bag"></i>
                                            <span class="badge">${sessionScope.size}</span>
                                        </a></li>
                        </ul>
                    </div>
                    <!-- End Atribute Navigation -->
                </div>
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->



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
                                    <form name="ff" action="yourorder" method="post"> 
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
                                            <td class="denied">Hủy</td>
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
                                            <td class="denied">Hủy</td>
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
                                            <td class="denied">Hủy </td>
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
                                            <td class="process"> Mua Lại</td>
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
                                            <td class="process">Mua Lại</td>
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

        <!-- Start Footer  -->
        <footer>
            <div class="footer-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-widget">
                                <h4>About ThewayShop</h4>
                                <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                </p>
                                <ul>
                                    <li><a href="#"><i class="fab fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-linkedin" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-google-plus" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-pinterest-p" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fab fa-whatsapp" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link">
                                <h4>Information</h4>
                                <ul>
                                    <li><a href="#">About Us</a></li>
                                    <li><a href="#">Customer Service</a></li>
                                    <li><a href="#">Our Sitemap</a></li>
                                    <li><a href="#">Terms &amp; Conditions</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                    <li><a href="#">Delivery Information</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-link-contact">
                                <h4>Contact Us</h4>
                                <ul>
                                    <li>
                                        <p><i class="fas fa-map-marker-alt"></i>Address: Michael I. Days 3756 <br>Preston Street Wichita,<br> KS 67213 </p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-phone-square"></i>Phone: <a href="tel:+1-888705770">+1-888 705 770</a></p>
                                    </li>
                                    <li>
                                        <p><i class="fas fa-envelope"></i>Email: <a href="mailto:contactinfo@gmail.com">contactinfo@gmail.com</a></p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- End Footer  --> 
        <!-- Main JS-->
        <script src="js/jsliststatisticuser/main.js"></script>
        <!-- ALL JS FILES -->
        <script src="js/jquery-3.2.1.min.js"></script>
        <script src="//code.jquery.com/jquery-1.10.2.js"></script>
        <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js"></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script> 

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
