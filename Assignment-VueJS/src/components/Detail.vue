<script setup>

</script>
<template>
    <nav class="navbar navbar-expand-sm navbar-light bg-light border">
            <div class="container">
                <a class="navbar-brand" href="#">
                    <img src="@/assets/images/logo-energy-pilates.png" alt="" style="width:150px;">
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item">
                            <a class="nav-link">
                                <i class="fa-solid fa-list"></i> Bài viết
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

                <div class="col-sm-8">
                    <div class="card mt-4">
                        <div class="card-body">
                            <h3 class="text-info text-center mb-4">
                                Phương pháp tập Pilates giúp phục hồi chấn thương cột sống
                            </h3>

                            <img src="@/assets/images/tap-pilates1.jpg" class="img-fluid w-100 rounded mb-4">

                            <p>
                                Tập Pilates có thể vẫn còn khá xa lạ với người Việt, nhưng tại các nước phương Tây thì
                                đây
                                chính là phương pháp tập thể dục giúp duy trì vóc dáng, tăng cường ý chí và cải thiện
                                sức linh hoạt,
                                dẻo dai cho người tập. Đặc biệt, các bài tập Pilates còn có khả năng trị đau lưng, là
                                giải pháp hữu hiệu
                                để phục hồi chấn thương cột sống. Sau đây hãy cùng tìm hiểu các phương pháp tập luyện
                                này giúp phục hồi
                                chấn thương cột sống nhanh chóng nhé!
                            </p>

                            <h5 class="fw-bold mt-4">
                                Pilates giúp phục hồi chấn thương cột sống nhanh chóng
                            </h5>

                            <p>
                                Một trong những căn bệnh ngày càng phổ biến, đặc biệt là dân văn phòng, đó là đau lưng,
                                thoát vị đĩa đệm. Tuy nhiên, nếu điều trị không đúng cách có thể dẫn đến nhiều biến
                                chứng nguy hiểm,
                                bao gồm: Viêm đĩa đệm, điều trị bằng laser không đúng cách hoặc tập yoga không đúng cách
                                có thể khiến bệnh nhân nằm liệt giường.
                            </p>

                            <img src="@/assets/images/tap-piltes.jpg" class="img-fluid w-100 rounded my-4">

                            <h5 class="fw-bold">
                                Phương pháp tập Pilates Cat Cow
                            </h5>

                            <p class="mb-2">Các bước thực hiện:</p>
                            <ul>
                                <li>
                                    Bắt đầu với tư thế 4 điểm. Vai và cổ tay của bạn phải thẳng hàng và vuông góc với
                                    thảm,
                                    lưng của bạn phải bằng phẳng và xương chậu của bạn phải cân đối.
                                </li>
                                <li>
                                    Hít vào, võng lưng, nâng ngực lên, mở rộng ngực.
                                </li>
                                <li>
                                    Thở ra, cong xương cột, nâng cong lưng và đưa cằm về gần khoang ngực.
                                </li>
                                <li>
                                    Lặp đi lặp lại động tác từ 5–7 lần.
                                </li>
                            </ul>

                            <h5 class="fw-bold mt-4">Lời kết</h5>
                            <p>
                                Trên đây là phương pháp tập Pilates giúp phục hồi chấn thương cột sống nhanh chóng.
                                Để đạt được kết quả tập luyện như mong muốn, bạn cần duy trì chế độ tập luyện đều đặn,
                                thực hiện đúng động tác, kết hợp cùng chế độ ăn uống khoa học.
                            </p>

                        </div>
                    </div>

                </div>
                <div class="col-sm-4">
                    <div class="row">
                        <div class="card mt-4">
                            <div class="card-body">
                                <h5 class="mb-3">Bình luận bài viết tại đây</h5>
                                <div class="mb-3">
                                    <textarea class="form-control" rows="3"
                                        placeholder="Nhập bình luận của bạn"></textarea>
                                </div>

                                <button class="btn btn-success mb-4">Gửi bình luận</button>

                                <h6>Danh sách các bình luận:</h6>
                                <ul class="mb-0">
                                    <li>
                                        <b>Bình An:</b> Bài viết rất hữu ích
                                    </li>
                                    <li>
                                        <b>Bình An:</b> Cảm ơn những chia sẻ bổ ích
                                    </li>
                                </ul>
                            </div>
                        </div>


                    </div>

                </div>

            </div>
        </div>
</template>