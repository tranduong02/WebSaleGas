
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <!-- Head -->
    <head>

        <title>Login</title>

        <!-- Meta-Tags -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta name="keywords" content="Existing Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design">
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- //Meta-Tags -->

        <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />

        <!-- Style --> <link rel="stylesheet" href="css/stylel.css" type="text/css" media="all">

        <!-- Fonts -->
        <link href="//fonts.googleapis.com/css?family=Quicksand:300,400,500,700" rel="stylesheet">
        <!-- //Fonts -->
        <style>
            .mess{
                color: red;
                background-color: #ffcc00; /* Màu vàng nhạt */
                font-size: 14px;
                padding: 8px;
                border-radius: 4px;
                font-weight: bold;
                text-align: center; /* Căn giữa chữ trong ô */
            }
        </style>
    </head>
    <!-- //Head -->

    <!-- Body -->
    <body>
        <div class="notification-pass"><strong style="color: green">${requestScope.UpdatePassSuccess}</strong></div>
        <h1>EXISTING LOGIN FORM</h1>

        <div class="w3layoutscontaineragileits">
            <h2>Login here</h2>
            <form name="fl" action="login" method="post">
                <c:set var="cookie" value="${pageContext.request.cookies}"/>
                <input placeholder="User Name" name="uname"  type="text" required="" value="${cookie.cuser.value}">
                <input type="password" Name="pass" placeholder="Password" required="" value="${cookie.cpass.value}">
                <c:if test="${not empty mess}">
                    <div class="mess">${mess}</div>
                </c:if>
                <ul class="agileinfotickwthree">
                    <li>
                        <input type="checkbox" ${(cookie.crem != null?'checked':'')} id="brand1" name="rem" value="ON" >
                        <label for="brand1"><span></span>Remember me</label>
                        <a href="forgotpass">Forgot password?</a>

                    </li>
                    <li>
                        <input type="checkbox"  id="brand1"  hidden="">
                        <label>Sign in as</label>
                        <select class="roles" name="role">
                            <option  value="u" selected>User</option>
                            <option  value="a">Admin</option>
                        </select>
                    </li>
                </ul>
                <div>

                </div>
                <div class="aitssendbuttonw3ls">
                    <input type="submit" value="LOGIN">
                    <p> To register new account <span>&rarr;</span> <a class="w3_play_icon1" href="signup"> Click Here</a></p>
                    <div class="clear"></div>
                </div>
            </form>
        </div>



        <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>


        <script
            type="text/javascript"
            src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.3.0/mdb.min.js"
        ></script>
        <script>
            function decodeCookieValue(cookieValue) {
                try {
                    // Giải mã giá trị cookie từ Base64
                    var decodedValue = atob(cookieValue);
                    return decodedValue;
                } catch (error) {
                    // Xử lý lỗi giải mã
                    console.error('Lỗi giải mã cookie:', error);
                    return null;
                }
            }

// Hàm giải mã giá trị cookie cuser
            function decodeCuserCookieValue() {
                var cookieValue = '${cookie.cuser.value}'; // Giá trị cookie cuser được nhúng từ mã JSP
                var decodedValue = decodeCookieValue(cookieValue);
                return decodedValue;
            }

// Hàm giải mã giá trị cookie cpass
            function decodeCpassCookieValue() {
                var cookieValue = '${cookie.cpass.value}'; // Giá trị cookie cpass được nhúng từ mã JSP
                var decodedValue = decodeCookieValue(cookieValue);
                return decodedValue;
            }

// Sử dụng các hàm giải mã trong mã JSP
            var decodedUser = decodeCuserCookieValue();
            var decodedPass = decodeCpassCookieValue();
        </script>
    </body>
    <!-- //Body -->

</html>