<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Tittle</title>--%>

<%--    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">--%>
<%--</head>--%>
<%--<body>--%>
    <!--Header-->
    <div class="divHeader">
        <div class="divHeaderTren">
            <p class="pHeaderTren1">Hotline: <span>(024) 73086880</span></p>
            <form action="<c:url value="/search"/>" method="get">
                <input type="text" name="infoSearch" required placeholder="Tìm sản phẩm">
                <button type="submit"><i class="fas fa-search"></i></button>
            </form>
            <c:choose>
                <c:when test="${not empty user_login}">
                        <span style="transform: translateX(230px);">
                            <div class="dropdown">
                                <button class="btn btn-secondary dropdown-toggle" type="button" id="btn-userLogin"
                                        style="color: black;background-color: transparent;border: none;"
                                        data-toggle="dropdown" aria-haspopup="true"
                                        aria-expanded="false">
                                        ${user_login.getFullName()}
                                </button>
                                <div class="dropdown-menu" aria-labelledby="triggerId">
                                    <c:if test="${user_login.getRoleByRoleId().getName() == 'ADMIN'}">
                                        <a class="dropdown-item" style="height: 35px;line-height: 25px" href="<c:url value="/admin"/>">Quản lý trang</a>
                                    </c:if>
                                    <a class="dropdown-item" style="height: 35px;line-height: 25px" href="<c:url value="/account"/>">
                                        Thông tin cá nhân
                                    </a>
                                    <a class="dropdown-item" style="height: 35px;line-height: 25px" id="btn-logout" data-contextPath = '${pageContext.request.contextPath}'>Thoát</a>
                                </div>
                            </div>
                        </span>
                </c:when>
                <c:otherwise>
                    <span onClick="showLogin()" style="margin-left: 85px">Đăng nhập</span>
                    <span>&</span>
                    <span onClick="showSignup()">Đăng ký</span>
                </c:otherwise>
            </c:choose>
        </div>
        <div class="divHeaderMenu">
            <a href="<c:url value="/"/>">
                <img src="<c:url value="/resources/fileupload/img/logo.jpg"/>" alt="">
            </a>
            <ul>
                <li>
                    <i class="fas fa-home"></i>
                    <a href="<c:url value="/"/>">Trang chủ</a>
                </li>
                <li>
                    <i class="fas fa-birthday-cake" style="font-size: 20px"></i>
                    <a href="<c:url value="/product/cate/0"/>">Sản phẩm</a>
                </li>
                <li>
                    <i class="fas fa-info-circle"></i>
                    <a href="<c:url value="/intro"/>">Giới thiệu</a>
                </li>
                <li>
                    <i class="fab fa-blogger"></i>
                    <a href="<c:url value="/blog"/>">Blog</a>
                </li>
                <li>
                    <i class="fas fa-phone" style="font-size: 15px"></i>
                    <a href="<c:url value="/contact"/>">Liên hệ</a>
                </li>
            </ul>
            <div class="divGioHang">
                <div class="divSoLuong">
                    <p>
                        <c:choose>
                            <c:when test="${not empty carts}">
                                ${carts.size()}
                            </c:when>
                            <c:otherwise>0</c:otherwise>
                        </c:choose>
                    </p>
                </div>
                <i class="fas fa-shopping-bag" style="font-size: 40px;color: #ef7147"></i>

                <span>
                        <a href="<c:url value="/cart"/>" style="color: black">
                            GIỎ HÀNG
                        </a>
                    </span>
            </div>
        </div>
        <div class="div-rangCua"></div>
    </div>

    <!--Xem nhanh sản phẩm-->
    <div class="modal fade" id="modal-xemNhanhSP" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
         aria-hidden="true">
    </div><!--end xem nhanh sản phẩm-->

    <!--Form đăng ký-->
    <div class="modal fade" id="modal-signup" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="container-fluid">
                    <p class="p-content1" style="height: 20px"></p>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="form-group div-form-signup">
                                <div class="container" style="padding: 0">
                                    <form id="form-regis">
                                        <div class="row text-center">
                                            <div class="col-sm-12">
                                                <p class="p-content1" style="width: 100%">ĐĂNG KÝ TÀI KHOẢN</p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txt-signup-name">Họ và tên</label>
                                                <input type="text" class="form-control" name="fullName" id="txt-signup-name"
                                                       placeholder="">
                                                <small id="small-signup-err-name"
                                                       class="form-text text-muted small-error"></small>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="txt-signup-phone">Số điện thoại:</label>
                                                <input type="text" class="form-control" name="phone" id="txt-signup-phone"
                                                       placeholder="">
                                                <small id="small-signup-err-phone"
                                                       class="form-text text-muted small-error"></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-sm-12">
                                                <label for="txt-signup-email">Email:</label>
                                                <input type="text" class="form-control" name="email" id="txt-signup-email"
                                                       placeholder="">
                                                <small id="small-signup-err-email"
                                                       class="form-text text-muted small-error"></small>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label for="txt-signup-password">Mật khẩu:</label>
                                                <input type="password" class="form-control" name="password" id="txt-signup-password"
                                                       placeholder="">
                                                <small id="small-signup-err-password"
                                                       class="form-text text-muted small-error"></small>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="txt-signup-repassword">Nhập lại mật khẩu:</label>
                                                <input type="password" class="form-control" name=""
                                                       id="txt-signup-repassword" placeholder="">
                                                <small id="small-signup-err-repassword"
                                                       class="form-text text-muted small-error"></small>
                                            </div>
                                        </div>

                                        <div class="row text-center">
                                            <div class="col-sm-12">
                                                <div class="btn btn-primary btn-login" id="btn-form-signup"
                                                     data-contextPath = '${pageContext.request.contextPath}'>
                                                    Đăng ký
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <hr>
                                <p style="text-align: center">
                                    Nếu bạn đã có tài khoản, hãy Đăng nhập
                                    <span style="color: #ef7147;cursor: pointer;" onclick="showLogin()">tại đây</span>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--end form đăng ký-->

    <!--Form đăng nhập-->
    <div class="modal fade" id="modal-login" tabindex="-1" role="dialog" aria-labelledby="modelTitleId"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="container-fluid div-form-login">
                    <p class="p-content1" style="height: 20px"></p>
                    <div class="row">
                        <div class="col-sm-12 text-center">
                            <p class="p-content1" style="width: 100%;">ĐĂNG NHẬP</p>
                        </div>
                        <div class="col-md-12">
                            <form id="form-login">
                                <div class="form-group">
                                    <label for="txt-login-email">Email:</label>
                                    <input type="text" class="form-control" name="email" id="txt-login-email" placeholder=""
                                           required>
                                    <small id="small-login-err-email" class="form-text text-muted small-error"></small>

                                    <label for="txt-login-password">Mật khẩu:</label>
                                    <input type="password" class="form-control" name="password" id="txt-login-password"
                                           placeholder="" required>
                                    <small id="small-login-err-password" class="form-text text-muted small-error"></small>

                                    <div class="btn btn-primary btn-login" id="btn-form-login"
                                         data-contexPath = "${pageContext.request.contextPath}">
                                        Đăng nhập
                                    </div>
                                    <hr>
                                </div>
                            </form>
                        </div>
                        <div class="col-sm-12 text-center">
                            <p style="width: 100%;">
                                Nếu bạn chưa có tài khoản, hãy Đăng ký
                                <span style="color: #ef7147;cursor: pointer;" onclick="showSignup()">tại đây</span>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--end form đăng nhập-->

<%--    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>--%>
<%--    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>--%>
<%--    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>--%>
<%--</body>--%>
<%--</html>--%>