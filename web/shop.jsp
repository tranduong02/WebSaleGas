<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html lang="en">    
    <!-- Basic -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">

        <!-- Mobile Metas -->
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Site Metas -->
        <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
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
                        <h2>Shop</h2>
                        <ul class="breadcrumb">
                            <li class="breadcrumb-item"><a href="map.jsp">Home</a></li>
                            <li class="breadcrumb-item active">Shop</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- End All Title Box -->

        <!-- Start Shop Page  -->
        <div class="shop-box-inner">
            <div class="container">
                <div class="row">
                    <div class="col-xl-3 col-lg-3 col-sm-12 col-xs-12 sidebar-shop-left">
                        <div class="product-categori">
                            <div class="search-product">
                                <form name="fs" action="shop">
                                    <input class="form-control" name="searchname" placeholder="Search here..." type="text">
                                    <button type="submit"> <i class="fa fa-search"></i> </button>
                                </form>
                            </div>
                            <form action="shop" method="">
                                <div class="filter-sidebar-left">
                                    <div class="title-left">
                                        <h3>Categories</h3>
                                    </div>
                                    <div class="list-group list-group-collapse list-group-sm list-group-tree" id="list-group-men" data-children=".sub-men">
                                        <div class="list-group-collapse sub-men">
                                            <input type="checkbox" name="category" value="" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            <label>All</label>
                                        </div>
                                        <c:forEach items="${requestScope.dataAllc}" var="dac">
                                            <div class="list-group-collapse sub-men">
                                                <input type="checkbox" name="category" value="${dac.categoryID}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <label>${dac.categoryName}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                                <%
                                     String queryString = request.getQueryString();
    if (queryString != null && queryString.contains("&priceS=")) {
        queryString = queryString.replaceAll("&priceS=[1-2]+", "");
    }
                                %>
                                <%!
    public String removeSpace(String queryString) {
        if (queryString != null) {
            queryString = queryString.replace("%20", "").trim();
        }
        return queryString;
    }
                                %>
                                <%  HttpServletRequest req = (HttpServletRequest) request; 
 String uri = req.getServletPath();%>
                                <div class="filter-price-left">
                                    <div class="title-left">
                                        <h3>Price</h3>
                                    </div>
                                    <div class="price-box-slider">
                                        <div id="slider-range"></div>
                                        <p>
                                            <input type="text" id="amount" name="price" readonly style="border:0; color:#FF8C00; font-weight:bold;">
                                        </p>
                                    </div>
                                </div>
                                <div class="filter-brand-left">
                                    <div class="title-left">
                                        <h3>Brand</h3>
                                    </div>
                                    <div class="brand-box">
                                        <ul>
                                            <li>
                                                <div class="radio radio-danger">
                                                    <input name="supplier" type="checkbox" value="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                    <label>All</label>
                                                </div>
                                            </li>
                                            <c:forEach var="das" items="${requestScope.dataAlls}">
                                                <li>
                                                    <div class="radio radio-danger">
                                                        <input name="supplier" value="${das.supplierID}" type="checkbox">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <label>${das.supplierName}</label>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                                <button class="btn hvr-hover" type="submit" style="color: #ffffff">Filter</button>
                            </form>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-sm-12 col-xs-12 shop-content-right">
                        <div class="right-product-box">
                            <div class="product-item-filter row">
                                <div class="col-12 col-sm-8 text-center text-sm-left">
                                    <div class="toolbar-sorter-right">
                                        <span>Sort by </span>
                                        <div class="sort-price">
                                            <a href="shop?<% if (queryString != null) {%><%= removeSpace(queryString) %><%}%>&priceS=1">High Price &rarr; Low Price</a>
                                        </div>
                                        <div class="sort-price">
                                            <a href="shop?<% if (queryString != null) {%><%= removeSpace(queryString) %><%}%>&priceS=2">Low Price &rarr; High Price</a>
                                        </div>
                                    </div>
                                    <span>Show   <c:if test="${requestScope.listProductFilter == null && requestScope.listSearch == null}">all results</c:if> 
                                        <c:if test="${requestScope.listProductFilter != null}">${requestScope.listProductFilter.size()} results</c:if>
                                        <c:if test="${requestScope.listSearch != null}">${requestScope.listSearch.size()} results</c:if>
                                        </span>
                                    </div>
                                    <div class="col-12 col-sm-4 text-center text-sm-right">
                                        <ul class="nav nav-tabs ml-auto">
                                            <li>
                                                <a class="nav-link active" href="#grid-view" data-toggle="tab"> <i class="fa fa-th"></i> </a>
                                            </li>
                                            <li>
                                                <a class="nav-link" href="#list-view" data-toggle="tab"> <i class="fa fa-list-ul"></i> </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!--all product-->

                            <c:if test="${requestScope.listSearch == null}">
                                <c:if test="${requestScope.listpbc == null}">
                                    <c:if test="${requestScope.listProductFilter == null}">
                                        <div class="row product-categorie-box" id="product-container">
                                            <div class="tab-content">
                                                <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                                    <div class="row">
                                                        <c:forEach var="da" items="${requestScope.dataAll}">
                                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                                <div class="products-single fix">
                                                                    <div class="box-img-hover">
                                                                        <div class="type-lb">
                                                                            <c:if test="${da.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                            <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                                            </div>
                                                                            <img src="${da.image}" class="img-fluid" alt="${da.productName}">
                                                                        <div class="mask-icon">
                                                                            <ul>
                                                                                <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                            </ul>
                                                                            <a class="cart" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                        </div>
                                                                    </div>
                                                                    <div class="why-text">
                                                                        <h4>${da.productName}</h4>
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <c:if test="${da.discount > 0}">
                                                                            <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.price)}"/></del></b>
                                                                                <tt>̣(Save: ${da.discount}%)</tt>̣</h6>
                                                                            </c:if>
                                                                        <h5><fmt:formatNumber  type = "currency" value="${(da.price) - (da.price)*(da.discount)/100}"/></h5>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <div role="tabpanel" class="tab-pane fade" id="list-view">
                                                    <c:forEach var="da" items="${requestScope.dataAll}">

                                                        <div class="list-view-box">
                                                            <div class="row">
                                                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                                    <div class="products-single fix">
                                                                        <div class="box-img-hover">
                                                                            <div class="type-lb">
                                                                                <c:if test="${da.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                                <c:if test="${da.discount == 0}"><p class="new">New</p></c:if>
                                                                                </div>
                                                                                <img src="${da.image}" class="img-fluid" alt="${da.productName}">
                                                                            <div class="mask-icon">
                                                                                <ul>
                                                                                    <li><a href="productdetail?productID=${da.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                                </ul>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                                    <div class="why-text full-width">
                                                                        <h4>${da.productName}</h4>
                                                                        <fmt:setLocale value = "vi_VN"/>
                                                                        <c:if test="${da.discount > 0}">
                                                                            <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(da.price)}"/></del></b>
                                                                                <tt>̣(Save: ${da.discount}%)</tt>̣</h5>
                                                                            </c:if>
                                                                        <h5><fmt:formatNumber  type = "currency" value="${(da.price) - (da.price)*(da.discount)/100}"/></h5>
                                                                        <p>${da.productDetail}</p>
                                                                        <a class="btn hvr-hover" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>

                                                </div>
                                            </div>
                                        </div>
                                    </c:if>


                                    <!--filter product-->
                                    <div class="row product-categorie-box" id="product-container">
                                        <div class="tab-content">
                                            <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                                <div class="row">
                                                    <c:forEach var="df" items="${requestScope.listProductFilter}">
                                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                            <div class="products-single fix">
                                                                <div class="box-img-hover">
                                                                    <div class="type-lb">
                                                                        <c:if test="${df.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                        <c:if test="${df.discount == 0}"><p class="new">New</p></c:if>
                                                                        </div>
                                                                        <img src="${df.image}" class="img-fluid" alt="${df.productName}">
                                                                    <div class="mask-icon">
                                                                        <ul>
                                                                            <li><a href="productdetail?productID=${df.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                        </ul>
                                                                        <a class="cart" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                    </div>
                                                                </div>
                                                                <div class="why-text">
                                                                    <h4>${df.productName}</h4>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <c:if test="${df.discount > 0}">
                                                                        <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(df.price)}"/></del></b>
                                                                            <tt>̣(Save: ${df.discount}%)</tt>̣</h6>
                                                                        </c:if>
                                                                    <h5><fmt:formatNumber  type = "currency" value="${(df.price) - (df.price)*(df.discount)/100}"/></h5>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>

                                            <div role="tabpanel" class="tab-pane fade" id="list-view">
                                                <c:forEach var="df" items="${requestScope.listProductFilter}">

                                                    <div class="list-view-box">
                                                        <div class="row">
                                                            <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                                <div class="products-single fix">
                                                                    <div class="box-img-hover">
                                                                        <div class="type-lb">
                                                                            <c:if test="${df.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                            <c:if test="${df.discount == 0}"><p class="new">New</p></c:if>
                                                                            </div>
                                                                            <img src="${df.image}" class="img-fluid" alt="${df.productName}">
                                                                        <div class="mask-icon">
                                                                            <ul>
                                                                                <li><a href="productdetail?productID=${df.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                                <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                            </ul>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                                <div class="why-text full-width">
                                                                    <h4>${df.productName}</h4>
                                                                    <fmt:setLocale value = "vi_VN"/>
                                                                    <c:if test="${df.discount > 0}">
                                                                        <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(df.price)}"/></del></b>
                                                                            <tt>̣(Save: ${df.discount}%)</tt>̣</h5>
                                                                        </c:if>
                                                                    <h5><fmt:formatNumber  type = "currency" value="${(df.price) - (df.price)*(df.discount)/100}"/></h5>
                                                                    <p>${df.productDetail}</p>
                                                                    <a class="btn hvr-hover" href="cart?productID=${df.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </c:if>
                                <!--product by category-->
                                <div class="row product-categorie-box" id="product-container">
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                            <div class="row">
                                                <c:forEach var="dp" items="${requestScope.listpbc}">
                                                    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                        <div class="products-single fix">
                                                            <div class="box-img-hover">
                                                                <div class="type-lb">
                                                                    <c:if test="${dp.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                    <c:if test="${dp.discount == 0}"><p class="new">New</p></c:if>
                                                                    </div>
                                                                    <img src="${dp.image}" class="img-fluid" alt="${dp.productName}">
                                                                <div class="mask-icon">
                                                                    <ul>
                                                                        <li><a href="productdetail?productID=${dp.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                    </ul>
                                                                    <a class="cart" href="cart?productID=${dp.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                                </div>
                                                            </div>
                                                            <div class="why-text">
                                                                <h4>${dp.productName}</h4>
                                                                <fmt:setLocale value = "vi_VN"/>
                                                                <c:if test="${dp.discount > 0}">
                                                                    <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(dp.price)}"/></del></b>
                                                                        <tt>̣(Save: ${dp.discount}%)</tt>̣</h6>
                                                                    </c:if>
                                                                <h5><fmt:formatNumber  type = "currency" value="${(dp.price) - (dp.price)*(dp.discount)/100}"/></h5>

                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div role="tabpanel" class="tab-pane fade" id="list-view">
                                            <c:forEach var="dp" items="${requestScope.listpbc}">

                                                <div class="list-view-box">
                                                    <div class="row">
                                                        <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                            <div class="products-single fix">
                                                                <div class="box-img-hover">
                                                                    <div class="type-lb">
                                                                        <c:if test="${dp.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                        <c:if test="${dp.discount == 0}"><p class="new">New</p></c:if>
                                                                        </div>
                                                                        <img src="${dp.image}" class="img-fluid" alt="${dp.productName}">
                                                                    <div class="mask-icon">
                                                                        <ul>
                                                                            <li><a href="productdetail?productID=${dp.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                            <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                        </ul>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                            <div class="why-text full-width">
                                                                <h4>${dp.productName}</h4>
                                                                <fmt:setLocale value = "vi_VN"/>
                                                                <c:if test="${dp.discount > 0}">
                                                                    <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(dp.price)}"/></del></b>
                                                                        <tt>̣(Save: ${dp.discount}%)</tt>̣</h5>
                                                                    </c:if>
                                                                <h5><fmt:formatNumber  type = "currency" value="${(dp.price) - (dp.price)*(dp.discount)/100}"/></h5>
                                                                <p>${dp.productDetail}</p>
                                                                <a class="btn hvr-hover" href="cart?productID=${dp.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>

                                        </div>
                                    </div>
                                </div>
                            </c:if>
                            <!--search product-->
                            <div class="row product-categorie-box" id="product-container">
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane fade show active" id="grid-view">
                                        <div class="row">
                                            <c:forEach var="ds" items="${requestScope.listSearch}">
                                                <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                    <div class="products-single fix">
                                                        <div class="box-img-hover">
                                                            <div class="type-lb">
                                                                <c:if test="${ds.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                <c:if test="${ds.discount == 0}"><p class="new">New</p></c:if>
                                                                </div>
                                                                <img src="${ds.image}" class="img-fluid" alt="${ds.productName}">
                                                            <div class="mask-icon">
                                                                <ul>
                                                                    <li><a href="productdetail?productID=${ds.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                    <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                </ul>
                                                                <a class="cart" href="cart?productID=${ds.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                            </div>
                                                        </div>
                                                        <div class="why-text">
                                                            <h4>${ds.productName}</h4>
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <c:if test="${ds.discount > 0}">
                                                                <h6 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(ds.price)}"/></del></b>
                                                                    <tt>̣(Save: ${ds.discount}%)</tt>̣</h6>
                                                                </c:if>
                                                            <h5><fmt:formatNumber  type = "currency" value="${(ds.price) - (ds.price)*(ds.discount)/100}"/></h5>

                                                        </div>
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade" id="list-view">
                                        <c:forEach var="ds" items="${requestScope.listSearch}">
                                            <div class="list-view-box">
                                                <div class="row">
                                                    <div class="col-sm-6 col-md-6 col-lg-4 col-xl-4">
                                                        <div class="products-single fix">
                                                            <div class="box-img-hover">
                                                                <div class="type-lb">
                                                                    <c:if test="${ds.discount > 0}"><p class="sale">Sale</p></c:if>
                                                                    <c:if test="${ds.discount == 0}"><p class="new">New</p></c:if>
                                                                    </div>
                                                                    <img src="${ds.image}" class="img-fluid" alt="${ds.productName}">
                                                                <div class="mask-icon">
                                                                    <ul>
                                                                        <li><a href="productdetail?productID=${ds.productID}" data-toggle="tooltip" data-placement="right" title="View"><i class="fas fa-eye"></i></a></li>
                                                                        <li><a href="#" data-toggle="tooltip" data-placement="right" title="Add to Wishlist"><i class="far fa-heart"></i></a></li>
                                                                    </ul>

                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-6 col-md-6 col-lg-8 col-xl-8">
                                                        <div class="why-text full-width">
                                                            <h4>${ds.productName}</h4>
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <c:if test="${ds.discount > 0}">
                                                                <h5 style="color: red"><b><del class="text-muted"><fmt:formatNumber  type = "currency" value="${(ds.price)}"/></del></b>
                                                                    <tt>̣(Save: ${ds.discount}%)</tt>̣</h5>
                                                                </c:if>
                                                            <h5><fmt:formatNumber  type = "currency" value="${(ds.price) - (ds.price)*(ds.discount)/100}"/></h5>
                                                            <p>${ds.productDetail}</p>
                                                            <a class="btn hvr-hover" href="cart?productID=${da.productID}&returnUrl=<%= uri %>">Add to Cart</a>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                    <c:if test="${requestScope.notfound != null}">
                                        <div class="centered-message">
                                            <p><i class="fas fa-exclamation-circle"></i>${requestScope.notfound}</p>
                                        </div>
                                    </c:if>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Shop Page -->


        <!-- Start Footer  -->
        <footer>
            <div class="footer-main">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="footer-widget">
                                <h4>About</h4>
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
        <script src="js/jquery-ui.js"></script>
        <script src="js/jquery.nicescroll.min.js"></script>
        <script src="js/form-validator.min.js"></script>
        <script src="js/contact-form-script.js"></script>
        <script src="js/custom.js"></script>

        <script async src="https://cse.google.com/cse.js?cx=553610216f3604cf3"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                // Bắt sự kiện khi người dùng nhập vào ô tìm kiếm
                $('input[name="searchname"]').keyup(function () {
                    var query = $(this).val(); // Lấy giá trị từ ô tìm kiếm
                    if (query !== '') {
                        // Gửi yêu cầu tìm kiếm đến Google Custom Search API
                        $.ajax({
                            url: 'https://www.googleapis.com/customsearch/v1',
                            data: {
                                key: 'AIzaSyAYUrUgC9Cm7ilCFuiK7ghz79pkxO0JkQ8',
                                cx: '553610216f3604cf3',
                                q: query
                            },
                            dataType: 'json',
                            success: function (data) {
                                // Xử lý kết quả tìm kiếm và hiển thị sản phẩm gợi ý
                                var suggestions = data.items;
                                var dropdown = $('.search-dropdown');
                                dropdown.empty(); // Xóa các gợi ý trước đó
                                if (suggestions.length > 0) {
                                    // Hiển thị các gợi ý
                                    for (var i = 0; i < suggestions.length; i++) {
                                        var suggestion = suggestions[i];
                                        var title = suggestion.title;
                                        var image = suggestion.pagemap.cse_image[0].src;
                                        dropdown.append('<div class="dropdown-item"><img src="' + image + '"> ' + title + '</div>');
                                    }
                                    dropdown.show(); // Hiển thị thanh xổ xuống
                                } else {
                                    dropdown.hide(); // Ẩn thanh xổ xuống nếu không có kết quả
                                }
                            }
                        });
                    } else {
                        $('.search-dropdown').hide(); // Ẩn thanh xổ xuống nếu ô tìm kiếm trống
                    }
                });

                // Bắt sự kiện khi người dùng chọn một gợi ý
                $(document).on('click', '.dropdown-item', function () {
                    var selectedTitle = $(this).text();
                    $('input[name="searchname"]').val(selectedTitle); // Gán giá trị gợi ý cho ô tìm kiếm
                    $('.search-dropdown').hide(); // Ẩn thanh xổ xuống
                });
            });

        </script>

    </body>

</html>