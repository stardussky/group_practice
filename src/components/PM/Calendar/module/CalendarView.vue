<template>
  <div class="calendar_view">
    <div class="calendar_month">
      {{ month }}
    </div>
    <ul class="calendar_days">
      <li
        v-for="day in days"
        :key="day.date"
        @click="selectDate = {date: day.date, day: day.day}"
      >
        <p>{{ day.day }}</p>
        <p>{{ day.date }}</p>
      <!-- <span>1</span> -->
      </li>
    </ul>
  </div>
</template>

<script>
import { computed } from '@vue/composition-api'
export default {
  name: 'CalendarView',
  props: {
    days: {
      type: Array,
      required: true
    },
    month: {
      type: Number,
      required: true
    },
    viewDate: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    const selectDate = computed({
      get () {
        return props.viewDate
      },
      set ({ date, day }) {
        emit('viewRemainder', {
          month: props.month,
          date,
          day
        })
      }
    })
    return {
      selectDate
    }
  }
}
</script>

<style lang='scss'>
.calendar_view {
  width: 80px;
  height: 100%;
  background-color: $white;
  border-radius: 0;
  overflow-y: auto;
  box-shadow: -1px 0 3px $shadow;
  .calendar_month {
    width: 100%;
    @include font(10);
    color: $dark;
    text-align: center;
    padding: 10px 0;
  }
  .calendar_days{
    list-style: none;
    color: $dark;
    position: relative;
    &::before {
      content: '';
      position: absolute;
      top: 0;
      right: 0;
      width: 3px;
      height: 100%;
      background-image: linear-gradient(to bottom,rgba($primary, 1),rgba($third, 1));
    }
    li {
      text-align: center;
      cursor: pointer;
      padding: 7.5px 0;
      position: relative;
      z-index: 1;
      &:nth-of-type(1){
        color: $primary;
      }
      p{
        transition: color .3s;
        &:nth-of-type(1){
          @include font(-.875);
          font-weight: 600;
        }
        &:nth-of-type(2){
          @include font(2);
        }
      }
      span {
        position: absolute;
        top: -5px;
        left: -5px;
        width: 15px;
        height: 15px;
        background-color: $danger;
        color: $white;
        border-radius: 50%;
        text-align: center;
        @include font(-.875, 15px);
      }
      &::before{
        content: '';
        position: absolute;
        top: 0;
        right: 0;
        width: 0;
        height: 100%;
        background-color: $primary;
        transition: all .3s;
        z-index: -1;
      }
      &:hover {
        &::before{
          width: 100%;
          opacity: .7;
        }
        p{
          color: $white;
        }
      }
    }
  }
  @include media(479px){
    width: 60px;
    .calendar_month {
      @include font(5);
    }
    .calendar_days{
      li {
        p{
          &:nth-of-type(1){
            @include font(-.875);
            margin-bottom: 5px;
          }
          &:nth-of-type(2){
            @include font(1);
          }
        }
      }
    }
  }
}
</style>
