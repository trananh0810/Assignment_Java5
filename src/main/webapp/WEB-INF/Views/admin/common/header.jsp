<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="div-header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-3 pt-2">
                <a href="<c:url value="/"/>">
                    <img src="<c:url value="/resources/fileupload/img/logo.jpg"/>" alt="">
                </a>
            </div>
            <div class="col-sm-3"></div>
            <div class="col-sm-3"></div>
            <div class="col-sm-1"></div>
            <div class="col-sm-2 pt-3">
                <div class="row">
                    <div class="col-sm-2">
                        <img class="img-icon-user" src="<c:url value="/resources/fileupload/img/icon-user.png"/>" alt="">
                    </div>
                    <div class="col-sm-8">
                        <div class="dropdown open">
                            <button class="btn btn-link dropdown-toggle" type="button" id="triggerId" data-toggle="dropdown"
                                    style="color:black;text-decoration: none;" aria-haspopup="true" aria-expanded="false">
                                ${user_login.getFullName()}
                            </button>
                            <div class="dropdown-menu" aria-labelledby="triggerId">
<%--                                <button class="dropdown-item" href="#">Thông tin cá nhân</button>--%>
                                <button class="dropdown-item" id="btn-logout" data-contextPath="${pageContext.request.contextPath}">
                                    Đăng xuất
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
