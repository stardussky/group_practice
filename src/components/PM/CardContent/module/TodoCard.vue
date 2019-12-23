<template>
  <div class="todoCard">
    <div
      class="pm_color"
      :style="{backgroundColor: color}"
    />
    <div class="todo_title">
      <p>{{ todo.title }}</p>
    </div>
    <div class="todo_info">
      <div class="todo_date">
        <img
          src="@/assets/icon/calendar.svg"
          alt="calendar"
          width="20"
        >
        <p>{{ todo.deadLine }}</p>
      </div>
      <div class="todo_done">
        <img
          src="@/assets/icon/checked_d.svg"
          alt="checked"
          width="20"
        >
        <p>{{ schedule }}</p>
      </div>
    </div>
  </div>
</template>

<script>
import { computed } from '@vue/composition-api'
export default {
  name: 'TodoCard',
  props: {
    todo: {
      type: Object,
      required: true
    },
    color: {
      type: String,
      required: true
    }
  },
  setup (props) {
    const schedule = computed(() => {
      let done = props.todo.content.map(content => {
        return content.lists.filter(list => {
          return list.status
        })
      }).reduce((prev, arr) => prev + arr.length, 0)
      let all = props.todo.content.reduce((prev, arr) => prev + arr.lists.length, 0)

      return `${done}/${all}`
    })
    return {
      schedule
    }
  }
}
</script>

<style lang='scss'>
.todoCard {
  width: 90%;
  height: 85px;
  background-color: $white;
  margin: 10px auto;
  border-radius: 0 0 10px 10px;
  padding: 10px;
  cursor: pointer;
  box-shadow: 1px 1px 3px $shadow;
  position: relative;
  z-index: 1;
  >div {
    width: 100%;
  }
  .pm_color {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    height: 3px;
    transition: all .3s;
    z-index: -1;
  }
  .todo_title {
    @include font(2);
    margin: 10px 0 5px;
    >p{
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }
  .todo_info {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .todo_date, .todo_done {
    display: flex;
    align-items: center;
    p {
      @include font;
      margin-left: 5px;
    }
  }
  &:hover {
    .pm_color {
      height: 100%;
      border-radius: 0 0 10px 10px;
      opacity: .6;
    }
  }
}
</style>
