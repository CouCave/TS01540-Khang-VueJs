<template>
    <div>
        <h2>Sản phẩm</h2>
        <input v-model="name" placeholder="Tên sản phẩm" />
        <input v-model.number="price" type="number" placeholder="Giá sản phẩm" />
        <textarea v-model="description" placeholder="Nội dung sản phẩm"></textarea>
        <button @click="submitProduct">Thêm sản phẩm</button>
    </div>
</template>
<script setup>
import { ref } from 'vue'

const emit = defineEmits(['add-product'])

const name = ref('')
const description = ref('')
const price = ref('')

function submitProduct() {
    if (name.value && description.value && price.value) {
        const newProduct = {
            name: name.value,
            description: description.value,
            price: price.value
        }

        emit('add-product', newProduct)

        name.value = ''
        description.value = ''
        price.value = ''
    }
}
</script>
<style>
input,
textarea {
    display: block;
    width: 100%;
    margin: 10px 0;
    padding: 10px;
    border-radius: 5px;
    border: 1px solid #ddd;
}

button {
    padding: 10px 20px;
    background-color: #3498db;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}
</style>
