import { createApp } from 'vue'
import App from './App.vue'
import router from './router' 

// Import Bootstrap và Icon
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.bundle.min.js'
import 'bootstrap-icons/font/bootstrap-icons.css'

// 1. Tạo app
const app = createApp(App)

// 2. Kích hoạt Router
app.use(router)

// 3. Mount vào giao diện
app.mount('#app')