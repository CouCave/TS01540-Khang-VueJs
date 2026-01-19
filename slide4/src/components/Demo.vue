<script>
export default {
    data() {
        return {
            message: 'Xin chào VueJS',
            number: 10,
            content: 'Xin chào các bạn',
            className: 'text-red',
            styleData: 'font-size: 5rem'
        }
    },
    methods: {
        sayHi() {
            return 'Đây là phương thức'
        },
        changeContent() {
            this.message = 'Đây là nội dung mới'
        },
        change(){
            this.content = 'Đã đổi thành nội dung mới'
            this.className = 'text-blue'
        }
    }
}
</script>

<template>
    <div>
        <h2 v-bind:class="className" v-bind:style="styleData" v-html="content"></h2>
        <h6 class="text-red" style="font-size: 5rem">{{ content }}</h6>
        <h1>Hiển thị nội dung</h1>
        <h2>{{ message }}</h2>
        <h2 v-html="number + 5"></h2>
        <h4>{{ sayHi() }}</h4>
        <button @click="change()">Change</button>
    </div>
</template>

<style>
    .text-red{
        color:red
    }
    .text-blue{
        color:blue
    }
</style>
