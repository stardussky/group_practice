<template>
  <div class="calendar">
    <component
      :is="info.type"
      v-for="info in calendar"
      :key="`${info.month}${info.day}`"
      :month="info.month"
      :date="info.date"
      :day="info.day"
    />
  </div>
</template>

<script>
import CalendarMonth from './module/CalendarMonth'
import CalendarDays from './module/CalendarDays'
import { ref, onMounted } from '@vue/composition-api'
export default {
  name: 'Calendar',
  components: {
    CalendarMonth,
    CalendarDays
  },
  setup () {
    const calendar = ref([])
    const getCalendar = () => {
      let date = new Date()
      let week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
      let nowMonth = date.getMonth() + 1
      let nowDate = date.getDate()
      let newDay = date.getDay()
      let nowMonthDays = new Date(date.getFullYear(), nowMonth, 0).getDate()
      calendar.value.push({
        type: 'CalendarMonth',
        month: nowMonth
      })
      for (let i = 0; i < 7; i++) {
        calendar.value.push({
          type: 'CalendarDays',
          month: nowMonth,
          date: (nowDate + i) % nowMonthDays || nowMonthDays,
          day: week[(newDay + i) % 7]
        })
        if ((nowDate + i) % nowMonthDays === 0) {
          nowMonth = (nowMonth + 1) % 12 || 12
          calendar.value.push({
            type: 'CalendarMonth',
            month: nowMonth
          })
        }
      }
    }
    onMounted(() => {
      getCalendar()
    })
    return {
      calendar
    }
  }
}
</script>

<style lang='scss'>
.calendar {
  width: 100px;
  height: 100%;
  position: absolute;
  top: 0;
  right: 0;
  background-image: linear-gradient(to bottom, rgba(white, 1), transparent);
  z-index: 99;
}
</style>
