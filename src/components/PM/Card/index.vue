<template>
  <div class="card">
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
      <DateComponent
        v-model="deadLine"
        :dead-line="deadLine"
        :date-status.sync="dateStatus"
      />
      <div class="listContent">
        <TodoContent
          v-for="(content, index) in todoContentList"
          :key="content.id"
          :content="content"
          :color="color"
          @enterContentList="pushContentList"
          @changeStatus="changeStatus($event, index)"
          @deleteTodoContent="deleteTodoContent(index)"
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
      @click="isEdit?EDIT_DONE(cardContent):pushTodoCard()"
    >
      {{ isEdit?'編輯完成':'新增' }}
    </div>
  </div>
</template>

<script>
import InviteComponent from './module/InviteComponent'
import DateComponent from './module/DateComponent'
import FileContent from './module/FileContent'
import TodoContent from './module/TodoContent'
import card from '@/composition/card'
import { mapActions } from 'vuex'
export default {
  name: 'Card',
  components: {
    InviteComponent,
    DateComponent,
    FileContent,
    TodoContent
  },
  props: {
    projectId: {
      type: String,
      required: true
    },
    color: {
      type: String,
      required: true
    },
    isEdit: {
      type: Boolean,
      required: true
    },
    editCard: {
      type: Object,
      required: true
    }
  },
  setup (props) {
    const { cardTitle, cardContent, resetCard, dateStatus, deadLine, todoTitle, todoContentList, fileContent, pushTodoContent, pushContentList, pushFile, changeStatus, deleteTodoContent, deleteFile } = card(props)
    return {
      cardTitle,
      deadLine,
      dateStatus,
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
    ...mapActions('pmStore', ['PUSH_TODO_CARD', 'EDIT_DONE']),
    pushTodoCard () {
      this.PUSH_TODO_CARD(this.cardContent)
      this.resetCard()
    }
  }
}
</script>

<style lang='scss'>
  .card{
    @import './_style';
  }
</style>
