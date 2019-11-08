<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Thanh toán</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/sweetalert2.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/pay.css'/>">

</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <p class="p-pay-title">Delicious</p>
                <p class="p-payDetail">Thông tin mua hàng</p>

                <form action="">
                    <div class="form-group">
                        <input type="text" class="form-control" name="" readonly value="${user_login.getFullName()}">
                        <small id="smaill-err-pay-name" class="form-text text-muted small-err"></small>

                        <input type="text" class="form-control" name="" readonly value="${user_login.getPhone()}">
                        <small id="small-err-pay-phone" class="form-text text-muted small-err"></small>

                        <textarea class="form-control" name="" id="txt-pay-address" rows="7" placeholder="Địa chỉ"></textarea>
                        <small id="small-err-pay-address" class="form-text text-muted small-err"></small>

<%--                        <label for="">Hình thức giao hàng</label>--%>
<%--                        <select class="form-control" name="" id="">--%>
<%--                            <option value="">Giao hàng tận nơi</option>--%>
<%--                            <option value="">Nhận tại cửa hàng</option>--%>
<%--                        </select>--%>

                        <textarea class="form-control" name="" id="txt-pay-note" rows="7" placeholder="Ghi chú"></textarea>
                        <small id="small-err-pay-note" class="form-text text-muted small-err"></small>
                    </div>
                </form>
            </div>

            <div class="col-sm-6 div-order">
                <div class="container">
                    <div class="row">
                        <!-- <div class="col-sm-1"></div> -->
                        <div class="col-sm-12 pt-2 mb-2" style="height: 50px;border-bottom: 1px solid #717171">
                            <p class="" style="font-size: 18px;">Đơn hàng (${carts.size()} sản phẩm)</p>
                        </div>
                    </div>
                </div>

                <div class="container-fluid" style="border-bottom: 1px solid #717171">
                    <c:forEach var="item" items="${carts}">
                        <div class="row mb-2">
                            <div class="col-sm-11">
                                <div class="row div-pay-product">
                                    <div class="col-sm-2 div-pay-product-img">
                                        <img src="<c:url
                                            value="/resources/fileupload/img/${item.getProduct().getImage()}"/>"
                                             class="img-fluid" alt="Ảnh không được tìm thấy">
                                        <p>${item.getQuantity()}</p>
                                    </div>
                                    <div class="col-sm-8 pt-2">
                                        ${item.getProduct().getName()}
                                    </div>
                                    <div class="col-sm-2 pt-2 text-right">
                                        <fmt:formatNumber pattern="#,000đ"
                                                          value="${item.getQuantity()*item.getProduct().getPrice()}"/>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                    </c:forEach>
                </div>

                <div class="row pt-2" style="margin-left: 0px;">
                    <div class="col-sm-9">
                        Tổng cộng:
                    </div>

                    <div class="col-sm-3">
                        <fmt:formatNumber pattern="#,000đ" value="${sumPrice}"/>
                    </div>
                </div>

                <div class="row mt-3">
                    <div class="col-sm-6">
                        <a href="<c:url value="/cart"/>">< Quay về giỏ hàng</a>
                    </div>

                    <div class="col-sm-6">
                        <div class="btn btn-succes btn-button" id="btn-order" style="width: 100%;"
                             data-contextPath="${pageContext.request.contextPath}">
                            Đặt hàng
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/sweetalert2.min.js'/>"></script>

    <script src="<c:url value='/resources/jscss/js/dung-chung.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/login.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/signup.js'/>"></script>

    <script>
        $(function () {
            $('#btn-order').click(function () {
                var txtAddress = $('#txt-pay-address').val();
                var txtNote = $('#txt-pay-note').val();

                var errAddress = $('#small-err-pay-address');

                var contextPath = $(this).attr('data-contextPath');
                var url = contextPath + "/ajax/order";

                if (txtAddress.length > 0){
                    errAddress.text('');

                    $.ajax({
                        url: url,
                        type: 'POST',
                        data:{
                            address: txtAddress,
                            note: txtNote
                        },
                        success: function (value) {
                            Swal.fire({
                                position: 'top-end',
                                type: 'success',
                                title: 'Đã thêm vào giỏ hàng',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function (value1) {
                                window.location = contextPath + "/";
                            });
                        }
                    })
                } else {
                    errAddress.text('Vui lòng nhập địa chỉ!');
                }
            });
        })
    </script>
</body>
</html>