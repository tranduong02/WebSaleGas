<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
    <head>
        <title>Register</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Official Signup Form Responsive, Login form web template,Flat Pricing tables,Flat Drop downs  Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Raleway:100,200,300,400,500,600,700,800,900" rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Monoton" rel="stylesheet">
        <!-- /fonts -->
        <!-- css -->
        <link href="css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/styles.css" rel='stylesheet' type='text/css' media="all" />
        <!-- /css -->
        <style>
            .error-message {
                color: red;
                background-color: #ffcc00; /* Màu vàng nhạt */
                font-size: 14px;
                padding: 10px;
                border-radius: 4px;
                font-weight: bold;
                text-align: center; /* Căn giữa chữ trong ô */
            }
        </style>
    </head>


    <body>
        <h1 class="w3ls">Sign up</h1>
        <div class="content-w3ls">
            <div class="content-agile1">
                <h2 class="agileits1">Official</h2>
                <p class="agileits2">Lorem ipsum dolor sit amet, consectetur adipiscing elit.</p>
            </div>
            <div class="content-agile2">
                <form name="fs" id="form" action="signup" method="post">

                    <div class="form-control w3layouts"> 
                        <input type="text" id="username" name="uname" placeholder="User Name" 
                               pattern="[A-Za-z0-9_.\-]{4,}" title="Các ký tự được chấp nhận bao gồm chữ cái viết hoa, chữ cái viết thường, chữ số, dấu gạch dưới (_), dấu chấm (.) và dấu gạch ngang (-) và tên đăng nhập phải nhiều hơn 4 kí tự."
                               required="">
                        <!-- Hiển thị thông báo lỗi -->
                        <c:if test="${not empty errorusername}">
                            <div class="error-message">${errorusername}</div>
                        </c:if>
                    </div>


                    <div class="form-control w3layouts"> 
                        <input type="text" id="firstname" name="fname" placeholder="First Name*" required="">
                         <i class="fas fa-user-cog"></i>
                    </div>

                    <div class="form-control w3layouts"> 
                        <input type="text" id="lastname" name="lname" placeholder="Last Name*" required="">
                    </div>

                    <div class="form-control agileinfo">	
                        <input type="password" id="password1" class="lock" name="pass" placeholder="Password"                                    
                               pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}" 
                               oninvalid="this.setCustomValidity('Mật khẩu trên 8 kí tự và bao gồm chữ cái hoa, thường, chữ số, kí tự đặc biệt')" 
                               oninput="this.setCustomValidity('')" required="">
                    </div>	

                    <div class="form-control agileinfo">	
                        <input type="password" id="password2" class="lock" name="pswd" placeholder="Confirm Password"  required="">
                    </div>

                    <div class="form-control w3layouts">	
                        <input type="email" id="email" name="email" placeholder="mail@example.com" required="">
                        <!-- Hiển thị thông báo lỗi -->
                        <c:if test="${not empty erroremail}">
                            <div class="error-message">${erroremail}</div>
                        </c:if>
                    </div>

                    <div class="form-control w3layouts">	
                        <input type="text" id="phone" name="phone" pattern="[0-9]{10}" title="Please enter a valid phone number." placeholder="Phone Number" required="">
                        <!-- Hiển thị thông báo lỗi -->
                        <c:if test="${not empty errorphone}">
                            <div class="error-message">${errorphone}</div>
                        </c:if>
                    </div>
                    <div class="form-control w3layouts">	
                        <input type="text" id="address" name="address" placeholder="Address" required="">
                    </div>
                     <div class="form-control w3layouts">	
                         <input type="checkbox" id="policies" required=""><span style="color: white"> Accept SaleGas terms and policies. </span>
                    </div>
                    <input type="submit" class="register" value="Register">
                </form>

                <script type="text/javascript">
                    window.onload = function () {
                        document.getElementById("password1").onchange = validatePassword;
                        document.getElementById("password2").onchange = validatePassword;
                    };
                    function setCustomValidity(message) {
                        var usernameInput = document.getElementById('username');
                        usernameInput.setCustomValidity(message);
                    }
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


                <p class="wthree w3l">Signup With Your Social Profile</p>
                <ul class="social-agileinfo wthree2">
                    <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                    <li><a href="#"><i class="fa fa-youtube"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                </ul>
                <p class="wthree w3l"></p>
                <p class="wthree w3l">Already have an account <span>→</span> <a style="color: #FF8C00;" href="login">Login Here</a></p>
            </div>
            <div class="clear"></div>
        </div>
    </body>

</html>