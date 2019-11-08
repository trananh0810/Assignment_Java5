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
            <div class="row pt-4">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="txt-search" placeholder="Tìm kiếm...">
                </div>
                <div class="col-sm-3">
                    <a href="<c:url value="/admin/blog/-1"/>">
                        <div class="btn btn-success">Thêm mới</div>
                    </a>
                </div>
            </div>

            <div class="row div-category-table mt-5">
                <!-- <div class="col-sm-3"></div> -->
                <div class="col-sm-12">
                    <table class="table table-bordered table-hover" id="tbl-blog">
                        <thead class="thead-light text-center">
                        <tr>
                            <th style="width: 5%">STT</th>
                            <th>Tên Blog</th>
                            <th style="">Danh mục</th>
                            <th style="">Tác giả</th>
                            <th style="">Hình</th>
                            <th style="width: 10%">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="index" value="1"/>
                        <c:forEach var="item" items="${list_blog}">
                            <tr>
                                <td scope="row" class="text-center">${index}</td>
                                <td>${item.title}</td>
                                <td class="text-center">${item.categoryBlog.name}</td>
                                <td class="text-center">${item.user.fullName}</td>
                                <td class="text-center" style="padding-bottom: 0;padding-top: 6px">
                                    <img src="<c:url value="/resources/fileupload/img/${item.image}"/>"
                                         style="width: 50px;height: 50px;"
                                         alt=".">
                                </td>
                                <td class="text-center">
                                    <a href="<c:url value="/admin/blog/${item.id}"/>">
                                        <div class="btn btn-warning">
                                            Sửa
                                        </div>
                                    </a>

                                    <div class="btn btn-danger btn-delete-blog"
                                         data-id="${item.id}" data-contextPath="${pageContext.request.contextPath}">
                                        Xóa
                                    </div>
                                </td>
                            </tr>
                            <c:set var="index" value="${index+1}"/>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <!-- <div class="col-sm-3"></div> -->
            </div>
        </div><!--end center-->
    </div><!--end content-->

    <script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/popper.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/sweetalert2.min.js'/>"></script>
    <script src="<c:url value='/resources/jscss/js/admin-dung-chung.js'/>"></script>

    <script>
        $(function () {
            $('#section2ContentId').addClass('show');
            $('#section2HeaderId>h6>a').css('color','#ef7147');
            $('#section2ContentId ul>a:nth-child(5)>li').css('color','#ef7147');

            $("#txt-search").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tbl-blog tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });

            $('.btn-delete-blog').click(function () {
                var id = $(this).attr('data-id');
                var contextPath = $(this).attr('data-contextPath');

                var url = contextPath + "/ajax/admin/blog/delete";

                Swal.fire({
                    title: 'Hỏi?',
                    text: "Bạn có muốn xóa không?",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'OK'
                }).then(function (value) {
                    if (value.value) {
                        $.ajax({
                            url: url,
                            type: 'POST',
                            data:{
                                id: id
                            },
                            success: function (value) {
                                if (value == 'cannot_delete'){
                                    Swal.fire({
                                        position: 'top-end',
                                        type: 'warning',
                                        title: 'Không thể xóa Sản phẩm đã được đặt hàng hoặc đã được đánh giá!',
                                        showConfirmButton: false,
                                        timer: 3000
                                    })
                                } else if (value == 'success'){
                                    Swal.fire({
                                        position: 'top-end',
                                        type: 'success',
                                        title: 'Xóa thành công',
                                        showConfirmButton: false,
                                        timer: 1500
                                    }).then(function (value1) {
                                        window.location = window.location.href;
                                    });
                                }
                            }
                        })
                    }
                });
            });

        })
    </script>
</body>
</html>