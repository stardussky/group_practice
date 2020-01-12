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
      <div class="control">
        <div
          class="reset"
          @click="resetTimer"
        >
          <img
            src="@/assets/icon/reload.svg"
            alt="reset"
          >
          <img
            src="@/assets/icon/reload_on.svg"
            alt="reset"
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
    mode: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit }) {
    const switchMode = computed({
      get () {
        return props.mode
      },
      set (val) {
        emit('update:mode', val)
      }
    })
    const resetTimer = () => emit('resetTimer')
    return {
      switchMode,
      resetTimer
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
    .reset {
      margin: 0 10px;
      position: relative;
      @include hoverImg(35px);
    }
  }
  @include media(767px){
    position: absolute;
    top: 60px;
    right: 7%;
    background-color: transparent;
    .switch {
      @include font(-.875);
    }
    .control {
      .reset{
        margin: 0 5px;
      }
    }
  }
  @include media(479px){
    position: absolute;
    top: 40px;
    right: 6px;
    .control {
      .reset{
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
