<template>
  <div class="clockFace">
    <svg
      id="svg"
      width="30vw"
      height="30vw"
      viewPort="0 0 155 155"
      version="1.1"
      xmlns="http://www.w3.org/2000/svg"
      :class="{active: isPlay}"
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
        :stroke-dashoffset="dashOffset"
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
import { ref, computed, onMounted, onBeforeUnmount } from '@vue/composition-api'
import clockTime from '@/mixins/clockTime'
export default {
  name: 'ClockFace',
  mixins: [clockTime],
  props: {
    timer: {
      type: Number,
      required: true
    },
    clockTime: {
      type: Number,
      required: true
    },
    mode: {
      type: Number,
      required: true
    },
    isPlay: {
      type: Boolean,
      required: true
    }
  },
  setup (props, { refs, emit }) {
    const dasharray = ref(NaN)
    const dashOffset = computed(() => dasharray.value - (dasharray.value - (dasharray.value / props.timer * props.clockTime)))
    const setDasharray = () => {
      let bar = refs.bar
      let c = bar.getBoundingClientRect().width * Math.PI
      bar.style.strokeDasharray = c
      dasharray.value = c
    }

    onMounted(() => {
      setTimeout(() => {
        setDasharray()
      }, 1)
      window.addEventListener('resize', setDasharray)
    })
    onBeforeUnmount(() => {
      window.removeEventListener('resize', setDasharray)
    })
    return {
      dasharray,
      dashOffset
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
      &.active {
        circle {
          transition-duration: 1s;
        }
      }
      circle {
        stroke-linecap: round;
        fill: rgba(255, 255, 255, 0);
        stroke: $white;
        stroke-width: 4px;
        transition: stroke-dashoffset .3s linear;
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
