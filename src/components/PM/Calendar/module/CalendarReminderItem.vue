<template>
  <li
    class="calendar_reminder_item"
    @click="checkTodoCard"
  >
    <div
      class="card_color"
      :style="{backgroundColor: cards.pro_col}"
    />
    <div class="todo_title">
      <p>{{ cards.card_name }}</p>
    </div>
    <div class="todo_info">
      <div class="todo_date">
        <img
          src="@/assets/icon/calendar.svg"
          alt="calendar"
          width="20"
        >
        <p>{{ cards.card_date }}</p>
      </div>
    </div>
  </li>
</template>

<script>
import {} from '@vue/composition-api'
export default {
  name: 'CalendarReminderItem',
  props: {
    cards: {
      type: Object,
      required: true
    }
  },
  setup (props, { root }) {
    const checkTodoCard = () => {
      root.$router.push({ name: 'Project', params: { id: props.cards.pro_no } })
    }
    return {
      checkTodoCard
    }
  }
}
</script>

<style lang='scss'>
.calendar_reminder_item{
  @include todoCard;
}
</style>
