<script setup>
import { ref } from 'vue'
import Bai1 from './components/Bai1.vue';
import Bai2 from './components/Bai2.vue';
import Bai3 from './components/Bai3.vue';
import CreatePost from './components/CreatePost.vue';
import PostList from './components/PostList.vue';
const posts = ref([])

function addPost(post) {
  posts.value.push(post)
}
const currentComponent = ref(Bai1)
</script>

<template>
  <div id="app">
    <h1>Ứng dụng Blog nhỏ với Vue.js</h1>
    <CreatePost @add-post="addPost" />
    <PostList :posts="posts" />
  </div>
  <div style="margin-bottom: 20px;">
  <button @click="currentComponent = Bai1">Bài 1</button>
  <button @click="currentComponent = Bai2">Bài 2</button>
  <button @click="currentComponent = Bai3">Bài 3</button>
  </div>
  <component :is="currentComponent" />
</template>

<style>
#app {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
}
</style>
