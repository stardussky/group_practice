export default () => {
  return {
    namespaced: true,
    state: {
      isPlay: false,
      targetInfo: null,
      selfList: [],
      pmList: []
    },
    getters: {
      clockList (state, getters, rootState, rootGetters) {
        return [
          {
            type: 'pm',
            name: '專案項目',
            list: rootState.isLogin ? state.pmList : rootGetters['pmStore/clockList']
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
      getClockList (state, json) {
        if (json)state.pmList = json
      },
      toggleStatus (state, status) {
        state.isPlay = status
      },
      selectTarget (state, payload) {
        state.targetInfo = payload
      },
      addTimer (state, { info, timer }) {
        let target
        if (info.type) {
          target = state.selfList.find(list => list.info.id === info.info.id)
        } else {
          target = state.pmList.find(list => list.todoContentId === info.todoContentId)
        }
        if (target)target.info.timer += timer
      },
      doneClock (state, payload) {
        let target
        if (payload.type) {
          target = state.selfList.find(list => list.info.id === payload.info.id)
        } else {
          target = state.pmList.find(list => list.todoContentId === payload.todoContentId)
        }
        if (target)target.info.status = true
      },
      deleteClock (state, payload) {
        let target
        if (payload.type) {
          target = state.selfList.findIndex(list => list.info.id === payload.info.id)
          state.selfList.splice(target, 1)
        } else {
          target = state.pmList.findIndex(list => list.todoContentId === payload.todoContentId)
          state.pmList.splice(target, 1)
        }
      },
      addSelfList (state, payload) {
        state.selfList.push(payload)
      },
      clearSelfList (state) {
        state.selfList = []
      }
    },
    actions: {
      GET_CLOCK_LIST ({ commit, rootState }) {
        return new Promise(resolve => {
          commit('changeLoadingStatue', 'start', { root: true })
          fetch('./php/clock/getClockList.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${rootState.memberStore.userInfo.mem_no}`)
          })
            .then(res => res.json())
            .then(json => {
              commit('getClockList', json.data)
              commit('changeLoadingStatue', 'success', { root: true })
            })
            .catch(err => commit('changeLoadingStatue', err, { root: true }))
          resolve()
        })
      },
      ADD_TIMER ({ commit, dispatch, rootState }, { info, timer }) {
        return new Promise(resolve => {
          if (info) {
            if (rootState.isLogin) {
              fetch('./php/clock/recordClockTime.php', {
                method: 'POST',
                body: new URLSearchParams(`todo_cont_no=${info.todoContentId}&timer=${timer}`)
              })
                .then(res => res.json())
                .then(json => {
                  if (json.status === 'success')commit('addTimer', { info, timer })
                })
                .catch(err => console.log(err))
            } else {
              if (info.type) {
                commit('addTimer', { info, timer })
              } else {
                dispatch('pmStore/RECORD_CLOCK_TIME', { info, timer }, { root: true })
              }
            }
          }
          resolve()
        })
      },
      DONE_CLOCK ({ commit, dispatch, rootState }, payload) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            if (rootState.isLoading) return
            commit('changeLoadingStatue', 'start', { root: true })
            fetch('./php/clock/clockStatus.php', {
              method: 'POST',
              body: new URLSearchParams(`todo_cont_no=${payload.todoContentId}&todo_cont_sta=1&todo_cont_clock=1`)
            })
              .then(res => res.json())
              .then(json => {
                if (json.status === 'success')commit('doneClock', payload)
                commit('changeLoadingStatue', 'success', { root: true })
              })
              .catch(err => commit('changeLoadingStatue', err, { root: true }))
          } else {
            if (payload.type) {
              commit('doneClock', payload)
            } else {
              dispatch('pmStore/DONE_PM_CLOCK', payload, { root: true })
            }
          }
          resolve()
        })
      },
      DELETE_CLOCK ({ commit, dispatch, rootState }, payload) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            if (rootState.isLoading) return
            commit('changeLoadingStatue', 'start', { root: true })
            fetch('./php/clock/clockStatus.php', {
              method: 'POST',
              body: new URLSearchParams(`todo_cont_no=${payload.todoContentId}&todo_cont_sta=0&todo_cont_clock=0`)
            })
              .then(res => res.json())
              .then(json => {
                if (json.status === 'success')commit('deleteClock', payload)
                commit('changeLoadingStatue', 'success', { root: true })
              })
              .catch(err => commit('changeLoadingStatue', err, { root: true }))
          } else {
            if (payload.type) {
              commit('deleteClock', payload)
            } else {
              dispatch('pmStore/DELETE_PM_CLOCK', payload, { root: true })
            }
          }
          resolve()
        })
      }
    }
  }
}
