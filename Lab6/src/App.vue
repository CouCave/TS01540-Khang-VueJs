<template>
  
    <h1 class="text-center text-primary mb-4">Lab 6</h1>
    
    <Bai1/>
    <Bai2/>
    <Bai3/>
    <Bai4/>
    <demo/>
</template>

<script setup>
import { ref } from 'vue';

import Bai1 from './components/Bai1.vue';
import Bai2 from './components/Bai2.vue';
import Bai3 from './components/Bai3.vue';
import Bai4 from './components/Bai4.vue';
import demo from './components/demo.vue';


const currentTab = ref(1);
</script>

<style>

body {
  background-color: #f8f9fa;
}

body, #app {
  color: #000000 !important;
  background-color: #ffffff; 
}


.text-primary {
  color: #000000 !important; 
}

input, textarea, select {
  color: #000000 !important;
}
</style>