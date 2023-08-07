<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html dir="ltr" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!-- Tell the browser to be responsive to screen width -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Admin</title>

        <link rel="canonical" href="https://www.wrappixel.com/templates/ample-admin-lite/" />
        <!-- Favicon icon -->
        <link rel="icon" type="image/png" sizes="16x16" href="plugins/images/favicon.png">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />

        <!-- main CSS -->
        <link href="css/cssdashboard/style.min.css" rel="stylesheet">

        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <script type="text/javascript">
            google.charts.load('current', {'packages': ['corechart']});
            google.charts.setOnLoadCallback(drawChart);

            function drawChart() {
                var data = google.visualization.arrayToDataTable([
                    ['Date', 'Money'],

            <c:forEach items="${requestScope.datachart}" var="dc">
                    ['${dc.date}',${dc.money}],
            </c:forEach>
                ]);

                var options = {
                    title: 'VND',
                    //              curveType: 'function',
                    legend: {position: 'bottom'}
                };

                var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

                chart.draw(data, options);
            }
        </script>
        <style>
            .used-icon {
                font-size: 24px;
                color: red; /* Thay đổi màu ở đây */
                margin-right: 10px;
            }
            .using-icon{
                font-size: 24px;
                color: blue; /* Thay đổi màu ở đây */
                margin-right: 10px;
            }
            .new-user-icon{
                font-size: 24px;
                color: greenyellow; /* Thay đổi màu ở đây */
                margin-right: 10px;
            }
             /* CSS cho modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .modal-content {
            background-color: #fff;
            margin: 15% auto;
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
        }
        </style>
        
    </head>

    <body>
        <!-- ============================================================== -->
        <!-- Preloader - style you can find in spinners.css -->
        <!-- ============================================================== -->
        
        <!-- ============================================================== -->
        <!-- Main wrapper - style you can find in pages.scss -->
        <!-- ============================================================== -->
        <%@include file="component/leftpanel.jsp" %>
        <div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5" data-sidebartype="full"
             data-sidebar-position="absolute" data-header-position="absolute" data-boxed-layout="full">
            <aside class="left-sidebar" data-sidebarbg="skin6">
            </aside>
<div class="modal" id="notificationModal">
        <div class="modal-content">
            <div id="notificationContainer"></div>
            <audio id="notificationSound">
                <source src="sound\Minions.mp3" type="audio/mpeg">
            </audio>
        </div>
    </div>
            <div class="page-wrapper">
                <div class="page-breadcrumb bg-white">
                    <div class="row align-items-center">
                        <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">

                        </div>
                        <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12">
                            <div class="d-md-flex">
                                <ol class="breadcrumb ms-auto">
                                    <li><p class="page-title">Dashboard</p></li>
                                </ol>

                            </div>
                        </div>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- Container fluid  -->
                <!-- ============================================================== -->
                <div class="container-fluid">
                    <!-- ============================================================== -->

                    <!-- Three charts -->
                    <!-- ============================================================== -->
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title"><a href="liststatisticuser?status=0">Khách hàng mới </a></h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <i class="new-user-icon fas fa-user-plus"></i>
                                    <li>
                                        <div id="sparklinedash"><canvas width="67" height="30"
                                                                        style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-success">${requestScope.quantityNewUser}</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title"><a href="liststatisticuser?status=1">Khách Hàng Đang Sử Dụng</a></h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <i class="using-icon fas fa-user-check"></i>
                                    <li>
                                        <div id="sparklinedash2"><canvas width="67" height="30"
                                                                         style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-purple">${requestScope.quantityUsingUser}</span></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="white-box analytics-info">
                                <h3 class="box-title"><a href="liststatisticuser?status=2">Khách Hàng Đã Sử Dụng   </a></h3>
                                <ul class="list-inline two-part d-flex align-items-center mb-0">
                                    <i class="used-icon fas fa-user-slash"></i>
                                    <li>
                                        <div id="sparklinedash3"><canvas width="67" height="30"
                                                                         style="display: inline-block; width: 67px; height: 30px; vertical-align: top;"></canvas>
                                        </div>
                                    </li>
                                    <li class="ms-auto"><span class="counter text-info">${requestScope.quantityUsedUser}</span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- PRODUCTS YEARLY SALES -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <div class="white-box">
                                <h3 class="box-title"><a href="statisticproduct">Doanh Số</a></h3>
                                <div id="curve_chart" style="width: 100%; height: 500px"></div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- RECENT SALES -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="white-box">
                                <div class="d-md-flex mb-3">
                                    <h3 class="box-title mb-0">Recent sales</h3>
                                    <div class="col-md-3 col-sm-4 col-xs-6 ms-auto">
                                        <select class="form-select shadow-none row border-top">
                                            <option>March 2021</option>
                                            <option>April 2021</option>
                                            <option>May 2021</option>
                                            <option>June 2021</option>
                                            <option>July 2021</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="table-responsive">
                                    <table class="table no-wrap">
                                        <thead>
                                            <tr>
                                                <th class="border-top-0">#</th>
                                                <th class="border-top-0">Name</th>
                                                <th class="border-top-0">Status</th>
                                                <th class="border-top-0">Date</th>
                                                <th class="border-top-0">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1</td>
                                                <td class="txt-oflo">Elite admin</td>
                                                <td>SALE</td>
                                                <td class="txt-oflo">April 18, 2021</td>
                                                <td><span class="text-success">$24</span></td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td class="txt-oflo">Real Homes WP Theme</td>
                                                <td>EXTENDED</td>
                                                <td class="txt-oflo">April 19, 2021</td>
                                                <td><span class="text-info">$1250</span></td>
                                            </tr>
                                            <tr>
                                                <td>3</td>
                                                <td class="txt-oflo">Ample Admin</td>
                                                <td>EXTENDED</td>
                                                <td class="txt-oflo">April 19, 2021</td>
                                                <td><span class="text-info">$1250</span></td>
                                            </tr>
                                            <tr>
                                                <td>4</td>
                                                <td class="txt-oflo">Medical Pro WP Theme</td>
                                                <td>TAX</td>
                                                <td class="txt-oflo">April 20, 2021</td>
                                                <td><span class="text-danger">-$24</span></td>
                                            </tr>
                                            <tr>
                                                <td>5</td>
                                                <td class="txt-oflo">Hosting press html</td>
                                                <td>SALE</td>
                                                <td class="txt-oflo">April 21, 2021</td>
                                                <td><span class="text-success">$24</span></td>
                                            </tr>
                                            <tr>
                                                <td>6</td>
                                                <td class="txt-oflo">Digital Agency PSD</td>
                                                <td>SALE</td>
                                                <td class="txt-oflo">April 23, 2021</td>
                                                <td><span class="text-danger">-$14</span></td>
                                            </tr>
                                            <tr>
                                                <td>7</td>
                                                <td class="txt-oflo">Helping Hands WP Theme</td>
                                                <td>MEMBER</td>
                                                <td class="txt-oflo">April 22, 2021</td>
                                                <td><span class="text-success">$64</span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ============================================================== -->
                    <!-- Recent Comments -->
                    <!-- ============================================================== -->
                    <div class="row">
                        <!-- .col -->
                        <div class="col-md-12 col-lg-8 col-sm-12">
                            <div class="card white-box p-0">
                                <div class="card-body">
                                    <h3 class="box-title mb-0">Recent Comments</h3>
                                </div>
                                <div class="comment-widgets">
                                    <!-- Comment Row -->
                                    <div class="d-flex flex-row comment-row p-3 mt-0">
                                        <div class="p-2"><img src="plugins/images/users/varun.jpg" alt="user" width="50" class="rounded-circle"></div>
                                        <div class="comment-text ps-2 ps-md-3 w-100">
                                            <!--<div id="notificationContainer"></div>-->
                                            <span class="mb-3 d-block" id="notificationContainer"></span>
                                            <div class="comment-footer d-md-flex align-items-center">
                                                <span class="badge bg-primary rounded">Pending</span>

                                                <div class="text-muted fs-2 ms-auto mt-2 mt-md-0" id="time-notificationContainer"></div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Comment Row -->
                                    <!--                                    <div class="d-flex flex-row comment-row p-3">
                                                                            <div class="p-2"><img src="plugins/images/users/genu.jpg" alt="user" width="50" class="rounded-circle"></div>
                                                                            <div class="comment-text ps-2 ps-md-3 active w-100">
                                                                                <h5 class="font-medium">Michael Jorden</h5>
                                                                                <span class="mb-3 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry.It has survived not only five centuries. </span>
                                                                                <div class="comment-footer d-md-flex align-items-center">
                                    
                                                                                    <span class="badge bg-success rounded">Approved</span>
                                    
                                                                                    <div class="text-muted fs-2 ms-auto mt-2 mt-md-0">April 14, 2021</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
                                    <!-- Comment Row -->
                                    <!--                                    <div class="d-flex flex-row comment-row p-3">
                                                                            <div class="p-2"><img src="plugins/images/users/ritesh.jpg" alt="user" width="50" class="rounded-circle"></div>
                                                                            <div class="comment-text ps-2 ps-md-3 w-100">
                                                                                <h5 class="font-medium">Johnathan Doeting</h5>
                                                                                <span class="mb-3 d-block">Lorem Ipsum is simply dummy text of the printing and type setting industry.It has survived not only five centuries. </span>
                                                                                <div class="comment-footer d-md-flex align-items-center">
                                    
                                                                                    <span class="badge rounded bg-danger">Rejected</span>
                                    
                                                                                    <div class="text-muted fs-2 ms-auto mt-2 mt-md-0">April 14, 2021</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>-->
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 col-sm-12">
                            <div class="card white-box p-0">
                                <div class="card-heading">
                                    <h3 class="box-title mb-0">Chat Listing</h3>
                                </div>
                                <div class="card-body">
                                    <ul class="chatonline">
                                        <li>
                                            <div class="call-chat">
                                                <button class="btn btn-success text-white btn-circle btn" type="button">
                                                    <i class="fas fa-phone"></i>
                                                </button>
                                                <button class="btn btn-info btn-circle btn" type="button">
                                                    <i class="far fa-comments text-white"></i>
                                                </button>
                                            </div>
                                            <a href="javascript:void(0)" class="d-flex align-items-center"><img
                                                    src="plugins/images/users/varun.jpg" alt="user-img" class="img-circle">
                                                <div class="ms-2">
                                                    <span class="text-dark">Varun Dhavan <small
                                                            class="d-block text-success d-block">online</small></span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="call-chat">
                                                <button class="btn btn-success text-white btn-circle btn" type="button">
                                                    <i class="fas fa-phone"></i>
                                                </button>
                                                <button class="btn btn-info btn-circle btn" type="button">
                                                    <i class="far fa-comments text-white"></i>
                                                </button>
                                            </div>
                                            <a href="javascript:void(0)" class="d-flex align-items-center"><img
                                                    src="plugins/images/users/genu.jpg" alt="user-img" class="img-circle">
                                                <div class="ms-2">
                                                    <span class="text-dark">Genelia
                                                        Deshmukh <small class="d-block text-warning">Away</small></span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="call-chat">
                                                <button class="btn btn-success text-white btn-circle btn" type="button">
                                                    <i class="fas fa-phone"></i>
                                                </button>
                                                <button class="btn btn-info btn-circle btn" type="button">
                                                    <i class="far fa-comments text-white"></i>
                                                </button>
                                            </div>
                                            <a href="javascript:void(0)" class="d-flex align-items-center"><img
                                                    src="plugins/images/users/ritesh.jpg" alt="user-img" class="img-circle">
                                                <div class="ms-2">
                                                    <span class="text-dark">Ritesh
                                                        Deshmukh <small class="d-block text-danger">Busy</small></span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="call-chat">
                                                <button class="btn btn-success text-white btn-circle btn" type="button">
                                                    <i class="fas fa-phone"></i>
                                                </button>
                                                <button class="btn btn-info btn-circle btn" type="button">
                                                    <i class="far fa-comments text-white"></i>
                                                </button>
                                            </div>
                                            <a href="javascript:void(0)" class="d-flex align-items-center"><img
                                                    src="plugins/images/users/arijit.jpg" alt="user-img" class="img-circle">
                                                <div class="ms-2">
                                                    <span class="text-dark">Arijit
                                                        Sinh <small class="d-block text-muted">Offline</small></span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="call-chat">
                                                <button class="btn btn-success text-white btn-circle btn" type="button">
                                                    <i class="fas fa-phone"></i>
                                                </button>
                                                <button class="btn btn-info btn-circle btn" type="button">
                                                    <i class="far fa-comments text-white"></i>
                                                </button>
                                            </div>
                                            <a href="javascript:void(0)" class="d-flex align-items-center"><img
                                                    src="plugins/images/users/govinda.jpg" alt="user-img"
                                                    class="img-circle">
                                                <div class="ms-2">
                                                    <span class="text-dark">Govinda
                                                        Star <small class="d-block text-success">online</small></span>
                                                </div>
                                            </a>
                                        </li>
                                        <li>
                                            <div class="call-chat">
                                                <button class="btn btn-success text-white btn-circle btn" type="button">
                                                    <i class="fas fa-phone"></i>
                                                </button>
                                                <button class="btn btn-info btn-circle btn" type="button">
                                                    <i class="far fa-comments text-white"></i>
                                                </button>
                                            </div>
                                            <a href="javascript:void(0)" class="d-flex align-items-center"><img
                                                    src="plugins/images/users/hritik.jpg" alt="user-img" class="img-circle">
                                                <div class="ms-2">
                                                    <span class="text-dark">John
                                                        Abraham<small class="d-block text-success">online</small></span>
                                                </div>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.col -->
                    </div>
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
        <!-- ============================================================== -->
        <!-- All Jquery -->
        <!-- ============================================================== -->
        <script src="js/jsdashboard/jquery.min.js"></script>
        <!-- Bootstrap tether Core JavaScript -->
        <script src="js/jsdashboard/bootstrap.bundle.min.js"></script>
        <script src="js/jsdashboard/app-style-switcher.js"></script>
        <script src="js/jsdashboard/jquery.sparkline.min.js"></script>
        <!--Wave Effects -->
        <script src="js/jsdashboard/waves.js"></script>
        <!--Menu sidebar -->
        <script src="js/jsdashboard/sidebarmenu.js"></script>
        <!--Custom JavaScript -->
        <script src="js/jsdashboard/custom.js"></script>
        <!--This page JavaScript -->
        <!--chartis chart-->
        <script src="js/jsdashboard/dashboard1.js"></script>

        <script>
         var socket = new WebSocket("ws://localhost:9999/salegas/notification");
        var notificationContainer = document.getElementById("notificationContainer");
        var notificationSound = document.getElementById("notificationSound");
        var notificationModal = document.getElementById("notificationModal");
        var notificationCount = 0;

        socket.onopen = function (event) {
            console.log("WebSocket connection opened.");
        };

        socket.onmessage = function (event) {
            var message = event.data;
            saveNotification(message);

            var notificationElement = document.createElement('div');
            notificationElement.textContent = message;
            notificationElement.onclick = function () {
                viewOrderDetails(message);
            };
            notificationContainer.appendChild(notificationElement);

            notificationSound.play();
            notificationModal.style.display = "block";

            notificationCount++;
            updateNotificationCount();
        };

        socket.onclose = function (event) {
            console.log("WebSocket connection closed.");
        };

        function saveNotification(message) {
            // Lưu trữ thông báo vào Local Storage (nếu cần)
        }

        function updateNotificationCount() {
            // Cập nhật số lượng thông báo (nếu có)
        }

        function viewOrderDetails(orderId) {
            // Điều hướng đến trang đơn hàng chi tiết với orderId
            window.location.href = "statisticorder?status=1";
        }
        </script>
    </body>

</html>