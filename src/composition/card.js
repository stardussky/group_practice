import { ref, computed, watch } from '@vue/composition-api'
export default (props) => {
  const cardTitle = ref(null)
  const todoTitle = ref(null)
  const deadLine = ref('未設定')
  const dateStatus = ref(false)
  const todoContentList = ref([])
  const fileContent = ref([])
  const editCardId = ref(null)
  const cardContent = computed(() => {
    return {
      id: editCardId.value || Math.random() + '',
      title: cardTitle.value || '待辦項目',
      status: dateStatus.value,
      deadLine: deadLine.value,
      content: todoContentList.value,
      files: fileContent.value
    }
  })

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
  const changeStatus = ({ status, index }, listIndex) => {
    todoContentList.value[listIndex].lists[index].status = status
  }
  const setTodoClock = ({ status, index }, listIndex) => {
    todoContentList.value[listIndex].lists[index].isClock = status
  }
  const deleteTodoContent = (index) => todoContentList.value.splice(index, 1)
  const deleteTodoList = (listIndex, index) => {
    todoContentList.value[index].lists.splice(listIndex, 1)
  }
  const deleteFile = (index) => fileContent.value.splice(index, 1)
  const resetCard = () => {
    editCardId.value = null
    cardTitle.value = '待辦項目'
    todoContentList.value = []
    fileContent.value = []
  }
  watch(() => props.editCard, val => {
    if (props.isEdit) {
      let edit = JSON.parse(JSON.stringify(val))
      editCardId.value = edit.id
      cardTitle.value = edit.title
      todoContentList.value = edit.content
      fileContent.value = edit.files
      dateStatus.value = edit.status
      deadLine.value = edit.deadLine
    } else {
      resetCard()
    }
  })
  return {
    cardTitle,
    cardContent,
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
    deleteTodoList,
    deleteFile,
    setTodoClock,
    resetCard
  }
}
