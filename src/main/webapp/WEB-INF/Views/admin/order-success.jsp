<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious | Admin - Đơn hàng thành công</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">


    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/admin-common.css'/>">
</head>
<body>
    <!--header-->
    <jsp:include page="common/header.jsp"/>
    <!--end header-->

    <!--content-->
    <div class="div-content">
        <!--menu-->
        <jsp:include page="common/menu.jsp"/>
        <!--end menu-->

        <!--center-->
        <div class="container-fluid div-content-center">
            <div class="row mt-3">
                <c:forEach var="item" items="${listOrder}">
                    <div class="col-sm-4 mb-3">
                        <div class="card" style="border: 3px solid green">
                            <div class="card-header text-center">
                                Mã đơn hàng: ${item.id}
                            </div>
                            <div class="card-header" style="background: none">
                                <p><i class="fas fa-street-view"></i> ${item.user.fullName}</p>
                                <p><i class="fas fa-map-marker-alt"></i> ${item.address}</p>
                                <p><i class="fas fa-mobile-alt"></i> ${item.user.phone}</p>
                            </div>

                            <c:forEach var="item2" items="${item.listOrderDetail}">
                                <div class="card-body" style="border-bottom: 1px solid #eae9e9">
                                    <div class="row">
                                        <div class="col-sm-8">
                                            <p class="card-text">
                                                    ${item2.product.name}
                                            </p>
                                        </div>
                                        <div class="col-sm-4">
                                            <p class="card-text">
                                                    ${item2.quantity}x<fmt:formatNumber pattern="#,000đ" value="${item2.price}"/>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div><!--end center-->
    </div><!--end content-->

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/admin-dung-chung.js'/>"></script>

    <script>
        $(function () {
            $('#section4ContentId').addClass('show');
            $('#section4HeaderId>h6>a').css('color','#ef7147');
            $('#section4ContentId ul>a:nth-child(3)>li').css('color','#ef7147');
        })
    </script>
</body>
</html>