<script setup>
import { ref } from 'vue';
// 1. Import các Modal
import ModalLogin from './ModalLogin.vue';
import ModalRegister from './ModalRegister.vue';

const newsList = ref([
  {
    title: "Công ty Trung Quốc muốn đưa robot hình người lên vũ trụ",
    summary: "Công ty Trung Quốc Engine AI công bố kế hoạch đưa robot hình người lên không gian...",
    image: "https://i1-vnexpress.vnecdn.net/2026/01/28/untitleddesign20250224t2035377-8816-3464-1769574495.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=pJx5sh394uD62j451IFigw",
    link: "#",
    comments: 7
  },
  {
    title: "Bên trong kế hoạch 'lột xác' Siri của Apple",
    summary: "Apple được cho là đang phát triển hai phiên bản Siri mới thông qua sự hợp tác với Google...",
    image: "https://i1-vnexpress.vnecdn.net/2026/01/27/chatgpt-image-jan-27-2026-11-1-8299-1199-1769530614.png?w=180&h=108&q=100&dpr=1&fit=crop&s=zlL-x73Sbj-b8UpwhsdR6A",
    link: "#",
    comments: 7
  },
  {
    title: "Giải pháp xác minh danh tính không cần gửi giấy tờ",
    summary: "Giải pháp NDAKey cho phép người dùng có thể quản lý danh tính tự chủ...",
    image: "https://i1-vnexpress.vnecdn.net/2026/01/27/629b1c29-a274-4821-9e1f-d74a7b-6672-1391-1769511532.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=Pv2J2NEQ6j-TKh71c3I3zA",
    link: "#",
    comments: 2
  },
  {
    title: "Kling - AI Trung Quốc thách thức OpenAI Sora, Google Veo",
    summary: "Kling, AI tạo video từ văn bản hoặc hình ảnh của Kuaishou, đang thu hút sự quan tâm lớn...",
    image: "https://i1-vnexpress.vnecdn.net/2026/01/27/kling21chinasbestvideogenerati-4704-3902-1769502849.png?w=180&h=108&q=100&dpr=1&fit=crop&s=bGxT0yNejBZXwXD_JNtBdw",
    link: "#",
    comments: 12
  },
  {
    title: "CEO Telegram: 'Mất não mới tin WhatsApp an toàn'",
    summary: "Pavel Durov, CEO Telegram, chê khả năng bảo mật của WhatsApp...",
    image: "https://i1-vnexpress.vnecdn.net/2026/01/27/Whatsapplogo175030763134541750-5810-4629-1769507045.jpg?w=180&h=108&q=100&dpr=1&fit=crop&s=J0UHPCtVvdJGNAElyiRAxQ",
    link: "#",
    comments: 35
  }
]);
</script>

