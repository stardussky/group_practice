<template>
  <div class="createCard">
    <div
      class="card_head"
      :style="{backgroundColor:color}"
    >
      <input
        type="text"
        value="事情A"
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
          <TodoContent />
          <div class="add_todo">
            <input
              type="text"
              placeholder="加點內容吧~"
            >
            <div>
              <img
                src="@/assets/icon/edit.svg"
                alt="add"
                width="20"
              >
              <img
                src="@/assets/icon/edit_on.svg"
                alt="add"
                width="20"
              >
            </div>
          </div>
        </div>
      </div>
      <FileContent />
    </div>
  </div>
</template>

<script>
import InviteComponent from './module/InviteComponent'
import DateComponent from './module/DateComponent'
import FileContent from './module/FileContent'
import TodoContent from './module/TodoContent'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'CreateCard',
  components: {
    InviteComponent,
    DateComponent,
    FileContent,
    TodoContent
  },
  inject: ['color'],
  setup () {
    const cardTitle = ref('待辦項目')
    const date = ref(new Date())
    const todoCard = computed(() => {
      return {
        status: false,
        cardTitle: cardTitle.value,
        member: [],
        daedline: date.value,
        content: [
          {
            title: '',
            list: [
              {
                status: false,
                todo: ''
              }
            ]
          }
        ],
        files: [
          {
            name: '',
            url: ''
          }
        ]
      }
    })
    return {
      todoCard
    }
  }
}
</script>

<style lang='scss'>
@import '@/style/_card';
.createCard {
  min-width: 400px;
  border-radius: 20px;
  background-color: $white;
  overflow-x: hidden;
  margin-right: 10px;
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
    padding: 10px 20px;
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
      width: 20px;
      height: 20px;
      @include positionCenter(y);
      @include hoverImg;
      right: 0;
    }
  }
}
</style>
