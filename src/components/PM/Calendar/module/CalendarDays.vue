<template>
  <ul class="calendar_days">
    <li>
      <p>{{ day }}</p>
      <p>{{ date }}</p>
      <!-- <span>1</span> -->
    </li>
  </ul>
</template>

<script>
export default {
  name: 'CalendarDays',
  props: {
    day: {
      type: String,
      required: true
    },
    date: {
      type: Number,
      required: true
    }
  }
}
</script>

<style lang='scss'>
.calendar_days{
  list-style: none;
  color: $dark;
  li {
    text-align: center;
    cursor: pointer;
    padding: 5px 0;
    position: relative;
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
      width: 3px;
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
</style>
