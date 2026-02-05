<script>
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'

const router = useRouter()
const route = useRoute()

const search = computed({
    get() {
        return route.query.search
    },
})
</script>
<template>
    <h2>About</h2>
    <label>
        Search:<input v-model.trim="search" maxlegth="20">
    </label>
</template>