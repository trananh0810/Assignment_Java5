<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Giỏ hàng</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/gio-hang.css'/>">

    <style>
        .divGioHang a{
            color: #ef7147!important;
        }
    </style>
</head>
<body>
    <!--Header-->
    <jsp:include page="common/header.jsp"/>

    <!--content-->
    <div class="container-fluid div-content" style="min-height: 465px">
        <p class="p-content1" style="height: 20px"></p>
        <c:choose>
            <c:when test="${not empty carts}">
                <div class="container div-content-gioHang">
                    <div class="row" style="border-bottom: 1px solid #AAAAAA;height: 40px">
                        <div class="col-sm-1">

                        </div>
                        <div class="col-sm-2">
                            <p class="pDSGH1">Ảnh sản phẩm</p>
                        </div>
                        <div class="col-sm-3">
                            <p class="pDSGH1">Tên sản phẩm</p>
                        </div>
                        <div class="col-sm-2">
                            <p class="pDSGH1">Đơn giá</p>
                        </div>
                        <div class="col-sm-1">
                            <p class="pDSGH1">Số lượng</p>
                        </div>
                        <div class="col-sm-2">
                            <p class="pDSGH1">Thành tiền</p>
                        </div>
                        <div class="col-sm-1">
                        </div>
                    </div>
                    <!--danh sách các sản phẩm trong giỏ hàng-->
                    <div class="div divProduct">
                        <c:forEach var="item" items="${carts}">
                            <div class="row rowDSGH1">
                                <div class="col-sm-1">
                                </div>
                                <div class="col-sm-2">
                                    <div class="container divImgDSHG p-1 mt-2" style="height: 133px;">
                                        <img src="<c:url value="/resources/fileupload/img/${item.getProduct().getImage()}"/>"
                                             alt="Ảnh không được tìm thấy" class="img-fluid">
                                    </div>
                                </div>
                                <div class="col-sm-3">
                                    <p class="pDSGH2">${item.getProduct().getName()}</p>
                                </div>
                                <div class="col-sm-2">
                                    <p class="pDSGH2 pdonGia">
                                        <fmt:formatNumber pattern="#,000đ" value="${item.getProduct().getPrice()}"/>
                                    </p>
                                </div>
                                <div class="col-sm-1">
                                    <div class="form-group divSLDSGH">
                                        <input type="number" class="form-control text-center txtQuantity"
                                               name="quantity"  value="${item.getQuantity()}" min="1"
                                               oninput="validity.valid||(value='');"
                                                data-id="${item.getProduct().getId()}"
                                                data-contextPath="${pageContext.request.contextPath}">
                                    </div>
                                </div>
                                <div class="col-sm-2">
                                    <p class="pDSGH2 pshowPrice">
                                        <fmt:formatNumber pattern="#,000đ"
                                                          value="${item.getProduct().getPrice()*item.getQuantity()}"/>
                                    </p>
                                </div>
                                <div class="col-sm-1" style="padding-top: 55px;">
                                    <div class="btn btn-danger btn-delete"
                                         data-id="${item.getProduct().getId()}"
                                         data-contextPath="${pageContext.request.contextPath}">
                                        Xóa
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
<%--                    <div class="row" style="height: 40px;border-bottom: 1px solid #CCCCCC;">--%>
<%--                        <div class="col-sm-1"></div>--%>
<%--                        <div class="col-sm-2"></div>--%>
<%--                        <div class="col-sm-3"></div>--%>
<%--                        <div class="col-sm-3"><p class="pDSGH1">Tổng tiền thanh toán: </p></div>--%>
<%--                        <div class="col-sm-2">--%>
<%--                            <p class="pDSGH1" id="pShowTongTienDSGH">900.000đ</p>--%>
<%--                        </div>--%>
<%--                        <div class="col-sm-1"></div>--%>
<%--                    </div>--%>
                    <div class="row">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-4">
                            <a href="<c:url value="/"/>">
                                <button type="button" class="btn btn-primary btnDSGH1 animated">Tiếp tục mua hàng</button>
                            </a>
                        </div>
                        <div class="col-sm-4">
                            <c:choose>
                                <c:when test="${not empty user_login}">
                                    <a href="<c:url value="/pay"/>">
                                        <button type="button" class="btn btn-primary btnDSGH2">Tiến hành thanh toán</button>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <button type="button" class="btn btn-primary btnDSGH2" onclick="showLogin()">
                                        Đăng nhập để thanh toán
                                    </button>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="container">
                    <div class="col-sm-12">
                        <h4>Chưa có sản phẩm nào trong giỏ hàng</h4>
                    </div>
                </div>
            </c:otherwise>
        </c:choose>
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
    <script src="<c:url value='/resources/jscss/js/gio-hang.js'/>"></script>

    <script>
        $(function () {
            $('.txtQuantity').change(function () {
                var idProduct = $(this).attr('data-id');
                var contextPath = $(this).attr('data-contextPath');
                var quantity = $(this).val();

                var url = contextPath + "/ajax/updateQuantityProductInCart";

                $.ajax({
                    url: url,
                    type: 'POST',
                    data:{
                        id: idProduct,
                        quantity: quantity
                    },
                    success: function (value) {

                    }
                })
            });

            $('.btn-delete').click(function () {
                var idProduct = $(this).attr('data-id');
                var contextPath = $(this).attr('data-contextPath');

                var url = contextPath + "/ajax/deleteProductInCart";

                $.ajax({
                    url: url,
                    type: 'POST',
                    data:{
                        id: idProduct
                    },
                    success: function (value) {
                        window.location = window.location.href;
                    }
                })
            });
        })
    </script>
</body>
</html>