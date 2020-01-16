import Vue from 'vue'
import VueRouter from 'vue-router'
import Home from '../views/Home.vue'
import store from '@/store/index'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push (location) {
  return originalPush.call(this, location).catch(err => err)
}

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    children: [
      {
        path: 'projectManagement',
        component: () => import(/* webpackChunkName: "ProjectManagement" */ '../views/ProjectManagement.vue'),
        children: [
          {
            path: '',
            redirect: 'pm'
          },
          {
            path: 'pm',
            name: 'ProjectManagement',
            component: () => import(/* webpackChunkName: "PMView" */ '@/components/PM/PMView.vue'),
            meta: { name: 'ProjectManagement', title: '我的專案', tour: true }
          },
          {
            path: 'project/:id',
            name: 'Project',
            component: () => import(/* webpackChunkName: "CardView" */ '@/components/PM/CardView.vue'),
            meta: { name: 'ProjectManagement', title: '專案內容', auth: true, tour: true }
          },
          {
            path: '*',
            redirect: 'pm'
          }
        ]
      },
      {
        path: 'clock',
        name: 'Clock',
        component: () => import(/* webpackChunkName: "Clock" */ '../views/Clock.vue'),
        meta: { name: 'Clock', title: '番茄鐘', tour: true }
      },
      {
        path: 'shop',
        name: 'Shop',
        component: () => import(/* webpackChunkName: "Shop" */ '../views/Shop.vue'),
        meta: { name: 'Shop', title: '商城' }
      },
      {
        path: 'login',
        name: 'Login',
        component: () => import(/* webpackChunkName: "Login" */ '../views/Login.vue'),
        meta: { name: 'Login', title: '登入' }
      }
    ]
  },
  {
    path: '*',
    redirect: '/'
  }
]

const router = new VueRouter({
  routes
})

router.beforeEach(async (to, from, next) => {
  if (to.meta.auth) {
    await store.dispatch('pmStore/GET_PROJECT', to.params.id)
    if (!store.getters['pmStore/project']) return next({ name: 'ProjectManagement' })
    next()
  }
  next()
})
router.beforeResolve((to, from, next) => {
  if (!store.state.isLoading) next()
})

export default router
