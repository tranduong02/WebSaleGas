<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Lock</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/font-awesome.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/owl.carousel.css">
    <link rel="stylesheet" href="../css/csslock/owl.theme.css">
    <link rel="stylesheet" href="../css/csslock/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/normalize.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/main.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/metisMenu.min.css">
    <link rel="stylesheet" href="../css/csslock/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/fullcalendar.min.css">
    <link rel="stylesheet" href="../css/csslock/fullcalendar.print.min.css">
    <!-- forms CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/all-type-forms.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="../css/csslock/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="../js/jslock/modernizr-2.8.3.min.js"></script>
</head>

<body>
    <!--[if lt IE 8]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
        <![endif]-->


    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="back-link back-backend">
                    <a href="index.html" class="btn btn-primary">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                <div class="hpanel">
                    <div class="panel-body text-center lock-inner">
                        <i class="fa fa-lock" aria-hidden="true"></i>
                        <br/>
                        <h4><span class="text-success" id="hn"></span> <strong id="dn"></strong></h4>
                        <p>Your are in lock screen. Main app was shut down and you need to enter your passwor to go back to app.</p>
                        <form action="#" class="m-t">
                            <div class="form-group">
                                <input type="password" required="" placeholder="******" class="form-control">
                            </div>
                            <button class="btn btn-primary block full-width" type="submit">Unlock</button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12"></div>
        </div>
        <div class="row">
            <div class="col-md-12 col-md-12 col-sm-12 col-xs-12 text-center login-footer">
                <p>Copyright Â© 2018 <a href="https://colorlib.com/wp/templates/">Colorlib</a> All rights reserved.</p>
            </div>
        </div>
    </div>
    <!-- jquery
		============================================ -->
    <script src="../js/jslock/jquery-1.12.4.min.js"></script>
    <!-- bootstrap JS
		============================================ -->
    <script src="../js/jslock/bootstrap.min.js"></script>
    <!-- wow JS
		============================================ -->
    <script src="../js/jslock/wow.min.js"></script>
    <!-- price-slider JS
		============================================ -->
    <script src="../js/jslock/jquery-price-slider.js"></script>
    <!-- meanmenu JS
		============================================ -->
    <script src="../js/jslock/jquery.meanmenu.js"></script>
    <!-- owl.carousel JS
		============================================ -->
    <script src="../js/jslock/owl.carousel.min.js"></script>
    <!-- sticky JS
		============================================ -->
    <script src="../js/jslock/jquery.sticky.js"></script>
    <!-- scrollUp JS
		============================================ -->
    <script src="../js/jslock/jquery.scrollUp.min.js"></script>
    <!-- mCustomScrollbar JS
		============================================ -->
    <script src="../js/jslock/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="../js/jslock/mCustomScrollbar-active.js"></script>
    <!-- metisMenu JS
		============================================ -->
    <script src="../js/jslock/metisMenu.min.js"></script>
    <script src="../js/jslock/metisMenu-active.js"></script>
    <!-- tab JS
		============================================ -->
    <script src="../js/jslock/tab.js"></script>
    <!-- icheck JS
		============================================ -->
    <script src="../js/jslock/icheck.min.js"></script>
    <script src="../js/jslock/icheck-active.js"></script>
    <!-- plugins JS
		============================================ -->
    <script src="../js/jslock/plugins.js"></script>
    <!-- main JS
		============================================ -->
    <script src="../js/jslock/main.js"></script>
    <script>
   var today = new Date();
   var date ="---Date: " + today.getDate()+' - '+(today.getMonth()+1)+' - '+today.getFullYear();
   var time ="Time: " + today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();

   document.getElementById("hn").innerHTML = time;
   document.getElementById("dn").innerHTML = date;
</script>
</body>

</html>