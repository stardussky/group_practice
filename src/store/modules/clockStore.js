export default () => {
  return {
    namespaced: true,
    state: {
      isPlay: false,
      targetInfo: null,
      selfList: []
    },
    getters: {
      clockList (state, getters, rootState, rootGetters) {
        return [
          {
            type: 'pm',
            name: '專案項目',
            list: rootGetters['pmStore/clockList']
          },
          {
            type: 'self',
            name: '個人項目',
            list: state.selfList
          }
        ]
      }
    },
    mutations: {
      toggleStatus (state, status) {
        state.isPlay = status
      },
      selectTarget (state, payload) {
        state.targetInfo = payload
      }
    },
    actions: {
      ADD_TIMER ({ dispatch }, { info, timer }) {
        if (info) {
          dispatch('pmStore/RECORD_CLOCK_TIME', { info, timer }, { root: true })
        }
      },
      DONE_CLOCK ({ commit, dispatch }, payload) {
        dispatch('pmStore/DONE_PM_CLOCK', payload, { root: true })
      },
      DELETE_CLOCK ({ commit, dispatch }, payload) {
        dispatch('pmStore/DELETE_PM_CLOCK', payload, { root: true })
      }
    }
  }
}
