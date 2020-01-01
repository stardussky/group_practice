<template>
  <div class="calendar">
    <transition name="slider_xl">
      <component
        :is="view"
        v-for="info in calendar"
        :key="info.nowMonth"
        :month="info.nowMonth"
        :days="info.days"
        :view-date="viewDate"
        @viewRemainder="viewRemainder"
        @back="back"
      />
    </transition>
  </div>
</template>

<script>
import CalendarView from './module/CalendarView'
import CalendarReminder from './module/CalendarReminder'
import { ref, onMounted } from '@vue/composition-api'
export default {
  name: 'Calendar',
  components: {
    CalendarView,
    CalendarReminder
  },
  setup () {
    const view = ref('CalendarView')
    const calendar = ref([])
    const viewDate = ref({})
    const getCalendar = () => {
      let date = new Date()
      let week = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT']
      let nowMonth = date.getMonth() + 1
      let nowDate = date.getDate()
      let newDay = date.getDay()
      let nowMonthDays = new Date(date.getFullYear(), nowMonth, 0).getDate()
      calendar.value.push({
        nowMonth,
        days: []
      })
      for (let i = 0; i < 7; i++) {
        calendar.value[calendar.value.length - 1].days.push({
          date: (nowDate + i) % nowMonthDays || nowMonthDays,
          day: week[(newDay + i) % 7]
        })
        if ((nowDate + i) % nowMonthDays === 0) {
          nowMonth = (nowMonth + 1) % 12 || 12
          calendar.value.push({
            nowMonth,
            days: []
          })
        }
      }
    }
    const viewRemainder = (date) => {
      view.value = 'CalendarReminder'
      viewDate.value = date
    }
    const back = () => {
      view.value = 'CalendarView'
    }
    onMounted(() => {
      getCalendar()
    })
    return {
      view,
      calendar,
      viewDate,
      viewRemainder,
      back
    }
  }
}
</script>

<style lang='scss'>
.calendar {

}
</style>
