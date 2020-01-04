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
      clockStart (state, { status, info }) {
        state.isPlay = status
        state.targetInfo = info
      },
      clockPause (state, status) {
        state.isPlay = status
      }
    },
    actions: {
      TOGGLE_START ({ commit, dispatch, state }, { status, info, timer }) {
        return new Promise(resolve => {
          if (status) {
            commit('clockStart', { status, info })
          } else {
            commit('clockPause', status)
            if (state.targetInfo) {
              dispatch('pmStore/RECORD_CLOCK_TIME', { info: state.targetInfo, timer }, { root: true })
            }
          }
          resolve()
        })
      }
    }
  }
}
