<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Giới thiệu</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/introduce.css'/>">

    <style>
        .divHeaderMenu>ul>li:nth-child(3),.divHeaderMenu>ul>li:nth-child(3)>a{
            color: #ef7147;
        }
    </style>
</head>
<body>
    <!--Header-->
    <jsp:include page="common/header.jsp"/>

    <!--content-->
    <div class="container-fluid div-content" style="height: auto;">
        <div class="container div-content-item">
            <p class="p-content1">GIỚI THIỆU</p>

            <p class="p-content2">
                <span class="span-conten1">Delicious CAKE & DRINK</span> được biết đến là một thương hiệu bánh ngọt và nước uống hấp dẫn cho mọi đối tượng người Việt.
            </p>

            <p class="p-content2">
                Trước tiên là sự thay đổi về thiết kế đã đem lại sự trẻ trung và sống động cho <span class="span-conten1">Delicious CAKE & DRINK</span>. Toàn bộ chuỗi cửa hàng <span class="span-conten1">Delicious CAKE & DRINK</span> trở nên bắt mắt hơn với trần nhà màu trắng và hệ thống đèn chiếu sáng hiện đại. Các cụm đèn màu cam và trắng gắn trên trần cũng đem lại cảm giác năng động nhưng không kém phần gần gũi cho những thực khách đặt chân đến với nơi này. Những sắc màu trẻ trung và họa tiết trên các tủ bánh cũng đem lại cảm giác thích thú khi khách hàng nhìn ngắm và lựa chọn từng chiếc bánh thật ngon mang tên <span class="span-conten1">Delicious</span>.
            </p>

            <p class="p-content2">
                Thay đổi thứ hai chính là sự bắt kịp với xu hướng thời đại của thương hiệu <span class="span-conten1">Delicious CAKE & DRINK</span>. 20 chi nhánh hiện nay đang phát triển theo mô hình kết hợp giữa bánh ngọt và nước uống, tạo không gian mua sắm tiện nghi, nơi thư giãn thoải mái cho tất cả mọi người. Các nhóm bạn hoặc đại gia đình có thể chọn <span class="span-conten1">Delicious CAKE & DRINK</span> làm điểm hẹn lý thú vào thời gian rảnh rỗi. Trong một không gian sang trọng và ấm cúng, mọi người ngồi quây quần bên nhau nhâm nhi những chiếc bánh ngọt ngon miệng cùng với tách café, trà nóng hoặc ly trà sữa thơm ngon, để cảm nhận hết những giá trị tuyệt vời mà <span class="span-conten1">Delicious CAKE & DRINK</span> đem lại.
            </p>

            <p class="p-content2">
                Những sản phẩm bánh mới nhất của thương hiệu <span class="span-conten1">Delicious CAKE & DRINK</span> như Bánh kem Chocolate nghệ thuật, bánh kem Black Forest, Milky Bun, Blubberry Polo thơm lừng, bánh phô mai, bánh kem Chocolate cao cấp, bánh Tiramisu đẳng cấp… Về nước uống phục vụ quý khách, chuỗi cửa hàng <span class="span-conten1">Delicious CAKE & DRINK</span> hân hạnh giới thiệu thực đơn là các loại café, trà nóng, các loại trà sữa thích hợp cho giới trẻ,… Thật tuyệt vời khi vị ngọt ngào tinh tế của bánh ngọt hòa quyện vào vị thơm lừng của các loại thức uống ở <span class="span-conten1">Delicious CAKE & DRINK</span>.
            </p>

            <p class="p-content2">
                Sự sành điệu thuộc về những người biết lựa chọn đúng gu thưởng thức ẩm thực của chính mình.
            </p>

            <p class="p-content2">
                Cảm ơn vì sự tin yêu dành cho <span class="span-conten1">Delicious CAKE & DRINK!</span>
            </p>
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