<!doctype html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dal.*" %>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
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
    <%
        News n = (News) request.getAttribute("news");
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



                    <div class="">
                        <div class="card">
                            <div class="card-header">
                                <strong>Update New</strong> 
                            </div>

                            <form action="updateNew" method="post" enctype="multipart/form-data" class="form-horizontal">
                                <input type="text" name="id" value="<%= n.getNewsId()%>" style="display: none;">
                                <div class="card-body card-block">
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="text-input" class=" form-control-label">New Title</label></div>
                                        <div class="col-12 col-md-9"><input type="text" id="text-input" name="title" value="<%= n.getNewsTitle()%>" class="form-control"></div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="select" class=" form-control-label">Tagname</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="tagname" id="select" class="form-control">
                                                <option value="<%= n.getTagname()%>"><%= n.getTagname()%></option>
                                                <% NewsDAO nd = new NewsDAO();
                                                    List<String> listtag = nd.getTagName();
                                                    for(String s : listtag){
                                                %>
                                                <option value="<%= s%>"><%= s%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="select" class=" form-control-label">New Parent</label></div>
                                        <div class="col-12 col-md-9">
                                            <select name="parent" id="select" class="form-control">
                                                <option value="<%= n.getNewParentId()%>"><%= nd.getTitleByID(n.getNewParentId())%></option>
                                                <% 
                                                    List<Integer> listid = nd.getNewId();
                                                    for(Integer in : listid){
                                                %>
                                                <option value="<%= in%>"><%= nd.getTitleByID(in)%></option>
                                                <%}%>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="textarea-input" class=" form-control-label">New Content</label></div>
                                        <div class="col-12 col-md-9"><textarea name="content" id="textarea-input" rows="9" class="form-control"><%= n.getNewsContent()%></textarea></div>
                                    </div>

                                    <div class="row form-group">
                                        <div class="col col-md-3"><label class=" form-control-label">Visible</label></div>
                                        <div class="col col-md-9">
                                            <div class="form-check">
                                                <div class="radio">
                                                    <label for="radio1" class="form-check-label ">
                                                        <input type="radio" id="radio1" name="visibale" value="1" class="form-check-input" checked>Yes
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label for="radio2" class="form-check-label ">
                                                        <input type="radio" id="radio2" name="visibale" value="0" class="form-check-input">No
                                                    </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-input" class=" form-control-label">File input</label></div>
                                        <div class="col-12 col-md-9">
                                                <img id="preview" src="#" alt="Ảnh của bạn">
                                                <input type="file" id="file-input" name="image" class="form-control-file" onchange="showImage(this);">
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
                                                            };
                                                            // Đọc nội dung của file dưới dạng URL
                                                            reader.readAsDataURL(input.files[0]);
                                                        }
                                                    }
                                                </script>
                                            </div>
                                    </div>
                                    <div class="row form-group">
                                        <div class="col col-md-3"><label for="file-multiple-input" class=" form-control-label">Multiple File input</label></div>
                                        <div class="col-12 col-md-9"><input type="file" id="file-multiple-input" name="file-multiple-input" multiple="" class="form-control-file"></div>
                                    </div>

                                </div>
                                <div class="card-footer">
                                    <input type="submit" class="btn btn-primary btn-sm">
                                    <i class="fa fa-dot-circle-o" value="Submit"></i> 

                                    <button type="reset" class="btn btn-danger btn-sm">
                                        <i class="fa fa-ban"></i> Reset
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>

                </div>



            </div><!-- .animated -->
        </div><!-- .content -->

        <div class="clearfix"></div>  
    </div><!-- /#right-panel -->

    <!-- Right Panel -->

</body>
</html>
