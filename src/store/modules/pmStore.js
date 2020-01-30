export default () => {
  return {
    namespaced: true,
    state: {
      projects: [],
      maturityCard: null,
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
      createProject (state, { data, id, userInfo }) {
        if (id) data.id = id
        if (userInfo) data.memberList = [userInfo]
        state.projects.push(data)
      },
      getProjectsList (state, data) {
        state.projects = data
      },
      getMaturityCard (state, data) {
        state.maturityCard = data
      },
      getProject (state, { getters, id, cards }) {
        state.isEdit = false
        state.id = id
        if (cards) {
          state.projects[getters.projectIndex].list.forEach((info, index) => {
            if (cards.length) info.todo = cards[index]
          })
        }
      },
      clearProjectId (state) {
        state.id = null
      },
      clearProjects (state) {
        state.id = null
        state.maturityCard = null
        state.projects = []
      },
      pushTodoCard (state, { getters, card, id }) {
        if (id)card.id = id
        state.projects[getters.projectIndex].list[0].todo.push(card)
      },
      editTodoCard (state, payload) {
        state.isEdit = true
        state.editInfo = payload
      },
      editDone (state, { getters, card }) {
        state.projects[getters.projectIndex].list[state.editInfo.step].todo.splice(state.editInfo.index, 1, card)
        state.isEdit = false
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
            if (rootState.isLoading) return
            commit('changeLoadingStatue', 'start', { root: true })
            fetch('./php/pm/createProject.php', {
              method: 'POST',
              body: new URLSearchParams(`mem_no=${rootState['memberStore'].userInfo.mem_no}&pro_col=${data.info.color}&pro_title=${data.info.title}`)
            })
              .then(res => res.json())
              .then(json => {
                commit('createProject', { data, id: json.data, userInfo: rootState.memberStore.userInfo })
                commit('changeLoadingStatue', 'success', { root: true })
              })
              .catch(err => commit('changeLoadingStatue', err, { root: true }))
          } else commit('createProject', { data })
          resolve()
        })
      },
      GET_PROJECTS_LIST ({ commit, rootState }, id) {
        return new Promise(resolve => {
          commit('changeLoadingStatue', 'start', { root: true })
          fetch('./php/pm/getProjectList.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${id}`)
          })
            .then(res => res.json())
            .then(json => {
              if (json.status === 'success') commit('getProjectsList', json.data)
              else commit('getProjectsList', [])
              commit('changeLoadingStatue', 'success', { root: true })
            })
            .catch(err => commit('changeLoadingStatue', err, { root: true }))
          resolve()
        })
      },
      GET_MATURITY_CARD ({ commit }, id) {
        return new Promise(resolve => {
          commit('changeLoadingStatue', 'start', { root: true })
          fetch('./php/calender/getMaturityCard.php', {
            method: 'POST',
            body: new URLSearchParams(`mem_no=${id}`)
          })
            .then(res => res.json())
            .then(json => {
              if (json.status === 'success') commit('getMaturityCard', json.data)
              else commit('getMaturityCard', null)
              commit('changeLoadingStatue', 'success', { root: true })
            })
            .catch(err => commit('changeLoadingStatue', err, { root: true }))
          resolve()
        })
      },
      GET_PROJECT ({ commit, rootState, getters }, id) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            if (rootState.isLoading) return
            commit('changeLoadingStatue', 'start', { root: true })
            fetch('./php/pm/getProject.php', {
              method: 'POST',
              body: new URLSearchParams(`pro_no=${id}`)
            })
              .then(res => res.json())
              .then(({ status, cards }) => {
                if (status === 'success') commit('getProject', { getters, id, cards })
                commit('changeLoadingStatue', 'success', { root: true })
                resolve()
              })
              .catch(err => commit('changeLoadingStatue', err, { root: true }))
          } else {
            commit('getProject', { id })
            resolve()
          }
        })
      },
      PUSH_TODO_CARD ({ commit, getters, rootState, state }, card) {
        return new Promise(resolve => {
          if (rootState.isLogin) {
            if (rootState.isLoading) return
            commit('changeLoadingStatue', 'start', { root: true })
            fetch('./php/pm/pushTodoCard.php', {
              method: 'POST',
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({ projectId: state.id, card })
            })
              .then(res => res.json())
              .then(json => {
                commit('changeLoadingStatue', 'success', { root: true })
                commit('pushTodoCard', { getters, card, id: json.data })
              })
              .catch(err => commit('changeLoadingStatue', err, { root: true }))
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
            if (rootState.isLoading) return
            commit('changeLoadingStatue', 'start', { root: true })
            fetch('./php/pm/editDone.php', {
              method: 'POST',
              headers: {
                'Accept': 'application/json',
                'Content-Type': 'application/json'
              },
              body: JSON.stringify({ projectId: state.id, step: state.editInfo.step, card })
            })
              .then(res => res.json())
              .then(json => {
                commit('changeLoadingStatue', 'success', { root: true })
                commit('editDone', { getters, card })
                resolve()
              })
              .catch(err => commit('changeLoadingStatue', err, { root: true }))
          } else {
            resolve()
            commit('editDone', { getters, card })
          }
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
            if (rootState.isLoading) return
            fetch('./php/pm/dragList.php', {
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
