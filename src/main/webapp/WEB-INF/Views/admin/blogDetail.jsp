<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious | Admin - Chi tiết Blog</title>

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
            <div class="col-sm-12">
                <form action="<c:url value="/admin/blog/addEdit"/>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <c:if test="${not empty blog}">
                            <input type="hidden" name="id" value="${blog.id}">
                            <input type="hidden" name="createdDate" value="${blog.createdDate}">
                            <input type="hidden" name="quantityView" value="${blog.quantityView}">
                            <input type="hidden" name="image" value="${blog.image}">
                            <input type="hidden" name="userId" value="${blog.user.id}">
                        </c:if>

                        <label>Tên sản phẩm</label>
                        <input type="text" class="form-control" name="title" value="${blog.title}" required>
                        <small id="helpId" class="form-text text-muted small-error"></small>

                        <label>Danh mục</label>
                        <select class="form-control" name="idCate" id="cbx-cate">
                            <c:forEach var="item" items="${listCateBlog}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                        <small id="helpId1" class="form-text text-muted"></small>

                        <label>Hình ảnh</label>
                        <input type="file" id="choose-img" class="form-control-file" name="file">
                        <small id="fileHelpId" class="form-text text-muted small-error"></small>

                        <c:if test="${not empty blog}">
                            <img id="img-avatar" src="<c:url value="/resources/fileupload/img/${blog.image}"/>"
                                 style="width: 150px">
                            <br><br>
                        </c:if>
                        <c:if test="${empty blog}">
                            <img id="img-avatar" src="<c:url value=""/>" style="width: 150px">
                            <br><br>
                        </c:if>

                        <label>Nội dung</label>
                        <textarea class="form-control" id="txtContent" name="content" rows="10">${blog.content}</textarea>

                        <br>

                        <a href="<c:url value="/admin/blog"/>">
                            <div class="btn btn-danger">Hủy</div>
                        </a>

                        <button type="submit" class="btn btn-success">Lưu</button>
                    </div>
                </form>
            </div>
        </div><!--end center-->
    </div><!--end content-->

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
    <script src="<c:url value='/resources/ckeditor/ckeditor.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/admin-dung-chung.js'/>"></script>

    <script>
        $(function () {
            $('#section2ContentId').addClass('show');
            $('#section2HeaderId>h6>a').css('color','#ef7147');
            $('#section2ContentId ul>a:nth-child(5)>li').css('color','#ef7147');

            $('#choose-img').change(function () {
                if (this.files && this.files[0]){
                    var reader = new FileReader();

                    reader.onload = function (ev) {
                        $('#img-avatar').attr('src', reader.result);
                    }

                    reader.readAsDataURL(this.files[0]);
                }
            });

            var editor = CKEDITOR.replace('txtContent');
        })
    </script>
</body>
</html>