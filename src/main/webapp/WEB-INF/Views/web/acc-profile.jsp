<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Thông tin tài khoản</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/introduce.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/account-common.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/account-profile.css'/>">

    <style>
        .div-account-menu-item:nth-child(2){
            background-color: #E7E7E7;
        }
    </style>
</head>
<body>
    <!--Header-->
    <jsp:include page="common/header.jsp"/>

    <!-- modal update infomation -->
    <div class="modal fade" id="modal-account-update-info" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cập nhật thông tin</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="container-fluid">
                            <div class="row">
                                <div class="col-12">
                                    <div class="form-group mb-0">
                                        <label for="txt-account-update-name">Họ và tên</label>
                                        <input type="text" class="form-control" name="" id="txt-account-update-name">
                                        <small id="small-account-update-name" class="form-text text-muted small-error"></small>

                                        <label for="txt-account-update-phone">Số điện thoại</label>
                                        <input type="text" class="form-control" name="" id="txt-account-update-phone">
                                        <small id="small-account-update-phone" class="form-text text-muted small-error"></small>

                                        <label for="txt-account-update-email">Email</label>
                                        <input type="email" class="form-control" name="" id="txt-account-update-email">
                                        <small id="small-account-update-email" class="form-text text-muted small-error"></small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" id="btn-account-update-info-save">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end modal update infomation -->

    <!-- modal change password -->
    <div class="modal fade" id="modal-account-change-password" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Thay đổi mật khẩu</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group">
                                    <label for="txt-account-changePass-nowPass">Mật khẩu hiện tại</label>
                                    <input type="password" class="form-control" name="" id="txt-account-changePass-nowPass">
                                    <small id="small-account-changePass-nowPass" class="form-text text-muted small-error"></small>

                                    <label for="txt-account-changePass-newPass">Mật khẩu mới</label>
                                    <input type="password" class="form-control" name="" id="txt-account-changePass-newPass">
                                    <small id="small-account-changePass-newPass" class="form-text text-muted small-error"></small>

                                    <label for="txt-account-changePass-reNewPass">Nhập lại mật khẩu mới</label>
                                    <input type="password" class="form-control" name="" id="txt-account-changePass-reNewPass">
                                    <small id="small-account-changePass-reNewPass" class="form-text text-muted small-error"></small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                    <button type="button" class="btn btn-primary" id="btn-account-change-password-save">Lưu</button>
                </div>
            </div>
        </div>
    </div>
    <!-- end modal change password -->

    <!--content-->
    <div class="container-fluid div-content" style="height: auto;">
        <div class="container div-content-item">
            <div class="row">
                <!-- account menu -->
                <div class="col-lg-3 div-account-left">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 div-account-avatar pl-0">
                                <div class="div-img">
                                    <img src="<c:url value="/resources/fileupload/img/avatar-default.png"/>" alt="" class="img-fluid img-account-avatar">

                                    <div class="div-account-avatar-edit">
                                        <div class="">
                                            <i class="fas fa-pencil-alt"></i>
                                        </div>
                                    </div>
                                </div>
                                <p>${user_login.fullName}</p>
                            </div>
                        </div>

                        <div class="row div-account-menu-item">
                            <a href="<c:url value="/account"/>">
                                <div class="col-12 pl-0">
                                    <i class="fas fa-user-circle" style="font-size: 20px"></i>
                                    <span>Thông tin tài khoản</span>
                                </div>
                            </a>
                        </div>

                        <div class="row div-account-menu-item">
                            <a href="">
                                <div class="col-12 pl-0">
                                    <i class="fas fa-file-invoice" style="font-size: 20px"></i>
                                    <span>Quản lý đơn hàng</span>
                                </div>
                            </a>
                        </div>

                        <div class="row">
<%--                            <a href="">--%>
<%--                                <div class="col-12 pl-0">--%>
<%--                                    <i class="fas fa-map-marker-alt" style="font-size: 20px"></i>--%>
<%--                                    <span>Sổ địa chỉ</span>--%>
<%--                                </div>--%>
<%--                            </a>--%>
                        </div>

                        <div class="row">
                            <div class="col-12 p-0 text-center">
                                <div class="dropdown open text-center">

                                    <button class="btn btn-link" type="button" id="triggerId" data-toggle="dropdown" aria-haspopup="true"
                                            aria-expanded="false">
                                        <div class="div-account-avatar-mobile">
                                            <div class="">
                                                <img src="<c:url value="/resources/fileupload/img/avatar-default.png"/>" alt="" class="img-fluid img-account-avatar">
                                            </div>
                                            <p>Trần Đức Anh</p>
                                            <i class="fas fa-sort-down"></i>
                                            <i class="fas fa-pen-square"></i>
                                        </div>
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="triggerId">
                                        <a href="<c:url value="/account"/>" class="dropdown-item">Thông tin tài khoản</a>
                                        <a href="" class="dropdown-item">Quản lý đơn hàng</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- end account menu -->

                <div class="col-lg-9 div-account-right">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12 div-account-title pl-0">
                                <p>
                                    Thông tin tài khoản
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-xl-2 col-lg-3 col-4">
                                Họ và tên
                            </div>
                            <div class="col-xl-10 col-lg-9 col-8">
                                ${user_login.fullName}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-2 col-lg-3 col-4">
                                Điện thoại
                            </div>
                            <div class="col-xl-10 col-lg-9 col-8">
                                ${user_login.phone}
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xl-2 col-lg-3 col-4">
                                Email
                            </div>
                            <div class="col-xl-10 col-lg-9 col-8">
                                ${user_login.email}
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="btn btn-primary" id="btn-account-update-info"
                                     data-toggle="modal" data-target="#modal-account-update-info">
                                    Cập nhật thông tin
                                </div>
                                <div class="btn btn-danger" id="btn-account-change-password"
                                     data-toggle="modal" data-target="#modal-account-change-password">
                                    Đổi mật khẩu
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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

    <script>
        $(function () {
            $('#btn-account-update-info').click(function () {
                let name = '${user_login.fullName}';
                let phone = '${user_login.phone}';
                let email = '${user_login.email}';

                $('#txt-account-update-name').val(name);
            });
        })
    </script>
</body>
</html>