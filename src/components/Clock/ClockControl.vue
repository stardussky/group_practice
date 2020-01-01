<template>
  <div class="clockControl">
    <div class="switch">
      <div
        class="work"
        :class="{active: !switchMode}"
        @click="switchMode = 0"
      >
        WORK
      </div>
      <div
        class="control"
        @click="isPlay = !isPlay"
      >
        <div
          v-if="!isPlay"
          class="play"
        >
          <img
            src="@/assets/icon/play.svg"
            alt="play"
          >
          <img
            src="@/assets/icon/play_c.svg"
            alt="play"
          >
        </div>
        <div
          v-else
          class="pause"
        >
          <img
            src="@/assets/icon/pause.svg"
            alt="pause"
          >
          <img
            src="@/assets/icon/pause_c.svg"
            alt="pause"
          >
        </div>
      </div>
      <div
        class="break"
        :class="{active: switchMode}"
        @click="switchMode = 1"
      >
        BREAK
      </div>
    </div>
    <div />
  </div>
</template>

<script>
import { computed } from '@vue/composition-api'
export default {
  name: 'ClockControl',
  props: {
    isStart: {
      type: Boolean,
      required: true
    },
    mode: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit }) {
    const isPlay = computed({
      get () {
        return props.isStart
      },
      set (val) {
        emit('update:isStart', val)
      }
    })
    const switchMode = computed({
      get () {
        return props.mode
      },
      set (val) {
        emit('update:mode', val)
      }
    })
    return {
      isPlay,
      switchMode
    }
  }

}
</script>

<style lang='scss'>
.clockControl {
  max-width: 300px;
  background-color: rgba($white, .9);
  border-radius: 20px;
  margin: auto;
  .switch {
    display: flex;
    align-items: center;
    justify-content: center;
    color: $dark;
    @include font;
    div {
      cursor: pointer;
    }
  }
  .work, .break{
    transition: color .3s;
  }
  .work {
    &.active {
      color: $primary;
    }
    &:hover {
      color: $primary;
    }
  }
  .break {
    &.active {
      color: $danger;
    }
    &:hover {
      color: $danger;
    }
  }
  .control {
    .play, .pause {
      margin: 0 10px;
      position: relative;
      @include hoverImg(35px);
    }
  }
  @include media(767px){
    position: absolute;
    top: 60px;
    right: 25px;
    background-color: transparent;
    .switch {
      @include font(-.875);
    }
    .control {
      .play, .pause{
        margin: 0 5px;
      }
    }
  }
  @include media(479px){
    position: absolute;
    top: 40px;
    right: 6px;
    .control {
      .play, .pause{
        margin: 0 5px;
        img {
          width: 20px;
          height: 20px;
        }
      }
    }
  }
}
</style>
