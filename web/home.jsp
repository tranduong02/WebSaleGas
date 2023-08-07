<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@page import="dal.*" %>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
    <!-- Basic -->

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
                            <p> <i class="fas fa-phone fa-flip-horizontal"></i><a  href="tel: +84966328802"> +84 966 328 802</a></p>
                        </div>
                        <div class="our-link">
                            <ul>
                                
                                <c:if test="${sessionScope.userinfo==null}">
                                    <li><a class="fas fa-sign-in-alt" href="login"> Đăng Nhập</a></li>
                                    </c:if>
                                    <c:if test="${sessionScope.userinfo != null}">
                                    <li><a class="fas fa-user" href="infouser"> ${sessionScope.userinfo.username}</a></li>
                                    </c:if>
                                <li><a class="fas fa-map-marker-alt" href="map.jsp"> Địa chỉ</a></li>
                                <li><a class="fas fa-envelope" href="contact-us.jsp"> Liên Hệ</a></li>
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
                            <li class="nav-item active"><a class="nav-link" href="index">Trang Chủ</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.jsp">Thông Tin</a></li>
                            <li class="nav-item"><a href="shop" class="nav-link">Sản Phẩm</a></li>

                            <li class="nav-item"><a class="nav-link" href="service.jsp">Dịch Vụ</a></li>
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
        <!-- Start Top Search -->
        <div class="top-search">
            <div class="container">
                <div class="input-group">
                    <form action="search" method="post" class="input-group">
                        <input class="input form-control" id="search" name="key" placeholder="Search here">
                        <button class="input-group-addon">Search</button>
                    </form>
                </div>
                <div class="input-group">                        
                    <ul id="searchResults" class="input-group"></ul> 

                </div>
                <script>
                    document.getElementById('search').addEventListener('input', function (event) {
                        var keyword = event.target.value.toLowerCase();
                        var searchResults = document.getElementById('searchResults');

                        // Clear previous search results
                        while (searchResults.firstChild) {
                            searchResults.removeChild(searchResults.firstChild);
                        }

                        // Check if the entered keyword is not empty
                        if (keyword.length > 0) {
                            // Send an Ajax request to search in the database
                            var xhr = new XMLHttpRequest();
                            xhr.open('GET', 'search?keyword=' + keyword, true);
                            xhr.onreadystatechange = function () {
                                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                                    var products = JSON.parse(xhr.responseText);

                                    // Display the search results
                                    for (var i = 0; i < products.length; i++) {
                                        var li = document.createElement('li');
                                        var productLink = document.createElement('a');
                                        productLink.href = 'searchsmart?pid=' + products[i].productID;
                                        var productName = products[i].productName;
                                        productLink.innerHTML = highlightKeyword(productName, keyword);

                                        // Add click event listener to the link
                                        li.addEventListener('click', function (e) {
//                                            e.preventDefault(); // Prevent default link behavior
                                            window.location.href = productLink.href; // Redirect to the link URL
                                        });

                                        li.appendChild(productLink);
                                        searchResults.appendChild(li);
                                    }
                                }
                            };
                            xhr.send();
                        }
                    });

                    function highlightKeyword(text, keyword) {
                        var regex = new RegExp('(' + keyword + ')', 'gi');
                        return text.replace(regex, '<span style="color: red;">$1</span>');
                    }
                </script>

            </div>
        </div>
        <!-- End Top Search -->
        <!-- Start Slider -->
        <div id="slides-shop" class="cover-slides">
            <ul class="slides-container">
                <li class="text-left">
                    <img src="images/banner-01.jpg" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="m-b-20"><strong>Welcome To <br> WebSaleGas</strong></h1>
                                <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                                <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="text-center">
                    <img src="images/banner-02.jpg" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="m-b-20"><strong>Welcome To <br> WebSaleGas</strong></h1>
                                <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                                <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                            </div>
                        </div>
                    </div>
                </li>
                <li class="text-right">
                    <img src="images/banner-03.jpg" alt="">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <h1 class="m-b-20"><strong>Welcome To <br> WebSaleGas</strong></h1>
                                <p class="m-b-40">See how your users experience your website in realtime or view <br> trends to see any changes in performance over time.</p>
                                <p><a class="btn hvr-hover" href="#">Shop New</a></p>
                            </div>
                        </div>
                    </div>
                </li>
            </ul>
            <div class="slides-navigation">
                <a href="#" class="next"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
                <a href="#" class="prev"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
            </div>
        </div>
        <!-- End Slider -->

        <!-- Start Categories  -->
        <div class="categories-shop">
            <div class="container">
                <div class="row">
                    <c:forEach var="lc" items="${requestScope.listc}">
                        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
                            <div class="shop-cat-box">
                                <img class="img-fluid" src="${lc.image}" alt="" />
                                <a class="btn hvr-hover" href="shop?categoryID=${lc.categoryID}">${lc.categoryName}</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <!-- End Categories -->
        <%  HttpServletRequest req = (HttpServletRequest) request; 
 String uri = req.getServletPath();%>
        <!-- Start Products  -->
        <div class="container"> 
            <div class="row">
                <div class="col-lg-12">
                    <div class="text-center product-heading">
                        <h1>Sản Phẩm</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <c:forEach var="dt10" items="${requestScope.list}">                           
                            <div class="item">
                                <div class="products-single fix">
                                    <div class="box-img-hover">
                                        <div class="type-lb">
                                            <c:if test="${dt10.discount > 0}">
                                                <p class="sale">Sale</p>
                                            </c:if>
                                            <c:if test="${dt10.discount == 0}">
                                                <p class="new">New</p>
                                            </c:if>
                                        </div>
                                        <img src="${dt10.image}" class="img-fluid" alt="Image">
                                        <div class="mask-icon">
                                            <ul>
                                                <li><a href="productdetail?productID=${dt10.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                            </ul>
                                            <a class="cart" href="cart?productID=${dt10.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                        </div>
                                    </div>
                                    <div class="why-text">
                                        <h4>${dt10.productName}</h4>
                                        <fmt:setLocale value="vi_VN" />
                                        <c:if test="${dt10.discount > 0}">
                                            <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber type="currency" value="${(dt10.price)}"/></del></b>
                                                <tt>(Tiết Kiệm: ${dt10.discount}%)</tt></h6>
                                            </c:if>
                                        <h5><fmt:formatNumber type="currency" value="${(dt10.price) - (dt10.price) * (dt10.discount) / 100}" /></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Mới Cập Nhật</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <c:forEach var="dt10" items="${requestScope.datatop10}">
                            <div class="item">
                                <div class="products-single fix">
                                    <div class="box-img-hover">
                                        <div class="type-lb">
                                            <c:if test="${dt10.discount > 0}"><p class="sale">Sale</p></c:if>
                                            <c:if test="${dt10.discount == 0}"><p class="new">New</p></c:if>
                                            </div>
                                            <img src="${dt10.image}" class="img-fluid" alt="Image">
                                        <div class="mask-icon">
                                            <ul>
                                                <li><a href="productdetail?productID=${dt10.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                            </ul>
                                            <a class="cart" href="cart?productID=${dt10.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                        </div>
                                    </div>
                                    <div class="why-text">
                                        <h4>${dt10.productName}</h4>
                                        <fmt:setLocale value = "vi_VN"/>
                                        <c:if test="${dt10.discount > 0}">
                                            <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(dt10.price)}"/></del></b>
                                                <tt>̣(Tiết Kiệm: ${dt10.discount}%)</tt>̣</h6>
                                            </c:if>
                                        <h5><fmt:formatNumber  type = "currency" value="${(dt10.price) - (dt10.price)*(dt10.discount)/100}"/></h5>
                                    </div>
                                </div>
                            </div>                                  
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!--Best seller-->
            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Bán Chạy Nhất</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <c:forEach var="dbs" items="${requestScope.databestselling}">
                            <div class="item">
                                <div class="products-single fix">
                                    <div class="box-img-hover">
                                        <div class="type-lb">
                                            <c:if test="${dbs.discount > 0}"><p class="sale">Sale</p></c:if>
                                            <c:if test="${dbs.discount == 0}"><p class="new">New</p></c:if>
                                            </div>
                                            <img src="${dbs.image}" class="img-fluid" alt="Image">
                                        <div class="mask-icon">
                                            <ul>
                                                <li><a href="productdetail?productID=${dbs.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                            </ul>
                                            <a class="cart" href="cart?productID=${dbs.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                        </div>
                                    </div>
                                    <div class="why-text">
                                        <h4>${dbs.productName}</h4>
                                        <fmt:setLocale value = "vi_VN"/>
                                        <c:if test="${dbs.discount > 0}">
                                            <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(dbs.price)}"/></del></b>
                                                <tt>̣(Tiết Kiệm: ${dbs.discount}%)</tt>̣</h6>
                                            </c:if>
                                        <h5><fmt:formatNumber  type = "currency" value="${(dbs.price) - (dbs.price)*(dbs.discount)/100}"/></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!--Bếp Gas-->
            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Bếp Gas</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <c:forEach items="${requestScope.dataAll}" var="da">
                            <c:if test="${da.categoryID == 1}">
                                <div class="item">
                                    <div class="products-single fix">
                                        <div class="box-img-hover">
                                            <div class="type-lb">
                                                <c:if test="${da.discount > 0}"><p class="sale">Sale</p></c:if>
                                                <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                </div>
                                                <img src="${da.image}" class="img-fluid" alt="Image">
                                            <div class="mask-icon">
                                                <ul>
                                                    <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                                </ul>
                                                <a class="cart" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                            </div>
                                        </div>
                                        <div class="why-text">
                                            <h4>${da.productName}</h4>
                                            <fmt:setLocale value = "vi_VN"/>
                                            <c:if test="${da.discount > 0}">
                                                <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.price)}"/></del></b>
                                                    <tt>̣(Tiết Kiệm: ${da.discount}%)</tt>̣</h6>
                                                </c:if>
                                            <h5><fmt:formatNumber  type = "currency" value="${(da.price) - (da.price)*(da.discount)/100}"/></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!--Gas-->
            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Gas</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <c:forEach items="${requestScope.dataAll}" var="da">
                            <c:if test="${da.categoryID == 2}">
                                <div class="item">
                                    <div class="products-single fix">
                                        <div class="box-img-hover">
                                            <div class="type-lb">
                                                <c:if test="${da.discount > 0}"><p class="sale">Sale</p></c:if>
                                                <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                </div>
                                                <img src="${da.image}" class="img-fluid" alt="Image">
                                            <div class="mask-icon">
                                                <ul>
                                                    <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                                </ul>
                                                <a class="cart" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                            </div>
                                        </div>
                                        <div class="why-text">
                                            <h4>${da.productName}</h4>
                                            <fmt:setLocale value = "vi_VN"/>
                                            <c:if test="${da.discount > 0}">
                                                <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.price)}"/></del></b>
                                                    <tt>̣(Tiết Kiệm: ${da.discount}%)</tt>̣</h6>
                                                </c:if>
                                            <h5><fmt:formatNumber  type = "currency" value="${(da.price) - (da.price)*(da.discount)/100}"/></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!--Phụ Kiện-->
            <div class="row my-5">
                <div class="col-lg-12">
                    <div class="title-all text-center">
                        <h1>Phụ Kiện</h1>
                    </div>
                    <div class="featured-products-box owl-carousel owl-theme">
                        <c:forEach items="${requestScope.dataAll}" var="da">
                            <c:if test="${da.categoryID == 3}">
                                <div class="item">
                                    <div class="products-single fix">
                                        <div class="box-img-hover">
                                            <div class="type-lb">
                                                <c:if test="${da.discount > 0}"><p class="sale">Sale</p></c:if>
                                                <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                </div>
                                                <img src="${da.image}" class="img-fluid" alt="Image">
                                            <div class="mask-icon">
                                                <ul>
                                                    <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="Chi Tiết"><i class="fas fa-eye"></i></a></li>
                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Thêm Vào Yêu Thích"><i class="far fa-heart"></i></a></li>
                                                </ul>
                                                <a class="cart" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Thêm Vào Giỏ Hàng</a>
                                            </div>
                                        </div>
                                        <div class="why-text">
                                            <h4>${da.productName}</h4>
                                            <fmt:setLocale value = "vi_VN"/>
                                            <c:if test="${da.discount > 0}">
                                                <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.price)}"/></del></b>
                                                    <tt>̣(Tiết Kiệm: ${da.discount}%)</tt>̣</h6>
                                                </c:if>
                                            <h5><fmt:formatNumber  type = "currency" value="${(da.price) - (da.price)*(da.discount)/100}"/></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>  
        <!-- End Products  -->

        <!-- Start Blog  -->
        <div class="latest-blog">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="title-all text-center">
                            <h1>Tin Tức Mới Nhất</h1>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="blog-box">
                            <div class="blog-img">
                                <img class="img-fluid" src="images/blog-img.jpg" alt="" />
                            </div>
                            <div class="blog-content">
                                <div class="title-blog">
                                    <h3>Fusce in augue non nisi fringilla</h3>
                                    <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                </div>
                                <ul class="option-blog">
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Likes"><i class="far fa-heart"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Views"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Comments"><i class="far fa-comments"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="blog-box">
                            <div class="blog-img">
                                <img class="img-fluid" src="images/blog-img-01.jpg" alt="" />
                            </div>
                            <div class="blog-content">
                                <div class="title-blog">
                                    <h3>Fusce in augue non nisi fringilla</h3>
                                    <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                </div>
                                <ul class="option-blog">
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Likes"><i class="far fa-heart"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Views"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Comments"><i class="far fa-comments"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 col-xl-4">
                        <div class="blog-box">
                            <div class="blog-img">
                                <img class="img-fluid" src="images/blog-img-02.jpg" alt="" />
                            </div>
                            <div class="blog-content">
                                <div class="title-blog">
                                    <h3>Fusce in augue non nisi fringilla</h3>
                                    <p>Nulla ut urna egestas, porta libero id, suscipit orci. Quisque in lectus sit amet urna dignissim feugiat. Mauris molestie egestas pharetra. Ut finibus cursus nunc sed mollis. Praesent laoreet lacinia elit id lobortis.</p>
                                </div>
                                <ul class="option-blog">
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Likes"><i class="far fa-heart"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Views"><i class="fas fa-eye"></i></a></li>
                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Comments"><i class="far fa-comments"></i></a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Blog  -->

        <!-- Start Footer  -->
        <footer>
            <div class="footer-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-widget">
                                <h4>About WebSaleGas</h4>
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
                                    <li><a href="#">Thông Tin</a></li>
                                    <li><a href="#">Dịch Vụ Khách Hàng</a></li>
                                    <li><a href="#">Địa Chỉ Đại Lý</a></li>
                                    <li><a href="#">Thông Tin Giao Hàng </a></li>
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
        <script type="text/javascript">
                     var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
                     (function () {
                         var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                         s1.async = true;
                         s1.src = 'https://embed.tawk.to/6488a16294cf5d49dc5d794a/1h2qrcqpr';
                         s1.charset = 'UTF-8';
                         s1.setAttribute('crossorigin', '*');
                         s0.parentNode.insertBefore(s1, s0);
                     })();
        </script>
        <!--End of Tawk.to Script-->
        <!-- Chèn mã nhúng vào vị trí bạn muốn hiển thị Zalo Official Account Widget -->
        <script src="https://sp.zalo.me/plugins/sdk.js"></script>
        <script>
                    var options = {
                        "id": "5ALyYyE9vRLsSOIOCGEO" // ID tạm thời hoặc ID của tài khoản Zalo Official Account có sẵn
                    };
                    new ZaloOfficialAccountCustomerCare().initialize(options);
        </script>
        <script async src="https://cse.google.com/cse.js?cx=553610216f3604cf3">
        </script>
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