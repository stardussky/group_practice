export default () => {
  return {
    namespaced: true,
    state: {
      projects: [],
      index: null
    },
    getters: {
      project (state) {
        return state.projects[state.index]
      }
    },
    mutations: {
      createProject (state, data) {
        state.projects.push(data)
      },
      getProject (state, id) {
        state.index = id - 1
      }
    },
    actions: {
      CREATE_PROJECT ({ commit }, data) {
        return new Promise(resolve => {
          commit('createProject', data)
          resolve()
        })
      },
      GET_PROJECT ({ commit }, id) {
        return new Promise(resolve => {
          commit('getProject', id)
          resolve()
        })
      }
    }
  }
}
