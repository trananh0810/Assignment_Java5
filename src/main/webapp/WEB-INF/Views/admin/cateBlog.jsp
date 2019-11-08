<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious | Admin - Danh mục Blog</title>

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

        <!-- model category -->
        <div class="modal fade" id="model-category" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">

        </div>

        <!--center-->
        <div class="container-fluid div-content-center">
            <div class="row pt-4">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="txt-search" placeholder="Tìm kiếm...">
                </div>

                <div class="col-sm-3">
                    <div class="btn btn-success" id="btn-addCategory"
                         data-id="-1" data-contextPath="${pageContext.request.contextPath}">
                        Thêm mới
                    </div>
                </div>
            </div>

            <div class="row div-category-table mt-5">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <table class="table table-bordered table-hover" id="tbl-cate-blog">
                        <thead class="thead-light text-center">
                        <tr>
                            <th style="width: 10%">STT</th>
                            <th>Tên danh mục</th>
                            <th style="width: 135px">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:set var="index" value="1"/>
                        <c:forEach var="item" items="${listCateBlog}">
                            <tr>
                                <td scope="row" class="text-center">${index}</td>
                                <td>${item.name}</td>
                                <td>
                                    <div class="btn btn-warning btn-edit"
                                         data-id="${item.id}" data-contextPath="${pageContext.request.contextPath}">
                                        Sửa
                                    </div>
                                    <div class="btn btn-danger btn-delete"
                                         data-id="${item.id}" data-contextPath="${pageContext.request.contextPath}">
                                        Xóa
                                    </div>
                                </td>
                                <c:set var="index" value="${index+1}"/>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-3"></div>
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
        $(function(){
            $('#btn-addCategory, .btn-edit').click(function(){
                var contextPath = $(this).attr('data-contextPath');
                var id = $(this).attr('data-id');

                var url = contextPath + "/admin/cate/blog/detail/" + id;

                $('#model-category').load(url, function () {
                    $('#model-category').modal('toggle');
                })
            });

            $('.btn-delete').click(function () {
                var contextPath = $(this).attr('data-contextPath');
                var id = $(this).attr('data-id');

                var url = contextPath + "/ajax/admin/cate/blog/delete";

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
                                        title: 'Không thể xóa Danh mục đã có Blog',
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

            $('#section2ContentId').addClass('show');
            $('#section2HeaderId>h6>a').css('color','#ef7147');
            $('#section2ContentId ul>a:nth-child(3)>li').css('color','#ef7147');

            $("#txt-search").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tbl-cate-blog tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        })
    </script>
</body>
</html>