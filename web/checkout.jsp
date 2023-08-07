<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value = "vi_VN"/>
<html lang="en">
    <!-- Basic -->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>WebSaleGas</title>
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

        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>

    <body>

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
                                    <i class="fa fa-shopping-bag"></i>
                                    <span class="badge">3</span>
                                </a></li>
                        </ul>
                    </div>
                    <!-- End Atribute Navigation -->
                </div>
            </nav>
            <!-- End Navigation -->
        </header>
        <!-- End Main Top -->

        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <span class="input-group-addon"><i class="fa fa-search"></i></span>
                    <input type="text" class="form-control" placeholder="Search">
                    <span class="input-group-addon close-search"><i class="fa fa-times"></i></span>
                </div>
            </div>
        </div>
        <!-- End Top Search -->

        <!-- Start All Title Box -->
        <div class="all-title-box">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <h2>Checkout</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="#">Shop</a></li>
                            <li class="breadcrumb-item active">Checkout</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Cart  -->
        <div class="cart-box-main">
            <form class="needs-validation" name="fc" action="checkout" method="post" novalidate>>
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="checkout-address">
                                <div class="title-left">
                                    <h3>Hóa Đơn</h3>
                                </div>

                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <label for="firstName">Họ</label>
                                        <input type="text" class="form-control" id="firstName" placeholder="" value="${requestScope.user.firstName}" readonly="">
                                        <div class="invalid-feedback"> Valid first name is required. </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="lastName">Tên</label>
                                        <input type="text" class="form-control" id="lastName" placeholder="" value="${requestScope.user.lastName}" readonly="">
                                        <div class="invalid-feedback"> Valid last name is required. </div>
                                    </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address">Số Điện Thoại</label>
                                    <input type="text" class="form-control" id="address" placeholder="" value="${requestScope.user.phoneNumber}" readonly="">
                                    <div class="invalid-feedback"> Please enter your shipping address. </div>
                                </div>
                                <div class="mb-3">
                                    <label for="address2">Địa Chỉ Nhận Hàng</label>
                                    <input type="text" class="form-control" id="address2" name="address" placeholder="" value="${requestScope.user.address}" required=""> </div>
                                <hr class="mb-4">
                                <div class="coupon-box">
                                    <div class="input-group input-group-sm">
                                        <input class="form-control" placeholder="Nhập Mã Giảm Giá Của Bạn" aria-label="Coupon code" type="text">
                                        <div class="input-group-append">
                                            <button class="btn btn-theme" type="button">Nhập</button>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-4">
                                <div class="title"> <span>Phương Thức Thanh Toán</span> </div>
                                <div class="d-block my-3">
                                    <div class="custom-control custom-radio">
                                        <input id="credit" name="paymentMethod" value="2" type="radio" class="custom-control-input" checked="" required>
                                        <label class="custom-control-label" for="credit">Thanh Toán Trực Tuyến</label>
                                    </div>
                                    <div class="custom-control custom-radio">
                                        <input id="debit" name="paymentMethod" value="1" type="radio" class="custom-control-input" required>
                                        <label class="custom-control-label" for="debit">Thanh Toán Khi Nhận Hàng</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <div class="payment-icon">
                                            <ul>
                                                <li><img class="img-fluid" src="images/payment-icon/1.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/2.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/3.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/5.png" alt=""></li>
                                                <li><img class="img-fluid" src="images/payment-icon/7.png" alt=""></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <hr class="mb-1"> 
                            </div>
                        </div>
                        <div class="col-sm-6 col-lg-6 mb-3">
                            <div class="row">
                                <div class="col-md-12 col-lg-12">
                                    <div class="shipping-method-box">
                                        <div class="title-left">
                                            <h3>Phương Thức Vận Chuyển</h3>
                                        </div>
                                        <div class="mb-4">
                                            <div class="custom-control custom-radio">
                                                <input id="shippingOption1" name="shipping-option" value="1" class="custom-control-input" checked="" type="radio">
                                                <label class="custom-control-label" for="shippingOption1">Giao hàng tiêu chuẩn</label> <span class="float-right font-weight-bold"><fmt:formatNumber type="currency" value="20000"/></span>
                                            </div>
                                            <div class="ml-4 mb-2 small">(3-7 ngày)</div>
                                            <div class="custom-control custom-radio">
                                                <input id="shippingOption2" name="shipping-option" value="2" class="custom-control-input" type="radio">
                                                <label class="custom-control-label" for="shippingOption2">Chuyển phát nhanh</label> <span class="float-right font-weight-bold"><fmt:formatNumber type="currency" value="50000"/></span>
                                            </div>
                                            <div class="ml-4 mb-2 small">(2-4 ngày)</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12">
                                    <div class="odr-box">
                                        <div class="title-left">
                                            <h3>Sản Phẩm</h3>
                                        </div>
                                        <div class="rounded p-2 bg-light">
                                            <c:set var="o" value="${sessionScope.cart}"/>
                                            <c:forEach items="${o.items}" var="i">
                                                <div class="media mb-2 border-bottom">
                                                    <div class="media-body"> 
                                                        <a href="productdetail?productID=${i.product.productID}">
                                                            ${i.product.productName}
                                                        </a>
                                                        <div class="small text-muted">Giá <fmt:formatNumber type="currency" value="${(i.product.price) - (i.product.price)*(i.product.discount)/100}"/> <span class="mx-2">|
                                                            </span> SL: ${i.quantity} <span class="mx-2">|
                                                            </span> Tổng: <fmt:formatNumber type="currency" value="${((i.product.price) - (i.product.price)*(i.product.discount)/100)*i.quantity}"/></div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-12 col-lg-12">
                                    <div class="order-box">
                                        <div class="title-left">
                                            <h3>Chi Tiết Thanh Toán</h3>
                                        </div>

                                        <div class="d-flex">
                                            <h4>Tổng Tiền Hàng</h4>
                                            <div class="ml-auto font-weight-bold"> <fmt:formatNumber type="currency" value="${o.getTotalMoney()}"/> </div>
                                        </div>
                                        <hr class="my-1">
                                        <div class="d-flex">
                                            <h4>Ưu đãi khách hàng thân thiết</h4>
                                            <div class="ml-auto font-weight-bold">- <fmt:formatNumber type="currency" value="${o.getTotalMoney() * requestScope.user.discount}"/></div>
                                        </div>
                                        <div class="d-flex">
                                            <h4>Phí Vận Chuyển</h4>
                                            <div id="shippingFee" class="ml-auto font-weight-bold"> <fmt:formatNumber type="currency" value="20000"/> </div>
                                        </div>
                                        <hr>
                                        <div id="totalPayment" class="d-flex gr-total">
                                            <h5>Tổng Thanh Toán</h5>
                                            <div class="ml-auto h5"><fmt:formatNumber type="currency" value="${o.getTotalMoney() - o.getTotalMoney() * requestScope.user.discount + 20000}"/></div>
                                        </div>
                                        <hr> </div>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                    <div class="update-box">
                                        <input value="Đặt Hàng" type="submit">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form
        </div>
        <!-- End Cart -->



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
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <!-- ALL PLUGINS -->
        <script src="js/jquery.superslides.min.js"></script>
        <script src="js/bootstrap-select.js"></script>
        <script src="js/inewsticker.js"></script>
        <script src="js/bootsnav.js."></script>
        <script src="js/images-loded.min.js"></script>
        <script src="js/isotope.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/baguetteBox.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>
        <script>
            // Lấy các phần tử cần tương tác
            const shippingOption1 = document.getElementById('shippingOption1');
            const shippingOption2 = document.getElementById('shippingOption2');
            const shippingFee = document.getElementById('shippingFee');
            const totalMoneyElement = document.querySelector('#totalPayment .h5');

