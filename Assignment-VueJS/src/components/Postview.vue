<script setup>

</script>
<template>
    <nav class="navbar navbar-expand-sm navbar-light bg-light border">
        <div class="container">
            <a class="navbar-brand" href="#">
                <img src="@/assets/images/logo-energy-pilates.png" alt="" style="width:150px;">
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="collapsibleNavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link">
                            <i class="fa-solid fa-list"></i> Trang chủ
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">
                            <i class="fa-solid fa-film"></i> Đăng bài viết
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link">
                            <i class="fa-solid fa-film"></i> Bài viết của tôi
                        </a>
                    </li>
                </ul>

                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link">Phan Vũ Phúc Khang</a></li>

                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h4 class="mb-3">Bài viết của tôi</h4>
        <div class="d-flex mt-4 mb-5">
            <button class="btn btn-success px-4">
                <i class="bi bi-plus-circle me-1"></i>
                Thêm bài viết
            </button>
        </div>

        <div class="row">
            <!-- Bài viết 1 -->
            <div class="col-md-4 mb-3">
                <div class="card h-100 position-relative">

                    
                    <div class="position-absolute top-0 end-0 p-2">
                        <button class="btn btn-sm btn-warning me-1">
                            <i class="bi bi-pencil"></i>
                        </button>
                        <button class="btn btn-sm btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>

                    
                    <img src="@/assets/images/tap-piltes.jpg" class="card-img-top post-img" />

                    
                    <div class="card-body">
                        <h5 class="card-title">Phương pháp tập Pilates cho các chị em trong năm 2026</h5>
                    </div>

                    
                    <div class="card-footer text-muted">
                        10/01/2026
                    </div>

                </div>
            </div>

            <!-- Bài viết 2 -->
            <div class="col-md-4 mb-3">
                <div class="card h-100 position-relative">

                    
                    <div class="position-absolute top-0 end-0 p-2">
                        <button class="btn btn-sm btn-warning me-1">
                            <i class="bi bi-pencil"></i>
                        </button>
                        <button class="btn btn-sm btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>

                    
                    <img src="@/assets/images/Orange.jpg" class="card-img-top post-img" />

                    
                    <div class="card-body">
                        <h5 class="card-title">9 tác dụng tuyệt vời của quả cam</h5>
                    </div>

                    
                    <div class="card-footer text-muted">
                        12/01/2026
                    </div>

                </div>
            </div>

            <!-- Bài viết 3 -->
            <div class="col-md-4 mb-3">
                <div class="card h-100 position-relative">

                    
                    <div class="position-absolute top-0 end-0 p-2">
                        <button class="btn btn-sm btn-warning me-1">
                            <i class="bi bi-pencil"></i>
                        </button>
                        <button class="btn btn-sm btn-danger">
                            <i class="bi bi-trash"></i>
                        </button>
                    </div>

                    
                    <img src="@/assets/images/sesameoil_300x300.jpg" class="card-img-top post-img" />


                    
                    <div class="card-body">
                        <h5 class="card-title">10 công dụng bất ngờ từ dầu dừa</h5>
                    </div>

                    
                    <div class="card-footer text-muted">
                        05/01/2026
                    </div>

                </div>
            </div>
        </div>

    </div>
</template>
<style>
.post-img {
    height: 200px;
    object-fit: cover;
}
</style>
