<template>
  <div>
    <div
      id="threeJs"
      ref="threeJs"
    >
      <div
        ref="projectManagement"
        class="button"
        data-path="ProjectManagement"
        @click="enterPage('ProjectManagement')"
        @touchstart="enterPage('ProjectManagement')"
      >
        專案管理
      </div>
      <div
        ref="clock"
        class="button"
        data-path="Clock"
        @click="enterPage('Clock')"
        @touchstart="enterPage('Clock')"
      >
        番茄鐘
      </div>
      <div
        ref="shop"
        class="button"
        data-path="Shop"
        @click="enterPage('Shop')"
        @touchstart="enterPage('Shop')"
      >
        商城
      </div>
      <div
        ref="login"
        class="button"
        data-path="Login"
        @click="enterPage('Login')"
        @touchstart="enterPage('Login')"
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
import { onMounted, onBeforeUnmount } from '@vue/composition-api'
import { init, handleWindowResize, changeRenderer, animation } from '../plugins/three/initThree'
import enterRouter from '@/mixins/enterRouter'
export default {
  name: 'Three',
  mixins: [enterRouter],
  props: {
    weather: {
      type: String,
      required: true
    }
  },
  setup (props, { root }) {
    onMounted(() => {
      changeRenderer(props.weather)
      handleWindowResize()
      window.addEventListener('resize', handleWindowResize)
    })
    onBeforeUnmount(() => {
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
#threeJs {
  position: absolute;
  top: 0;
  left: 0;
  z-index: -1;
  height: 100%;
  overflow: hidden;
  .button {
    color: $white;
    text-shadow: 1px 1px 1px $dark;
    @include font(1);
    cursor: pointer;
  }
}
#stats {
  position: absolute;
  left: 0;
  top: 0;
}
</style>
