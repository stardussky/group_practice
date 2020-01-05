<template>
  <div class="clock">
    <div id="clock">
      <ClockFace
        :mode="mode"
        :clock-time="passedTimer"
        :timer="timer"
      />
      <ClockControl
        :mode.sync="mode"
        @resetTimer="resetTimer(targetInfo)"
      />
    </div>
    <ClockContent
      :mode="mode"
      :elapsedtimer="workElapsedtimer"
    />
  </div>
</template>

<script>
import ClockFace from '@/components/Clock/ClockFace'
import ClockControl from '@/components/Clock/ClockControl'
import ClockContent from '@/components/Clock/ClockContent'
import { ref, computed, onMounted } from '@vue/composition-api'
import { mapState, mapMutations, mapActions } from 'vuex'
export default {
  name: 'Clock',
  components: {
    ClockFace,
    ClockControl,
    ClockContent
  },
  setup () {
    const mode = ref(0)
    const workTimer = ref(10)
    const breakTimer = ref(5)
    const workElapsedtimer = ref(0)
    const breakElapsedtimer = ref(0)
    const setTime = ref(null)

    const timer = computed(() => !mode.value ? workTimer.value : breakTimer.value)
    const elapsedtimer = computed({
      get () {
        return !mode.value ? workElapsedtimer.value : breakElapsedtimer.value
      },
      set (val) {
        !mode.value ? workElapsedtimer.value = val : breakElapsedtimer.value = val
      }
    })
    const passedTimer = computed(() => timer.value - elapsedtimer.value)
    const startTime = () => {
      setTime.value = setTimeout(() => {
        clearTime()
        if (passedTimer.value > 0) {
          elapsedtimer.value += 1
        } else if (mode.value === 0) {
          elapsedtimer.value = 0
          mode.value = 1
        } else {
          resetClock()
        }
        if (passedTimer.value >= 0)startTime()
      }, 1000)
    }
    const clearTime = () => clearTimeout(setTime.value)

    const resetClock = () => {
      mode.value = 0
      workElapsedtimer.value = 0
      breakElapsedtimer.value = 0
    }
    onMounted(() => {
      resetClock()
    })
    return {
      mode,
      workElapsedtimer,
      resetClock,
      startTime,
      clearTime,
      timer,
      passedTimer
    }
  },
  computed: {
    ...mapState('clockStore', ['isPlay', 'targetInfo'])
  },
  watch: {
    mode: {
      handler () {
        this.toggleStatus(false)
      }
    },
    targetInfo: {
      handler (newval, oldval) {
        this.resetTimer(oldval)
      }
    },
    isPlay: {
      immediate: true,
      handler (val) {
        if (val) this.startTime()
        else this.clearTime()
      }
    }
  },
  methods: {
    ...mapMutations('clockStore', ['toggleStatus']),
    ...mapActions('clockStore', ['ADD_TIMER']),
    resetTimer (info) {
      this.ADD_TIMER({ info, timer: this.workElapsedtimer })
      this.toggleStatus(false)
      this.resetClock()
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
