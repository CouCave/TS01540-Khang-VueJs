<script setup>
import { ref } from 'vue';
import { useRouter } from 'vue-router';

const router = useRouter();

// Khai báo các biến
const fullName = ref('');
const email = ref('');
const password = ref('');
const rePassword = ref('');

const handleRegister = () => {
    // 1. Kiểm tra rỗng
    if (!fullName.value || !email.value || !password.value || !rePassword.value) {
        alert("Vui lòng nhập đầy đủ thông tin!");
        return;
    }

    // 2. Kiểm tra mật khẩu
    if (password.value !== rePassword.value) {
        alert("Mật khẩu xác nhận không khớp!");
        return;
    }

    // 3. Lưu thông tin
    const userData = {
        name: fullName.value,
        email: email.value,
        password: password.value
    };
    localStorage.setItem('currentUser', JSON.stringify(userData));

    // 4. Đóng Modal & XỬ LÝ MÀN HÌNH ĐEN (Quan trọng)
    const modalElement = document.getElementById('modalRegister');
    if (modalElement) {
        const bootstrapInstance = window.bootstrap || bootstrap; 
        const modalInstance = bootstrapInstance.Modal.getInstance(modalElement);
        if (modalInstance) {
            modalInstance.hide();
        } else {
            new bootstrapInstance.Modal(modalElement).hide();
        }
    }

    // --- ĐOẠN CODE FIX LỖI MÀN HÌNH ĐEN ---
    // Xóa thủ công lớp nền đen nếu Bootstrap quên xóa
    const backdrop = document.querySelector('.modal-backdrop');
    if (backdrop) {
        backdrop.remove();
    }
    // Xóa class cấm cuộn chuột của body
    document.body.classList.remove('modal-open');
    document.body.style = ''; 
    // ---------------------------------------

    // 5. Chuyển hướng
    alert("Đăng ký thành công!"); 
    router.push('/home-user');
}
</script>

<template>
    <div class="modal fade" id="modalRegister" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Đăng ký tài khoản</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                
                <div class="modal-body">
                    <form @submit.prevent="handleRegister">
                        <div class="mb-3">
                            <label class="form-label">Họ và Tên</label>
                            <input v-model="fullName" class="form-control" placeholder="Nhập họ và tên">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Email</label>
                            <input v-model="email" type="email" class="form-control" placeholder="Nhập email">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Mật khẩu</label>
                            <input v-model="password" type="password" class="form-control" placeholder="Nhập mật khẩu">
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Xác nhận mật khẩu</label>
                            <input v-model="rePassword" type="password" class="form-control" placeholder="Xác nhận mật khẩu">
                        </div>
                        
                        <button type="submit" style="display: none;"></button>
                    </form>
                </div>
                
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                    <button type="button" class="btn btn-success" @click="handleRegister">Đăng ký</button>
                </div>
            </div>
        </div>
    </div>
</template>