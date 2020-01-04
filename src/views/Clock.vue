<template>
  <div class="clock">
    <div id="clock">
      <ClockFace
        :timer="timer"
        :passed-timer.sync="passedTimer"
        :cumulative-timer=" mode ? cumulativeTimer : 0"
        :is-start.sync="isStart"
        :mode.sync="mode"
      />
      <ClockControl
        :mode.sync="mode"
        @resetTimer="resetTimer"
      />
    </div>
    <ClockContent
      :clock-list="clockList"
      :cumulative-timer=" !mode ? cumulativeTimer : 0"
    />
  </div>
</template>

<script>
import ClockFace from '@/components/Clock/ClockFace'
import ClockControl from '@/components/Clock/ClockControl'
import ClockContent from '@/components/Clock/ClockContent'
import { ref, computed, onMounted } from '@vue/composition-api'
import { mapGetters, mapState, mapActions } from 'vuex'
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
    const cumulativeTimer = computed(() => timer.value - passedTimer.value)
    const resetTimer = () => {
      workedTimer.value = workTimer.value
      breakedTimer.value = breakTimer.value
    }
    onMounted(() => {
      resetTimer()
    })
    return {
      mode,
      timer,
      passedTimer,
      cumulativeTimer,
      resetTimer
    }
  },
  computed: {
    ...mapState('clockStore', ['targetInfo']),
    ...mapGetters('clockStore', ['clockList']),
    isStart: {
      ...mapState('clockStore', {
        get: state => state.isPlay
      }),
      ...mapActions('clockStore', {
        set: 'TOGGLE_START'
      })
    }
  },
  watch: {
    targetInfo () {
      this.resetTimer()
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
      #clock {
        width: 300px;
        height: 40%;
        align-items: center;
        margin: auto;
        padding: 0;
      }
    }
  }
</style>
