import { createRouter, createWebHistory } from 'vue-router'

// 1. Import các trang chính (Page)
import HomeGuest from '../components/HomeGuest.vue'
import HomeUser from '../components/HomeUser.vue'

// Lưu ý: Không cần import ModalLogin/Register vào đây
// Vì chúng là linh kiện (component) con của HomeGuest, không phải là trang riêng.

const routes = [
  // 2. Định nghĩa trang chủ (Khách)
  { 
    path: '/', 
    name: 'Guest', 
    component: HomeGuest 
  },
  
  // 3. Định nghĩa trang Người dùng (Sau khi đăng nhập)
  { 
    path: '/home-user', 
    name: 'User', 
    component: HomeUser,
    // (Tuỳ chọn) Chặn người dùng chưa đăng nhập
    beforeEnter: (to, from, next) => {
        const user = localStorage.getItem('currentUser');
        if (!user) {
            next('/'); // Chưa đăng nhập thì đá về trang chủ
        } else {
            next(); // Cho phép đi tiếp
        }
    }
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})
 
export default router