<template>
  <nav class="navbar navbar-expand-sm navbar-light bg-light border">
    <div class="container">
      <a class="navbar-brand" href="#">
        <img src="@/assets/images/logo.png" alt="" style="width:150px;">
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
        </ul>

        <ul class="navbar-nav">
          <li class="nav-item">
            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalRegister">Đăng ký</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#modalLogin">Đăng nhập</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>

  <div class="container mt-4">
    <div id="newsCarousel" class="carousel slide" data-bs-ride="carousel" data-bs-interval="4000">
      <div class="carousel-inner">
        <div class="carousel-item">
          <div class="news-slide d-flex">
            <div class="news-meta mt-3 ps-3">
              <h2><a href="#" class="news-title">Intel bị "đấm vỡ alo" bởi oppa AMD trong cuộc đua CPU</a></h2>
              <div class="summary">Cuộc chiến chip xử lý ngày càng khốc liệt khi AMD liên tục tung ra các sản phẩm hiệu
                năng cao với mức giá cực tốt.</div>
            </div>
            <a href="#" class="news-thumb"><img src="@/assets/images/banner1.jpg" alt=""></a>
          </div>
        </div>
        <div class="carousel-item active">
          <div class="news-slide d-flex">
            <div class="news-meta mt-3 ps-3">
              <h2><a href="#" class="news-title">Laptop sinh viên Thiết kế đồ họa đáng mua nhất 2026</a></h2>
              <div class="summary">Cùng khám phá những mẫu laptop sinh viên Thiết kế đồ họa đáng mua nhất 2026!</div>
            </div>
            <a href="#" class="news-thumb"><img src="@/assets/images/banner2.jpg" alt=""></a>
          </div>
        </div>
        <div class="carousel-item">
          <div class="news-slide d-flex">
            <div class="news-meta mt-3 ps-3">
              <h2><a href="#" class="news-title">Bên trong kế hoạch 'lột xác' Siri của Apple</a></h2>
              <div class="summary">Apple được cho là đang phát triển hai phiên bản Siri mới thông qua sự hợp tác với
                Google.</div>
            </div>
            <a href="#" class="news-thumb"><img src="@/assets/images/banner3.jpg" alt=""></a>
          </div>
        </div>
      </div>
      <button class="carousel-control-prev" type="button" data-bs-target="#newsCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon"></span>
      </button>
      <button class="carousel-control-next" type="button" data-bs-target="#newsCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon"></span>
      </button>
    </div>
  </div>

  <div class="container mt-4">
    <div class="row">
      <div class="col-sm-4 col-left-container">
        <h3 class="section-title mt-2 mb-3">Tin mới</h3>
        <article v-for="(item, index) in newsList" :key="index" class="item-news d-flex mb-4">
          <div class="thumb-art me-3">
            <a :href="item.link" class="thumb thumb-5x3">
              <img :src="item.image" :alt="item.title" loading="lazy">
            </a>
          </div>
          <div class="content">
            <h4 class="title-news"><a :href="item.link">{{ item.title }}</a></h4>
            <p class="description">
              <a :href="item.link" class="text-decoration-none text-secondary">{{ item.summary }}</a>
              <span class="meta-news ms-2" v-if="item.comments > 0">
                <i class="bi bi-chat-left-fill text-secondary" style="font-size: 12px;"></i>
                <span class="comment-count">{{ item.comments }}</span>
              </span>
            </p>
          </div>
        </article>
      </div>

      <div class="col-sm-8">
        <h3 class="section-title mt-2">Tất cả bài viết</h3>
        <div class="row">
          <div class="col-sm-6">
            <div class="card news mt-3">
              <div class="card-body border-bottom">
                <h5 class="card-title">Nhiều người dùng Mỹ xóa TikTok</h5>
              </div>
              <div class="card-body pt-3">
                <img
                  src="https://i1-vnexpress.vnecdn.net/2026/01/27/dsc03349-jpg-7666-1769481104-1-1951-5213-1769483054.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=wtjxWjq_K0K7Q0g_n_fOGg"
                  class="card-img-top rounded" alt="">
                <p class="card-text pt-3">Số lượng người dùng Mỹ xóa TikTok tăng 150%...</p>
              </div>
            </div>

            <div class="card news mt-3">
              <div class="card-body border-bottom">
                <h5 class="card-title">10 năm iCheck thúc đẩy minh bạch sản phẩm qua mã vạch</h5>
              </div>
              <div class="card-body pt-3">
                <img
                  src="https://i1-vnexpress.vnecdn.net/2026/01/23/1-1769146053-1441-1769146139.png?w=1020&h=0&q=100&dpr=1&fit=crop&s=yq4fPbAj0ZY67vQ9GFcYtQ"
                  class="card-img-top rounded" alt="">
                <p class="card-text pt-3">Từ vị thế start up công nghệ, iCheck trở thành nền tảng...</p>
              </div>
            </div>
          </div>

          <div class="col-sm-6">
            <div class="card news mt-3">
              <div class="card-body border-bottom">
                <h5 class="card-title">CEO Telegram: 'Mất não mới tin WhatsApp an toàn'</h5>
              </div>
              <div class="card-body pt-3">
                <img
                  src="https://i1-vnexpress.vnecdn.net/2026/01/27/Whatsapp-logo-1750307631-3454-4107-6496-1769507045.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Eu6EXqSWI1Q_AtVzXfJ9jw"
                  class="card-img-top rounded" alt="">
                <p class="card-text pt-3">Pavel Durov, CEO Telegram, chê khả năng bảo mật của WhatsApp...</p>
              </div>
            </div>

            <div class="card news mt-3">
              <div class="card-body border-bottom">
                <h5 class="card-title">Trải nghiệm AI và kết nối thiết bị Apple trên Oppo Reno 15</h5>
              </div>
              <div class="card-body pt-3">
                <img
                  src="https://cdn-media.sforum.vn/storage/app/media/trannghia/Ecovacs/OPPO-Reno-15-15-pro-ra-mat-2.jpg"
                  class="card-img-top rounded" alt="">
                <p class="card-text pt-3">Oppo Reno 15 có bộ công cụ AI nhiều tính năng...</p>
              </div>
            </div>
          </div>
        </div>

        <nav aria-label="Page navigation example" class="d-flex justify-content-center">
          <ul class="pagination pt-3 mb-0">
            <li class="page-item"><a class="page-link" href="#">&laquo;</a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#">&raquo;</a></li>
          </ul>
        </nav>
      </div>
    </div>
  </div>

  <ModalLogin />
  <ModalRegister />

