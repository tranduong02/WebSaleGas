<%-- 
    Document   : listproducts
    Created on : May 26, 2023, 8:16:22 PM
    Author     : duykh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dal.*" %>
<%@page import="model.*" %>
<%@page import="java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>List Products</title>
        <link rel="stylesheet" href="css/style_listadmin.css">
        <link rel="stylesheet" href="css/listproducts.css">
    </head>
    <%
        ProductDAO pd = new ProductDAO();
        List<Product> list = pd.getAllProduct();
        String msg = (String) request.getAttribute("msg");
    %>
    <body>
        <div class="block2">
            <div class="top">
                <h4 style="color: #efece9;">WEBSITE SELL GAS STOVE & ACCESSORIES</h4>
                <div class="nav">
                    <a href="homeadmin"><img id="logo" style="width: 130px; height: 80px;" src="images/logo.png" alt=""></a>
                    <div class="nav_search">
                        <input class=" search " type="text" placeholder="Enter a keywords..." />
                        <button class="submit_search" type="submit"><i> Search</i></button>
                    </div>
                </div>

            </div>

        </div>

        <h1> <b>List of Products </b> </h1>
        <% if (msg != null) {%>
        <h3><%= msg%></h3>
        <%}%>
        <br>
        <br>
        <!--for demo wrap-->
        <div id="nav">
            <button id="addproduct">
                <a class="nav-link" style="text-decoration: none; color: aliceblue; font-size: 17px;" href="addproduct">
                    <i class="fas fa-shopping-cart"></i>
                    <h3>Add Products</h3>
                </a>
            </button>
            <div class="dropdown"> 
                <button class="dropbtn">All Product</button>
                <div class="dropdown-content">
                    <a href="listproduct">All Product</a>
                    <%-- <c:forEach items="${requestScope.datac}" var="dc">
                    <a href="listproduct?categoryID=${dc.categoryID}">${dc.categoryName}</a>
                    </c:forEach> --%>
                    <a href="#">Gas Stove</a>
                    <a href="#">Gas</a>
                    <a href="#">Accessories</a>
                </div>
            </div>
        </div>
        <div class="tbl-header">
            <table cellpadding="0" cellspacing="0" border="0">
                <thead>
                    <tr>
                        <th><b>Image</b></th>
                        <th><b>ID Product</b></th>
                        <th><b>Name Product</b></th>
                        <th><b>Category</b></th>
                        <th><b>Price</b></th>
                        <th><b>Quantity</b></th>
                        <th><b></b></th>
                    </tr>
                </thead>
            </table>
        </div>
        <div class="tbl-content">
            <table cellpadding="0" cellspacing="0" border="0">
                <tbody>
                    <%
                        CategoryDAO cd = new CategoryDAO();
                        for (Product p : list) {
                            String cname = cd.getCategoryName(p.getCategoryID());
                    %>
                    <tr>
                        <td name="imgproduct"><img class="imgbook" id="division" src="<%= p.getImage()%>" alt=""></td>
                        <td name="idprod" id="division"><%= p.getProductID()%></td>
                        <td name="nameproduct" id="division"> <%= p.getProductName()%></td>
                        <td name="categoryproduct" id="division"><%= cname%></td>
                        <td name="priceproduct" id="division"><%=(int) p.getPrice()%></td>
                        <td name="quantityproduct" id="division"><%= p.getQuantity()%> </td>
                        <td name="button" id="division">
                            <a class="nav-link" style="text-decoration: none;" href="updateproduct?productID=<%=p.getProductID()%>">
                                <button id="admchoose">Update</button>
                            </a>
                        </td>
                    </tr>
                    <%}%>

                </tbody>
            </table>
        </div>
    </body>
</html>
