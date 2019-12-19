import Vue from 'vue'
import Vuex from 'vuex'

import pmStore from './modules/pmStore'
Vue.use(Vuex)
export default new Vuex.Store({
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    pmStore: pmStore()
  }
})
