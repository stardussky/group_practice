<template>
  <div class="calendarReminder">
    <div class="reminder_header">
      <button @click="back">
        <img
          src="@/assets/icon/back.svg"
          alt="back"
        >
        <img
          src="@/assets/icon/back.svg"
          alt="back"
        >
      </button>
      <div class="reminder_date">
        <p>{{ getFullMonth }}, {{ viewDate.day }}</p>
        <h2>{{ viewDate.date }}</h2>
      </div>
    </div>
    <ul class="reminder_list">
      <CalendarReminderItem />
    </ul>
  </div>
</template>

<script>
import CalendarReminderItem from './CalendarReminderItem'
import { computed } from '@vue/composition-api'
export default {
  name: 'CalendarReminder',
  components: {
    CalendarReminderItem
  },
  props: {
    viewDate: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    const back = () => {
      emit('back')
    }
    const getFullMonth = computed(() => {
      let months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
      return months[props.viewDate.month - 1]
    })
    return {
      back,
      getFullMonth
    }
  }
}
</script>

<style lang='scss'>
.calendarReminder {
  width: 300px;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  background-image: linear-gradient(-45deg, $third, $secondary);
  box-shadow: -1px 0 3px $shadow;
  z-index: 99;
  .reminder_header {
    width: 100%;
    padding: 10px;
    display: flex;
    button {
      position: absolute;
      left: 10px;
      @include btnReset;
      @include hoverImg(30px);
    }
  }
  .reminder_date {
    width: 100%;
    text-align: center;
    color: $white;
    p {
      @include font(1, 30px);
    }
    h2 {
      @include font(20);
    }
  }
  .reminder_list {
    height: calc(100% - 120px);
    list-style: none;
    overflow-y: auto;
    padding-bottom: 10px;
  }
  @include media(479px){
    width: 100%;
  }
}
</style>
