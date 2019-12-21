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
        src="@/assets/icon/edit_w.svg"
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
      @click="pushTodoCard"
    >
      新增
    </div>
  </div>
</template>

<script>
import InviteComponent from './base/InviteComponent'
import DateComponent from './base/DateComponent'
import FileContent from './base/FileContent'
import TodoContent from './base/TodoContent'
import card from '@/composition/card'
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
    const { todoTitle, todoContentList, fileContent, pushTodoContent, pushContentList, pushFile, changeStatus, deleteTodoContent, deleteFile } = card()
    const cardTitle = ref('待辦項目')
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
    const resetCard = () => {
      cardTitle.value = '待辦項目'
      todoContentList.value = []
      fileContent.value = []
    }
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
      cardContent,
      resetCard
    }
  },
  methods: {
    ...mapActions('pmStore', ['PUSH_TODO_CARD']),
    pushTodoCard () {
      this.PUSH_TODO_CARD(this.cardContent)
      this.resetCard()
    }
  }
}
</script>

<style lang='scss'>
  .createCard{
    @import './base/_style';
  }
</style>
