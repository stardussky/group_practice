<template>
  <div class="clockFace">
    <svg
      id="svg"
      width="30vw"
      height="30vw"
      viewPort="0 0 155 155"
      version="1.1"
      xmlns="http://www.w3.org/2000/svg"
    >
      <defs>
        <linearGradient
          id="gradient"
          x1="0"
          x2="0"
          y1="0"
          y2="1"
          :class="{break: mode}"
        >
          <stop offset="0%" />
          <stop offset="100%" />
        </linearGradient>
      </defs>
      <circle
        r="40%"
        cx="50%"
        cy="50%"
      />
      <circle
        id="bar"
        ref="bar"
        r="40%"
        cx="50%"
        cy="50%"
        :stroke-dashoffset="dashoffset"
      />
      <circle
        id="outside"
        r="45%"
        cx="50%"
        cy="50%"
      />
      <text
        id="timer"
        x="50%"
        y="50%"
      >{{ time }}</text>
    </svg>
  </div>
</template>

<script>
import { ref, computed, onMounted, onUnmounted, watch } from '@vue/composition-api'
export default {
  name: 'ClockFace',
  props: {
    timer: {
      type: Number,
      required: true
    },
    isStart: {
      type: Boolean,
      required: true
    },
    mode: {
      type: Number,
      required: true
    }
  },
  setup (props, { refs, emit }) {
    const dasharray = ref(NaN)
    const nowOffset = ref(NaN)
    const timeOut = ref(null)
    const time = computed(() => {
      let second = props.timer % 60 < 10 ? '0' + props.timer % 60 : props.timer % 60
      let minute = (props.timer - second) / 60 < 10 ? '0' + (props.timer - second) / 60 : (props.timer - second) / 60
      return `${minute}:${second}`
    })
    const dashoffset = computed(() => {
      if (props.isStart) {
        nowOffset.value -= (100 / props.timer * nowOffset.value / 100)
      }
      return nowOffset.value
    })
    const countDown = computed({
      get () {
        return props.timer
      },
      set (val) {
        setTimer()
        emit('update:timer', val)
      }
    })
    const setDasharray = () => {
      let bar = refs.bar
      let c = bar.getBoundingClientRect().width * Math.PI
      bar.style.strokeDasharray = c
      dasharray.value = nowOffset.value = c
    }
    const setTimer = () => {
      timeOut.value = setTimeout(() => {
        clearTimer()
        if (countDown.value > 0)countDown.value -= 1
        else if (props.mode === 0) emit('update:mode', 1)
        else stopTimer()
      }, 1000)
    }
    const clearTimer = () => {
      clearTimeout(timeOut.value)
    }
    const stopTimer = () => emit('update:isStart', false)
    watch(() => props.isStart, (val) => {
      if (val)setTimer()
      else clearTimer()
    })
    watch(() => props.mode, () => { stopTimer(); setDasharray() }, { lazy: true })
    onMounted(() => {
      setDasharray()
      window.addEventListener('resize', setDasharray)
    })
    onUnmounted(() => {
      window.removeEventListener('resize', setDasharray)
    })
    return {
      dasharray,
      dashoffset,
      time
    }
  }
}
</script>

<style lang='scss'>
  .clockFace {
    display: flex;
    justify-content: center;
    #svg {
      max-width: 350px;
      min-width: 150px;
      max-height: 350px;
      min-height: 150px;
      circle {
        stroke-linecap: round;
        fill: transparent;
        stroke: $white;
        stroke-width: 4px;
        transition: stroke-dashoffset 1s linear;
      }
      #gradient {
        stop {
          &:nth-of-type(1){
            stop-color: $secondary;
          }
          &:nth-of-type(2){
            stop-color: $primary;
          }
        }
        &.break {
          stop {
            &:nth-of-type(1){
              stop-color: $danger;
            }
            &:nth-of-type(2){
              stop-color: $third;
            }
          }
        }
      }
      #bar {
        fill: rgba($white, .5);
        stroke: url(#gradient);
      }
      #outside {
        stroke-width: 1px;
      }
      #timer {
        dominant-baseline:middle;
        text-anchor:middle;
        @include font(8);
        fill: $dark;
        transition: all 1s;
      }
    }
    @include media(767px){
      height: 100%;
      align-items: center;
      justify-content: flex-start;
      #svg{
        #timer {
          @include font(5);
        }
      }
    }
  }
</style>
