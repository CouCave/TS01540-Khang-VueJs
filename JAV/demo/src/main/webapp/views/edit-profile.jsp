<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Profile - Online Entertainment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
    <style>
        .card:hover {
            transform: none !important;
            box-shadow: none !important;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img src="${pageContext.request.contextPath}/views/images/LogoCinemax.png" alt="Cinemax" height="30">
            </a>
            <c:if test="${not empty sessionScope.user}">
                 <a class="nav-link ms-3" href="${pageContext.request.contextPath}/like" style="font-weight: 500;">Favorites</a>
            </c:if>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/account/profile">Welcome, ${sessionScope.user.fullname}</a></li>
                            <c:if test="${sessionScope.user.admin}">
                                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/admin/videos">Administration</a></li>
                            </c:if>
                            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/logoff">Logoff</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card bg-dark text-white border-secondary">
                    <div class="card-header border-secondary">
                        <h4>Edit Profile</h4>
                    </div>
                    <div class="card-body">
                        <c:if test="${not empty message}">
                            <div class="alert alert-info">${message}</div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/account/profile" method="post">
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input type="text" name="id" class="form-control bg-secondary text-white border-0" value="${sessionScope.user.id}" readonly>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Fullname</label>
                                <input type="text" name="fullname" class="form-control bg-secondary text-white border-0" value="${sessionScope.user.fullname}" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" name="email" class="form-control bg-secondary text-white border-0" value="${sessionScope.user.email}" required>
                            </div>
                            <hr class="border-secondary my-4">
                            <h5>Change Password</h5>
                            <div class="mb-3">
                                <label class="form-label">Current Password</label>
                                <input type="password" name="currentPassword" class="form-control bg-secondary text-white border-0">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">New Password</label>
                                <input type="password" name="newPassword" class="form-control bg-secondary text-white border-0">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Confirm New Password</label>
                                <input type="password" name="confirmPassword" class="form-control bg-secondary text-white border-0">
                            </div>
                            <button class="btn btn-primary">Update Profile</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-center py-3 mt-4" style="position: fixed; bottom: 0; width: 100%;">
        <p>&copy; 2026 Online Entertainment. All rights reserved.</p>
    </footer>
</body>
</html>