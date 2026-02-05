<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; }
        .table { color: #fff; border-color: #333; }
        .table-hover tbody tr:hover { color: #fff; background-color: #1a1a1a; }
        .table-bordered td, .table-bordered th { border-color: #333; }
    </style>
</head>
<body>
    <jsp:include page="admin-nav.jsp" />
    
    <div class="container">
        <h2 class="text-warning mb-4">User Management</h2>
        
        <c:if test="${not empty message}">
            <div class="alert alert-info bg-dark text-white border-secondary">${message}</div>
        </c:if>
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-dark">
                <thead>
                    <tr class="text-warning">
                        <th>Username</th>
                        <th>Fullname</th>
                        <th>Email</th>
                        <th>Role</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${users}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.fullname}</td>
                            <td>${item.email}</td>
                            <td>${item.admin ? 'Admin' : 'User'}</td>
                            <td>
                                <a href="user/edit?id=${item.id}" class="btn btn-sm btn-primary">Edit</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>