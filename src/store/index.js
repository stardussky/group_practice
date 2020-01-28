import Vue from 'vue'
import Vuex from 'vuex'

import pmStore from './modules/pmStore'
import clockStore from './modules/clockStore'
import memberStore from './modules/memberStore'
Vue.use(Vuex)
export default new Vuex.Store({
  state: {
    isLogin: false,
    isLoading: false
  },
  mutations: {
    changeLoginStatus (state, status) {
      state.isLogin = status
    },
    changeLoadingStatue (state, status) {
      if (status === 'start') {
        this._vm.$Progress.start()
        state.isLoading = true
      } else if (status === 'success') {
        this._vm.$Progress.finish()
        state.isLoading = false
      } else {
        this._vm.$Progress.fail()
        state.isLoading = false
        console.log(state)
      }
    }
  },
  actions: {
  },
  modules: {
    pmStore: pmStore(),
    clockStore: clockStore(),
    memberStore: memberStore()
  }
})
