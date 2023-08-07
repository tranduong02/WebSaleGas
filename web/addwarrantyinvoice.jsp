<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--[if lt IE 7]>      <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang=""> <![endif]-->
<!--[if IE 7]>         <html class="no-js lt-ie9 lt-ie8" lang=""> <![endif]-->
<!--[if IE 8]>         <html class="no-js lt-ie9" lang=""> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang=""> <!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Ela Admin - HTML5 Admin Template</title>
        <meta name="description" content="Ela Admin - HTML5 Admin Template">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
        <link rel="stylesheet" href="assets/css/style.css">

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
                                        <li><a href="#">Forms</a></li>
                                        <li class="active">Basic</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="animated fadeIn">
                    <div class="card">
                        <div class="card-header">
                            <strong>Basic Form</strong>
                        </div>
                        <div class="card-body card-block">
                            <form action="addwarrantyinvoice" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Họ:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="firstName" value="${requestScope.firstName}" class="form-control" required=""><small class="form-text text-muted">Họ khách hàng.</small></div>
                                </div>
                                    <input hidden="" value="${requestScope.orderID}" name="orderID">
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Tên:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="lastName" value="${requestScope.lastName}" class="form-control" required=""><small class="form-text text-muted">Tên khách hàng.</small></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">Tên sản phẩm:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input" name="productName"  disabvalue="" value="${requestScope.productName}" ed="" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">Mã sản phẩm:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input" name="productID"  value="${requestScope.productID}" disabled="" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">Ngày mua sản phẩm:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input" name="orderDate" value="${requestScope.orderDate}" disabled="" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">Thời gian bảo hành:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input" name="warrantyPeriod" value="${requestScope.warrantyPeriod}" disabled="" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="disabled-input" class=" form-control-label">Chính sách bảo hành:</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="disabled-input" name="warrantyCategory" value="${requestScope.warrantyCategory}" disabled="" class="form-control"></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Ngày bảo dưỡng:</label></div>
                                    <div class="col-12 col-md-9"><input type="date" name="maintenanceDate" ><small class="form-text text-muted">Ngày khách đưa sản phẩm đến bảo dưỡng.</small></div>
                                </div>
                                <div class="row form-group"> 
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label">Ngày hẹn lấy hàng:</label></div>
                                    <div class="col-12 col-md-9"><input type="date" name="appointmentDate"><small class="form-text text-muted">Ngày hẹn khách trở lại lấy sản phẩm.</small></div>
                                </div>

                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">Mô tả</label></div>
                                    <div class="col-12 col-md-9"><textarea name="describe" id="textarea-input" rows="9" placeholder="Tình trạng sản phẩm..." class="form-control"></textarea></div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="select" class=" form-control-label">Trạng thái</label></div>
                                    <div class="col-12 col-md-9">
                                        <select name="status" id="select" class="form-control">
                                            <option value="1">Đặt lịch</option>
                                            <option value="2">Đang sửa chữa</option>
                                            <option value="3">Hoàn thành</option>
                                            <option value="4">Khách hàng không quay lại</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col col-md-3"><label for="text-input" class=" form-control-label"> Chi phí sửa chữa</label></div>
                                    <div class="col-12 col-md-9"><input type="text" id="text-input" name="money" class="form-control"><small class="form-text text-muted">Chi phí sửa chữa của sản phẩm.</small></div>
                                </div>
                                <div class="card-footer row">
                                    <button type="reset" class="btn btn-danger btn-sm">
                                        <i class="fa fa-ban col-2"></i><strong>Nhập Lại</strong>
                                    </button>
                                    <button type="submit" class="btn btn-success btn-sm">
                                        <i class="fa fa-dot-circle-o col-2"></i><strong>Hoàn Tất</strong>
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>
                </div><!-- .animated -->
            </div><!-- .content -->
          

            <div class="clearfix"></div>
        </div><!-- /#right-panel -->
        
       
        <!-- Right Panel -->
    </body>
</html>
