<template>
  <div>
    <div
      id="threeJs"
      ref="threeJs"
    >
      <div
        ref="projectManagement"
        class="button"
        data-path="projectManagement"
      >
        專案管理
      </div>
      <div
        ref="clock"
        class="button"
        data-path="clock"
      >
        番茄鐘
      </div>
      <div
        ref="shop"
        class="button"
        data-path="shop"
      >
        商城
      </div>
      <div
        ref="login"
        class="button"
        data-path="login"
      >
        登入
      </div>
    </div>
    <div
      id="stats"
      ref="stats"
    />
  </div>
</template>

<script>
import { onMounted, onUnmounted } from '@vue/composition-api'
import { init, handleWindowResize, changeRenderer, animation } from '../plugins/three/initThree'

export default {
  name: 'Three',
  props: {
    weather: {
      type: String,
      required: true
    }
  },
  setup (props) {
    onMounted(() => {
      changeRenderer(props.weather)
      handleWindowResize()
      window.addEventListener('resize', handleWindowResize)
    })
    onUnmounted(() => {
      window.removeEventListener('resize', handleWindowResize)
      cancelAnimationFrame(animation)
    })
    return {
    }
  },
  watch: {
    weather: {
      immediate: false,
      handler (val) {
        changeRenderer(val)
      }
    }
  },
  mounted () {
    init(this.$refs, this)
  }
}
</script>

<style lang="scss">
@import '@/style/_var';
#threeJs {
  height: 100vh;
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  .button {
    pointer-events: none;
    @include font(1);
  }
}
#stats {
  position: absolute;
  left: 0;
  top: 0;
}
</style>
