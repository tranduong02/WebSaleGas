<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Recover Password</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" type="image/png" href="assets/images/icon/favicon.ico">
        <link rel="stylesheet" href="css/cssresetpass/bootstrap.min.css">
        <link rel="stylesheet" href="css/cssresetpass/font-awesome.min.css">
        <link rel="stylesheet" href="css/cssresetpass/themify-icons.css">
        <link rel="stylesheet" href="css/cssresetpass/metisMenu.css">
        <link rel="stylesheet" href="css/cssresetpass/owl.carousel.min.css">
        <link rel="stylesheet" href="css/cssresetpass/slicknav.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <!-- amchart css -->
        <link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
        <!-- others css -->
        <link rel="stylesheet" href="css/cssresetpass/typography.css">
        <link rel="stylesheet" href="css/cssresetpass/default-css.css">
        <link rel="stylesheet" href="css/cssresetpass/styles.css">
        <link rel="stylesheet" href="css/cssresetpass/responsive.css">
        <!-- modernizr css -->
        <script src="js/jsresetpass/modernizr-2.8.3.min.js"></script>
    </head>

    <body>
        <!--[if lt IE 8]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
            <![endif]-->
        <!-- preloader area start -->
        <div id="preloader">
            <div class="loader"></div>
        </div>
        <!-- preloader area end -->
        <!-- login area start -->
        <div class="login-area">
            <div class="container">
                <div class="login-box ptb--100">
                    <form name="fr" action="resetpass" method="post">
                        <div class="login-form-head">
                             <div class="login-logo">
                                <a href="home">
                                    <img src="images/logo.png" alt="Gas">
                                </a>
                            </div>
                            <h4>Reset Password</h4>
                        </div>
                        <div class="login-form-body">
                            <div class="form-gp">
                                <label for="password1">Mật Khẩu Mới</label>
                                <input type="password" id="password1" class="lock" name="pass"                                   
                                       pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                                       oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                                       oninput="this.setCustomValidity('')" required="">
                                <i class="far fa-key"></i>
                            </div>
                            <div class="form-gp">
                                <label for="exampleInputPassword2">Nhập Lại Mật Khẩu</label>
                                <input type="password" id="password2" class="lock" name="pswd" required="">
                                <i class="far fa-key"></i>
                            </div>
                            <div class="submit-btn-area mt-5">
                                <button id="form_submit" type="submit">Reset <i class="ti-arrow-right"></i></button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- login area end -->

        <!-- jquery latest version -->
        <script src="js/jsresetpass/jquery-2.2.4.min.js"></script>
        <!-- bootstrap 4 js -->
        <script src="js/jsresetpass/popper.min.js"></script>
        <script src="js/jsresetpass/bootstrap.min.js"></script>
        <script src="js/jsresetpass/owl.carousel.min.js"></script>
        <script src="js/jsresetpass/metisMenu.min.js"></script>
        <script src="js/jsresetpass/jquery.slimscroll.min.js"></script>
        <script src="js/jsresetpass/jquery.slicknav.min.js"></script>

        <!-- others plugins -->
        <script src="js/jsresetpass/plugins.js"></script>
        <script src="js/jsresetpass/scripts.js"></script>
    </body>
    <script type="text/javascript">
        window.onload = function () {
            document.getElementById("password1").onchange = validatePassword;
            document.getElementById("password2").onchange = validatePassword;
        };
        function validatePassword() {
            var pass2 = document.getElementById("password2").value;
            var pass1 = document.getElementById("password1").value;
            if (pass1 !== pass2)
                document.getElementById("password2").setCustomValidity("Passwords Don't Match");
            else
                document.getElementById("password2").setCustomValidity('');
            //empty string means no validation error
        }
    </script>
</html>