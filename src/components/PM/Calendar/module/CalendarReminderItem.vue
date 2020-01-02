<template>
  <li class="calendar_reminder_item">
    <div class="card_color" />
  </li>
</template>

<script>
export default {
  name: 'CalendarReminderItem'
}
</script>

<style lang='scss'>
.calendar_reminder_item{
  @include todoCard;
  .card_color {
    background-color: $primary;
  }
}
</style>
