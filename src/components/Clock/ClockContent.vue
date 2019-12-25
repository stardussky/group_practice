<template>
  <div class="clockContent">
    <ClockContentList
      v-for="data in clockList"
      :key="data.id"
      :class="data.id"
      :info="data"
    />
  </div>
</template>

<script>
import ClockContentList from './ClockContentList'
export default {
  name: 'ClockContent',
  components: {
    ClockContentList
  },
  props: {
    clockList: {
      type: Array,
      required: true
    }
  }
}
</script>

<style lang='scss'>
  .clockContent {
    width: 60%;
    height: 100%;
    padding-top: 10px;
    display: flex;
    padding-bottom: 10px;
    @include media(1280px){
      width: 50%;
      flex-direction: column;
      align-items: center;
    }
    @include media(767px){
      width: 100%;
      height: 60%;
      flex-direction: row;
      align-items: flex-start;
      padding-top: 0;
      >.self {
        display: none;
      }
    }
  }
</style>
