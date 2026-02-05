<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; }
        .card { background-color: #1a1a1a; border-color: #333; }
        .card-header { border-bottom-color: #333; }
        .form-control { background-color: #121212; border-color: #333; color: #fff; }
        .form-control:focus { background-color: #121212; border-color: #ff8c00; color: #fff; box-shadow: none; }
        .form-control[readonly] { background-color: #2a2a2a; }
    </style>
</head>
<body>
    <jsp:include page="admin-nav.jsp" />
    
    <div class="container">
        <div class="card col-md-8 mx-auto">
            <div class="card-header bg-dark text-warning border-secondary">
                <h4>${empty video ? 'Create Video' : 'Edit Video'}</h4>
            </div>
            <div class="card-body">
                <c:if test="${not empty message}">
                    <div class="alert alert-danger bg-dark text-danger border-danger">${message}</div>
                </c:if>

                <form action="${empty video ? 'create' : 'update'}" method="post">
                    <div class="mb-3">
                        <label class="form-label">YouTube ID</label>
                        <input type="text" name="id" class="form-control" value="${video.id}" ${not empty video ? 'readonly' : ''} required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Video Title</label>
                        <input type="text" name="title" class="form-control" value="${video.title}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Poster URL</label>
                        <input type="text" name="poster" class="form-control" value="${video.poster}" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <textarea name="description" class="form-control" rows="4">${video.description}</textarea>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" name="active" class="form-check-input" id="active" ${video.active ? 'checked' : ''} value="true">
                        <label class="form-check-label" for="active">Active?</label>
                    </div>
                    
                    <button class="btn btn-primary">Save</button>
                    <a href="../videos" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>