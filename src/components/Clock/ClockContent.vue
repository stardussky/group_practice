<template>
  <div class="clockContent">
    <ClockContentList />
  </div>
</template>

<script>
import ClockContentList from './ClockContentList'
export default {
  name: 'ClockContent',
  components: {
    ClockContentList
  }
}
</script>

<style lang='scss'>
  .clockContent {
    width: 50%;
    height: 100%;
    padding: 10px;
  }
</style>
