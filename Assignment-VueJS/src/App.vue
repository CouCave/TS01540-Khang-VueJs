<script setup>
import CRUDPost from './components/CRUDPost.vue';
import Login from './components/Login.vue';
import EditProfile from './components/EditProfile.vue';
import Register from './components/Register.vue';
import HomeGuest from './components/HomeGuest.vue';
import HomeUser from './components/HomeUser.vue';
import Detail from './components/Detail.vue';
import EditPost from './components/EditPost.vue';
</script>

<template>

  <Register/>

  <Login/>

  <CRUDPost/>

  <EditPost/>

  <EditProfile/>

  <HomeGuest/>

  <HomeUser/>

  <Detail/>
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
