<script setup>

</script>
<template>
    <div class="container mt-4">
        <div class="card" style="width: 600px;">
            <div class="card-body">
                <form>
                <h4 class="mb-3">Đăng ký</h4>
                    <div class="mb-2">
                        <label class="m-2">Họ và Tên</label>
                        <input class="form-control" placeholder="Nhập họ và tên">
                    </div>

                    <div class="mb-3">
                        <label class="m-2">Email</label>
                        <input class="form-control" placeholder="Nhập email">
                    </div>

                    <div class="mb-3">
                        <label class="m-2">Số điện thoại</label>
                        <input class="form-control" placeholder="Nhập số điện thoại">
                    </div>

                    <div class="mb-3">
                        <label class="m-2">Mật khẩu</label>
                        <input class="form-control" placeholder="Nhập mật khẩu">
                    </div>

                    <div class="mb-3">
                        <label class="m-2">Xác nhận mật khẩu</label>
                        <input class="form-control" placeholder="Xác nhận mật khẩu">
                    </div>

                    <div class="mb-3">
                        <label class="m-2">Giới tính:</label>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="nam" checked>
                            <label class="form-check-label" for="nam">Nam</label>
                        </div>

                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" name="gender" id="nu">
                            <label class="form-check-label" for="nu">Nữ</label>
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="agree">
                            <label class="form-check-label" for="agree">
                                Tôi đồng ý với các điều khoản và điều kiện
                            </label>
                        </div>
                    </div>

                    <button class="btn btn-success">Đăng ký</button>
                </form>

            </div>
        </div>

    </div>
</template>