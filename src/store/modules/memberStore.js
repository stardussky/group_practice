export default () => {
  return {
    namespaced: true,
    state: {
      userInfo: null,
      userMessage: []
    },
    mutations: {
      setUserInfo (state, json) {
        state.userInfo = json
      },
      setMessage (state, json) {
        state.userMessage = json
      },
      replyMessage (state, index) {
        state.userMessage.splice(index, 1)
      }
    },
    actions: {
      SUBMIT ({ commit, rootState }, { url, data }) {
        return new Promise(resolve => {
          if (rootState.isLoading) return
          commit('changeLoadingStatue', 'start', { root: true })
          let result = fetch(url, {
            method: 'POST',
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json'
            },
            body: JSON.stringify(data)
          }).then(res => res.json()).then(json => {
            if (json.content === '登入成功') {
              commit('changeLoginStatus', true, { root: true })
              commit('setUserInfo', json.data)
              commit('pmStore/clearProjects', null, { root: true })
              commit('clockStore/clearSelfList', null, { root: true })
            }
            commit('changeLoadingStatue', 'success', { root: true })
            return json
          }).catch(err => commit('changeLoadingStatue', err, { root: true }))
          resolve(result)
        })
      },
      CHECK_LOGIN ({ commit }) {
        return new Promise(resolve => {
          fetch('./php/member/isLogin.php')
            .then(res => res.json())
            .then(json => {
              if (json.status === 'success') {
                commit('changeLoginStatus', true, { root: true })
                commit('setUserInfo', json.data)
              }
            }).catch(err => err)
          resolve()
        })
      },
      GET_MESSAGE ({ commit, state }) {
        return new Promise(resolve => {
          fetch('./php/member/getMessage.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${state.userInfo.mem_no}`)
          })
            .then(res => res.json())
            .then(json => commit('setMessage', json.data))
            .catch(err => console.log(err))
          resolve()
        })
      },
      REPLY_MESSAGE ({ commit, state }, { index, projectId, status }) {
        return new Promise(resolve => {
          commit('changeLoadingStatue', 'start', { root: true })
          fetch('./php/member/replyMessage.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${state.userInfo.mem_no}&pro_no=${projectId}&reply=${status}`)
          })
            .then(res => res.json())
            .then(json => {
              if (json.status === 'success') {
                commit('replyMessage', index)
                commit('changeLoadingStatue', 'success', { root: true })
              }
            })
            .catch(err => commit('changeLoadingStatue', err, { root: true }))
          resolve()
        })
      },
      LOGOUT ({ commit }) {
        return new Promise(resolve => {
          fetch('./php/member/logout.php')
            .then(res => res.json())
            .then(json => {
              commit('changeLoginStatus', false, { root: true })
              commit('pmStore/clearProjects', null, { root: true })
              commit('clockStore/clearSelfList', null, { root: true })
            }).catch(err => err)
          resolve()
        })
      }
    }
  }
}
