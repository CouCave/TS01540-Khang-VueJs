<template>
    <div>
        <h2>Danh sách sản phẩm</h2>
        <div v-for="(product, index) in products" :key="index" :class="{ 'highlighted': product.name.length > 20 }"
            :style="{ backgroundColor: product.backgroundColor, color: product.textColor }" class="product">
            <h3 class="text-success">{{ product.name }}</h3>
            <h4 class="text-danger">{{ product.price }}</h4>
            <p>{{ product.description }}</p>
        </div>
    </div>
</template>

<script>
export default {
    name: "ProductList",
    props: {
        products: {
            type: Array,
            required: true
        }
    }
};
</script>

<style>
.product {
    padding: 20px;
    margin: 10px 0;
    border: 1px solid #ddd;
    border-radius: 10px;
}

.highlighted {
    border: 2px solid lightgray;
}
</style>
