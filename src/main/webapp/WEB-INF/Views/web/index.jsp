<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/index.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/sweetalert2.min.css'/>">

    <style>
        .divHeaderMenu>ul>li:nth-child(1),.divHeaderMenu>ul>li:nth-child(1)>a{
            color: #ef7147;
        }
    </style>
</head>
<body>
    <jsp:include page="common/header.jsp"/>

    <!--Thông báo thêm vào giỏ hàng-->
    <div class="divThemVaoGioHang">
        <div class="container">
            <p class="pThemVaoGH1 pt-2">Sản phẩm đã được thêm vào giỏ hàng</p>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-sm-4">
                    <div class="container">
                        <img src="<c:url value="/resources/fileupload/img/lamington.jpg"/>" class="img-fluid" alt="">
                    </div>
                </div>
                <div class="col-sm-8" style="padding: 0">
                    <span class="spanTVGH1">Lamington</span> <br>
                    <span class="spanTVGH2">300.000đ</span>
                    <div class="row">
                        <div class="btn btn-primary btnThemVaoGH" style="margin-left: 15px;margin-right: 10px"
                             onClick="hiddenTVGH()">Tiếp tục mua hàng
                        </div>
                        <div class="btn btn-primary btnThemVaoGH">Tiến hành thanh toán</div>
                    </div>
                </div>
            </div>
        </div>
    </div><!--end thông báo thêm vào giỏ hàng-->



    <!--slide-->
    <div id="carouselId" class="carousel slide" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#carouselId" data-slide-to="0" class="active"></li>
            <li data-target="#carouselId" data-slide-to="1"></li>
            <li data-target="#carouselId" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <img src="<c:url value="/resources/fileupload/img/slider_1.png"/>" alt="First slide">
            </div>
            <div class="carousel-item">
                <img src="<c:url value="/resources/fileupload/img/slider_2.png"/>" alt="Second slide">
            </div>
            <div class="carousel-item">
                <img src="<c:url value="/resources/fileupload/img/slider_3.png"/>" alt="Third slide">
            </div>
        </div>
        <a class="carousel-control-prev" href="#carouselId" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselId" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div><!--end slide-->

    <!--content-->

    <!--Món ăn nổi bật-->
    <div class="container-fluid text-center divMANB pt-5">
        <div class="container pt-1">
            <img src="<c:url value="/resources/fileupload/img/icon-banh.png"/>" alt="">
            <p class="mt-2 pMANB1">--------------------------------------MÓN ĂN NỔI
                BẬT--------------------------------------</p>
            <div class="card-deck">
                <c:forEach var="item" items="${top3_product_noi_bat}">
                    <div class="card">
                        <div class="container mt-2 divImgMANB text-center" style="height: 272px;">
                            <img class="card-img-top" src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                 alt="Ảnh không được tìm thấy">
                            <div class="divImgBlur"></div>
                            <div class="divIconXemNhanhMuaHang">
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
                                <h4 class="card-title pTieuDeMonAn">${item.getName()}</h4>
                            </a>
                            <p class="card-text p-price">
                                <fmt:formatNumber pattern="#,000đ" value="${item.getPrice()}"/>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div> <!--end món ăn nổi bật-->


    <!--Món ăn được ưa chuộng-->
    <div class="container-fluid text-center divMADUC pt-5 pb-5">
        <div class="container pt-1">
            <img src="<c:url value="/resources/fileupload/img/icon-banh.png"/>" alt="">
            <p class="mt-2 pMANB1">-----------------------------------MÓN ĂN ĐƯỢC ƯA
                CHUỘNG-----------------------------------</p>
            <div class="row">
                <div class="card-deck">
                    <c:forEach var="item" items="${top4_product_bc_nhat}">
                        <div class="card">
                            <div class="container mt-2 divImgMANB" style="">
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
                                <p class="card-text p-price" id="pShowPriceMADUC_lamington">
                                    <fmt:formatNumber pattern="#,000đ" value="${item.getPrice()}"/>
                                </p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div> <!--end món ăn được ưa chuộng-->

    <!--Món ăn mới-->
    <div class="container-fluid divMAM pt-5 text-center pb-5">
        <div class="container pt-1">
            <img src="<c:url value="/resources/fileupload/img/icon-banh.png"/>" alt="">
            <p class="mt-2 pMANB1" style="color: white">--------------------------------------------MÓN ĂN
                MỚI--------------------------------------------</p>
            <div class="row mb-3">
                <c:forEach var="item" items="${top4_mon_an_moi}">
                    <div class="col-sm-6 mb-3">
                        <div class="card pt-2 divMAMChild" style="background-color: #ffffff1a">
                            <div class="container-fluid mt-1">
                                <div class="row">
                                    <div class="col-sm-3" style="width: 134.5px;height: 94px">
                                        <img src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                             alt="Ảnh không được tìm thấy" class="img-fluid"
                                            style="width: 104px;height: 86px">
                                    </div>
                                    <div class="col-sm-9 text-left">
                                        <a href="<c:url value="/product/${item.getId()}"/>">
                                            <h6 class="tenMonAnMAM">${item.getName()}</h6>
                                        </a>
                                        <h6 class="priceMAM">
                                            <fmt:formatNumber pattern="#,000đ" value="${item.getPrice()}"/>
                                        </h6>
                                        <h6 class="motaMAM">
                                            <c:if test="${item.getDetail().length() > 60}">
                                                <h6 class="motaMAM">${fn:substring(item.getDetail(),0 ,60)}...</h6>
                                            </c:if>
                                            <c:if test="${item.getDetail().length() <= 60}">
                                                <h6 class="motaMAM">${fn:substring(item.getDetail(),0 ,60)}...</h6>
                                            </c:if>
                                        </h6>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div><!--end món ăn mới-->


    <!--Blog-->
    <div class="container-fluid pt-5 text-center divBlog">
        <div class="container">
            <img src="<c:url value="/resources/fileupload/img/icon-banh.png"/>" alt="">
            <p class="mt-2 pMANB1">
                ----------------------------------------------BLOG----------------------------------------------</p>
            <div class="card-deck">
                <c:forEach var="item" items="${top3_blog_xem_nhieu}">
                    <div class="card ">
                        <div class="container mt-2 divImgMANB" style="height: 331px;height: 220px">
                            <img class="card-img-top" src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                 alt="Ảnh không tìm thấy" style="height: 220px">
                        </div>
                        <div class="card-body text-left">
                            <div class="btn btn-warning btnBlog">LỢI ÍCH</div>
                            <a href="<c:url value="/blog/${item.getId()}"/>">
                                <p class="card-text text-justify mt-2 tieuDeBlog">
                                    ${item.getTitle()}
                                </p>
                            </a>
                            <a href="<c:url value="/blog/${item.getId()}"/>">
                                <p class="chiTietBlog">Xem chi tiết</p>
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div><!--end blog-->

    <!--Introduce-->
    <div class="container-fluid divIntro pt-5 pb-5">
        <div class="container">
            <div class="row">
                <div class="col-sm-1"></div>
                <div class="col-sm-5">
                    <img src="<c:url value="/resources/fileupload/img/section_introduce_avatar.png"/>" class="img-fluid" alt=""
                         style="cursor: pointer;border-radius: 10px">
                </div>
                <div class="col-sm-5 pt-5">
                    <img src="<c:url value="/resources/fileupload/img/logo.jpg"/>" alt="" style="cursor: pointer">
                    <p class="mt-3 text-justify">Được khởi xướng và vận hành bởi một nhóm người trẻ năng động, cửa hàng bánh
                        ngọt và đồ uống DELICIOUS đang dần khẳng định chỗ đứng trong thị trường đồ ăn giải khát phong phú và
                        đa dạng ở Hà Nội. Hướng tới đối tượng khách hàng là các bạn trẻ năng động, chúng tôi quan tâm tới
                        chất lượng và hình ảnh của sản phẩm.</p>
                    <p class="chiTietBlog">Đọc thêm</p>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div>
    </div>

    <!--cam kết-->
    <div class="container-fluid pt-5 pb-5 divDichVu">
        <div class="container">
            <div class="card-deck">
                <div class="card text-center divDichVuChild">
                    <div class="container">
                        <img src="<c:url value="/resources/fileupload/img/dichvu_1.png"/>" alt="">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">CHUYỂN PHÁT NHANH</h5>
                        <p class="card-text">Chúng tôi miễn phí với đơn hàng trên 350.000đ tại Hà Nội và free ship toàn quốc
                            với đơn hàng 700.000đ</p>
                    </div>
                </div>
                <div class="card text-center divDichVuChild">
                    <div class="container">
                        <img src="<c:url value="/resources/fileupload/img/dichvu_2.png"/>" alt="">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">LÀM BÁNH THEO YÊU CẦU</h5>
                        <p class="card-text">Chiếc bánh được thiết kế riêng, độc đáo dành cho người thân, bạn bè chắc hẳn sẽ
                            là một món quà bất ngờ và đặc biệt nhất.</p>
                    </div>
                </div>
                <div class="card text-center divDichVuChild">
                    <div class="container">
                        <img src="<c:url value="/resources/fileupload/img/dichvu_3.png"/>" alt="">
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">HỖ TRỢ KHÁCH HÀNG</h5>
                        <p class="card-text">Trung tâm chăm sóc khách hàng của DELICIOUS, hotline (024) 73086880 để được hỗ
                            trợ giải đáp.</p>
                    </div>
                </div>
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

    <script src="<c:url value='/resources/jscss/js/sweetalert2.min.js'/>"></script>

    <script src="<c:url value='/resources/jscss/js/dung-chung.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/index.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/login.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/signup.js'/>"></script>


</body>
</html>