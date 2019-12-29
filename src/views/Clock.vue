<template>
  <div class="clock">
    <div class="select_list">
      <button
        type="button"
        class="active"
      >
        專案管理
      </button>
      <button type="button">
        個人清單
      </button>
    </div>
    <div id="clock">
      <ClockFace
        :timer.sync="timer"
        :is-start.sync="isStart"
        :mode.sync="mode"
      />
      <ClockControl
        :is-start.sync="isStart"
        :mode.sync="mode"
      />
    </div>
    <ClockContent :clock-list="clockList" />
  </div>
</template>

<script>
import ClockFace from '@/components/Clock/ClockFace'
import ClockControl from '@/components/Clock/ClockControl'
import ClockContent from '@/components/Clock/ClockContent'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'Clock',
  components: {
    ClockFace,
    ClockControl,
    ClockContent
  },
  setup () {
    const clockList = ref([
      {
        id: 'pm',
        name: '專案管理',
        lists: [
          {
            id: '1',
            content: 'XXX',
            timer: null,
            status: false
          }
        ]
      },
      {
        id: 'self',
        name: '個人清單',
        lists: [
          {
            id: '1',
            content: 'XXX',
            timer: null,
            status: false
          }
        ]
      }
    ])
    const workTimer = ref(10)
    const breakTimer = ref(5)
    const isStart = ref(false)
    const mode = ref(0)
    const timer = computed({
      get () {
        return mode.value === 0 ? workTimer.value : breakTimer.value
      },
      set (val) {
        mode.value === 0 ? workTimer.value = val : breakTimer.value = val
      }
    })
    return {
      clockList,
      workTimer,
      breakTimer,
      isStart,
      mode,
      timer
    }
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
    #clock {
      width: 40%;
      height: 100%;
      padding: 0 10px;
    }
    @include media(1280px){
      #clock {
        width: 50%;
      }
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
      #clock {
        width: 300px;
        height: 40%;
        align-items: center;
        margin: auto;
        padding: 0;
      }
    }
    @include media(479px){
      .select_list{
        top: 5px;
        right: 5px;
      }
    }
  }
</style>
