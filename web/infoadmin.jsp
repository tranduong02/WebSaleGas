
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Ample Admin Lite Template by WrapPixel</title>
        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link href="css/cssdashboard/style.min.css" rel="stylesheet">
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
       
        <!-- ============================================================== -->
        <%@include file="component/leftpanel.jsp" %>
         <!-- ============================================================== -->
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <aside class="left-sidebar" data-sidebarbg="skin6">
            </aside>
            <!-- Page wrapper  -->
            <!-- ============================================================== -->
            <div class="page-wrapper">
                <!-- ============================================================== -->
                <!-- Bread crumb and right sidebar toggle -->
                <!-- ============================================================== -->
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><p class="page-title">Thông tin tài khoản</p></li>
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
                    <!-- ============================================================== -->
                    <!-- Start Page Content -->
                    <!-- ============================================================== -->
                    <!-- Row -->
                    <div class="row">
                        <!-- Column -->

                        <!-- Column -->
                        <!-- Column -->

                        <div class="col-lg-8 col-xlg-9 col-md-12 mx-auto">
                            <div class="card">
                                <div class="card-body">
                                    <form class="form-horizontal form-material" name="fu" action="infouser" method="post">
                                         <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">ID cá nhân</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text"  value="${sessionScope.employeeinfo.getEmployeename()}" class="form-control p-0 border-0" readonly=""> 
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Tên Đăng Nhập</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anEm.getEmployeename()}" name="uname"
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
                                                <input type="text" value="${requestScope.anEm.firstName}" name="fname"
                                                       class="form-control p-0 border-0" required> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Tên</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text" value="${requestScope.anEm.lastName}" name="lname"
                                                       class="form-control p-0 border-0" required> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label for="example-email" class="col-md-12 p-0">Email</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="email" value="${requestScope.anEm.email}" name="email"
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
                                                <input type="text" value="${requestScope.anEm.phoneNumber}" name="phone"
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
                                                <input type="text" value="${requestScope.anEm.address}" name="address"
                                                       class="form-control p-0 border-0" required> </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <label class="col-md-12 p-0">Vai trò quản trị viên</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input type="text"  value="${requestScope.anEm.role}" class="form-control p-0 border-0" readonly=""> 
                                            </div>
                                        </div>
                                        <div class="form-group mb-4">
                                            <div class="col-sm-12">
                                                <button class="btn btn-success">Thay đổi thông tin cá nhân</button>

                                            </div>
                                        </div>

                                    </form>
                                    <!--form doi mat khau-->
                                    <form>
                                        <div class="form-group mb-4 hidden" id="password-group">
                                            <label class="col-md-12 p-0">Mật Khẩu</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input id="current-password" type="password" placeholder="*********" class="form-control p-0 border-0"
                                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                                       oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                                       oninput="this.setCustomValidity('')">
                                            </div>
                                        </div>

                                        <div class="form-group mb-4 hidden" id="new-password-group">
                                            <label class="col-md-12 p-0">Mật Khẩu Mới</label>
                                            <div class="col-md-12 border-bottom p-0">
                                                <input id="new-password"  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
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
