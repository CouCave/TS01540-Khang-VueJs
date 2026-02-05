<template>
  <div class="container mt-4">
    <div class="mb-3">
      <label>Nhập điểm trung bình:</label>
      <input type="number" v-model.number="score" class="form-control" placeholder="Nhập điểm..." min="0" max="10">
    </div>

    <div class="alert alert-info" v-if="score !== null">
      <strong>Xếp loại: </strong>
      <span v-if="score < 5">Yếu</span>
      <span v-else-if="score < 6.5">Trung bình</span>
      <span v-else-if="score < 8">Khá</span>
      <span v-else-if="score < 9">Giỏi</span>
      <span v-else>Xuất sắc</span>
    </div>
  </div>
</template>

<script setup>
import { ref } from 'vue';

const score = ref(null); 
</script>