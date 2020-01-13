export default () => {
  return {
    namespaced: true,
    state: {
      projects: [],
      maturityCard: [],
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
      createProject (state, { data, id }) {
        if (id)data.id = id
        state.projects.push(data)
      },
      getProjectsList (state, data) {
        state.projects = data
      },
      getMaturityCard (state, data) {
        state.maturityCard = data
      },
      getProject (state, { getters, id, json }) {
        state.isEdit = false
        state.id = id
        if (json) {
          state.projects[getters.projectIndex].list.forEach((info, index) => {
            info.todo = json[index]
          })
        }
      },
      clearProjectId (state) {
        state.id = null
      },
      pushTodoCard (state, { getters, card, id }) {
        if (id)card.id = id
        state.projects[getters.projectIndex].list[0].todo.push(card)
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
      moveList (state, { projectIndex, step, val }) {
        state.projects[projectIndex].list[step].todo = val
      }
    },
    actions: {
      CREATE_PROJECT ({ commit, rootState }, data) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            commit('changeLoadingStatue', true, { root: true })
            fetch('/phpLab/dd104g3/pm/createProject.php', {
              method: 'POST',
              body: new URLSearchParams(`mem_no=${rootState['memberStore'].userInfo.mem_no}&pro_col=${data.info.color}&pro_title=${data.info.title}`)
            })
              .then(res => res.json())
              .then(json => {
                commit('createProject', { data, id: json.data })
                commit('changeLoadingStatue', false, { root: true })
              })
              .catch(err => console.log(err))
          } else commit('createProject', { data })
          resolve()
        })
      },
      GET_PROJECTS_LIST ({ commit }, id) {
        return new Promise(resolve => {
          commit('changeLoadingStatue', true, { root: true })
          fetch('/phpLab/dd104g3/pm/getProjectList.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${id}`)
          })
            .then(res => res.json())
            .then(json => {
              if (json.status === 'success') commit('getProjectsList', json.data)
              else commit('getProjectsList', [])
              commit('changeLoadingStatue', false, { root: true })
            })
            .catch(err => console.log(err))
          resolve()
        })
      },
      GET_MATURITY_CARD ({ commit }, id) {
        return new Promise(resolve => {
          commit('changeLoadingStatue', true, { root: true })
          fetch('/phpLab/dd104g3/calender/getMaturityCard.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${id}`)
          })
            .then(res => res.json())
            .then(json => {
              commit('getMaturityCard', json.data)
              commit('changeLoadingStatue', false, { root: true })
            })
            .catch(err => console.log(err))
          resolve()
        })
      },
      GET_PROJECT ({ commit, rootState, getters }, id) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            commit('changeLoadingStatue', true, { root: true })
            fetch('/phpLab/dd104g3/pm/getProject.php', {
              method: 'POST',
              body: new URLSearchParams(`pro_no=${id}`)
            })
              .then(res => res.json())
              .then(json => {
                if (json.status === 'success') commit('getProject', { getters, id, json: json.data })
                else commit('getProject', { id })
                commit('changeLoadingStatue', false, { root: true })
                resolve()
              })
              .catch(err => console.log(err))
          } else {
            commit('getProject', { id })
            resolve()
          }
        })
      },
      PUSH_TODO_CARD ({ commit, getters, rootState, state }, card) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            commit('changeLoadingStatue', true, { root: true })
            fetch('/phpLab/dd104g3/pm/pushTodoCard.php', {
              method: 'POST',
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({ projectId: state.id, card })
            })
              .then(res => res.json())
              .then(json => {
                commit('changeLoadingStatue', false, { root: true })
                commit('pushTodoCard', { getters, card, id: json.data })
              })
              .catch(err => err)
          } else commit('pushTodoCard', { getters, card })
          resolve()
        })
      },
      EDIT_TODO_CARD ({ commit }, payload) {
        return new Promise(resolve => {
          commit('editTodoCard', payload)
          resolve()
        })
      },
      EDIT_DONE ({ commit, getters, rootState, state }, card) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            commit('changeLoadingStatue', true, { root: true })
            fetch('/phpLab/dd104g3/pm/editDone.php', {
              method: 'POST',
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({ projectId: state.id, step: state.editInfo.step, card })
            })
              .then(res => res.json())
              .then(json => commit('changeLoadingStatue', false, { root: true }))
              .catch(err => console.log(err))
          }
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
      DONE_PM_CLOCK ({ commit }, payload) {
        return new Promise(resolve => {
          commit('donePmClock', payload)
          resolve()
        })
      },
      DELETE_PM_CLOCK ({ commit }, payload) {
        return new Promise(resolve => {
          commit('deletePmClock', payload)
          resolve()
        })
      },
      DRAG_LIST ({ rootState, state }, { step, added }) {
        return new Promise(resolve => {
          if (rootState.isLogin && added) {
            fetch('/phpLab/dd104g3/pm/dragList.php', {
              method: 'POST',
              body: new URLSearchParams(`pro_no=${state.id}&step=${step}&card_no=${added.element.id}`)
            })
              .then(res => res.text())
              .then(json => json)
              .catch(err => console.log(err))
          }
          resolve()
        })
      }
    }
  }
}
