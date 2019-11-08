<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious | Admin</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/admin-common.css'/>">

    <style>
        #accordianId>a:nth-child(1) h6{
            color: #ef7147;
        }
    </style>
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
            <div class="row pt-4">
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h3 class="card-title">
                                        ${quantityOrderOnDay}
                                    </h3>
                                    <p class="card-text">Hóa đơn</p>
                                </div>
                                <div class="col-sm-4">
                                    <i class="fas fa-file-invoice" style="font-size: 60px;"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 pt-2" style="border-top: 1px solid #ebebeb;">
                                    <p class="card-text" style="font-size: 14px">Tổng số hóa đơn bán trong ngày</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h3 class="card-title">
                                        ${quantityNewCustomerOnDay}
                                    </h3>
                                    <p class="card-text">Khách hàng</p>
                                </div>
                                <div class="col-sm-4">
                                    <i class="fas fa-user" style="font-size: 60px;"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 pt-2" style="border-top: 1px solid #ebebeb;">
                                    <p class="card-text" style="font-size: 14px">Tổng số khách hàng mới trong ngày</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h3 class="card-title">
                                        ${quantityEmployee}
                                    </h3>
                                    <p class="card-text">Nhân viên</p>
                                </div>
                                <div class="col-sm-4">
                                    <i class="fas fa-user-secret" style="font-size: 60px;"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 pt-2" style="border-top: 1px solid #ebebeb;">
                                    <p class="card-text" style="font-size: 14px">Tổng số nhân viên của cửa hàng</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="card">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-8">
                                    <h3 class="card-title">
                                        ${quantityProduct}
                                    </h3>
                                    <p class="card-text">Sản phẩm</p>
                                </div>
                                <div class="col-sm-4">
                                    <i class="fas fa-pizza-slice" style="font-size: 60px;"></i>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-12 pt-2" style="border-top: 1px solid #ebebeb;">
                                    <p class="card-text" style="font-size: 14px">Tổng số sản phẩm đang kinh doanh</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--end center-->
    </div><!--end content-->

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/admin-dung-chung.js'/>"></script>
    </body>
</html>