<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>${video.title} - Online Entertainment</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                <img src="${pageContext.request.contextPath}/views/images/LogoCinemax.png" alt="Cinemax" height="50">
            </a>

            <c:if test="${not empty sessionScope.user}">
                 <a class="nav-link ms-3 me-3" href="${pageContext.request.contextPath}/like" style="font-weight: 500;">Favorites</a>
            </c:if>

            <!-- Search Bar -->
            <form action="${pageContext.request.contextPath}/home" method="get" class="d-flex flex-grow-1 justify-content-center">
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

    <div class="container mt-4">
        <div class="row">
            <!-- Main Video Column -->
            <div class="col-lg-8">
                <div class="ratio ratio-16x9 mb-3">
                    <iframe src="https://www.youtube.com/embed/${video.id}?autoplay=1" allowfullscreen style="border-radius: 12px;"></iframe>
                </div>

                <!-- Navigation Buttons (Previous/Next) -->
                <div class="d-flex justify-content-between mb-2">
                    <c:choose>
                        <c:when test="${not empty prevId}">
                            <a href="${pageContext.request.contextPath}/video/detail?id=${prevId}" class="nav-btn-circle" title="Previous Video">
                                <i class="fas fa-step-backward"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="nav-btn-circle disabled" title="Previous Video">
                                <i class="fas fa-step-backward"></i>
                            </a>
                        </c:otherwise>
                    </c:choose>

                    <c:choose>
                        <c:when test="${not empty nextId}">
                            <a href="${pageContext.request.contextPath}/video/detail?id=${nextId}" class="nav-btn-circle" title="Next Video">
                                <i class="fas fa-step-forward"></i>
                            </a>
                        </c:when>
                        <c:otherwise>
                            <a href="#" class="nav-btn-circle disabled" title="Next Video">
                                <i class="fas fa-step-forward"></i>
                            </a>
                        </c:otherwise>
                    </c:choose>
                </div>

                <h4 class="text-white mb-2">${video.title}</h4>

                <div class="d-flex justify-content-between align-items-center mb-3 flex-wrap gap-2">
                    <div class="d-flex align-items-center">
                        <div class="rounded-circle bg-secondary me-2" style="width: 40px; height: 40px;"></div>
                        <div>
                            <h6 class="mb-0 text-white">Channel Name</h6>
                            <small class="text-secondary">1.2M subscribers</small>
                        </div>
                        <button class="btn btn-light rounded-pill ms-3 fw-bold btn-sm px-3">Subscribe</button>
                    </div>

                    <div class="d-flex gap-2">
                        <!-- Like Button -->
                        <c:choose>
                            <c:when test="${empty sessionScope.user}">
                                <button class="btn btn-like d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#loginModal" style="background-color: #000; color: #2ba640;">
                                    <i class="far fa-thumbs-up me-2"></i> Like
                                </button>
                            </c:when>
                            <c:when test="${liked}">
                                <a href="${pageContext.request.contextPath}/like?id=${video.id}" class="btn btn-like d-flex align-items-center" style="background-color: #000; color: #ff0000;">
                                    <i class="fas fa-thumbs-up me-2"></i> Liked
                                </a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/like?id=${video.id}" class="btn btn-like d-flex align-items-center" style="background-color: #000; color: #2ba640;">
                                    <i class="far fa-thumbs-up me-2"></i> Like
                                </a>
                            </c:otherwise>
                        </c:choose>

                        <!-- Share Button -->
                        <c:choose>
                            <c:when test="${empty sessionScope.user}">
                                <button class="btn btn-share d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#loginModal">
                                    <i class="fas fa-share me-2"></i> Share
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-share d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#shareModal">
                                    <i class="fas fa-share me-2"></i> Share
                                </button>
                            </c:otherwise>
                        </c:choose>
                        
                        <button class="btn btn-share d-flex align-items-center">
                            <i class="fas fa-ellipsis-h"></i>
                        </button>
                    </div>
                </div>

                <div class="bg-dark p-3 rounded-3 mb-4" style="background-color: #2a2a2a !important;">
                    <div class="d-flex gap-3 mb-2">
                        <span class="fw-bold text-white">${video.views} views</span>
                        <span class="fw-bold text-white">2 years ago</span>
                    </div>
                    <p class="text-white mb-0" style="white-space: pre-line;">${video.description}</p>
                </div>

                <!-- Comments Section (Placeholder) -->
                <h5 class="text-white mb-3">Comments</h5>
                <div class="d-flex gap-3 mb-4">
                    <div class="rounded-circle bg-secondary" style="width: 40px; height: 40px;"></div>
                    <input type="text" class="form-control bg-transparent border-0 border-bottom text-white" placeholder="Add a comment...">
                </div>
            </div>

            <!-- Sidebar Videos -->
            <div class="col-lg-4">
                <c:forEach var="item" items="${videos}">
                    <c:if test="${item.id != video.id}">
                        <a href="${pageContext.request.contextPath}/video/detail?id=${item.id}" class="video-sidebar-item">
                            <div class="position-relative">
                                <img src="${item.poster}" class="sidebar-thumb" alt="${item.title}">
                                <span class="position-absolute bottom-0 end-0 bg-dark text-white px-1 m-1 rounded" style="font-size: 10px; opacity: 0.9;">12:34</span>
                            </div>
                            <div class="sidebar-info py-1">
                                <h6 title="${item.title}">${item.title}</h6>
                                <p>Channel Name</p>
                                <p>${item.views} views • 3 days ago</p>
                            </div>
                        </a>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- Share Modal -->
    <div class="modal fade" id="shareModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Share</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <c:if test="${not empty message}">
                        <div class="alert alert-success">${message}</div>
                    </c:if>
                    <form action="${pageContext.request.contextPath}/share" method="post">
                        <input type="hidden" name="videoId" value="${video.id}">
                        <div class="mb-3">
                            <label class="form-label">Share to Email</label>
                            <input type="email" name="email" class="form-control bg-secondary text-white border-0" placeholder="Friend's Email" required>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Cancel</button>
                            <button class="btn btn-primary">Send</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title">Login</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="${pageContext.request.contextPath}/login" method="post">
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
                    <form action="${pageContext.request.contextPath}/register" method="post">
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
                    <form action="${pageContext.request.contextPath}/forgot-password" method="post">
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

    <footer class="bg-dark text-center py-3 mt-4">
        <p>&copy; 2026 Online Entertainment. All rights reserved.</p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <c:if test="${not empty message}">
        <script>
            var shareModal = new bootstrap.Modal(document.getElementById('shareModal'));
            shareModal.show();
        </script>
    </c:if>
</body>
</html>