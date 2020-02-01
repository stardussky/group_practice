<template>
  <div
    ref="projectManagement"
    class="projectManagement"
    @mousedown="startDrag"
    @mousemove="dragHandler"
    @mouseup="stopDrag"
    @mouseleave="stopDrag"
    @mousewheel="mousewheelHandler"
  >
    <transition
      name="fade"
      mode="out-in"
    >
      <router-view @closeDrag="stopDrag" />
    </transition>
  </div>
</template>

<script>
import { ref } from '@vue/composition-api'
export default {
  name: 'ProjectManagement',
  provide () {
    return {
      pmRefs: this.$refs
    }
  },
  setup (props, { refs }) {
    const isDrag = ref(false)
    const startX = ref(0)
    const startScroll = ref(0)
    const mousewheelHandler = (e) => {
      let delta = Math.max(-1, Math.min(1, (e.wheelDelta || -e.detail)))
      refs.projectManagement.scrollLeft -= (delta * 200)
    }
    const startDrag = (e) => {
      isDrag.value = true
      startX.value = e.pageX
      startScroll.value = refs.projectManagement.scrollLeft
    }
    const dragHandler = (e) => {
      if (isDrag.value) {
        let x = e.pageX - startX.value
        refs.projectManagement.scrollLeft = startScroll.value - x
      }
    }
    const stopDrag = () => {
      isDrag.value = false
    }
    return {
      mousewheelHandler,
      startDrag,
      dragHandler,
      stopDrag,
      isDrag
    }
  },
  beforeRouteUpdate (to, from, next) {
    this.$refs.projectManagement.scrollLeft = 0
    next()
  }
}
</script>

<style lang="scss">
.projectManagement {
  height: calc(100% - 10px);
  overflow-x: auto;
  padding: 0 10px 10px 10px;
  scroll-behavior: smooth;
  @include media(479px){
    height: 100%;
    padding: 10px;
  }
}
</style>
