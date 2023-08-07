<%-- 
    Document   : add_products
    Created on : May 24, 2023, 9:39:53 PM
    Author     : dell
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.*" %>
<%@page import="model.*" %>
<%@page import="java.util.*" %>

<html lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta http-equiv="X-UA-Compatible" content="ie=edge" />
        <title>Thêm sản phẩm</title>
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css?family=Roboto:400,700"
            />
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="css/fontawesome.min.css" />
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
        <!-- http://api.jqueryui.com/datepicker/ -->
        <link rel="stylesheet" href="css/bootstrap.min.css" />
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="css/templatemo-style.css">
        <!--
            Product Admin CSS Template
        -->
    </head>

    <body>
        <nav class="navbar navbar-expand-xl">
            <div class="container h-100">
                <a class="navbar-brand" href="homeadmin">
                    <h1 class="tm-site-title mb-0"> Admin</h1>
                </a>
                <button
                    class="navbar-toggler ml-auto mr-0"
                    type="button"
                    data-toggle="collapse"
                    data-target="#navbarSupportedContent"
                    aria-controls="navbarSupportedContent"
                    aria-expanded="false"
                    aria-label="Toggle navigation"
                    >
                    <i class="fas fa-bars tm-nav-icon"></i>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mx-auto h-100">
                        <li class="nav-item">
                            <a class="nav-link" href="homeadmin">
                                <i class="fas fa-tachometer-alt"></i> Dashboard
                                <span class="sr-only">(current)</span>
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                                >
                                <i class="far fa-file-alt"></i>
                                <span> Reports <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Daily Report</a>
                                <a class="dropdown-item" href="#">Weekly Report</a>
                                <a class="dropdown-item" href="#">Yearly Report</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="listproduct">
                                <i class="fas fa-shopping-cart"></i> Products
                            </a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="infoadmin">
                                <i class="far fa-user"></i> Accounts
                            </a>
                        </li>
                        <li class="nav-item dropdown">
                            <a
                                class="nav-link dropdown-toggle"
                                href="#"
                                id="navbarDropdown"
                                role="button"
                                data-toggle="dropdown"
                                aria-haspopup="true"
                                aria-expanded="false"
                                >
                                <i class="fas fa-cog"></i>
                                <span> Settings <i class="fas fa-angle-down"></i> </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Profile</a>
                                <a class="dropdown-item" href="#">Billing</a>
                                <a class="dropdown-item" href="#">Customize</a>
                            </div>
                        </li>
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="login">
                                Admin, <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container tm-mt-big tm-mb-big">
            <div class="row">
                <div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
                    <div class="tm-bg-primary-dark tm-block tm-block-h-auto">
                        <div class="row">
                            <div class="col-12">
                                <h2 class="tm-block-title d-inline-block">Add Product</h2>
                            </div>
                        </div>
                        <div> <h3 style="color: #00FF00">${requestScope.mess}</h3></div>
                        <div class="row tm-edit-product-row">
                            <div class="col-xl-12 col-lg-12 col-md-12">

                                <form action="addproduct" class="tm-edit-product-form" method="post" enctype="multipart/form-data">
                                    <div class="form-group mb-3">
                                        <label
                                            for="name"
                                            >Product Name
                                        </label>
                                        <input
                                            id="name"
                                            name="productName"
                                            type="text"
                                            class="form-control validate"
                                            required
                                            />
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Supplier</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            name="supplierID"
                                            id="category"
                                            >
                                            <option selected>Select Supplier</option>
                                            <c:forEach items="${requestScope.datas}" var="s">
                                                <option value="${s.supplierID}">${s.supplierName}</option>
                                            </c:forEach>


                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label
                                            for="description"
                                            >Describe</label
                                        >
                                        <textarea
                                            class="form-control validate"
                                            name="describe"
                                            rows="3"
                                            required
                                            ></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label
                                            for="category"
                                            >Category</label
                                        >
                                        <select
                                            class="custom-select tm-select-accounts"
                                            name="categoryID"
                                            id="category"
                                            >
                                            <option selected>Select category</option>
                                            <c:forEach items="${requestScope.datac}" var="c">
                                                <option value="${c.categoryID}">${c.categoryName}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="expire_date"
                                                >Warranty Period
                                            </label>
                                            <input
                                                id="expire_date"
                                                name="warrantyPeriod"
                                                type="text"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="stock"
                                                >Quantity
                                            </label>
                                            <input
                                                id="stock"
                                                name="quantity"
                                                type="number"
                                                class="form-control validate"
                                                required
                                                />
                                        </div>  
                                    </div>
                                    <div class="row">
                                        <div class="form-group mb-3 col-xs-12 col-sm-6">
                                            <label
                                                for="expire_date"
                                                >Price
                                            </label>
                                            <input
                                                id="numberInput"
                                                name="price"
                                                type="text"
                                                oninput="formatNumber()"
                                                class="form-control validate"
                                                data-large-mode="true"
                                                />
                                        </div>
                                        <script>
                                            function formatNumber() {
                                                var input = document.getElementById("numberInput");
                                                var value = input.value;
                                                // Loại bỏ tất cả các ký tự không phải số và dấu chấm
                                                value = value.replace(/[^\d.]/g, "");
                                                // Chèn dấu phẩy giữa các cụm ba số liên tiếp
                                                value = value.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                                                // Gán giá trị đã định dạng vào ô input
                                                input.value = value;
                                            }
                                        </script>

                                    </div>
                                    <div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
                                        <div class="tm-product-img-dummy mx-auto">
                                                <img id="preview" src="#" alt="Ảnh của bạn">
                                        </div>
                                        <div class="custom-file mt-3 mb-3">
                                            Chọn file ảnh: <input type="file" name="image" onchange="showImage(this);">
                                            
                                            <script>
                                                // Hàm này sẽ được gọi khi người dùng chọn file ảnh
                                                function showImage(input) {
                                                    // Kiểm tra xem input có chứa file hay không
                                                    if (input.files && input.files[0]) {
                                                        // Tạo một đối tượng FileReader để đọc nội dung của file
                                                        var reader = new FileReader();
                                                        // Định nghĩa hàm onload cho đối tượng FileReader
                                                        reader.onload = function (e) {
                                                            // Lấy đối tượng img theo id
                                                            var img = document.getElementById("preview");
                                                            // Gán nội dung của file cho thuộc tính src của img
                                                            img.src = e.target.result;
                                                            // Thay đổi kích thước của img nếu cần
                                                            img.width = 245;
                                                            img.height = 160;
                                                            var fileName = input.files[0].name;
                                                            document.getElementById("filename").value = "img/" + fileName;
                                                        };
                                                        // Đọc nội dung của file dưới dạng URL
                                                        reader.readAsDataURL(input.files[0]);
                                                    }
                                                }
                                            </script>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-block text-uppercase">Add Product Now</button>
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="tm-footer row tm-mt-small">
        </footer> 

        <script src="js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="jquery-ui-datepicker/jquery-ui.min.js"></script>
        <!-- https://jqueryui.com/download/ -->
        <script src="js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script>
                                                $(function () {
                                                    $("#expire_date").datepicker();
                                                });
        </script>
    </body>
</html>
