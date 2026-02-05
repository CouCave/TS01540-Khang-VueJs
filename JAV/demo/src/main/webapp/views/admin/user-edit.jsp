<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit User</title>
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
        <div class="card col-md-6 mx-auto">
            <div class="card-header bg-dark text-warning border-secondary">
                <h4>Edit User</h4>
            </div>
            <div class="card-body">
                <form action="update" method="post">
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" name="id" class="form-control" value="${user.id}" readonly>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fullname</label>
                        <input type="text" name="fullname" class="form-control" value="${user.fullname}" required>
                    </div>
                     <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="text" name="email" class="form-control" value="${user.email}" required>
                    </div>
                    <div class="mb-3 form-check">
                        <input type="checkbox" name="admin" class="form-check-input" id="adm" ${user.admin ? 'checked' : ''} value="true">
                        <label class="form-check-label" for="adm">Is Admin?</label>
                    </div>
                    
                    <button class="btn btn-primary">Update User</button>
                    <a href="../users" class="btn btn-secondary">Cancel</a>
                </form>
            </div>
        </div>
    </div>
</body>
</html>