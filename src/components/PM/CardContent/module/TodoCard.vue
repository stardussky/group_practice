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
        >
        <img
          src="@/assets/icon/delete_on.svg"
          alt="delete"
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
  position: relative;
  >div {
    z-index: 1;
    &:nth-of-type(2) {
      position: relative;
      width: 70px;
      height: 65.8px;
    }
  }
  .pm_color {
    position: absolute;
    top: 10px;
    left: 10px;
    width: 30px;
    height: 5px;
    background-color: $danger;
    border-radius: 20px;
    transition: all .3s;
  }
  .todo_title {
    width: 180px;
    @include font(2);
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    margin: 10px 0 5px;
  }
  .todo_date, .todo_done {
    display: flex;
    align-items: center;
    p {
      @include font;
      margin-left: 5px;
    }
  }
  .todo_delete {
    position: absolute;
    top: 0;
    right: 0;
    @include hoverImg(20px);
  }
  .todo_done {
    position: absolute;
    right: 0;
    bottom: 0;
  }
  &:hover {
    .pm_color {
      width: 100%;
      height: 100%;
      top: 0;
      left: 0;
      border-radius: 10px;
      opacity: .7;
      z-index: -1;
    }
  }
}

</style>
