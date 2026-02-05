<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; }
        .table { color: #fff; border-color: #333; }
        .table-hover tbody tr:hover { color: #fff; background-color: #1a1a1a; }
        .table-bordered td, .table-bordered th { border-color: #333; }
        .nav-tabs .nav-link { color: #aaa; border-color: transparent; }
        .nav-tabs .nav-link.active { color: #ff8c00; background-color: #1a1a1a; border-color: #333 #333 #1a1a1a; }
        .nav-tabs .nav-link:hover { color: #fff; border-color: #333; }
        .nav-tabs { border-bottom-color: #333; }
        .form-select { background-color: #1a1a1a; color: #fff; border-color: #333; }
        .form-select:focus { background-color: #1a1a1a; color: #fff; border-color: #ff8c00; box-shadow: none; }
    </style>
</head>
<body>
    <jsp:include page="admin-nav.jsp" />
    
    <div class="container">
        <h2 class="text-warning mb-4">Reports & Statistics</h2>

        <ul class="nav nav-tabs mb-4">
            <li class="nav-item">
                <a class="nav-link ${tab == 'favorites' ? 'active' : ''}" href="reports?tab=favorites">Favorites Statistics</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${tab == 'favorite-users' ? 'active' : ''}" href="reports?tab=favorite-users">Favorite Users</a>
            </li>
            <li class="nav-item">
                <a class="nav-link ${tab == 'shared-friends' ? 'active' : ''}" href="reports?tab=shared-friends">Shared Friends</a>
            </li>
        </ul>

        <div class="tab-content">
            <!-- Tab 1: Favorites -->
            <c:if test="${tab == 'favorites'}">
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-dark">
                        <thead>
                            <tr class="text-warning">
                                <th>Video Title</th>
                                <th>Favorite Count</th>
                                <th>Latest Date</th>
                                <th>Oldest Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${favList}">
                                <tr>
                                    <td>${row[0]}</td>
                                    <td>${row[1]}</td>
                                    <td>${row[2]}</td>
                                    <td>${row[3]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>

            <!-- Tab 2: Favorite Users -->
            <c:if test="${tab == 'favorite-users'}">
                <form action="reports" method="get" class="row g-3 mb-3">
                    <input type="hidden" name="tab" value="favorite-users">
                    <div class="col-auto">
                        <select name="videoId" class="form-select" onchange="this.form.submit()">
                            <option value="">-- Select Video --</option>
                            <c:forEach var="v" items="${vidList}">
                                <option value="${v.id}" ${v.id == selectedVid ? 'selected' : ''}>${v.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
                
                <div class="table-responsive">
                    <table class="table table-bordered table-hover table-dark">
                        <thead>
                            <tr class="text-warning">
                                <th>Username</th>
                                <th>Fullname</th>
                                <th>Email</th>
                                <th>Like Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${favUsers}">
                                <tr>
                                    <td>${row[0]}</td>
                                    <td>${row[1]}</td>
                                    <td>${row[2]}</td>
                                    <td>${row[3]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
            
            <!-- Tab 3: Shared Friends -->
            <c:if test="${tab == 'shared-friends'}">
                 <form action="reports" method="get" class="row g-3 mb-3">
                    <input type="hidden" name="tab" value="shared-friends">
                    <div class="col-auto">
                        <select name="videoId" class="form-select" onchange="this.form.submit()">
                            <option value="">-- Select Video --</option>
                            <c:forEach var="v" items="${vidList}">
                                <option value="${v.id}" ${v.id == selectedVid ? 'selected' : ''}>${v.title}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
                
                 <div class="table-responsive">
                    <table class="table table-bordered table-hover table-dark">
                        <thead>
                            <tr class="text-warning">
                                <th>Sender Name</th>
                                <th>Sender Email</th>
                                <th>Receiver Email</th>
                                <th>Share Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="row" items="${shareList}">
                                <tr>
                                    <td>${row[0]}</td>
                                    <td>${row[1]}</td>
                                    <td>${row[2]}</td>
                                    <td>${row[3]}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:if>
        </div>
    </div>
</body>
</html>