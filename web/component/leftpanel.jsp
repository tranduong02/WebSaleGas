<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ela Admin - HTML5 Admin Template</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
        <link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" integrity="sha512-..." crossorigin="anonymous" />

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/custom.css">


    </head>

    <body>
        <!-- Left Panel -->
        <aside id="left-panel" class="left-panel">
            <nav class="navbar navbar-expand-sm navbar-default">
                <div id="main-menu" class="main-menu collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active">
                            <a href="dashboard"><i class="menu-icon fa fa-tachometer"></i>Dashboard </a>
                        </li>
                        <li class="menu-title">Quản Trị Viên</li><!-- /.menu-title -->
                        <li>
                            <a href="addadmin.jsp"> <i class="menu-icon fas fa-plus"></i>Thêm Quản Trị Viên</a>
                        </li>
                        <li>
                            <a href="widgets.html"> <i class="menu-icon fas fa-users"></i>Danh Sách Quản Trị Viên</a>
                        </li>
                        <li>
                            <a href="widgets.html"> <i class="menu-icon fas fa-user-cog"></i>Danh Sách QTV C1 </a>
                        </li>
                        <li>
                            <a href="widgets.html"> <i class="menu-icon fas fa-user"></i>Danh Sách QTV C2 </a>
                        </li>

                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
                                <i class="menu-icon fas fa-male"></i>Danh Sách QTV C3</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Tất Cả</a></li>
                                <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Danh Sách QTV Khách Hàng,Tin Tức</a></li>
                                <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Danh Sách QTV Sản Phẩm,Doanh Số</a></li>
                                <li><i class="fa fa-id-badge"></i><a href="ui-badges.html">Danh Sách QTV Đơn Hàng,Bảo Hành</a></li>
                            </ul>
                        </li>

                        <li class="menu-title">Khách Hàng,Tin Tức</li><!-- /.menu-title -->

                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-tasks"></i>Trạng Thái Khách Hàng</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="menu-icon fas fa-user-plus"></i><a href="liststatisticuser?status=0">Khách hàng mới</a></li>
                                <li><i class="menu-icon fas fa-user-check"></i><a href="liststatisticuser?status=1">Khách Hàng Đang Sử Dụng</a></li>
                                <li><i class="menu-icon fas fa-user-slash"></i><a href="liststatisticuser?status=2">Khách Hàng Đã Sử Dụng</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#"> <i class="menu-icon fas fa-headset"></i>Tư Vấn </a>
                        </li>
                        <li>
                            <a href="listnews"> <i class="menu-icon fa fa-calendar-o"></i>Tin Tức</a>
                        </li>
                          <li class="menu-title">Đối Tác</li><!-- /.menu-title -->
                          <li>
                            <a href="addsupplier"> <i class="menu-icon fas fa-handshake"></i>Thêm Đối Tác</a>
                        </li>
                        <li>
                            <a href="listsupplier"> <i class="menu-icon fas fa-briefcase"></i>Danh Sách Đối Tác</a>
                        </li>
                        <li class="menu-title">Sản Phẩm,Doanh Số</li><!-- /.menu-title -->
                        <li>
                            <a href="statisticproduct"> <i class="menu-icon fa fa-fire"></i>Sản Phẩm</a>
                        </li>
                        <li>
                            <a href="statisticproduct"> <i class="menu-icon fa fa-bar-chart-o"></i>Doanh Số</a>
                        </li>
                        
                        <li class="menu-title">Đơn Hàng,Bảo Hành</li><!-- /.menu-title -->
                         <li>
                            <a href="warrantymanagement"> <i class="menu-icon fa fa-cogs"></i>Quản Lý Bảo Hành</a>
                        </li>
                        <li class="menu-item-has-children dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="menu-icon fa fa-archive"></i>Quản Lý Đơn Hàng</a>
                            <ul class="sub-menu children dropdown-menu">
                                <li><i class="menu-icon fa fa-spinner"></i><a href="statisticorder?status=1">Đơn Hàng Chờ Xác Nhận</a></li>
                                <li><i class="menu-icon fa fa-edit"></i><a href="statisticorder?status=2">Đơn Hàng Đang Chuẩn Bị</a></li>
                                <li><i class="menu-icon fa fa-truck"></i><a href="statisticorder?status=3">Đơn Hàng Đang Vận Chuyển</a></li>
                                <li><i class="menu-icon fa fa-check-square-o"></i><a href="statisticorder?status=4">Đơn Hàng Đã Hoàn Thành</a></li>
                                <li><i class="menu-icon fa fa-warning"></i><a href="statisticorder?status=5">Đơn Hàng Bị Hủy</a></li>
                                <li><i class="menu-icon fa fa-cogs"></i><a href="statisticorder?status=5">Đơn Hàng Bảo Hành</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </nav>
        </aside>
        <!-- /#left-panel -->
        <!-- Right Panel -->
        <div id="right-panel" class="right-panel">
            <!-- Header-->
            <header id="header" class="header">
                <div class="top-left">
                    <div class="navbar-header">
                        <a class="navbar-brand" href="dashboard"><img src="images/logo-admin.png" alt="Logo"></a>
                        <a id="menuToggle" class="menutoggle"><i class="fa fa-bars"></i></a>
                    </div>
                </div>
                <div class="top-right">
                    <div class="header-menu">
                        <div class="header-left">
                            <button class="search-trigger"><i class="fa fa-search"></i></button>
                            <div class="form-inline">
                                <form class="search-form">
                                    <input class="form-control mr-sm-2" type="text" placeholder="Search ..." aria-label="Search">
                                    <button class="search-close" type="submit"><i class="fa fa-close"></i></button>
                                </form>
                            </div>

                            <div class="dropdown for-notification">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="notification" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-bell"></i>
                                    <span id="unreadCount" class="count bg-danger">3</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="notification">
                                    <p class="red">You have <span id="unreadNotificationCount">3</span> Notification</p>
                                    <a id="readNotification" class="dropdown-item media" href="#">
                                        <i class="fa fa-check"></i>
                                        <p>Server #1 overloaded.</p>
                                    </a>
                                    <a id="unreadNotification" class="dropdown-item media" href="#">
                                        <i class="fa fa-eye"></i>
                                        <p>Server #2 overloaded.</p>
                                    </a>
                                </div>
                            </div>


                            <div class="dropdown for-message">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="message" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fa fa-envelope"></i>
                                    <span class="count bg-primary">4</span>
                                </button>
                                <div class="dropdown-menu" aria-labelledby="message">
                                    <p class="red">You have 4 Mails</p>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/1.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Jonathan Smith</span>
                                            <span class="time float-right">Just now</span>
                                            <p>Hello, this is an example msg</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/2.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Jack Sanders</span>
                                            <span class="time float-right">5 minutes ago</span>
                                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/3.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Cheryl Wheeler</span>
                                            <span class="time float-right">10 minutes ago</span>
                                            <p>Hello, this is an example msg</p>
                                        </div>
                                    </a>
                                    <a class="dropdown-item media" href="#">
                                        <span class="photo media-left"><img alt="avatar" src="images/avatar/4.jpg"></span>
                                        <div class="message media-body">
                                            <span class="name float-left">Rachel Santos</span>
                                            <span class="time float-right">15 minutes ago</span>
                                            <p>Lorem ipsum dolor sit amet, consectetur</p>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="user-area dropdown">
                            <a href="#" class="dropdown-toggle active" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Name &nbsp;<i class="fas fa-hand-o-down"> </i>
                            </a>

                            <div class="user-menu dropdown-menu dropdown-menu-left">
                                <a class="nav-link" href="infoadmin"><i class="fas fa-user"></i>My Profile</a>
                                <a class="nav-link" href="#"><i class="fas fa-cog"></i>Settings</a>
                                <a class="nav-link" href="logout?logout=out"><i class="fas fa-sign-out-alt"></i>Logout</a>
                            </div>
                        </div>
                        <div class="user-area dropdown"></div>
                    </div>
            </header>
            <!-- /#header -->

            <div class="clearfix"></div>

        </div>
        <!-- /#right-panel -->

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
        <script src="assets/js/main.js"></script>
        <script src="assets/js/custom.js"></script>
        
