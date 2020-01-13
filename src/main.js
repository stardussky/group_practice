import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import composition from '@vue/composition-api'
import veeValidate from './plugins/veeValidate/veeValidate'
import vueShepherd from 'vue-shepherd'
import { vueProgressBar, options } from './plugins/vueProgressbar/vueProgressbar'

Vue.config.productionTip = false
Vue.use(composition)
Vue.use(veeValidate)
Vue.use(vueShepherd)
Vue.use(vueProgressBar, options)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
