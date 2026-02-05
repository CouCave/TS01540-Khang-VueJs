<template>
  <div class="container mt-4">
    <h3>Tính tiền sản phẩm</h3>
    
    <div class="mb-3">
      <label class="form-label">Đơn giá:</label>
      <input 
        type="number" 
        v-model.number="price" 
        class="form-control" 
        placeholder="Nhập đơn giá..." 
        min="0"
      />
    </div>

    <div class="mb-3">
      <label class="form-label">Số lượng:</label>
      <input 
        type="number" 
        v-model.number="quantity" 
        class="form-control" 
        placeholder="Nhập số lượng..." 
        min="0"
      />
    </div>

    <div class="alert alert-success" v-if="quantity > 0 && price > 0">
      <p>Thành tiền gốc: {{ (price * quantity).toLocaleString() }} VNĐ</p>
      
      <p v-if="quantity >= 10" class="text-danger fw-bold">
        Giảm 10%
      </p>
      
      <h4>
        Tổng thanh toán: {{ finalAmount.toLocaleString() }} VNĐ
      </h4>
    </div>
  </div>
</template>

<script setup>
import { ref, computed } from 'vue';

const price = ref(0);    
const quantity = ref(0); 


const finalAmount = computed(() => {
  const total = price.value * quantity.value;
  
  if (quantity.value >= 10) {
    return total * 0.9; 
  }
  
  return total; 
});
</script>