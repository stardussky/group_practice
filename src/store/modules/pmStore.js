export default () => {
  return {
    namespaced: true,
    state: {
      projects: [],
      index: null,
      isEdit: false,
      editInfo: null
    },
    getters: {
      project (state) {
        return state.projects[state.index]
      },
      editCardTarget (state, getters) {
        return {
          editInfo: state.editInfo,
          card: getters.project.list[state.editInfo.step].todo[state.editInfo.cardId]
        }
      }
    },
    mutations: {
      createProject (state, data) {
        state.projects.push(data)
      },
      getProject (state, id) {
        state.isEdit = false
        state.index = id
      },
      pushTodoCard (state, { projectId, card }) {
        // state.projects[projectId].list[0].todo.push(JSON.parse(JSON.stringify(card)))
        state.projects[projectId].list[0].todo.push(card)
      },
      editTodoCard (state, payload) {
        state.isEdit = true
        state.editInfo = payload
      },
      editDone (state, { projectId, step, card }) {
        state.isEdit = false
        state.projects[projectId].list[step].todo[card.id] = card
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
      },
      EDIT_TODO_CARD ({ commit }, payload) {
        return new Promise(resolve => {
          commit('editTodoCard', payload)
          resolve()
        })
      },
      EDIT_DONE ({ commit }, payload) {
        return new Promise(resolve => {
          commit('editDone', payload)
          resolve()
        })
      }
    }
  }
}
