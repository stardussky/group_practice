<template>
  <div class="todoCard">
    <div>
      <div class="pm_color" />
      <p class="todo_title">
        事項A事項A事項A事項A事項A事項A事項A事項A
      </p>
      <div class="todo_date">
        <img
          src="@/assets/icon/calendar.svg"
          alt="calendar"
          width="20"
        >
        <p>2019/12/31</p>
      </div>
    </div>
    <div>
      <div class="todo_delete">
        <img
          src="@/assets/icon/delete.svg"
          alt="delete"
          width="20"
        >
        <img
          src="@/assets/icon/delete_on.svg"
          alt="delete"
          width="20"
        >
      </div>
      <div class="todo_done">
        <img
          src="@/assets/icon/checked_d.svg"
          alt="checked"
          width="20"
        >
        <p>0/6</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'TodoCard'
}
</script>

<style lang='scss'>
@import '@/style/_var';
.todoCard {
  width: 90%;
  height: 85px;
  background-color: $white;
  margin: 10px auto;
  border-radius: 10px;
  padding: 10px;
  cursor: pointer;
  display: flex;
  align-items: center;
  box-shadow: 1px 1px 3px $shadow;
  >div:nth-of-type(2){
    width: 70px;
    height: 65.8px;
    position: relative;
  }
  .pm_color {
    width: 30px;
    height: 5px;
    background-color: $danger;
    border-radius: 20px;
  }
  .todo_title {
    width: 180px;
    @include font(2);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    margin: 5px 0;
  }
  .todo_date, .todo_done {
    img{
      vertical-align: middle;
    }
    p {
      @include font;
      display: inline-block;
      vertical-align: middle;
      margin-left: 5px;
    }
  }
  .todo_delete {
    position: absolute;
    top: 0;
    right: 0;
    width: 30px;
    height: 30px;
    cursor: pointer;
    img{
      @include positionCenter;
      transition: opacity .3s;
      &:nth-of-type(2) {
        opacity: 0;
      }
    }
    &:hover {
      img{
        &:nth-of-type(1) {
        opacity: 0;
        }
        &:nth-of-type(2) {
          opacity: 1;
        }
      }
    }
  }
  .todo_done {
    position: absolute;
    right: 0;
    bottom: 0;
  }
}

</style>
