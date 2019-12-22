<template>
  <div class="clock">
    <ClockFace />
  </div>
</template>

<script>
import ClockFace from '@/components/Clock/ClockFace'
export default {
  name: 'Clock',
  components: {
    ClockFace
  }
}
</script>

<style lang='scss'>
  .clock {
  }
</style>
