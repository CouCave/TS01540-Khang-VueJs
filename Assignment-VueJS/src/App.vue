<script setup>
import { ref } from 'vue'
import CRUDPost from './components/CRUDPost.vue';
import Login from './components/Login.vue';
import EditProfile from './components/EditProfile.vue';
import Register from './components/Register.vue';
import HomeGuest from './components/HomeGuest.vue';
import HomeUser from './components/HomeUser.vue';
import Detail from './components/Detail.vue';
import EditPost from './components/EditPost.vue';
import Profile from './components/Profile.vue';
import Postview from './components/Postview.vue';

const currentComponent = ref(HomeGuest)
</script>

<template>


  <div style="margin-bottom: 20px;">
    <button @click="currentComponent = HomeGuest">Trang chủ chưa đăng nhập</button>
    <button @click="currentComponent = Register">Đăng ký</button>
    <button @click="currentComponent = Login">Đăng nhập</button>
    <button @click="currentComponent = HomeUser">Trang chủ đã đăng nhập</button>
    <button @click="currentComponent = Postview">Xem bài viết</button>
    <button @click="currentComponent = CRUDPost">Tạo bài viết</button>
    <button @click="currentComponent = EditPost">Sửa bài viết</button>
    <button @click="currentComponent = Detail">Detail</button>
    <button @click="currentComponent = Profile">Profile</button>
    <button @click="currentComponent = EditProfile">Edit Profile</button>
  </div>

  <component :is="currentComponent" />
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
</style>
