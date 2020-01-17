export default () => {
  return {
    namespaced: true,
    state: {
      userInfo: null
    },
    mutations: {
      setUserInfo (state, json) {
        state.userInfo = json
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
