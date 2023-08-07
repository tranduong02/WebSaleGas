// Lấy các phần tử HTML cần thiết
const modal = document.getElementById("modal1");
const changePasswordButton = document.getElementById("change-password-button1");
const closeButton = document.querySelector(".close1");
const submitButton = document.querySelector(".submit-button1");
const messageContainer = document.getElementById("messageContainer1");

// Xử lý sự kiện click vào nút "Change Password"
changePasswordButton.addEventListener("click", showModal);

// Xử lý sự kiện click vào nút đóng modal
closeButton.addEventListener("click", closeModal);

// Xử lý sự kiện click vào nút "Save Changes"
submitButton.addEventListener("click", saveChanges);

// Hàm hiển thị modal
function showModal() {
    modal.style.display = "block";
}

// Hàm đóng modal
function closeModal() {
    modal.style.display = "none";
}
window.onload = function () {
    document.getElementById("password").onchange = saveChanges;
    document.getElementById("passwordN").onchange = saveChanges;
    document.getElementById("passwordCF").onchange = saveChanges;
};
function saveChanges(event) {
    event.preventDefault();

    var pass2 = document.getElementById("passwordCF").value;
    var pass1 = document.getElementById("passwordN").value;
    var pass = document.getElementById("password").value;
    // Kiểm tra và xử lý logic khi lưu thay đổi mật khẩu
    // Kiểm tra và xử lý logic khi lưu thay đổi mật khẩu
    if (pass2 && pass1 && pass) {
        if (pass1 === pass2) {
            // Kiểm tra mật khẩu mới có đủ yêu cầu
            const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            if (passwordRegex.test(pass) && passwordRegex.test(pass1)) {
                // Thực hiện lưu thay đổi mật khẩu
                messageContainer.innerText = "Password changed successfully!";
                closeModal();
            } else {
                messageContainer.innerText =
                        "New password does not meet the requirements!";
            }
        } else {
            messageContainer.innerText = "New passwords do not match!";
        }
    } else {
        messageContainer.innerText = "Please fill in all fields!";
    }
}
