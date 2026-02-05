<%@ page pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <title>Video Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/youtube-style.css" rel="stylesheet">
    <style>
        body { background-color: #000; color: #fff; }
        .table { color: #fff; border-color: #333; }
        .table-hover tbody tr:hover { color: #fff; background-color: #1a1a1a; }
        .table-bordered td, .table-bordered th { border-color: #333; }
        .form-control { background-color: #121212; border-color: #333; color: #fff; }
        .form-control:focus { background-color: #121212; border-color: #ff8c00; color: #fff; box-shadow: none; }
        .form-control[readonly] { background-color: #2a2a2a; }
    </style>
</head>
<body>
    <jsp:include page="admin-nav.jsp" />
    
    <div class="container">
        <h2 class="text-warning mb-4">Video Management</h2>
        
        <c:if test="${not empty message}">
            <div class="alert alert-info bg-dark text-white border-secondary">${message}</div>
        </c:if>
        
        <button type="button" class="btn btn-success mb-3" onclick="openVideoModal()">Create New Video</button>
        
        <div class="table-responsive">
            <table class="table table-bordered table-hover table-dark">
                <thead>
                    <tr class="text-warning">
                        <th>ID</th>
                        <th>Title</th>
                        <th>Views</th>
                        <th>Active</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${videos}">
                        <tr>
                            <td>${item.id}</td>
                            <td>${item.title}</td>
                            <td>${item.views}</td>
                            <td>${item.active ? 'Yes' : 'No'}</td>
                            <td>
                                <button type="button" class="btn btn-sm btn-primary edit-btn"
                                    data-id="${item.id}"
                                    data-title="${fn:escapeXml(item.title)}"
                                    data-poster="${fn:escapeXml(item.poster)}"
                                    data-description="${fn:escapeXml(item.description)}"
                                    data-active="${item.active}">
                                    Edit
                                </button>
                                <a href="video/delete?id=${item.id}" class="btn btn-sm btn-danger" onclick="return confirm('Delete this video?')">Delete</a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Video Modal -->
    <div class="modal fade" id="videoModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content bg-dark text-white border-secondary">
                <div class="modal-header border-secondary">
                    <h5 class="modal-title" id="videoModalLabel">Video</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form id="videoForm" action="video/create" method="post">
                        <div class="mb-3">
                            <label class="form-label">YouTube ID</label>
                            <input type="text" name="id" id="videoId" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Video Title</label>
                            <input type="text" name="title" id="videoTitle" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Poster URL</label>
                            <input type="text" name="poster" id="videoPoster" class="form-control" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Description</label>
                            <textarea name="description" id="videoDescription" class="form-control" rows="4"></textarea>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" name="active" class="form-check-input" id="videoActive" value="true">
                            <label class="form-check-label" for="videoActive">Active?</label>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary me-2" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        var videoModal = new bootstrap.Modal(document.getElementById('videoModal'));

        function openVideoModal(id, title, poster, description, active) {
            var form = document.getElementById('videoForm');
            var modalTitle = document.getElementById('videoModalLabel');
            var idInput = document.getElementById('videoId');

            if (id) {
                // Edit Mode
                modalTitle.innerText = 'Edit Video';
                form.action = 'video/update';
                idInput.value = id;
                idInput.readOnly = true;
                document.getElementById('videoTitle').value = title;
                document.getElementById('videoPoster').value = poster;
                document.getElementById('videoDescription').value = description;
                document.getElementById('videoActive').checked = active;
            } else {
                // Create Mode
                modalTitle.innerText = 'Create New Video';
                form.action = 'video/create';
                form.reset();
                idInput.readOnly = false;
                document.getElementById('videoActive').checked = true; // Default active
            }

            videoModal.show();
        }

        // Attach event listeners to edit buttons
        document.addEventListener('DOMContentLoaded', function() {
            var editButtons = document.querySelectorAll('.edit-btn');
            editButtons.forEach(function(btn) {
                btn.addEventListener('click', function() {
                    var id = this.getAttribute('data-id');
                    var title = this.getAttribute('data-title');
                    var poster = this.getAttribute('data-poster');
                    var description = this.getAttribute('data-description');
                    var active = this.getAttribute('data-active') === 'true';
                    openVideoModal(id, title, poster, description, active);
                });
            });
        });
    </script>

    <c:if test="${not empty video}">
        <script>
            // Re-open modal if there was an error (e.g., duplicate ID) and video object is present
            openVideoModal('${video.id}', '${fn:escapeXml(video.title)}', '${fn:escapeXml(video.poster)}', '${fn:escapeXml(video.description)}', ${video.active});
        </script>
    </c:if>
</body>
</html>