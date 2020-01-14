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
          commit('changeLoadingStatue', true, { root: true })
          let result = fetch(url, {
            method: 'POST',
            body: new URLSearchParams(data)
          }).then(res => res.json()).then(json => {
            if (json.content === '登入成功') {
              commit('changeLoginStatus', true, { root: true })
              commit('setUserInfo', json.data)
              commit('pmStore/clearProjects', null, { root: true })
            }
            commit('changeLoadingStatue', false, { root: true })
            return json
          }).catch(err => err)
          resolve(result)
        })
      },
      CHECK_LOGIN ({ commit }) {
        return new Promise(resolve => {
          fetch('/phpLab/dd104g3/member/isLogin.php')
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
          fetch('/phpLab/dd104g3/member/logout.php')
            .then(res => res.json())
            .then(json => {
              commit('changeLoginStatus', false, { root: true })
              commit('pmStore/clearProjects', null, { root: true })
            }).catch(err => err)
          resolve()
        })
      }
    }
  }
}
