<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tittle</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">
</head>
<body>
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="divXemNhanhSP">
                <div class="conatiner-fluid">
                    <div class="divXemNhanhSPLeft pt-3">
                        <div class="container-fluid">
                            <img src="<c:url value="/resources/fileupload/img/${product.getImage()}"/>"
                                 class="img-fluid" alt="Ảnh không được tìm thấy">
                        </div>
                    </div>

                    <div class="divXemNhanhSPRight pt-3">
                        <div class="container">
                            <p class="pXemNhanhTieuDe">${product.getName()}</p>
                            <!-- <span class="spanXemNhanh1">Tình trạng: </span><span class="spanXemNhanh2">Còn hàng</span> -->
                            <p class="pXemNhanhGia">
                                <fmt:formatNumber pattern="#,000đ" value="${product.getPrice()}"/>
                            </p>
                            <div class="divGachNgang"></div>
                        </div>
                        <div class="container pt-3">
<%--                            <span class="spanXemNhanh1" style="float: left;padding-top: 10px">Số lượng</span>--%>
<%--                            <input type="text" class="form-control" name="" id="inputXemNhanhSp_Sl"--%>
<%--                                   aria-describedby="helpId"--%>
<%--                                   placeholder="" style="width: 100px" value="1">--%>
<%--                            <div class="btn btn-primary btnTVGH" data-dismiss="modal" onClick="">Thêm vào giỏ hàng</div>--%>
<%--                            <div class="divGachNgang mt-3"></div>--%>
                        </div>
                        <div class="container pt-3	">
                            <i class="fas fa-phone-volume" style="font-size: 30px;color: red"></i>
                            <span style="font-family: Arial">Đặt mua qua điện thoại (8h - 22h)</span>
                            <p style="font-size: 18px;color: #ef7147;font-weight: bold;font-family: Arial;margin-left: 27px">
                                (024) 730868800</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
</body>
</html>