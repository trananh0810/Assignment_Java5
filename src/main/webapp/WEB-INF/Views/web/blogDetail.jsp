<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious - ${blog.getTitle()}</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/dung-chung.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/blog-detail.css'/>">

    <style>
        .divHeaderMenu>ul>li:nth-child(4),.divHeaderMenu>ul>li:nth-child(4)>a{
            color: #ef7147;
        }
    </style>
</head>
<body>
    <!--Header-->
    <jsp:include page="common/header.jsp"/>

    <!--content-->
    <div class="container-fluid div-content">
        <p class="p-content1" style="height: 20px"></p>
        <div class="container">
            <div class="row div-blogDetail-title text-center">
                <p style="width: 100%;">
                    ${blog.getTitle().toUpperCase()}
                </p>
            </div>

            <div class="row div-blogDetail-content mt-5 mb-5 text-justify">
                ${blog.getContent()}
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
    <script src="<c:url value='/resources/jscss/js/blog.js'/>"></script>
</body>
</html>