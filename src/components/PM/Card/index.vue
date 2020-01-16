<template>
  <div class="card">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      <input
        v-model.trim="cardTitle"
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
          v-show="content.id"
          :key="content.id"
          :content="content"
          :color="color"
          @enterContentList="pushContentList"
          @changeStatus="changeStatus($event, index)"
          @deleteTodoContent="deleteTodoContent(index)"
          @deleteTodoList="deleteTodoList($event, index)"
          @setTodoClock="setTodoClock($event, index)"
        />
        <div class="add_todo">
          <input
            v-model.trim="todoTitle"
            type="text"
            placeholder="加點內容吧~"
            @keydown.enter="pushTodoContent"
          >
          <div @click="pushTodoContent">
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
import { mapGetters, mapActions } from 'vuex'
import bus from '@/bus'
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
    const { cardTitle, editCardId, setTodoClock, resetCard, dateStatus, deadLine, todoTitle, todoContentList, fileContent, pushContentList, pushFile, changeStatus, deleteTodoContent, deleteTodoList, deleteFile } = card(props)
    return {
      cardTitle,
      deadLine,
      editCardId,
      dateStatus,
      todoTitle,
      todoContentList,
      fileContent,
      pushContentList,
      pushFile,
      deleteTodoContent,
      deleteTodoList,
      deleteFile,
      changeStatus,
      setTodoClock,
      resetCard
    }
  },
  computed: {
    ...mapGetters('pmStore', ['project']),
    cardContent () {
      return {
        id: this.editCardId || Date.now() + '',
        title: this.cardTitle || '待辦項目',
        status: this.dateStatus,
        deadLine: this.deadLine,
        content: this.todoContentList,
        files: this.fileContent
      }
    }
  },
  created () {
    bus.$on('editDone', async (res) => {
      await this.EDIT_DONE(this.cardContent)
      res()
    })
    bus.$on('tourMode', (status) => {
      if (status) {
        this.todoContentList.push({
          id: Date.now() + '',
          title: '範例',
          lists: [
            {
              id: Date.now() + '',
              status: false,
              isClock: false,
              content: '範例',
              timer: 0
            }
          ]
        })
      } else {
        this.todoContentList = []
      }
    })
  },
  beforeDestroy () {
    bus.$off('editDone')
    bus.$off('tourMode')
  },
  methods: {
    ...mapActions('pmStore', ['PUSH_TODO_CARD', 'EDIT_DONE']),
    pushTodoContent () {
      if (this.todoTitle) {
        this.todoContentList.push({
          id: Date.now() + '',
          title: this.todoTitle,
          lists: []
        })
        this.todoTitle = null
      }
    },
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
