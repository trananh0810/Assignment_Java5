<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - ${product.getName()}</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/sweetalert2.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/index.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/product-detail.css'/>">

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
                <div class="col-sm-9">
                    <div class="container">
                        <div class="row">
                            <div class="col-sm-5 div-img" style="margin: 0!important;">
                                <img src="<c:url value="/resources/fileupload/img/${product.getImage()}"/>"
                                     class="img-fluid" alt="Ảnh không được tìm thấy">
                            </div>

                            <div class="col-sm-7">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <p class="p-product-title">${product.getName()}</p>
                                        </div>
                                    </div>
                                    <div class="row div-product-price">
                                        <div class="col-sm-12">
                                            <p class="p-product-price">
                                                <fmt:formatNumber pattern="#,000đ" value="${product.getPrice()}"/>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="row div-product-quantity pt-4">
<%--                                        <div class="col-sm-3">Số lượng</div>--%>
<%--                                        <div class="col-sm-3">--%>
<%--                                            <input type="number" class="form-control text-center" name="" min="1" value="1">--%>
<%--                                        </div>--%>
                                        <div class="col-sm-6">
                                            <button type="button" class="btn btn-primary btn-button divIconMuaHang"
                                                    id="btn-addCart"
                                                    data-idProduct="${product.getId()}"
                                                    data-contextPath = "${pageContext.request.contextPath}">
                                                Thêm vào giỏ hàng
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row" style="height: 60px;">
                                        <div class="col-sm-1 pt-2" style="color: #ef7147; font-size: 40px">
                                            <i class="fas fa-phone-square"></i>
                                        </div>
                                        <div class="col-sm-8 text-center pt-3">
                                            <p style="margin: 0;">Đặt mua qua điện thoại (8h-22h)</p>
                                            <p style="color: #ef7147">1800 6750</p>
                                        </div>
                                        <div class="col-sm-3 pt-3 text-center div-product-shoppingGuide">
                                            <a href="<c:url value="/shopping-guide"/>">
                                                Hướng dẫn mua hàng
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="div-transport">
                        <p class="p-transport-title">
                            <i class="fas fa-truck"></i> VẬN CHUYỂN MIỄN PHÍ
                        </p>
                        <p class="p-transport-content text-center">
                            <b>Nội thành Hà Nội với đơn hàng trên 300.000đ</b>
                        </p>
                    </div>
                    <div class="div-transport2 container">
                        <div class="row div-transport2-item">
                            <div class="col-sm-2"><i class="fas fa-server"></i></div>
                            <div class="col-sm-10">
                                <p class="p-transport-title2">Giao hàng tận nhà và nhanh chóng</p>
                            </div>
                        </div>
                        <div class="row div-transport2-item">
                            <div class="col-sm-2"><i class="fas fa-dollar-sign"></i></div>
                            <div class="col-sm-10">
                                <p class="p-transport-title2">Thu tiền tại nhà, đảm bảo an toàn</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!--Nội dung chi tiết sản phẩm-->
            <div class="row mt-3">
                <div class="col-sm-9">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#home">Chi tiết sản phẩm</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#menu1">Bình luận sản phẩm</a>
                        </li>
                    </ul>

                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane container active div-product-tab div-product-tab-detail p-4 text-justify" id="home">
                            ${product.getDetail()}
                        </div>
                        <!--tab comment-->
                        <div class="tab-pane container fade div-product-tab div-product-tab-comment" id="menu1">
                            <div class="row">
                                <div class="col-sm-12">
                                    <p>Đánh giá sản phẩm</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-3 pl-3 pt-4 text-center">
                                    <p>${avg_rating_product} <i class="fas fa-star" style="color:#ffde3c"></i>
                                        ${product.getListComment().size()} <i class="fas fa-comment"></i>
                                    </p>
                                </div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-3"></div>
                                <div class="col-sm-3 pt-3">
                                    <c:choose>
                                        <c:when test="${not empty user_login}">
                                            <div class="btn btn-success btn-button" id="btn-writeComment">
                                                Viết đánh giá
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="btn btn-success btn-button" onclick="showLogin()">
                                                Đăng nhập
                                            </div>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                            </div>
                            <!--comments-->
                            <div class="div-comments">
                                <c:forEach var="item" items="${product.getListComment()}">
                                    <div class="row">
                                        <div class="col-sm-3 pt-2 pb-2 text-center" style="border-right: 1px solid #ebebeb">
                                            <span style="color: #ef7147">${item.getUser().getFullName()}</span> <br>
                                            <span>${item.getRatingValue()} <i class="fas fa-star" style="color:#ffde3c"></i></span> <br>
                                            <span>${item.getCreatedDate()}</span>
                                        </div>
                                        <div class="col-sm-9 pt-2 pb-2">
                                            <span style="color: #ef7147">${item.getTitle()}</span> <br> <br>
                                            <span>${item.getContent()}</span>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div><!--end comments-->
