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
            @enterContentList="pushContentList"
            @changeStatus="changeStatus"
            @deleteTodoContent="deleteTodoContent"
          />
          <div class="add_todo">
            <input
              v-model="todoTitle"
              type="text"
              placeholder="加點內容吧~"
              @keydown.enter="enterTodoContent"
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
      <FileContent />
    </div>
    <div
      class="card_footer"
      :style="{backgroundColor:color}"
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
import { ref } from '@vue/composition-api'
import { mapActions } from 'vuex'
export default {
  name: 'CreateCard',
  components: {
    InviteComponent,
    DateComponent,
    FileContent,
    TodoContent
  },
  inject: ['color'],
  props: {
    id: {
      type: Number,
      required: true
    }
  },
  setup () {
    const cardTitle = ref('待辦項目')
    const todoTitle = ref(null)
    const todoContentList = ref([])
    const enterTodoContent = () => {
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
    const changeStatus = ({ id, status }) => {
      todoContentList.value[id].lists[status.id].status = status.status
    }
    const deleteTodoContent = (id) => todoContentList.value.splice(id, 1)

    return {
      cardTitle,
      todoTitle,
      todoContentList,
      enterTodoContent,
      pushContentList,
      deleteTodoContent,
      changeStatus
    }
  },
  methods: {
    ...mapActions('pmStore', ['PUSH_TODO_CARD'])
  }
}
</script>

<style lang='scss'>
.createCard {
  min-width: 400px;
  height: 100%;
  border-radius: 20px;
  background-color: $white;
  overflow-x: hidden;
  margin-right: 10px;
  position: relative;
  padding-bottom: 50px;
  .card_head {
    @include cardHead;
    position: relative;
    >input {
      font-family: 'Montserrat', 'Noto Sans TC', sans-serif;
      color: $white;
      background-color: inherit;
      border: none;
      outline: none;
      text-align: center;
      @include font(2);
    }
  }
  .card_body {
    height: calc(100% - 50px);
    padding: 10px 20px;
    overflow-y: auto;
  }
  .listContent {
    >.content {
      padding-left: 25px;
    }
    >.title {
      display: flex;
      align-items: center;
      margin: 5px 0;
      p{
        @include font(1);
        margin-left: 5px;
      }
    }
  }
  .add_todo {
    position: relative;
    margin-top: 10px;
    >input {
      width: 100%;
      @include btnReset;
      @include font(1);
      color: $dark;
      height: 30px;
      border-bottom: 1px solid $dark;
      padding: 0 30px 0 5px;
      &::-webkit-input-placeholder{
        @include font;
        color: $dark;
        text-align: center;
      }
    }
    >div {
      @include positionCenter(y);
      @include hoverImg(20px);
      right: 0;
    }
  }
  .card_footer {
    @include cardFooter
  }
}
</style>
