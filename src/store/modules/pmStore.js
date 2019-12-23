export default () => {
  return {
    namespaced: true,
    state: {
      projects: [],
      id: null,
      isEdit: false,
      editInfo: null
    },
    getters: {
      projectIndex (state) {
        if (state.id) {
          return state.projects.findIndex(project => project.id === state.id)
        }
      },
      project (state, getters) {
        return state.projects[getters.projectIndex]
      },
      editCardTarget (state, getters) {
        if (state.isEdit) {
          return {
            editInfo: state.editInfo,
            card: getters.project.list[state.editInfo.step].todo[state.editInfo.index]
          }
        }
      }
    },
    mutations: {
      createProject (state, data) {
        state.projects.push(data)
      },
      getProject (state, id) {
        state.isEdit = false
        state.id = id
      },
      pushTodoCard (state, { getters, card }) {
        state.projects[getters.projectIndex].list[0].todo.push(card)
        // state.projects.find(project => project.id === projectId).list[0].todo.push(JSON.parse(JSON.stringify(card)))
      },
      editTodoCard (state, payload) {
        state.isEdit = true
        state.editInfo = payload
      },
      editDone (state, { getters, payload }) {
        state.isEdit = false
        state.projects[getters.projectIndex].list[payload.step].todo.splice(state.editInfo.index, 1, payload.card)
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
      PUSH_TODO_CARD ({ commit, getters }, card) {
        return new Promise(resolve => {
          commit('pushTodoCard', { getters, card })
          resolve()
        })
      },
      EDIT_TODO_CARD ({ commit }, payload) {
        return new Promise(resolve => {
          commit('editTodoCard', payload)
          resolve()
        })
      },
      EDIT_DONE ({ commit, getters }, payload) {
        return new Promise(resolve => {
          commit('editDone', { getters, payload })
          resolve()
        })
      }
    }
  }
}
