<template>
  <div class="createCard">
    <div class="card_head">
      <div class="edit_card">
        <img
          src="@/assets/icon/edit.svg"
          alt="edit"
          width="30"
        >
        <img
          src="@/assets/icon/edit_on.svg"
          alt="edit"
          width="30"
        >
      </div>
      <p>事情A</p>
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
            <img
              src="@/assets/icon/plus.svg"
              alt="add"
              width="20"
            >
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import InviteComponent from './InviteComponent'
import DateComponent from './DateComponent'
import TodoContent from './TodoContent'
export default {
  name: 'CreateCard',
  components: {
    InviteComponent,
    DateComponent,
    TodoContent
  }
}
</script>

<style lang='scss'>
@import '@/style/_card';
.createCard {
  width: 400px;
  height: 90%;
  border-radius: 20px;
  background-color: $white;
  overflow-x: hidden;
  margin: 0 10px;
  .card_head {
    @include cardHead;
    position: relative;
  }
  .edit_card{
    @include positionCenter(x);
    @include hoverImg;
    left: 30px;
    width: 30px;
    height: 30px;
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
    >img {
      position: absolute;
      top: 0;
      right: 0;
      cursor: pointer;
    }
  }
}
</style>