<%--                            <!--paging-->--%>
<%--                            <div class="row pt-3 text-center">--%>
<%--                                <nav aria-label="Page navigation example" style="margin-left: 575px">--%>
<%--                                    <ul class="pagination">--%>
<%--                                        <li class="page-item">--%>
<%--                                            <a class="page-link" href="#" aria-label="Previous">--%>
<%--                                                <span aria-hidden="true">&laquo;</span>--%>
<%--                                            </a>--%>
<%--                                        </li>--%>
<%--                                        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--                                        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--                                        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--                                        <li class="page-item">--%>
<%--                                            <a class="page-link" href="#" aria-label="Next">--%>
<%--                                                <span aria-hidden="true">&raquo;</span>--%>
<%--                                            </a>--%>
<%--                                        </li>--%>
<%--                                    </ul>--%>
<%--                                </nav>--%>
<%--                            </div><!--end paging-->--%>
                        </div> <!--end tab comment-->
                    </div>
                </div>
            </div>
        </div>
    </div> <!--end content-->

    <!-- Form Comment -->
    <div class="modal fade" id="div-formComment" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Viết đánh giá sản phẩm</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group text-center">
                        <form id="form-comment">
                            <label for="">Đánh giá</label>

                            <select class="form-control" name="ratingValue">
                                <option value="1">1 sao</option>
                                <option value="2">2 sao</option>
                                <option value="3">3 sao</option>
                                <option value="4">4 sao</option>
                                <option value="5">5 sao</option>
                            </select>

                            <input type="hidden" class="form-control" name="idProduct" value="${product.getId()}">

                            <label for=""></label>
                            <input type="text" class="form-control" value="${user_login.getFullName()}" disabled>
                            <small id="helpId1" class="form-text text-muted"></small>

                            <label for=""></label>
                            <input type="text" class="form-control" value="${user_login.getEmail()}" disabled>
                            <small id="helpId2" class="form-text text-muted"></small>

                            <label for=""></label>
                            <input type="text" class="form-control" id="txt-comment-title" name="title" placeholder="Tiêu đề">
                            <small id="err-comment-title" class="form-text text-muted small-error"></small>

                            <label for=""></label>
                            <textarea class="form-control" id="txt-comment-content" name="content" rows="5" placeholder="Nội dung"></textarea>
                            <small id="err-comment-content" class="form-text text-muted small-error"></small>

                            <button type="button" class="btn btn-primary btn-button mt-2" id="btn-send-comment"
                                    data-contentPath="${pageContext.request.contextPath}">
                                Gửi
                            </button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div><!--end form comment-->

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
    <script src="<c:url value='/resources/jscss/js/product-detail.js'/>"></script>

    <script>
        $(function () {
            $('#btn-send-comment').click(function () {
                var contextPath = $(this).attr("data-contentPath");
                var url = contextPath + "/comment";

                if (checkInfoComment()){
                    $.ajax({
                        url: url,
                        type: 'POST',
                        data: $('#form-comment').serialize(),
                        success: function (value) {
                            Swal.fire({
                                position: 'top-end',
                                type: 'success',
                                title: 'Gửi bình luận thành công!',
                                showConfirmButton: false,
                                timer: 1500
                            }).then(function (value1) {
                                window.location = window.location.href;
                            });
                        }
                    })
                }
            });
        })

        function checkInfoComment() {
            var txtTitle = $('#txt-comment-title');
            var txtContent = $('#txt-comment-content');
            var errTitle = $('#err-comment-title');
            var errContent = $('#err-comment-content');

            if (txtTitle.val().length == 0){
                errTitle.text('Vui lòng nhập tiêu đề!')
                return false;
            } else {
                errTitle.text('')
            }

            if (txtContent.val().length == 0){
                errContent.text('Vui lòng nhập nội dung!')
                return false;
            } else {
                errContent.text('')
            }

            return true;
        }
    </script>
</body>
</html>