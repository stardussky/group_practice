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
      },
      pushTodoCard (state, { id, todo }) {
        // state.projects[id - 1].list[0].todo.push(todo)
        console.log(todo)
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
      PUSH_TODO_CARD ({ commit }, { id, card }) {
        return new Promise(resolve => {
          console.log(card)
          // commit('pushTodoCard', { id, card })
          resolve()
        })
      }
    }
  }
}
