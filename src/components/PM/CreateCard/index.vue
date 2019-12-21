<template>
  <div class="createCard">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      <input
        v-model="cardTitle"
        type="text"
      >
      <img
        src="@/assets/icon/edit_on.svg"
        alt="edit"
        width="20"
      >
    </div>
    <div class="card_body">
      <InviteComponent />
      <DateComponent />
      <div class="listContent">
        <div class="title">
          <img
            src="@/assets/icon/copy-content.svg"
            alt="content"
            width="20"
          >
          <p>內容</p>
        </div>
        <div class="content">
          <TodoContent
            v-for="content in todoContentList"
            :key="content.id"
            :content="content"
            :color="color"
            @enterContentList="pushContentList"
            @changeStatus="changeStatus"
            @deleteTodoContent="deleteTodoContent"
          />
          <div class="add_todo">
            <input
              v-model="todoTitle"
              type="text"
              placeholder="加點內容吧~"
              @keydown.enter="pushTodoContent"
            >
            <div>
              <img
                src="@/assets/icon/edit.svg"
                alt="add"
              >
              <img
                src="@/assets/icon/edit_on.svg"
                alt="add"
              >
            </div>
          </div>
        </div>
      </div>
      <FileContent
        :file-content="fileContent"
        :color="color"
        @pushFile="pushFile"
        @deleteFile="deleteFile"
      />
    </div>
    <div
      class="card_footer"
      :style="{backgroundColor:color}"
      @click="PUSH_TODO_CARD(cardContent)"
    >
      新增
    </div>
  </div>
</template>

<script>
import InviteComponent from './module/InviteComponent'
import DateComponent from './module/DateComponent'
import FileContent from './module/FileContent'
import TodoContent from './module/TodoContent'
import { ref, computed } from '@vue/composition-api'
import { mapActions } from 'vuex'
export default {
  name: 'CreateCard',
  components: {
    InviteComponent,
    DateComponent,
    FileContent,
    TodoContent
  },
  props: {
    projectId: {
      type: Number,
      required: true
    },
    todoId: {
      type: Number,
      required: true
    },
    color: {
      type: String,
      required: true
    }
  },
  setup (props) {
    const cardTitle = ref('待辦項目')
    const todoTitle = ref(null)
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
    const cardContent = computed(() => {
      return {
        projectId: props.projectId,
        card: {
          id: props.todoId,
          title: cardTitle.value,
          status: false,
          content: todoContentList.value,
          files: fileContent.value
        }
      }
    })
    const pushContentList = ({ id, list }) => todoContentList.value[id].lists.push(list)
    const pushFile = (file) => fileContent.value.push(file)
    const changeStatus = ({ id, status }) => {
      todoContentList.value[id].lists[status.id].status = status.status
    }
    const deleteTodoContent = (id) => todoContentList.value.splice(id, 1)
    const deleteFile = (id) => fileContent.value.splice(id, 1)
    return {
      cardTitle,
      todoTitle,
      todoContentList,
      fileContent,
      pushTodoContent,
      pushContentList,
      pushFile,
      deleteTodoContent,
      deleteFile,
      changeStatus,
      cardContent
    }
  },
  methods: {
    ...mapActions('pmStore', ['PUSH_TODO_CARD'])
  }
}
</script>

<style lang='scss'>
  @import './_style';
</style>
