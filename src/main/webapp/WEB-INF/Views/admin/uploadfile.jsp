<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tittle</title>

    <link rel="stylesheet" href="<c:url value='/resources/jscss/css/bootstrap/bootstrap.min.css'/>">
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-12 text-center mt-5">
            <form action="<c:url value="/uploadfile"/>" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label>Hình ảnh</label>
                    <input type="file" class="form-control-file" name="file" required>
                    <small id="fileHelpId" class="form-text text-muted small-error"></small>

                    <button type="submit" class="btn btn-success">Lưu</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="<c:url value='/resources/jscss/js/jquery-3.3.1.min.js'/>"></script>
<script src="<c:url value='/resources/jscss/js/bootstrap/bootstrap.min.js'/>"></script>
<script src="<c:url value='/resources/jscss/js/fontawesome/all.js'/>"></script>
</body>
</html>