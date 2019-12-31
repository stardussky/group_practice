<template>
  <div class="todoCard">
    <div
      class="card_color"
      :style="{backgroundColor: color}"
      :class="{active: isEditTarget}"
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
import { mapGetters } from 'vuex'
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
  },
  computed: {
    ...mapGetters('pmStore', ['editCardTarget']),
    isEditTarget () {
      return this.editCardTarget ? this.editCardTarget.id === this.todo.id : false
    }
  }
}
</script>

<style lang='scss'>
.todoCard {
  @include todoCard;
  position: relative;
  z-index: 1;
  >div {
    width: 100%;
  }
  .todo_title {
    @include font(2);
    margin: 10px 0 5px;
    >p{
      word-wrap: break-word;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-box-orient: vertical;
      -webkit-line-clamp: 10;
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
  .todo_done {
    min-width: 56px;
  }
}
</style>
