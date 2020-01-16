<template>
  <div
    class="todoCard"
    :class="{active: isEditTarget, draggable: !isEditTarget}"
  >
    <div
      class="card_color"
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
        <p>{{ todo.deadLine || '未設定' }}</p>
      </div>
      <div class="todo_done">
        <img
          v-if="!todo.status"
          src="@/assets/icon/checked_d.svg"
          alt="undone"
          width="20"
        >
        <img
          v-else
          src="@/assets/icon/checked_s.svg"
          alt="done"
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
  >div {
    width: 100%;
  }
  .todo_done {
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
