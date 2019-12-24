<template>
  <div class="clock">
    <div class="select_list">
      <button type="button">
        專案管理
      </button>
      <button type="button">
        個人清單
      </button>
    </div>
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
    position: relative;
    .select_list {
      display: none;
    }
    @include media(767px){
      flex-direction: column;
      .select_list {
        display: block;
        position: absolute;
        top: 15px;
        right: 15px;
        z-index: 1;
        @include switchBtn;
      }
    }
    @include media(479px){
      .select_list{
        top: 0;
        right: 5px;
      }
    }
  }
</style>
