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
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="container-fluid">
                <p class="p-content1" style="height: 20px"></p>
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group div-form-signup">
                            <div class="container" style="padding: 0">
                                <form id="form-user">
                                    <div class="row text-center">
                                        <div class="col-sm-12">
                                            <p class="p-content1" style="width: 100%">
                                                <c:choose>
                                                    <c:when test="${not empty user}">
                                                        CẬP NHẬT
                                                    </c:when>
                                                    <c:otherwise>
                                                        THÊM MỚI
                                                    </c:otherwise>
                                                </c:choose>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <c:if test="${not empty user}">
                                                <input type="hidden" name="id" value="${user.getId()}">
                                                <input type="hidden" name="createdDate" value="${user.getCreatedDate()}">
                                            </c:if>

                                            <label>Họ và tên</label>
                                            <input type="text" class="form-control" name="fullName" id="txt-signup-name"
                                                   value="${user.getFullName()}"
                                                    <c:if test="${not empty user}">readonly</c:if>>
                                            <small id="small-signup-err-name"
                                                   class="form-text text-muted small-error"></small>
                                        </div>

                                        <div class="col-md-6">
                                            <label>Số điện thoại:</label>
                                            <input type="text" class="form-control" name="phone" id="txt-signup-phone"
                                                   value="${user.getPhone()}"
                                                   <c:if test="${not empty user}">readonly</c:if>>
                                            <small id="small-signup-err-phone"
                                                   class="form-text text-muted small-error"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <label>Email:</label>
                                            <input type="text" class="form-control" name="email" id="txt-signup-email"
                                                   value="${user.getEmail()}"
                                                   <c:if test="${not empty user}">readonly</c:if>>
                                            <small id="small-signup-err-email"
                                                   class="form-text text-muted small-error"></small>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <label>Mật khẩu:</label>
                                            <input type="password" class="form-control" name="password"
                                                   id="txt-signup-password" value="${user.getPassword()}"
                                                   <c:if test="${not empty user}">readonly</c:if>>
                                            <small id="small-signup-err-password"
                                                   class="form-text text-muted small-error"></small>
                                        </div>

                                        <div class="col-md-6">
                                            <label>Loại tài khoản</label>
                                            <select class="form-control" name="idRole" id="cbx-role">
                                                <c:forEach var="item" items="${listRole}">
                                                    <option value="${item.getId()}">
                                                        ${item.getName()}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="row text-center mt-3">
                                        <div class="col-sm-12">
                                            <div class="btn btn-primary btn-login" id="btn-modalUser-add"
                                                 data-contextPath="${pageContext.request.contextPath}">
                                                Lưu
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        <c:if test="${not empty user}">
            $('#cbx-role').val(${user.getRoleByRoleId().getId()});
        </c:if>
        $(function () {
            $('#btn-modalUser-add').click(function () {
                var contextPath = $(this).attr('data-contextpath');
                var url = contextPath + "/ajax/admin/addEitUser";

                if (checkInfoRegis()){
                    $.ajax({
                        url: url,
                        type: 'POST',
                        data: $('#form-user').serialize(),
                        success: function (value) {
                            if (value == 'phone_exist') {
                                $('#small-signup-err-phone').text('Số điện thoại đã được sử dụng để đăng ký tài khoản!')
                            } else if (value == 'email_exist'){
                                $('#small-signup-err-email').text('Email đã được sử dụng để đăng ký tài khoản!')
                            } else if (value == 'success') {
                                Swal.fire({
                                    position: 'top-end',
                                    type: 'success',
                                    title: 'Thành công',
                                    showConfirmButton: false,
                                    timer: 1500
                                }).then(function (value1) {
                                    window.location = window.location.href;
                                });
                            }
                        }
                    })
                }
            });
        })

        //check thông tin đăng ký
        function checkInfoRegis(){
            var name 	= $('#txt-signup-name').val();
            var email 		= $('#txt-signup-email').val();
            var pass 		= $('#txt-signup-password').val();
            var phone	 	= $('#txt-signup-phone').val();

            var errFirstName 	= $('#small-signup-err-name');
            var errEmail 		= $('#small-signup-err-email');
            var errPass 		= $('#small-signup-err-password');
            var errPhone 		= $('#small-signup-err-phone');

            if(name.length === 0){
                errFirstName.text('Vui lòng nhập họ và tên!');
                $('#txt-signup-name').focus();
                return false;
            } else {
                errFirstName.text('');
            }

            if(!/^(0|\+84){1}(9|3|7|8|5){1}\d{8}$/.test(phone)){
                errPhone.text('Số điện thoại không hợp lệ!');
                $('#txt-signup-phone').focus();
                return false;
            } else {
                errPhone.text('');
            }

            if(/^([\w\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{1})+$/.test(email) === false){
                errEmail.text('Địa chỉ email không hợp lệ!');
                $('#txt-signup-email').focus();
                return false;
            } else {
                errEmail.text('');
            }

            if(pass.length <= 5){
                errPass.text('Mật khẩu phải có ít nhất 6 kí tự!');
                $('#txt-signup-password').focus();
                return false;
            } else {
                errPass.text('');
            }

            return true;
        }
    </script>

<%--<script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>--%>
<%--<script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>--%>
<%--<script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>--%>
<%--</body>--%>
<%--</html>--%>