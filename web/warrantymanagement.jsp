<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!-->
<html class="no-js" lang=""> <!--<![endif]-->

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ela Admin - HTML5 Admin Template</title>
        <meta name="description" content="Ela Admin - HTML5 Admin Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">

        <link rel="stylesheet"
              href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
        <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800' rel='stylesheet' type='text/css'>

        <!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

    </head>

    <body>


        <!-- Right Panel -->
        <%@include file="component/leftpanel.jsp" %>
        <div id="right-panel" class="right-panel">
            <div class="breadcrumbs">
                <div class="breadcrumbs-inner">
                    <div class="row m-0">
                        <div class="col-sm-4">
                            <div class="page-header float-left">
                                <div class="page-title">
                                    <h1>Dashboard</h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="page-header float-right">
                                <div class="page-title">
                                    <ol class="breadcrumb text-right">
                                        <li><a href="#">Dashboard</a></li>
                                        <li><a href="#">Table</a></li>
                                        <li class="active">Basic table</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="animated fadeIn"> 
                    <div class="">

                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">List Suppliers</strong>
                            </div>
                            <form name="f" action="warrantymanagement" method="post">
                                <div class="card-body">
                                    <table class="table">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">Ngày Đặt Hàng</th>
                                                <th scope="col">Username</th>
                                                <th scope="col">Họ</th>
                                                <th scope="col">Tên</th>
                                                <th scope="col">Số Điện Thoại</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Tên Sản Phẩm</th>
                                                <th scope="col">Loại Bảo Hành</th>
                                                <th scope="col">Thời Gian Bảo Hành</th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                                <th scope="col"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="t" value="0"/>
                                            <c:forEach items="${requestScope.listWarranty}" var="lw">
                                                <c:set var="t" value="${t+1}"/>   
                                                <tr>
                                                    <th scope="row">${t}</th>
                                                    <td>${lw.orderDate}</td>
                                            <input type="text" hidden="" id="orderDate" name="orderDate" value="${lw.orderDate}">
                                            <td>${lw.username}</td>
                                            <input type="text" hidden="" name="username" id="username" value="${lw.username}">
                                            <td>${lw.firstName}</td>
                                            <input type="text" hidden="" id="firstName" name="firstName" value="${lw.firstName}">
                                            <td>${lw.lastName}</td>
                                            <input type="text" hidden="" id="lastName" name="lastName" value="${lw.lastName}">
                                            <td>${lw.phoneNumber}</td>
                                            <input type="text" hidden="" id="phoneNumber" name="phoneNumber" value="${lw.phoneNumber}">
                                            <td>${lw.email}</td>
                                            <input type="text" hidden="" name="email" id="email" value="${lw.email}">
                                            <td>${lw.productName}</td>
                                            <input type="text" hidden="" id="productName" name="productName" value="${lw.productName}">
                                            <td>${lw.warrantyCategory}</td>
                                            <input type="text" hidden="" id="warrantyCategory" name="warrantyCategory" value="${lw.warrantyCategory}">
                                            <td>${lw.warrantyPeriod}</td>
                                            <input type="text" hidden="" id="warrantyPeriod" name="warrantyPeriod" value="${lw.warrantyPeriod}">
                                            <input type="text" hidden="" id="productID" name="productID" value="${lw.productID}">
                                            <input type="text" hidden="" id="userID" name="userID" value="${lw.userID}">
                                            <td><a href="#" class="btn btn-success text-white btn-circle btn"> <i class="fas fa-phone"></i></a></td>
                                            <td><button onclick="sendFormDataToServlet()" class="btn btn-info btn-circle btn"> <i class="fas fa-envelope text-white"></i></button></td>
                                            <td><button type="submit" class="btn btn-warning btn-circle btn"> <i class="fas  fa-plus text-white"></i></button></td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </form>
                        </div>
                    </div>
                </div><!-- .animated -->
                <div id="myModal" class="modal">
                    <div class="modal-content btn-success">
                        <span class="close">&times;</span>
                    </div>
                </div>
                <div id="confirmModal" class="modal">
                    <div class="modal-content">
                        <span class="close-confirm">&times;</span>
                        <p>Gửi email đến người dùng?</p>
                        <button id="confirmButton" class="btn btn-primary">Gửi</button>
                    </div>
                </div>
            </div><!-- .content -->

            <div class="clearfix"></div>
        </div><!-- /#right-panel -->

        <!-- Right Panel -->

    </body>

</html>