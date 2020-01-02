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
        :timer="timer"
        :passed-timer.sync="passedTimer"
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
import { ref, computed, onMounted } from '@vue/composition-api'
import { mapGetters } from 'vuex'
export default {
  name: 'Clock',
  components: {
    ClockFace,
    ClockControl,
    ClockContent
  },
  setup () {
    const workTimer = ref(60)
    const breakTimer = ref(30)
    const workedTimer = ref(NaN)
    const breakedTimer = ref(NaN)
    const isStart = ref(false)
    const mode = ref(0)
    const timer = computed(() => mode.value === 0 ? workTimer.value : breakTimer.value)
    const passedTimer = computed({
      get () {
        return mode.value === 0 ? workedTimer.value : breakedTimer.value
      },
      set (val) {
        mode.value === 0 ? workedTimer.value = val : breakedTimer.value = val
      }
    })
    onMounted(() => {
      workedTimer.value = workTimer.value
      breakedTimer.value = breakTimer.value
    })
    return {
      isStart,
      mode,
      timer,
      passedTimer
    }
  },
  computed: {
    ...mapGetters('pmStore', ['clockList'])
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
