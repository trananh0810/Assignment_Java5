<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Sản phẩm</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/index.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/product.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/sweetalert2.min.css'/>">

    <style>
        .divHeaderMenu>ul>li:nth-child(2),.divHeaderMenu>ul>li:nth-child(2)>a{
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
            <div class="row">
                <div class="col-sm-3">
                    <!--category-->
                    <div class="category">
                        <div class="category-head">DANH MỤC</div>
                        <ul id="ul-menu-cate">
                            <a href="<c:url value="/product/cate/0"/>"><li data-idCate="0">Tất cả sản phẩm</li></a>

                            <c:forEach var="item" items="${list_cate_product}">
                                <a href="<c:url value="/product/cate/${item.getId()}"/>">
                                    <li data-idCate="${item.getId()}">${item.getName()}</li>
                                </a>
                            </c:forEach>
                        </ul>
                    </div> <!-- end category-->
                </div>

                <div class="col-sm-9">
                    <!--product-->
                    <div class="product">
                        <p class="p-product-title">
                            <c:choose>
                                <c:when test="${empty cate_name}">
                                    TẤT CẢ SẢN PHẨM
                                </c:when>
                                <c:otherwise>
                                    ${cate_name}
                                </c:otherwise>
                            </c:choose>
                        </p>

                        <div class="row">
                            <c:forEach var="item" items="${list_product}">
                                <div class="div-product-item col-sm-4 text-center">
                                    <div class="card">
                                        <div class="container mt-2 divImgMANB text-center" style="height: 184px">
                                            <img class="card-img-top" src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                                 alt="Ảnh không được tìm thấy">
                                            <div class="divImgBlur"></div>
                                            <div class="divIconXemNhanhMuaHang" style="padding-left: 65px">
                                                <div class="divIconXemNhanh" data-idProduct="${item.getId()}"
                                                     data-contexPath = "${pageContext.request.contextPath}">
                                                    <i class="fas fa-eye"></i>
                                                </div>
                                                <div class="divIconMuaHang" data-idProduct="${item.getId()}"
                                                     data-contextPath = "${pageContext.request.contextPath}">
                                                    <i class="fas fa-cart-plus"></i>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body">
                                            <a href="<c:url value="/product/${item.getId()}"/>">
                                                <h5 class="card-title pTieuDeMonAn">${item.getName()}</h5>
                                            </a>
                                            <p class="card-text p-price">
                                                <fmt:formatNumber pattern="#,000đ" value="${item.getPrice()}"/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!--end content-->

    <!--chân trang-->
    <jsp:include page="common/footer.jsp"/>
    <!--end footer-->

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>

    <script src="<c:url value='/resources/jscss/js/sweetalert2.min.js'/>"></script>

    <script src="<c:url value='/resources/jscss/js/dung-chung.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/index.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/login.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/signup.js'/>"></script>

    <script>
        $(function () {
            $('#ul-menu-cate li').css("color","black");

            $('#ul-menu-cate').find("li[data-idcate=${idCateProduct}]").css("color","#ef7147");
        })
    </script>
</body>
</html>