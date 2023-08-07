/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

//tim tim
!(function (e, t, a) {
    function r() {
        for (var e = 0; e < o.length; e++)
            o[e].alpha <= 0
                    ? (t.body.removeChild(o[e].el), o.splice(e, 1))
                    : (o[e].y--,
                            (o[e].scale += 0.004),
                            (o[e].alpha -= 0.013),
                            (o[e].el.style.cssText =
                                    "left:" +
                                    o[e].x +
                                    "px;top:" +
                                    o[e].y +
                                    "px;opacity:" +
                                    o[e].alpha +
                                    ";transform:scale(" +
                                    o[e].scale +
                                    "," +
                                    o[e].scale +
                                    ") rotate(45deg);background:" +
                                    o[e].color +
                                    ";z-index:99999"));
        requestAnimationFrame(r);
    }
    function n(e) {
        var a = t.createElement("div");
        (a.className = "heart"),
                o.push({el: a, x: e.clientX - 5, y: e.clientY - 5, scale: 1, alpha: 1, color: "rgb(" + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + "," + ~~(255 * Math.random()) + ")"}),
                t.body.appendChild(a);
    }
    var o = [];
    (e.requestAnimationFrame =
            e.requestAnimationFrame ||
            e.webkitRequestAnimationFrame ||
            e.mozRequestAnimationFrame ||
            e.oRequestAnimationFrame ||
            e.msRequestAnimationFrame ||
            function (e) {
                setTimeout(e, 1e3 / 60);
            }),
            (function (e) {
                var a = t.createElement("style");
                a.type = "text/css";
                try {
                    a.appendChild(t.createTextNode(e));
                } catch (t) {
                    a.styleSheet.cssText = e;
                }
                t.getElementsByTagName("head")[0].appendChild(a);
            })(
            ".heart{width: 10px;height: 10px;position: fixed;background: #f00;transform: rotate(45deg);-webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);}.heart:after,.heart:before{content: '';width: inherit;height: inherit;background: inherit;border-radius: 50%;-webkit-border-radius: 50%;-moz-border-radius: 50%;position: fixed;}.heart:after{top: -5px;}.heart:before{left: -5px;}",
            ),
            (function () {
                var t = "function" == typeof e.onclick && e.onclick;
                e.onclick = function (e) {
                    t && t(), n(e);
                };
            })(),
            r();
})(window, document);

//ajax gui du lieu mail tu warrantymanagement.jsp ve sendmailwarranty
function sendFormDataToServlet() {
    var username = document.getElementById("username").value;
    var email = document.getElementById("email").value;
    var warrantyCategory = document.getElementById("warrantyCategory").value;
    var warrantyPeriod = document.getElementById("warrantyPeriod").value;
    var productName = document.getElementById("productName").value;

    var data = {
        username: username,
        email: email,
        warrantyCategory: warrantyCategory,
        warrantyPeriod: warrantyPeriod,
        productName: productName
    };

    var confirmModal = document.getElementById("confirmModal");
    var confirmSpan = document.getElementsByClassName("close-confirm")[0];

    confirmModal.style.display = "block";

    confirmSpan.onclick = function () {
        confirmModal.style.display = "none";
    };

    window.onclick = function (event) {
        if (event.target === confirmModal) {
            confirmModal.style.display = "none";
        }
    };

    var confirmButton = document.getElementById("confirmButton");
    confirmButton.onclick = function () {
        confirmModal.style.display = "none";
        // Tiếp tục gửi dữ liệu bằng AJAX
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "sendmailwarranty", true);
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    console.log("Request completed successfully");
                    document.getElementById("modalMessage").innerHTML = "Đã gửi mail đến khách hàng thành công!";
                    openModal();
                } else {
                    console.log("Request failed");
                    document.getElementById("modalMessage").innerHTML = "Gửi mail đến khách hàng thất bại!";
                    openModal();
                }
            }
        };
        xhr.send(JSON.stringify(data));
    };
}

//modal thong bao gui du lieu mail tu warrantymanagement.jsp ve sendmailwarranty
function openModal() {
    var modal = document.getElementById("myModal");
    var span = document.getElementsByClassName("close")[0];

    modal.style.display = "block";

    span.onclick = function () {
        modal.style.display = "none";
    };

    window.onclick = function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    };
}

