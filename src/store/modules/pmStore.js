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
        state.index = id
      },
      pushTodoCard (state, { projectId, card }) {
        state.projects[projectId].list[0].todo.push(card)
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
      },
      PUSH_TODO_CARD ({ commit }, payload) {
        return new Promise(resolve => {
          commit('pushTodoCard', payload)
          resolve()
        })
      }
    }
  }
}
