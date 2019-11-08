<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Tìm kiếm ${infoSearch}</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/search.css'/>">

</head>
<body>
    <!--Header-->
    <jsp:include page="common/header.jsp"/>

    <!--content-->
    <div class="container-fluid div-content">
        <p class="p-content1" style="height: 20px"></p>
        <div class="container">
            <p class="p-content1" style="height: 20px">CÓ ${list_product_search.size()} KẾT QUẢ TÌM KIẾM PHÙ HỢP CHO ${infoSearch}</p>

            <div class="row">
                <c:forEach var="item" items="${list_product_search}">
                    <div class="col-sm-4 mb-3">
                        <div class="card div-search-item text-center">
                            <div class="container mt-2 divImgMANB text-center" style="width: 330px; height: 272px">
                                <img class="card-img-top" src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                     alt="Ảnh không được tìm thấy">
                                <div class="divImgBlur"></div>
                                <div class="divIconXemNhanhMuaHang">
                                    <div class="divIconXemNhanh" data-idProduct="${item.getId()}"
                                         data-contexPath = "${pageContext.request.contextPath}">
                                        <i class="fas fa-eye"></i>
                                    </div>
                                    <div class="divIconMuaHang" data-idProduct="${item.getId()}">
                                        <i class="fas fa-cart-plus"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body">
                                <a href="">
                                    <h4 class="card-title pTieuDeMonAn">${item.getName()}</h4>
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
</body>
</html>