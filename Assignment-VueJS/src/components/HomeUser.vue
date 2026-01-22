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
        <div class="row">

            <div class="col-sm-4">
                <h3 class="text-info mt-5">Chuyên mục</h3>
                <ul class="list-group mt-3">
                    <li class="list-group-item active bg-info d-flex justify-content-between align-items-center">
                        <a class="nav-link text-white">Chế độ tập</a>
                        <span class="badge bg-primary rounded-pill">12</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a class="nav-link">Chế độ dinh dưỡng</a>
                        <span class="badge bg-primary rounded-pill">15</span>
                    </li>
                    <li class="list-group-item d-flex justify-content-between align-items-center">
                        <a class="nav-link">Cẩm nang cuộc sống</a>
                        <span class="badge bg-primary rounded-pill">99</span>
                    </li>
                </ul>
                <div class="card news mt-3">
                    <div class="card-body border-bottom">
                        <h3 class="card-title text-info mb-0">
                            Bài viết nổi bật
                        </h3>
                    </div>
                    <div class="card-body pt-3">

                        <div class="d-flex mb-3">
                            <img src="@/assets/images/spinach_300x300.jpg" class="rounded-circle me-3" width="70"
                                height="70">
                            <div>
                                <b>Lợi ích khi ăn rau mỗi ngày</b>
                                <p class="text-muted small mb-0">
                                    Tiêu thụ rau xanh hàng ngày sẽ giúp tăng cường thị lực,
                                    kiểm soát cân nặng, ngăn ngừa ung thư...
                                </p>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <img src="@/assets/images/orange_300x300.jpg" class="rounded-circle me-3" width="70"
                                height="70">
                            <div>
                                <b>9 tác dụng tuyệt vời của quả cam</b>
                                <p class="text-muted small mb-0">
                                    Cam tự hào về khả năng chống lão hóa mạnh mẽ nhờ
                                    hàm lượng chất chống oxy hóa cao...
                                </p>
                            </div>
                        </div>

                        <div class="d-flex mb-3">
                            <img src="@/assets/images/sesameoil_300x300.jpg" class="rounded-circle me-3" width="70"
                                height="70">
                            <div>
                                <b>10 công dụng bất ngờ từ dầu dừa</b>
                                <p class="text-muted small mb-0">
                                    Dầu dừa như một loại kem dưỡng ẩm tự nhiên cho cơ thể,
                                    giúp việc sản xuất collagen trong các tế bào...
                                </p>
                            </div>
                        </div>

                    </div>


                </div>
            </div>
            <div class="col-sm-8">
                <div class="row">
                    <h3 class="text-info mt-5">Tất cả bài viết</h3>
                    <div class="col-sm-6">
                        <div class="card news mt-3">
                            <div class="card-body border-bottom">
                                <h5 class="card-title">
                                    Phương pháp tập Pilates cho các chị em trong năm 2026
                                    <small class="text-secondary">
                                        <i class="bi bi-chat-left-fill"></i> 142
                                    </small>
                                </h5>
                            </div>

                            <div class="card-body pt-3">
                                <img src="@/assets/images/tap-piltes.jpg" class="card-img-top rounded" alt="">
                                <p class="card-text pt-3">
                                    Ngoài việc giúp duy trì vóc dáng, cải thiện sự linh hoạt,
                                    dẻo dai cho người tập, Pilates giúp cơ bắp và các khớp mọc dài hơn, kéo giãn
                                    hơn...
                                </p>
                            </div>

                        </div>
                        <div class="card news mt-3">
                            <div class="card-body border-bottom">
                                <h5 class="card-title">
                                    Tập Pilates có thể cải thiện sức khỏe tim mạch của bạn
                                    <small class="text-secondary">
                                        <i class="bi bi-chat-left-fill"></i> 135
                                    </small>
                                </h5>
                            </div>

                            <div class="card-body pt-3">
                                <img src="@/assets/images/tim-mach.jpg" class="card-img-top rounded" alt="">
                                <p class="card-text pt-3">
                                    Tập Pilates không chỉ giúp bạn có một cơ thể khỏe mạnh và linh hoạt mà còn có nhiều
                                    lợi ích cho sức
                                    khỏe tim mạch.
                                    Bài viết này sẽ tìm hiểu sâu hơn về tác động tích cực của việc tập Pilates đối với
                                    sức khỏe tim
                                    mạch.
                                </p>
                            </div>

                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="card news mt-3">
                            <div class="card-body border-bottom">
                                <h5 class="card-title">
                                    Đây là những gì 1 giờ tập Pilates có thể làm cho cơ thể của bạn
                                    <small class="text-secondary">
                                        <i class="bi bi-chat-left-fill"></i> 120
                                    </small>
                                </h5>
                            </div>

                            <div class="card-body pt-3">
                                <img src="@/assets/images/tap-pilates1.jpg" class="card-img-top rounded" alt="">
                                <p class="card-text pt-3">
                                    Được thiết kế để xây dựng cơ bắp săn chắc, khỏe mạnh hơn,
                                    bài tập này đã trở thành một cái tên quen thuộc nhờ có rất nhiều người nổi tiếng
                                    theo đuổi.
                                </p>
                            </div>

                        </div>
                        <div class="card news mt-3">
                            <div class="card-body border-bottom">
                                <h5 class="card-title">
                                    EAT CLEAN: Nên Và Không Nên Ăn Thực Phẩm Nào?
                                    <small class="text-secondary">
                                        <i class="bi bi-chat-left-fill"></i> 97
                                    </small>
                                </h5>
                            </div>

                            <div class="card-body pt-3">
                                <img src="@/assets/images/eat-clean.png" class="card-img-top rounded" alt="">
                                <p class="card-text pt-3">
                                    Chúng ta luôn chú trọng lựa chọn thực phẩm sạch và duy trì lối sống lành mạnh.
                                    Vậy chế độ ăn Eat Clean nên và không nên ăn trong thực đơn hàng ngày để cân bằng
                                    dinh dưỡng cho cơ
                                    thể?
                                </p>
                            </div>

                        </div>
                    </div>

                </div>

                <nav aria-label="Page navigation example" class="d-flex justify-content-center">
                    <ul class="pagination pt-3 mb-0">
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#" aria-current="page">1</a>
                        </li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </ul>
                </nav>

            </div>
        </div>
    </div>

</template>