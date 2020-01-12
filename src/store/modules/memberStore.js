import router from '@/router'
export default () => {
  return {
    namespaced: true,
    state: {
      userInfo: null,
      projectId: null,
      cardId: null
    },
    mutations: {
      setUserInfo (state, { user, id: [{ card }, { program }] }) {
        state.userInfo = user
        state.projectId = program
        state.cardId = card
      },
      addId (state, name) {
        if (state[name]) state[name]++
      }
    },
    actions: {
      SUBMIT ({ commit }, { url, data }) {
        return new Promise(resolve => {
          let result = fetch(url, {
            method: 'POST',
            body: new URLSearchParams(data)
          }).then(res => res.json()).then(json => {
            if (json.content === '登入成功') {
              commit('changeLoginStatus', true, { root: true })
              commit('setUserInfo', json.data)
            }
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
              router.go(0)
            }).catch(err => err)
          resolve()
        })
      }
    }
  }
}
