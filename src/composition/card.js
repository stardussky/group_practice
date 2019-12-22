import { ref } from '@vue/composition-api'
export default () => {
  const todoTitle = ref(null)
  const deadLine = ref('未設定')
  const dateStatus = ref(false)
  const todoContentList = ref([])
  const fileContent = ref([])
  const pushTodoContent = () => {
    if (todoTitle) {
      todoContentList.value.push({
        id: todoContentList.value.length,
        title: todoTitle.value,
        lists: []
      })
      todoTitle.value = null
    }
  }
  const pushContentList = ({ id, list }) => todoContentList.value[id].lists.push(list)
  const pushFile = (file) => fileContent.value.push(file)
  const changeStatus = ({ id, status }) => {
    todoContentList.value[id].lists[status.id].status = status.status
  }
  const deleteTodoContent = (id) => todoContentList.value.splice(id, 1)
  const deleteFile = (id) => fileContent.value.splice(id, 1)
  return {
    todoTitle,
    deadLine,
    dateStatus,
    todoContentList,
    fileContent,
    pushTodoContent,
    pushContentList,
    pushFile,
    changeStatus,
    deleteTodoContent,
    deleteFile
  }
}
