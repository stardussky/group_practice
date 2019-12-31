export default () => {
  return {
    namespaced: true,
    state: {
      pmList: []
    },
    mutations: {
      addTodoList (state, { $event: content, projectId: id }) {
        if (id) {
          state.pmList.push({
            projectId: id,
            content
          })
        }
      }
    },
    actions: {
      ADD_TODO_LIST ({ commit }, payload) {
        return new Promise(resolve => {
          commit('addTodoList', payload)
          resolve()
        })
      }
    }
  }
}
