<script setup>
import { ref } from 'vue'

defineProps({
  msg: String,
})

const count = ref(0)
</script>

<template>
<h1>Chào mừng đến với VueJS</h1>
</template>

<style>
h1{color: red;}
</style>