// Xử lý sự kiện khi người dùng thay đổi lựa chọn
            shippingOption1.addEventListener('change', function () {
                if (shippingOption1.checked) {
                    shippingFee.textContent = formatCurrency(20000);
                }
            });

            shippingOption2.addEventListener('change', function () {
                if (shippingOption2.checked) {
                    shippingFee.textContent = formatCurrency(50000);
                }
            });


// Xử lý sự kiện khi người dùng thay đổi lựa chọn
            shippingOption1.addEventListener('change', updateTotalPayment);
            shippingOption2.addEventListener('change', updateTotalPayment);

            function updateTotalPayment() {
                if (shippingOption1.checked) {
                    // Logic tính toán tổng thanh toán khi chọn Giao hàng tiêu chuẩn
                    totalMoneyElement.textContent = formatCurrency(${sessionScope.cart.getTotalMoney() - sessionScope.cart.getTotalMoney() * requestScope.user.discount} + 20000);
                } else if (shippingOption2.checked) {
                    // Logic tính toán tổng thanh toán khi chọn Chuyển phát nhanh
                    totalMoneyElement.textContent = formatCurrency(${sessionScope.cart.getTotalMoney() - sessionScope.cart.getTotalMoney() * requestScope.user.discount} + 50000);
                }
            }

// Hàm định dạng số tiền thành định dạng tiền tệ
            function formatCurrency(value) {
                return new Intl.NumberFormat('vi-VN', {style: 'currency', currency: 'VND'}).format(value);
            }

        </script>
    </body>

</html>