</template>

<style scoped>

.section-title {
  color: #70173d;
  font-weight: 700;
}

.carousel-control-prev,
.carousel-control-next {
  width: 20px;
  height: 20px;
  top: 50%;
  transform: translateY(-50%);
  background: none;
  opacity: 1;
}

.carousel-control-prev-icon,
.carousel-control-next-icon {
  width: 32px;
  height: 32px;
  border-radius: 50%;
  background-size: 50%;
}

.news-title {
  font-size: 26px;
  font-weight: 700;
  line-height: 1.3;
  color: #111;
  text-decoration: none;
  display: inline-block;
  transition: color 0.25s ease;
}

.news-title:hover {
  color: #70173d;
}

.news-slide {
  border-radius: 16px;
  overflow: hidden;
}

.news-meta {
  flex: 1;
  padding-right: 15px;
}

.news-thumb {
  width: 65%;
  flex-shrink: 0;
}

.news-thumb img {
  width: 100%;
  height: 350px;
  object-fit: cover;
  border-radius: 12px;
  display: block;
}

@media (max-width: 768px) {
  .news-slide {
    flex-direction: column-reverse;
  }

  .news-thumb {
    width: 100%;
  }

  .news-thumb img {
    height: 200px;
  }
}

.col-left-container {
  padding-right: 15px;
}

.item-news {
  border-bottom: 1px solid #eee;
  padding-bottom: 15px;
}

.item-news:last-child {
  border-bottom: none;
}

.thumb-art {
  flex-shrink: 0;
  width: 140px;
}

.thumb-art img {
  width: 100%;
  height: 84px;
  object-fit: cover;
  border-radius: 4px;
  background-color: #f7f7f7;
}

.title-news {
  font-size: 16px;
  font-weight: 700;
  line-height: 1.4;
  margin-bottom: 5px;
  margin-top: -3px;
}

.title-news a {
  color: #222;
  text-decoration: none;
  transition: color 0.2s;
}

.title-news a:hover {
  color: #9f224e;
}

.description {
  font-size: 13px;
  line-height: 1.5;
  color: #555;
  margin-bottom: 0;
}

.description a {
  color: #444;
}

.description a:hover {
  color: #000;
}

.meta-news {
  white-space: nowrap;
  font-size: 12px;
  color: #757575;
}

.comment-count {
  margin-left: 3px;
  font-weight: bold;
}
</style>