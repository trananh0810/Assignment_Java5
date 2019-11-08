<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Thêm mới danh mục</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form id="form-cate-product">
                    <div class="form-group">
                        <c:if test="${not empty cateProduct}">
                            <input type="hidden" name="id" value="${cateProduct.id}">
                        </c:if>

                        <label>Tên danh mục</label>
                        <input type="text" class="form-control" name="name" id="txt-cate-product-name"
                                value="${cateProduct.name}">
                        <small id="small-cate-product-name" class="form-text text-muted small-error"></small>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Hủy</button>
                <button type="button" class="btn btn-primary" id="btn-modal-save"
                        data-contextPath="${pageContext.request.contextPath}">
                    Lưu
                </button>
            </div>
        </div>
    </div>

    <script>
        $(function () {
            $('#btn-modal-save').click(function () {
                var contextPath = $(this).attr('data-contextpath');
                var url = contextPath + "/ajax/admin/cate/product/addEdit";

                if (checkInfo()){
                    $.ajax({
                        url: url,
                        type: 'POST',
                        data: $('#form-cate-product').serialize(),
                        success: function (value) {
                            if (value == 'cate_exist') {
                                $('#small-cate-product-name').text('Tên danh mục đã tồn tại!')
                            } else if (value == 'success') {
                                Swal.fire({
                                    position: 'top-end',
                                    type: 'success',
                                    title: 'Thành công',
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
        })

        //check thông tin đăng ký
        function checkInfo(){
            var name 	= $('#txt-cate-product-name').val();

            var errName 	= $('#small-cate-product-name');

            if(name.length === 0){
                errName.text('Vui lòng nhập tên danh mục!');
                $('#txt-cate-product-name').focus();
                return false;
            } else {
                errName.text('');
            }

            return true;
        }
    </script>
