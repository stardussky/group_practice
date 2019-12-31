<template>
  <div class="calendar_month">
    {{ month }}
  </div>
</template>

<script>
export default {
  name: 'CalendarMonth',
  props: {
    month: {
      type: Number,
      required: true
    }
  }
}
</script>

<style lang='scss'>
.calendar_month {
  width: 100%;
  @include font(10);
  color: $dark;
  text-align: center;
  padding: 10px 0;
}
</style>
