<template>
  <div class="editCard">
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
      @click="EDIT_DONE(cardContent)"
    >
      編輯完成
    </div>
  </div>
</template>

<script>
import InviteComponent from './base/InviteComponent'
import DateComponent from './base/DateComponent'
import FileContent from './base/FileContent'
import TodoContent from './base/TodoContent'
import card from '@/composition/card'
import { ref, computed, watch } from '@vue/composition-api'
import { mapActions } from 'vuex'
export default {
  name: 'EditCard',
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
    editCard: {
      type: Object,
      required: true
    }
  },
  setup (props) {
    const { dateStatus, deadLine, todoTitle, todoContentList, fileContent, pushTodoContent, pushContentList, pushFile, changeStatus, deleteTodoContent, deleteFile } = card()
    const cardTitle = ref(null)
    const cardContent = computed(() => {
      return {
        step: props.editCard.editInfo.step,
        card: {
          id: props.editCard.card.id,
          title: cardTitle.value,
          status: dateStatus.value,
          deadLine: deadLine.value,
          content: todoContentList.value,
          files: fileContent.value
        }
      }
    })
    watch(() => props.editCard.card, (val) => {
      let edit = JSON.parse(JSON.stringify(val))
      cardTitle.value = edit.title
      todoContentList.value = edit.content
      fileContent.value = edit.files
      dateStatus.value = edit.status
      deadLine.value = edit.deadLine
    })
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
      cardContent
    }
  },
  methods: {
    ...mapActions('pmStore', ['EDIT_DONE'])
  }
}
</script>

<style lang='scss'>
  .editCard{
    @import './base/_style';
  }
</style>
