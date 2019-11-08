<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Liên hệ</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/introduce.css'/>">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@7.29.2/dist/sweetalert2.min.css">

    <style>
        .divHeaderMenu>ul>li:nth-child(5),.divHeaderMenu>ul>li:nth-child(5)>a{
            color: #ef7147;
        }
    </style>
</head>
<body>
    <!--Header-->
    <jsp:include page="common/header.jsp"/>

    <!--content-->
    <div class="container-fluid div-content">
        <div class="container div-content-item">
            <p class="p-content1">LIÊN HỆ</p>
            <div class="row">
                <div class="col-md-8 div-form-lienHe">
                    <p>Bạn hãy điền nội dung tin nhắn vào form dưới đây. Chúng tôi sẽ trả lời bạn sau khi nhận được.</p>
                    <form id="form-feedback">
                        <div class="form-group">
                            <label for="">Họ và tên:</label>
                            <input type="text" class="form-control" name="fullName" id="input-feedback-name" required
                                   placeholder="" value="${user_login.getFullName()}">
                            <small id="small-err-name" class="form-text text-muted small-error"></small>

                            <label for="">Email:</label>
                            <input type="text" class="form-control" name="email" id="input-feedback-email" required
                                   placeholder="" value="${user_login.getEmail()}">
                            <small id="small-err-email" class="form-text text-muted small-error"></small>

                            <label for="">Tiêu đề:</label>
                            <input type="text" class="form-control" name="title" id="input-feedback-title" required
                                   placeholder="">
                            <small id="small-err-title" class="form-text text-muted small-error"></small>

                            <label for="">Nội dung</label>
                            <textarea class="form-control" name="content" id="input-feedback-content" rows="5"></textarea>
                            <small id="small-err-content" class="form-text text-muted small-error"></small>

                            <button type="button" class="btn btn-primary" id="btn-sendMess"
                                    data-contextPath = '${pageContext.request.contextPath}'>
                                Gửi tin nhắn
                            </button>
                        </div>
                    </form>
                </div>

                <div class="col-md-4 div-lienHe">
                    <img src="<c:url value="/resources/fileupload/img/logo.jpg"/>" alt="">
                    <p><i class="fas fa-map-marker-alt"></i>266 Đội Cấn, Phường Liễu Giai</p>
                    <p><i class="fas fa-phone-volume"></i>(024) 73086880</p>
                    <p><i class="fas fa-calendar-alt"></i>Thứ 2 - Chủ Nhật: 9:00 - 18:00</p>
                    <p><i class="fas fa-envelope"></i>support@delicious.com</p>
                </div>
            </div>

            <div class="row" style="margin-top: 30px;">
                <div class="mapouter"><div class="gmap_canvas"><iframe width="1150" height="500" id="gmap_canvas" src="https://maps.google.com/maps?q=266%20%C4%90%E1%BB%99i%20C%E1%BA%A5n&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://www.emojilib.com"></a></div><style>.mapouter{position:relative;text-align:right;height:500px;width:1150px;}.gmap_canvas {overflow:hidden;background:none!important;height:500px;width:1150px;}</style></div>
            </div>
        </div>
    </div>

    <!--chân trang-->
    <jsp:include page="common/footer.jsp"/>
    <!--end footer-->

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>

    <script src="<c:url value='/resources/jscss/js/dung-chung.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/index.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/login.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/signup.js'/>"></script>

    <script src="<c:url value='/resources/jscss/js/signup.js'/>"></script>

    <script>
        $(function () {
            $('#btn-sendMess').click(function () {
                var contextPath = $(this).attr('data-contextPath');
                if (checkInfoFeedback()){
                    $.ajax({
                       url: contextPath + "/ajax/sendFeedback",
                        type: 'POST',
                        data: $('#form-feedback').serialize(),
                        success: function (value) {
                            if (value == 'success'){
                                Swal.fire({
                                    position: 'top-end',
                                    type: 'success',
                                    title: 'Gửi phản hồi thành công!',
                                    showConfirmButton: false,
                                    timer: 1500
                                }).then(function (value1) {
                                    var urlNow = window.location.href;

                                    window.location = urlNow;
                                });
                            }
                        }
                    });
                }
            });
        })

        function checkInfoFeedback() {
            var name = $('#input-feedback-name');
            var email = $('#input-feedback-email');
            var title = $('#input-feedback-title');
            var content = $('#input-feedback-content');

            var  err_name = $('#small-err-name');
            var  err_email = $('#small-err-email');
            var  err_title = $('#small-err-title');
            var  err_content = $('#small-err-content');

            if (name.val().length == 0){
                err_name.text("Vui lòng nhập họ và tên!")
                return false;
            } else {
                err_name.text("")
            }

            if (email.val().length == 0){
                err_email.text("Vui lòng nhập email!")
                return false;
            } else {
                err_email.text("")
            }

            if (title.val().length == 0){
                err_title.text("Vui lòng nhập tiêu đề!")
                return false;
            } else {
                err_title.text("")
            }

            if (content.val().length == 0){
                err_content.text("Vui lòng nhập nội dung!")
                return false;
            } else {
                err_content.text("")
            }

            return true;
        }
    </script>
</body>
</html>