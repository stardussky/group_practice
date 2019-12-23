<template>
  <div class="clock">
    <ClockFace />
    <ClockContent />
  </div>
</template>

<script>
import ClockFace from '@/components/Clock/ClockFace'
import ClockContent from '@/components/Clock/ClockContent'
export default {
  name: 'Clock',
  components: {
    ClockFace,
    ClockContent
  }
}
</script>

<style lang='scss'>
  .clock {
    width: 100%;
    height: 100%;
    display: flex;
  }
</style>
