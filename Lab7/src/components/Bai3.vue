<template>
  <div class="container mt-5">
    <div class="row">
      <div class="col-sm-6">
        <h3>Form Đăng Ký</h3>
        <form @submit.prevent="isSubmitted = true">
          <div class="mb-3">
            <label>Họ tên:</label>
            <input v-model="user.name" class="form-control" >
          </div>
          <div class="mb-3">
            <label>Email:</label>
            <input v-model="user.email" class="form-control" >
          </div>
          <div class="mb-3">
            <label>Mật khẩu:</label>
            <input type="password" v-model="user.password" class="form-control">
          </div>
          <div class="mb-3">
            <label>Ngày sinh:</label>
            <input type="date" v-model="user.dob" class="form-control">
          </div>
          <div class="mb-3">
            <label>Giới tính:</label><br>
            <input type="radio" value="Nam" v-model="user.gender"> Nam
            <input type="radio" value="Nữ" v-model="user.gender"> Nữ
            <input type="radio" value="Khác" v-model="user.gender"> Khác
          </div>
          <div class="mb-3">
            <label>Ngôn ngữ:</label><br>
            <input type="checkbox" value="Tiếng Việt" v-model="user.languages"> Tiếng Việt
            <input type="checkbox" value="Tiếng Anh" v-model="user.languages"> Tiếng Anh
            <input type="checkbox" value="Tiếng Nhật" v-model="user.languages"> Tiếng Nhật
          </div>
          <button type="submit" class="btn btn-primary">Đăng ký</button>
        </form>
      </div>

      <div v-if="isSubmitted" class="col-sm-6">
        <h3>Thông tin đã đăng ký:</h3>
        <p><strong>Họ tên:</strong> {{ user.name }}</p>
        <p><strong>Email:</strong> {{ user.email }}</p>
        <p><strong>Ngày sinh:</strong> {{ user.dob }}</p>
        <p><strong>Giới tính:</strong> {{ user.gender }}</p>
        <p><strong>Ngôn ngữ:</strong> {{ user.languages.join(', ') }}</p>
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive } from 'vue';
const isSubmitted = ref(false);
const user = reactive({
  name: '',
  email: '',
  password: '',
  dob: '',
  gender: '',
  languages: []
});
</script>