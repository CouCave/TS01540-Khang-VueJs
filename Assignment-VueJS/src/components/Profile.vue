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
    <div class="row justify-content-center">
      <div class="col-md-6">
        <div class="card shadow">
          <div class="card-body">

            
            <div class="text-center mb-3">
              <img
                src="@/assets/images/ezgif.com-gif-maker.jpg"
                class="rounded-circle"
                width="120"
                height="120"
              />
            </div>

            
            <h5 class="text-center mb-1">Phan Vũ Phúc Khang</h5>
            <p class="text-center text-muted">khangpvpts01540@gmail.com</p>

            <hr>

            <p><strong>Số điện thoại:</strong> 0908339635</p>
            <p><strong>Giới tính:</strong> Nam</p>
            

            
            <div class="d-flex justify-content-between mt-3">
              <button class="btn btn-outline-info">
                Chỉnh sửa
              </button>
              <button class="btn btn-outline-danger">
                Đăng xuất
              </button>
            </div>

          </div>
        </div>
      </div>
    </div>
  </div>

</template>