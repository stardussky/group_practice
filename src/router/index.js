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
            meta: { name: 'ProjectManagement', title: '我的專案' }
          },
          {
            path: 'project/:id',
            name: 'Project',
            component: () => import(/* webpackChunkName: "CardView" */ '@/components/PM/CardView.vue'),
            meta: { name: 'ProjectManagement', title: '專案內容', auth: true }
          },
          {
            path: '*',
            redirect: 'pm'
          }
        ]
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

router.beforeEach((to, from, next) => {
  if (to.meta.auth) {
    store.dispatch('pmStore/GET_PROJECT', to.params.id)
    if (!store.getters['pmStore/project']) return next('pm')
    next()
  }
  next()
})

export default router
