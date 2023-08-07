<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <!-- Required meta tags-->
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="au theme template">
        <meta name="author" content="Hau Nguyen">
        <meta name="keywords" content="au theme template">

        <!-- Title Page-->
        <title>Forget Password</title>

        <!-- Fontfaces CSS-->
        <link href="../css/cssforgetpass/font-face.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/../css/cssforgetpass/font-awesome.min.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/fontawesome-all.min.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/material-design-iconic-font.min.css" rel="stylesheet" media="all">

        <!-- Bootstrap CSS-->
        <link href="../css/cssforgetpass/bootstrap.min.css" rel="stylesheet" media="all">

        <!-- Vendor CSS-->
        <link href="../css/cssforgetpass/animsition.min.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/animate.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/hamburgers.min.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/slick.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/select2.min.css" rel="stylesheet" media="all">
        <link href="../css/cssforgetpass/perfect-scrollbar.css" rel="stylesheet" media="all">

        <!-- Main CSS-->
        <link href="../css/cssforgetpass/theme.css" rel="stylesheet" media="all">

    </head>

    <body class="animsition">
        <div class="page-wrapper">
            <div class="page-content--bge5">
                <div class="container">
                    <div class="login-wrap">
                        <div class="login-content">
                            <div class="login-logo">
                                <a href="#">
                                    <img src="../images/logo.png" alt="Gas">
                                </a>
                            </div>
                            <div class="login-form">
                                <div class="error">
                                    ${requestScope.notfound}
                                </div>
                                <form action="" method="post">
                                    <div class="form-group">
                                        <label>Email Address</label>
                                        <input class="au-input au-input--full" type="email" name="email" placeholder="Email">
                                    </div>
                                    <button class="au-btn au-btn--block au-btn--green m-b-20" type="submit">submit</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Jquery JS-->
        <script src="../js/jsforgetpass/jquery-3.2.1.min.js"></script>
        <!-- Bootstrap JS-->
        <script src="../js/jsforgetpass/popper.min.js"></script>
        <script src="../js/jsforgetpass/bootstrap.min.js"></script>
        <!-- Vendor JS       -->
        <script src="../js/jsforgetpass/slick.min.js">
        </script>
        <script src="../js/jsforgetpass/wow.min.js"></script>
        <script src="../js/jsforgetpass/animsition.min.js"></script>
        <script src="../js/jsforgetpass/bootstrap-progressbar.min.js">
        </script>
        <script src="../js/jsforgetpass/jquery.waypoints.min.js"></script>
        <script src="../js/jsforgetpass/jquery.counterup.min.js">
        </script>
        <script src="../js/jsforgetpass/circle-progress.min.js"></script>
        <script src="../js/jsforgetpass/perfect-scrollbar.js"></script>
        <script src="../js/jsforgetpass/Chart.bundle.min.js"></script>
        <script src="../js/jsforgetpass/select2.min.js">
        </script>

        <!-- Main JS-->
        <script src="../js/jsforgetpass/main.js"></script>

    </body>

</html>
<!-- end document-->