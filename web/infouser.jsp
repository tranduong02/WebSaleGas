
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>Gas Group-3 SE1707</title>
        <meta name="keywords" content="">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Site Icons -->
        <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <!-- Site CSS -->
        <link rel="stylesheet" href="css/style.css">
        <!-- Responsive CSS -->
        <link rel="stylesheet" href="css/responsive.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/custom.css">

        <!-- Custom CSS -->
        <link href="css/cssdashboard/styleinfo.css" rel="stylesheet">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
        <style>
            .hidden {
                display: none;
            }
        </style> 
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        <div class="preloader">
            <div class="lds-ripple">
                <div class="lds-pos"></div>
                <div class="lds-pos"></div>
            </div>
        </div>
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
                            <p> <i class="fas fa-phone fa-flip-horizontal"></i><a  href="#"> +11 900 800 100</a></p>
                        </div>
                        <div class="our-link">
                            <ul>
                                <c:if test="${sessionScope.userinfo==null}">
                                    <li><a class="fas fa-sign-in-alt" href="login"> Đăng Nhập </a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.userinfo != null}">
                                    <li><a class="fas fa-user" href="infouser"> ${sessionScope.userinfo.username}</a></li>
                                    </c:if>
                                <li><a class="fas fa-map-marker-alt" href="#"> Địa Chỉ Đại Lý</a></li>
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
                                    <li><a href="logout?logout=out"><i class="fas fa-sign-out-alt"></i>Đăng Xuất</a></li>
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
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <!-- ============================================================== -->
            <!-- Topbar header - style you can find in pages.scss -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- End Left Sidebar - style you can find in sidebar.scss  -->
            <!-- ============================================================== -->
            <!-- ============================================================== -->
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                            <h1 class="page-title">Thông Tin Cá Nhân</h1>
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
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <!-- Row -->
                    <div class="row">
                        <!-- Column -->
                        <!-- Column -->
                        <div class="col-lg-8 col-xlg-9 col-md-12 mx-auto">
                            <div class="card">
                                <div class="notification-pass"><strong style="color: red">${requestScope.errorUpdatePass}</strong></div>
                                <div class="card-body">
                                    <form class="form-horizontal form-material" name="fu" action="infouser" method="post">
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Tên Đăng Nhập</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anuser.username}" name="uname"
                                                       pattern="[A-Za-z0-9_.\-]{4,}" title="Các ký tự được chấp nhận bao gồm chữ cái viết hoa, chữ cái viết thường, chữ số, dấu gạch dưới (_), dấu chấm (.) và dấu gạch ngang (-) và tên đăng nhập phải nhiều hơn 4 kí tự."
                                                       class="form-control p-0 border-0" required=""> </div>
                                        </div>
                                        <!-- Hiển thị thông báo lỗi -->
                                        <c:if test="${not empty errorusername}">
                                            <div class="error-message">${errorusername}</div>
                                        </c:if>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Họ</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anuser.firstName}" name="fname"
                                                       class="form-control p-0 border-0" required> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Tên</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anuser.lastName}" name="lname"
                                                       class="form-control p-0 border-0" required> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label for="example-email" class="col-md-12 p-0">Email</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="email" value="${requestScope.anuser.email}" name="email"
                                                       class="form-control p-0 border-0" name="example-email"
                                                       id="example-email" required>
                                            </div>
                                        </div>
                                        <!-- Hiển thị thông báo lỗi -->
                                        <c:if test="${not empty erroremail}">
                                            <div class="error-message">${erroremail}</div>
                                        </c:if>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Số Điện Thoại</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anuser.phoneNumber}" name="phone"
                                                       pattern="[0-9]{10}" title="Please enter a valid phone number."
                                                       class="form-control p-0 border-0">
                                            </div>
                                        </div>
                                        <!-- Hiển thị thông báo lỗi -->
                                        <c:if test="${not empty errorphone}">
                                            <div class="error-message">${errorphone}</div>
                                        </c:if>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Địa Chỉ</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anuser.address}" name="address"
                                                       class="form-control p-0 border-0" required> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Trạng Thái</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text"
                                                       <c:if test="${requestScope.anuser.status == 0}">
                                                           value="Khách Hàng Mới"
                                                       </c:if>
                                                       <c:if test="${requestScope.anuser.status == 1}">
                                                           value="Khách Hàng Đang Sử Dụng"
                                                       </c:if>
                                                       <c:if test="${requestScope.anuser.status == 2}">
                                                           value="Khách Hàng Đã Sử Dụng"
                                                       </c:if>
                                                       class="form-control p-0 border-0" readonly=""> 
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Ưu Ðãi Khách Hàng Thân Thiết</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text"  value="<fmt:formatNumber type = "percent" maxIntegerDigits="3" value = "${requestScope.anuser.discount}"/> giá trị các đơn hàng" class="form-control p-0 border-0" readonly=""> 
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success">Thay đổi thông tin cá nhân</button>

                                            </div>
                                        </div>

                                    </form>
                                    <!--form doi mat khau-->
                                    <form name="fcp" action="changpassuser" method="post">
                                        <div class="form-group mb-4 hidden" id="password-group">
                                            <input type="email" value="${requestScope.anuser.email}" name="email" hidden="">
                                            <input type="text" value="${requestScope.anuser.username}" name="uname" hidden=">"
                                            <label class="col-md-12 p-0">Mật Khẩu</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input id="current-password" name="oldpass" type="password" placeholder="*********" class="form-control p-0 border-0"
                                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                       oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                       oninput="this.setCustomValidity('')">
                                            </div>
                                        </div>

                                        <div class="form-group mb-4 hidden" id="new-password-group">
                                            <label class="col-md-12 p-0">Mật Khẩu Mới</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input id="new-password" name="newpass"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                       oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                       oninput="this.setCustomValidity('')" type="password"  placeholder="*********" class="form-control p-0 border-0">
                                            </div>
                                        </div>

                                        <div class="form-group mb-4 hidden" id="confirm-password-group">
                                            <label class="col-md-12 p-0">Xác Nhận Mật Khẩu</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input id="confirm-password" type="password"  placeholder="*********" class="form-control p-0 border-0">
                                            </div>
                                        </div>
                                        <div class="form-group mb-4 hidden" id="update-password-group">
                                            <button id="update-password-btn" type="submit" class="btn btn-success">Xác Nhận</button>
                                        </div>
                                    </form>
                                    <button id="change-password-btn" type="button" class="btn btn-primary">Đổi Mật Khẩu</button> 
                                </div>
                            </div>
                        </div>

                        <!-- Column -->
                    </div>
                    <!-- Row -->
                    <!-- ============================================================== -->
                    <!-- End PAge Content -->
                    <!-- ============================================================== -->
                    <!-- ============================================================== -->
                    <!-- Right sidebar -->
                    <!-- ============================================================== -->
                    <!-- .right-sidebar -->
                    <!-- ============================================================== -->
                    <!-- End Right sidebar -->
                    <!-- ============================================================== -->
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



        <a href="#" id="back-to-top" title="Back to top" style="display: none;">&uarr;</a>

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
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="js/jsdashboard/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="js/jsdashboard/bootstrap.bundle.min.js"></script>
        <script src="js/jsdashboard/app-style-switcher.js"></script>
        <!--Wave Effects -->
        <script src="js/jsdashboard/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/jsdashboard/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="js/jsdashboard/custom.js"></script>
        <script type="text/javascript">
            window.onload = function () {
                document.getElementById("new-password").onchange = validatePassword;
                document.getElementById("confirm-password").onchange = validatePassword;
            };
            function validatePassword() {
                var pass2 = document.getElementById("new-password").value;
                var pass1 = document.getElementById("confirm-password").value;
                if (pass1 !== pass2)
                    document.getElementById("confirm-password").setCustomValidity("Passwords Don't Match");
                else
                    document.getElementById("confirm-password").setCustomValidity('');
                //empty string means no validation error
            }
        </script>
    </body>

</html>
