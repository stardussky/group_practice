<template>
  <div class="clock">
    <div id="clock">
      <ClockFace
        :mode="mode"
        :clock-time="passedTimer"
        :timer="timer"
        :is-play="isPlay"
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
import { ref, computed } from '@vue/composition-api'
import { mapState, mapMutations, mapActions } from 'vuex'
export default {
  name: 'Clock',
  components: {
    ClockFace,
    ClockControl,
    ClockContent
  },
  setup (props, { root }) {
    const mode = ref(0)
    const workTimer = ref(10)
    const breakTimer = ref(5)
    const workElapsedtimer = ref(0)
    const breakElapsedtimer = ref(0)
    const tempTimer = ref(0)
    const setTime = ref(null)
    const ring = ref(new Audio('./audio/ring1.mp3'))

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
        if (passedTimer.value === 0) {
          if (!mode.value)mode.value = 1
          else root.$store.commit('clockStore/toggleStatus', false)
          ring.value.play()
        } else {
          elapsedtimer.value++
          startTime()
        }
      }, 1000)
    }
    const clearTime = () => clearTimeout(setTime.value)

    const resetClock = () => {
      mode.value = 0
      workElapsedtimer.value = 0
      breakElapsedtimer.value = 0
      tempTimer.value = 0
    }
    const setTempTimer = () => { tempTimer.value = workElapsedtimer.value }
    return {
      mode,
      ring,
      workElapsedtimer,
      resetClock,
      startTime,
      clearTime,
      timer,
      passedTimer,
      tempTimer,
      setTempTimer
    }
  },
  computed: {
    ...mapState('clockStore', ['isPlay', 'targetInfo']),
    ...mapState('memberStore', ['userInfo']),
    ...mapState(['isLogin'])
  },
  watch: {
    mode: {
      handler () {
        this.toggleStatus(false)
        this.setTempTimer()
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
        this.setTempTimer()
        if (val) this.startTime()
        else this.clearTime()
      }
    },
    isLogin (val) {
      if (val) {
        this.GET_CLOCK_LIST()
        this.ring.src = this.userInfo.ring_no
      }
    }
  },
  mounted () {
    if (this.isLogin) this.GET_CLOCK_LIST()
  },
  activated () {
    if (this.isLogin) this.GET_CLOCK_LIST()
  },
  methods: {
    ...mapMutations('clockStore', ['toggleStatus']),
    ...mapActions('clockStore', ['ADD_TIMER', 'GET_CLOCK_LIST']),
    resetTimer (info) {
      this.setTempTimer()
      this.ADD_TIMER({ info, timer: this.tempTimer })
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
      max-width: 470px;
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
        width: 400px;
        height: 40%;
        align-items: center;
        margin: auto;
        padding: 0;
      }
    }
    @include media(479px){
      #clock{
        width: 320px;
      }
    }
  }
</style>
