<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="div-content-left">
    <div id="accordianId" role="tablist" aria-multiselectable="true">
        <a href="<c:url value="/admin"/>">
            <div class="card div-menu-item">
                <div class="card-header" role="tab" id="section1HeaderId" style="cursor: pointer">
                    <h6 class="mb-0">
                        <!-- <a class="a-menu-item"> -->
                        Màn hình chính
                        <!-- </a> -->
                    </h6>
                </div>
            </div>
        </a>
        <!--Quản lý-->
        <div class="card div-menu-item">
            <div class="card-header" role="tab" id="section2HeaderId" data-toggle="collapse" data-parent="#accordianId"
                 href="#section2ContentId" aria-expanded="true" aria-controls="section2ContentId" style="cursor: pointer">
                <h6 class="mb-0">
                    <a class="a-menu-item">
                        Quản lý
                    </a>
                </h6>
            </div>
            <div id="section2ContentId" class="collapse in" role="tabpanel" aria-labelledby="section2HeaderId"
                 style="background: white">
                <div class="card-body">
                    <ul>
                        <a href="<c:url value="/admin/user"/>">
                            <li>Quản lý Người dùng</li>
                        </a>
                        <a href="<c:url value="/admin/cate/product"/>">
                            <li>Quản lý Danh mục Sản phẩm</li>
                        </a>
                        <a href="<c:url value="/admin/cate/blog"/>">
                            <li>Quản lý Danh mục Blog</li>
                        </a>
                        <a href="<c:url value="/admin/product"/>">
                            <li>Quản lý Sản phẩm</li>
                        </a>
                        <a href="<c:url value="/admin/blog"/>">
                            <li>Quản lý Blog</li>
                        </a>
                    </ul>
                </div>
            </div>
        </div><!--end quản lý-->
        <!--Đơn hàng-->
        <div class="card div-menu-item">
            <div class=" card-header" role="tab" id="section4HeaderId" data-toggle="collapse" data-parent="#accordianId"
                 href="#section4ContentId" aria-expanded="true" aria-controls="section4ContentId" style="cursor: pointer">
                <h6 class="mb-0">
                    <a class="a-menu-item">
                        Đơn hàng
                    </a>
                </h6>
            </div>
            <div id="section4ContentId" class="collapse in" role="tabpanel" aria-labelledby="section2HeaderId"
                 style="background: white">
                <div class="card-body">
                    <ul>
                        <a href="<c:url value="/admin/order/wait-confirm"/>">
                            <li>Chờ xác nhận</li>
                        </a>
                        <a href="<c:url value="/admin/order/confirmed"/>">
                            <li>Đã xác nhận</li>
                        </a>
                        <a href="<c:url value="/admin/order/success"/>">
                            <li>Thành công</li>
                        </a>
                        <a href="<c:url value="/admin/order/cancelled"/>">
                            <li>Hủy</li>
                        </a>
                    </ul>
                </div>
            </div>
        </div><!--end đơn hàng-->
<%--        <!--thống kê-->--%>
<%--        <div class="card div-menu-item">--%>
<%--            <div class=" card-header" role="tab" id="section3HeaderId" data-toggle="collapse" data-parent="#accordianId"--%>
<%--                 href="#section3ContentId" aria-expanded="true" aria-controls="section3ContentId" style="cursor: pointer">--%>
<%--                <h6 class="mb-0">--%>
<%--                    <a class="a-menu-item">--%>
<%--                        Thống kê báo cáo--%>
<%--                    </a>--%>
<%--                </h6>--%>
<%--            </div>--%>
<%--            <div id="section3ContentId" class="collapse in" role="tabpanel" aria-labelledby="section3HeaderId"--%>
<%--                 style="background: white">--%>
<%--                <div class="card-body">--%>
<%--                    <ul>--%>
<%--                        <a href="#">--%>
<%--                            <li>Doanh thu tổng quan</li>--%>
<%--                        </a>--%>
<%--                        <a href="#">--%>
<%--                            <li>Doanh thu theo Danh Mục</li>--%>
<%--                        </a>--%>
<%--                    </ul>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
    </div>
</div>