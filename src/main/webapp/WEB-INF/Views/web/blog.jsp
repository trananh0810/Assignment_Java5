<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - Blog</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/blog.css'/>">

    <style>
        .divHeaderMenu>ul>li:nth-child(4),.divHeaderMenu>ul>li:nth-child(4)>a{
            color: #ef7147;
        }
    </style>
</head>
<body>
    <jsp:include page="common/header.jsp"/>

    <!--content-->
    <div class="container-fluid div-content">
        <p class="p-content1" style="height: 20px"></p>
        <div class="container">
            <div class="row">
                <div class="col-md-8">
                    <c:forEach var="item" items="${list_blog}">
                        <div class="card card-blog-item">
                            <div class="container-fluid mt-3" style="height: 208px;">
                                <img class="card-img-top"
                                     src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                     alt="Ảnh không được tìm thấy">
                            </div>
                            <div class="card-body">
                                <div class="btn btnBlog">${item.getCategoryBlog().getName()}</div>
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

                <div class="col-md-4">
                    <p class="p-content1" style="height: 20px;font-size: 18px">BÀI VIẾT XEM NHIỀU</p>

                    <div class="container-fluid">
                        <c:forEach var="item" items="${top3_blog_xem_nhieu}">
                            <div class="row div-blogXemNhieu-item">
                                <div class="col-md-5 div-blog-img">
                                    <img src="<c:url value="/resources/fileupload/img/${item.getImage()}"/>"
                                         alt="Ảnh không được tìm thấy"
                                         class="img-fluid">
                                </div>

                                <div class="col-md-7">
                                    <a href="<c:url value="/blog/${item.getId()}"/>">
                                        <p class="p-blog1">
                                            ${item.getTitle()}
                                        </p>
                                    </a>

                                    <p class="p-blog2">
                                        ${item.getCreatedDate()}
                                    </p>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

<%--            <div class="row">--%>
<%--                <div class="col-md-8 text-center">--%>
<%--                    <div class="btn btnBlog">Xem thêm</div>--%>
<%--                </div>--%>

<%--                <div class="col-md-4"></div>--%>
<%--            </div>--%>
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
    <script src="<c:url value='/resources/jscss/js/blog.js'/>"></script>
</body>
</html>