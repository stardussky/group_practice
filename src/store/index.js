import Vue from 'vue'
import Vuex from 'vuex'

import pmStore from './modules/pmStore'
import clockStore from './modules/clockStore'
Vue.use(Vuex)
export default new Vuex.Store({
  strict: true,
  state: {
  },
  mutations: {
  },
  actions: {
  },
  modules: {
    pmStore: pmStore(),
    clockStore: clockStore()
  }
})
