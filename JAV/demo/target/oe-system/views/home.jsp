<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - Online Entertainment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
    <style>
        .nav-btn-circle {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: #222;
            color: #fff;
            border: none;
            display: flex;
            align-items: center;
            justify-content: center;
            text-decoration: none;
        }
        .nav-btn-circle:hover {
            background-color: #333;
            color: #fff;
        }
        .nav-btn-circle.disabled {
            opacity: 0.5;
            pointer-events: none;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="home">
                <img src="views/images/LogoCinemax.png" alt="Cinemax" height="50">
            </a>

            <c:if test="${not empty sessionScope.user}">
                 <a class="nav-link ms-3 me-3" href="like" style="font-weight: 500;">Favorites</a>
            </c:if>

            <!-- Search Bar -->
            <form action="home" method="get" class="d-flex flex-grow-1 justify-content-center">
                <div class="input-group search-bar">
                    <input type="text" name="keyword" class="form-control search-input rounded-start-pill" placeholder="Search" value="${keyword}">
                    <button class="btn search-btn rounded-end-pill px-4" type="submit">
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </form>

            <div class="collapse navbar-collapse flex-grow-0">
                <ul class="navbar-nav ms-auto">
                    <c:choose>
                        <c:when test="${empty sessionScope.user}">
                            <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#loginModal">Login</a></li>
                            <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#registerModal">Register</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#profileModal">Welcome, ${sessionScope.user.fullname}</a></li>
                            <c:if test="${sessionScope.user.admin}">
                                <li class="nav-item"><a class="nav-link" href="admin/videos">Administration</a></li>
                            </c:if>
                            <li class="nav-item"><a class="nav-link" href="logoff">Logoff</a></li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <c:forEach var="item" items="${videos}">
                <div class="col-md-4 mb-4">
                    <div class="card h-100">
                        <img src="${item.poster}" class="card-img-top" alt="${item.title}" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">${item.title}</h5>
                            <p class="card-text">Views: ${item.views}</p>
                            <a href="video/detail?id=${item.id}" class="btn btn-primary">Watch Now</a>

                            <c:choose>
                                <c:when test="${empty sessionScope.user}">
                                    <button class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#loginModal">Like</button>
                                    <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#loginModal">Share</button>
                                </c:when>
                                <c:otherwise>
                                    <a href="like?id=${item.id}" class="btn btn-outline-danger">Like</a>
                                    <a href="video/detail?id=${item.id}#share" class="btn btn-outline-success">Share</a>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <!-- Pagination Buttons (Only show if not searching) -->
        <c:if test="${empty keyword && not empty totalPage && totalPage > 1}">
            <div class="d-flex justify-content-center gap-3 my-4">
                <c:choose>
                    <c:when test="${currentPage > 1}">
                        <a href="home?page=${currentPage - 1}" class="nav-btn-circle" title="Previous Page">
                            <i class="fas fa-chevron-left"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="#" class="nav-btn-circle disabled" title="Previous Page">
                            <i class="fas fa-chevron-left"></i>
                        </a>
                    </c:otherwise>
                </c:choose>

                <span class="text-white align-self-center">Page ${currentPage} of ${totalPage}</span>

                <c:choose>
                    <c:when test="${currentPage < totalPage}">
                        <a href="home?page=${currentPage + 1}" class="nav-btn-circle" title="Next Page">
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="#" class="nav-btn-circle disabled" title="Next Page">
                            <i class="fas fa-chevron-right"></i>
                        </a>
                    </c:otherwise>
                </c:choose>
            </div>
        </c:if>
    </div>

    <footer class="bg-dark text-center py-3 mt-4">
        <p>&copy; 2026 Online Entertainment. All rights reserved.</p>
    </footer>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Login</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="login" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="id" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" name="remember" class="form-check-input" id="rem">
                            <label class="form-check-label" for="rem">Remember Me?</label>
                        </div>
                        <button class="btn btn-primary w-100">Login</button>
                    </form>
                </div>
                <div class="modal-footer border-secondary justify-content-center">
                    <a href="#" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#registerModal" class="text-decoration-none text-warning">Create an account</a>
                    <span class="mx-2">|</span>
                    <a href="#" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#forgotPasswordModal" class="text-decoration-none text-secondary">Forgot Password?</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Register Modal -->
    <div class="modal fade" id="registerModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Register</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="register" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="id" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Fullname</label>
                            <input type="text" name="fullname" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <button class="btn btn-primary w-100">Sign Up</button>
                    </form>
                </div>
                <div class="modal-footer border-secondary justify-content-center">
                    <a href="#" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#loginModal" class="text-decoration-none text-warning">Already have an account? Login</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Forgot Password Modal -->
    <div class="modal fade" id="forgotPasswordModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Forgot Password</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="forgot-password" method="post">
                        <div class="mb-3">
                            <label class="form-label">Username or Email</label>
                            <input type="text" name="id" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input type="email" name="email" class="form-control bg-secondary text-white border-0" required>
                        </div>
                        <button class="btn btn-primary w-100">Recover Password</button>
                    </form>
                </div>
                <div class="modal-footer border-secondary justify-content-center">
                    <a href="#" data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#loginModal" class="text-decoration-none text-warning">Back to Login</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Edit Profile</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="account/profile" method="post">
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
                        <button class="btn btn-primary w-100">Update Profile</button>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <c:if test="${not empty param.message}">
        <script>
            // Simple toast or alert could be better, but for now let's just alert
            alert("${param.message}");
        </script>
    </c:if>
</body>
</html>