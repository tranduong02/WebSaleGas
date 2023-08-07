<%-- 
    Document   : waitforresetpass
    Created on : Jun 12, 2023, 4:03:22 PM
    Author     : duykh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Notification Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
        <style>
            body {
                margin: 0;
                padding: 0;
                font-family: Arial, sans-serif;
                background-color: #f5f5f5;
            }
            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 40px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .notification {
                color: #2ecc71;
                font-size: 24px;
                margin-bottom: 20px;
            }
            .btn {
                display: inline-block;
                padding: 10px 20px;
                background-color: #00483d;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
                margin-top: 10px;
            }
            .btn:hover {
                background-color: #FF8C00;
            }
            .input-wrapper {
                display: flex;
                align-items: center;
                margin-bottom: 10px;
            }

            .input-wrapper input[type="text"] {
                flex: 1;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .input-wrapper button.btn:hover {
                background-color: #FF8C00;
            }

            .input-wrapper button.btn:hover span {
                text-decoration: underline;
            }
            .error-container {
                border: 2px solid #000;
                padding: 10px;
                display: inline-block;
            }

            .error-message {
                color: red;
            }

            @media (min-width: 768px) {
                .error-container {
                    width: 100%;
                }
            }
            .input-wrapper button.btn {
                margin-left: 10px;
                padding: 10px 20px;
                background-color: #00483d;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }
            @media only screen and (max-width: 480px) {
                .container {
                    max-width: 100%;
                    padding: 20px;
                }
                .notification {
                    font-size: 20px;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="login-logo">
                <a href="home">
                    <img src="images/logo.png" alt="Gas">
                </a>
            </div>
            <h1 class="notification">Chúng tôi đã gửi thông báo đến email của bạn!</h1>
            <p>Vui lòng kiểm tra email của bạn để được hướng dẫn thêm.</p>
            <form action="verifysignup" method="post">
                <c:if test="${requestScope.error != null}">
                    <div class="error-container">
                        <p class="error-message"><i class="fas fa-exclamation-triangle"></i> ${requestScope.error}</p>
                    </div>
                </c:if>
                <div class="input-wrapper">
                    <input type="text" name="verification" placeholder="Mã xác nhận" required>
                    <button type="submit" class="btn"><i class="fas fa-check"></i> Xác nhận</button>
                </div>
            </form>
            <a class="btn" href="signup"><i class="fas fa-arrow-left"></i> Quay về trang đăng ký</a>
        </div>
    </body>
</html>
</html>
