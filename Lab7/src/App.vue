<template>
  <div>
    <Bai1/>
    <Bai2/>
    <Bai3/>
    <LoginComponent v-if="!isLoggedIn" @loggedIn="handleLoginSuccess" />
    <CommentComponent v-else :username="loggedInUser" />
  </div>
</template>

<script setup>
import { ref } from 'vue';
import LoginComponent from './components/LoginComponent.vue';
import CommentComponent from './components/CommentComponent.vue';
import Bai1 from './components/Bai1.vue';
import Bai2 from './components/Bai2.vue';
import Bai3 from './components/Bai3.vue';

const isLoggedIn = ref(false);
const loggedInUser = ref('');

function handleLoginSuccess(username) {
  loggedInUser.value = username;
  isLoggedIn.value = true;
}
</script>
<style>

body {
  margin: 0;
  display: block !important; 
  place-items: unset !important;
  min-width: 100vw;
}
#app {
  width: 100%;
  max-width: 100% !important;
  margin: 0;
  padding: 0;
  text-align: left !important; 
}
</style>