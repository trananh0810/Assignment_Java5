<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious | Admin - Chi tiết ${product.name}</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/sweetalert2.min.css'/>">


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
                <form action="<c:url value="/admin/product/addEdit"/>" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <c:if test="${not empty product}">
                            <input type="hidden" name="id" value="${product.id}">
                            <input type="hidden" name="createdDate" value="${product.createdDate}">
                            <input type="hidden" name="quantityView" value="${product.quantityView}">
                            <input type="hidden" name="image" value="${product.image}">
                        </c:if>

                        <input type="hidden" name="idCate" value="1">

                        <label>Tên sản phẩm</label>
                        <input type="text" class="form-control" name="name" value="${product.name}" required>
                        <small id="helpId" class="form-text text-muted small-error"></small>

                        <label>Danh mục</label>
                        <select class="form-control" name="idCate" id="cbx-cate">
                            <c:forEach var="item" items="${list_cate_product}">
                                <option value="${item.id}">${item.name}</option>
                            </c:forEach>
                        </select>
                        <small id="helpId1" class="form-text text-muted"></small>

                        <label>Giá</label>
                        <input type="number" class="form-control" name="price" required value="${product.price}">
                        <small id="helpId2" class="form-text text-muted small-error"></small>

                        <label>Hình ảnh</label>
                        <input type="file" id="choose-img" class="form-control-file" name="file">
                        <small id="fileHelpId" class="form-text text-muted small-error"></small>

                        <c:if test="${not empty product}">
                            <img id="img-avatar" src="<c:url value="/resources/fileupload/img/${product.image}"/>"
                                    style="width: 150px">
                            <br><br>
                        </c:if>
                        <c:if test="${empty product}">
                            <img id="img-avatar" src="<c:url value=""/>" style="width: 150px">
                            <br><br>
                        </c:if>

                        <label>Mô tả sản phẩm</label>
                        <textarea class="form-control" id="txtContent" name="detail" rows="10">${product.detail}</textarea>

                        <br>

                        <a href="<c:url value="/admin/product"/>">
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
            <c:if test="${not empty product}">
                $('#cbx-cate').val(${product.categoryProductByCategoryId.id});
            </c:if>
            $('#section2ContentId').addClass('show');
            $('#section2HeaderId>h6>a').css('color','#ef7147');
            $('#section2ContentId ul>a:nth-child(4)>li').css('color','#ef7147');
            
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