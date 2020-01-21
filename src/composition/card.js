import { ref, watch } from '@vue/composition-api'
export default (props) => {
  const cardTitle = ref(null)
  const todoTitle = ref(null)
  const deadLine = ref('未設定')
  const dateStatus = ref(false)
  const todoContentList = ref([])
  const fileContent = ref([])
  const editCardId = ref(null)
  const cardMember = ref([])
  const memberSet = ref(new Set())

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
  const toggleCardMember = (obj) => {
    if (!memberSet.value.has(obj.mem_no)) {
      memberSet.value.add(obj.mem_no)
      cardMember.value.push(obj)
    } else {
      let index = [...memberSet.value].indexOf(obj.mem_no)
      memberSet.value.delete(obj.mem_no)
      cardMember.value.splice(index, 1)
    }
  }
  const resetCard = () => {
    editCardId.value = null
    dateStatus.value = false
    deadLine.value = '未設定'
    cardTitle.value = '待辦項目'
    todoContentList.value = []
    fileContent.value = []
    cardMember.value = []
    memberSet.value.clear()
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
      cardMember.value = edit.cardMember
      edit.cardMember.forEach(info => memberSet.value.add(info.mem_no))
    } else {
      resetCard()
    }
  })
  return {
    cardTitle,
    editCardId,
    todoTitle,
    deadLine,
    dateStatus,
    todoContentList,
    fileContent,
    pushContentList,
    pushFile,
    changeStatus,
    deleteTodoContent,
    deleteTodoList,
    deleteFile,
    setTodoClock,
    resetCard,
    cardMember,
    toggleCardMember,
    memberSet
  }
}
