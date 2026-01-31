<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();
const email = ref('');
const password = ref('');

const handleLogin = () => {
    // 1. Validate
    if (!email.value || !password.value) {
        alert("Vui lòng nhập email và mật khẩu!");
        return;
    }

    // 2. Lưu thông tin (Giả lập)
    const userData = {
        name: "Người dùng mẫu", // Hoặc lấy tên từ API nếu có
        email: email.value
    };
    localStorage.setItem('currentUser', JSON.stringify(userData));

    // 3. Đóng Modal (Bootstrap)
    const modalElement = document.getElementById('modalLogin');
    if (modalElement) {
        const bootstrapInstance = window.bootstrap || bootstrap;
        const modalInstance = bootstrapInstance.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        } else {
             new bootstrapInstance.Modal(modalElement).hide();
        }
    }

    // 4. FIX LỖI MÀN HÌNH ĐEN (Thêm đoạn này vào)
    // Xóa thủ công lớp nền đen nếu Bootstrap chưa kịp xóa
    const backdrop = document.querySelector('.modal-backdrop');
    if (backdrop) {
        backdrop.remove();
    }
    // Cho phép cuộn trang trở lại
    document.body.classList.remove('modal-open');
    document.body.style = '';

    // 5. Chuyển hướng
    // alert("Đăng nhập thành công!"); // Có thể bỏ alert nếu muốn chuyển nhanh
    router.push('/home-user');
}
</script>

<template>
    <div class="modal fade" id="modalLogin" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Đăng nhập</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input v-model="email" type="email" class="form-control" placeholder="Nhập email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Mật khẩu</label>
                            <input v-model="password" type="password" class="form-control" placeholder="Nhập mật khẩu">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-success" @click="handleLogin">Đăng nhập</button>
                </div>
            </div>
        </div>
    </div>
</template>