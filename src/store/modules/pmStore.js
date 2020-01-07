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
          return getters.project.list[state.editInfo.step].todo[state.editInfo.index]
        }
      },
      clockList (state) {
        return state.projects.reduce((prev, project, projectIndex) => {
          project.list.map((projectList, step) => {
            return projectList.todo.map((todo, todoIndex) => {
              return todo.content.map((content, contentIndex) => {
                return content.lists.map((info, listIndex) => {
                  if (info.isClock) {
                    prev.push({
                      projectIndex,
                      step,
                      todoIndex,
                      contentIndex,
                      listIndex,
                      color: project.info.color,
                      info
                    })
                  }
                })
              })
            })
          })
          return prev
        }, [])
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
      changeEditStatus (state, status) {
        state.isEdit = status
      },
      editTodoCard (state, payload) {
        state.isEdit = true
        state.editInfo = payload
      },
      editDone (state, { getters, card }) {
        state.projects[getters.projectIndex].list[state.editInfo.step].todo.splice(state.editInfo.index, 1, card)
      },
      recordClockTime (state, { info: { projectIndex, step, todoIndex, contentIndex, listIndex }, timer }) {
        state.projects[projectIndex].list[step].todo[todoIndex].content[contentIndex].lists[listIndex].timer += timer
      },
      donePmClock (state, { projectIndex, step, todoIndex, contentIndex, listIndex }) {
        state.projects[projectIndex].list[step].todo[todoIndex].content[contentIndex].lists[listIndex].status = true
      },
      deletePmClock (state, { projectIndex, step, todoIndex, contentIndex, listIndex }) {
        state.projects[projectIndex].list[step].todo[todoIndex].content[contentIndex].lists[listIndex].isClock = false
      },
      dragList (state, { getters, payload: { $event: list, index } }) {
        state.projects[getters.projectIndex].list[index].todo = list
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
      EDIT_DONE ({ commit, getters }, card) {
        return new Promise(resolve => {
          commit('editDone', { getters, card })
          resolve()
        })
      },
      RECORD_CLOCK_TIME ({ commit }, payload) {
        return new Promise(resolve => {
          commit('recordClockTime', payload)
          resolve()
        })
      },
      DONE_PM_CLOCK ({ commit, getters }, payload) {
        return new Promise(resolve => {
          commit('donePmClock', { getters, payload })
          resolve()
        })
      },
      DELETE_PM_CLOCK ({ commit }, payload) {
        return new Promise(resolve => {
          commit('deletePmClock', payload)
          resolve()
        })
      },
      DRAG_LIST ({ commit, getters }, payload) {
        return new Promise(resolve => {
          commit('dragList', { getters, payload })
          resolve()
        })
      }
    }
  }
}
