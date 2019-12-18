import Vue from 'vue'
import App from './App.vue'
import router from './router'
import composition from '@vue/composition-api'
import veeValidate from './plugins/veeValidate/veeValidate'
import store from './store'

Vue.config.productionTip = false
Vue.use(composition)
Vue.use(veeValidate)

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
