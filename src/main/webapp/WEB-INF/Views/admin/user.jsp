<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delicious | Admin - Danh sách Người sử dụng</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/sweetalert2.min.css'/>">

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/admin-common.css'/>">

    <style>

    </style>
</head>
<body>
    <!--header-->
    <jsp:include page="common/header.jsp"/>
    <!--end header-->

    <!-- Modal user -->
    <div class="modal fade" id="modalUser" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">

    </div>

    <!--content-->
    <div class="div-content">
        <!--menu-->
        <jsp:include page="common/menu.jsp"/>
        <!--end menu-->

        <!--center-->
        <div class="container-fluid div-content-center">
            <div class="row pt-4">
                <div class="col-sm-3"></div>
                <div class="col-sm-5">
                    <input type="text" class="form-control" id="txt-search" placeholder="Tìm kiếm người dùng">
                </div>
                <div class="col-sm-2">
<%--                    <div class="btn btn-primary" style="width: 73px;">Tìm</div>--%>
<%--                    <div class="btn btn-primary">View all</div>--%>
                </div>

                <div class="col-sm-2">
                    <div class="btn btn-success" id="btn-addUser" data-id="-1"
                         data-contextPath="${pageContext.request.contextPath}">
                        Thêm mới
                    </div>
                </div>
            </div>

            <div class="row div-category-table mt-5">
                <div class="col-sm-1"></div>
                <div class="col-sm-10">
                    <table class="table table-bordered table-hover" id="tbl-user">
                        <thead class="thead-light text-center">
                        <tr>
                            <th style="width: 7%">STT</th>
                            <th style="width: 25%">Họ và tên</th>
                            <th style="">Số điện thoại</th>
                            <th style="width: 25%">Email</th>
                            <th style="width: 13%">Vai trò</th>
                            <th style="width: 11%;">Thao tác</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:set var="index" value="1"/>
                            <c:forEach var="item" items="${listUser}">
                                <tr>
                                    <td scope="row" class="text-center">
                                        ${index}
                                    </td>
                                    <td>
                                        ${item.getFullName()}
                                    </td>
                                    <td class="text-center">
                                        ${item.getPhone()}
                                    </td>
                                    <td>
                                        ${item.getEmail()}
                                    </td>
                                    <td class="text-center">
                                        ${item.getRoleByRoleId().getName()}
                                    </td>
                                    <td class="text-center">
                                        <div class="btn btn-primary btn-edit" data-id="${item.getId()}"
                                             data-contextPath="${pageContext.request.contextPath}">
                                            Sửa
                                        </div>
                                        <div class="btn btn-danger btn-delete" data-id="${item.getId()}"
                                             data-contextPath="${pageContext.request.contextPath}">
                                            Xóa
                                        </div>
                                    </td>
                                </tr>
                                <c:set var="index" value="${index+1}"/>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-sm-1"></div>
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
            $('#btn-addUser,.btn-edit').click(function(){
                var id = $(this).attr('data-id');
                var contextPath = $(this).attr('data-contextPath');

                var url = contextPath + "/admin/user/detail/" + id;

                $('#modalUser').load(url, function () {
                    $('#modalUser').modal('toggle');
                });
            });

            $('.btn-delete').click(function(){
                var id = $(this).attr('data-id');
                var contextPath = $(this).attr('data-contextPath');

                var url = contextPath + "/ajax/admin/deleteUser";

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
                                if (value == 'cannot_delete_cause_order'){
                                    Swal.fire({
                                        position: 'top-end',
                                        type: 'warning',
                                        title: 'Không thể xóa Người dùng đã đặt hàng!',
                                        showConfirmButton: false,
                                        timer: 3000
                                    })
                                } else if (value == 'cannot_delete_cause_comment'){
                                    Swal.fire({
                                        position: 'top-end',
                                        type: 'warning',
                                        title: 'Không thể xóa Người dùng đã tham gia đánh giá sản phẩm!',
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
            $('#section2ContentId ul>a:nth-child(1)>li').css('color','#ef7147');
            $('#section2HeaderId>h6>a').css('color','#ef7147');

            $("#txt-search").on("keyup", function() {
                var value = $(this).val().toLowerCase();
                $("#tbl-user tbody tr").filter(function() {
                    $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                });
            });
        })
    </script>
</body>
</html>