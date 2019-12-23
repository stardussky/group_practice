import { ref } from '@vue/composition-api'
export default () => {
  const todoTitle = ref(null)
  const deadLine = ref('未設定')
  const dateStatus = ref(false)
  const todoContentList = ref([])
  const fileContent = ref([])
  const pushTodoContent = () => {
    if (todoTitle.value) {
      todoContentList.value.push({
        id: Math.random() + '',
        title: todoTitle.value,
        lists: []
      })
      todoTitle.value = null
    }
  }
  const pushContentList = ({ id, list }) => {
    todoContentList.value.find(list => {
      return list.id === id
    }).lists.push(list)
  }
  const pushFile = (file) => fileContent.value.push(file)
  const changeStatus = (listIndex, index) => {
    let status = todoContentList.value[index].lists[listIndex].status
    todoContentList.value[index].lists[listIndex].status = !status
  }
  const deleteTodoContent = (index) => todoContentList.value.splice(index, 1)
  const deleteFile = (index) => fileContent.value.splice(index, 1)
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
