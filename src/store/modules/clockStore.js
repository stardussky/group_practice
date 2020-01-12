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
        let target = state.pmList.find(list => list.todoContentId === info.todoContentId)
        if (target)target.info.timer += timer
      },
      doneClock (state, payload) {
        let target = state.pmList.find(list => list.todoContentId === payload.todoContentId)
        if (target)target.info.status = true
      },
      deleteClock (state, payload) {
        let index = state.pmList.findIndex(list => list.todoContentId === payload.todoContentId)
        state.pmList.splice(index, 1)
      }
    },
    actions: {
      GET_CLOCK_LIST ({ commit, rootState }) {
        return new Promise(resolve => {
          fetch('/phpLab/dd104g3/clock/getClockList.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${rootState.memberStore.userInfo.mem_no}`)
          })
            .then(res => res.json())
            .then(json => commit('getClockList', json.data))
            .catch(err => console.log(err))
          resolve()
        })
      },
      ADD_TIMER ({ commit, dispatch, rootState }, { info, timer }) {
        return new Promise(resolve => {
          if (info) {
            if (rootState.isLogin) {
              fetch('/phpLab/dd104g3/clock/recordClockTime.php', {
                method: 'POST',
                body: new URLSearchParams(`todo_cont_no=${info.todoContentId}&timer=${timer}`)
              })
                .then(res => res.json())
                .then(json => {
                  if (json.status === 'success')commit('addTimer', { info, timer })
                })
                .catch(err => console.log(err))
            } else {
              dispatch('pmStore/RECORD_CLOCK_TIME', { info, timer }, { root: true })
            }
          }
          resolve()
        })
      },
      DONE_CLOCK ({ commit, dispatch, rootState }, payload) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            fetch('/phpLab/dd104g3/clock/clockStatus.php', {
              method: 'POST',
              body: new URLSearchParams(`todo_cont_no=${payload.todoContentId}&todo_cont_sta=1&todo_cont_clock=1`)
            })
              .then(res => res.json())
              .then(json => {
                if (json.status === 'success')commit('doneClock', payload)
              })
              .catch(err => console.log(err))
          } else {
            dispatch('pmStore/DONE_PM_CLOCK', payload, { root: true })
          }
          resolve()
        })
      },
      DELETE_CLOCK ({ commit, dispatch, rootState }, payload) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            fetch('/phpLab/dd104g3/clock/clockStatus.php', {
              method: 'POST',
              body: new URLSearchParams(`todo_cont_no=${payload.todoContentId}&todo_cont_sta=0&todo_cont_clock=0`)
            })
              .then(res => res.json())
              .then(json => {
                if (json.status === 'success')commit('deleteClock', payload)
              })
              .catch(err => console.log(err))
          } else {
            dispatch('pmStore/DELETE_PM_CLOCK', payload, { root: true })
          }
          resolve()
        })
      }
    }
  }
}