<!--        <script >
            var socket = new WebSocket("ws://localhost:9999/salegas/notification");
            var notificationContainer = document.getElementById("notificationContainer");
            var notificationSound = document.getElementById("notificationSound");
            var unreadCount = document.getElementById("unreadCount");
            var unreadNotificationCount = document.getElementById("unreadNotificationCount");

            socket.onopen = function (event) {
                console.log("WebSocket connection opened.");
            };

            socket.onmessage = function (event) {
                var message = JSON.parse(event.data);
                var notification = document.createElement("div");
                notification.textContent = message.message;
                notificationContainer.appendChild(notification);

                // Phát âm thanh notification
                notificationSound.play();

                // Kiểm tra loại thanh toán và cập nhật thông báo tương ứng
                if (message.paymentMethod === 1) {
                    var unreadNotification = document.getElementById("unreadNotification");
                    unreadNotification.innerHTML = `
            <i class="fa fa-eye"></i>
            <p>${message.message}</p>
        `;
                    unreadNotification.classList.add("new-notification");

                    // Cập nhật số lượng thông báo chưa đọc
                    var currentCount = parseInt(unreadCount.textContent);
                    unreadCount.textContent = currentCount + 1;

                    // Cập nhật số lượng thông báo chưa đọc trong phần "You have X Notification"
                    unreadNotificationCount.textContent = currentCount + 1;
                } else if (message.paymentMethod === 2) {
                    var readNotification = document.getElementById("readNotification");
                    readNotification.innerHTML = `
            <i class="fa fa-check"></i>
            <p>${message.message}</p>
        `;
                }
            };

            socket.onclose = function (event) {
                console.log("WebSocket connection closed.");
            };

        </script>-->
    </body>
</html>
