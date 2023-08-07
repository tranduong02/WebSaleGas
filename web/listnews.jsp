<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.*" %>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
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
        <style>
            /* Định dạng cho thẻ div có lớp "addnews" */
            .addnews {
                display: inline-block; /* Hiển thị dưới dạng khối, nhưng không chiếm toàn bộ hàng */
                background-color: #67c2ef; /* Màu nền xanh Facebook */
                padding: 5px 10px; /* Khoảng cách lề bên trong */
                border-radius: 5px; /* Bo góc để tạo hình vuông */
            }

            /* Định dạng cho thẻ a (nút Add News) */
            .addnews a {
                text-decoration: none; /* Loại bỏ gạch chân mặc định */
                color: white; /* Màu chữ trắng */
            }
        </style>


    </head>
    <% 
        NewsDAO nd = new NewsDAO();
        List<News> list = nd.getNews();
        %>
    <body>


        <!-- Right Panel -->
        <%@include file="component/leftpanel.jsp" %>
        <div id="right-panel" class="right-panel">
            <div class="breadcrumbs">
                <div class="breadcrumbs-inner">
                    <div class="row m-0">                      
                    </div>
                </div>
            </div>

            <div class="content">
                <div class="animated fadeIn">    
                    <div class="addnews"> <a href="addnews.jsp">Add News</a> <li class="fa fa-plus"></li> </div>         
                    <div class="">
                        <div class="card">
                            <div class="card-header">
                                <strong class="card-title">List News</strong>
                            </div>
                            <% String msg = (String) request.getAttribute("msg");
                            if(msg != null){%>
                            <div class="card-header">
                                <h4><%= msg%></h4>
                                <%}%>
                            </div>
                            <div class="card-body">
                                <table class="table">
                                    <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Tagname</th>
                                            <th scope="col">Title</th>
                                            <th scope="col">Visible</th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% for(News n : list){%>
                                        <tr>
                                            <th scope="row"><%= n.getNewsId()%></th>
                                            <td><%= n.getTagname()%></td>
                                            <td><%= n.getNewsTitle()%></td>
                                            <td>
                                                <% if(n.isIsVisible()){%>
                                                <p>Yes</p>
                                                <%}
                                                else{%>
                                                <p>No</p>
                                                <%}%>
                                            </td>
                                            <td><li class=" fa fa-pencil-square-o" onclick="Update('<%= n.getNewsId()%>')"></li>&emsp;<li class="fa fa-trash-o" onclick="Delete('<%= n.getNewsId()%>')"></li></td>
                                    </tr>   
                                    <%}%>
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>
                </div><!-- .animated -->
            </div><!-- .content -->

            <div class="clearfix"></div>
        </div><!-- /#right-panel -->

        <!-- Right Panel -->
        <script>
           function Update(NewsId){
               window.location.href= "updateNew?newId="+NewsId;
           };
           function Delete(NewsId){
               window.location.href= "deleteNew?newId="+NewsId;
           };
        </script>


    </body>

</html>