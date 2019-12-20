<template>
  <div class="projectManagement">
    <transition
      name="slider"
      mode="out-in"
    >
      <router-view />
    </transition>
  </div>
</template>

<script>
export default {
  name: 'ProjectManagement'
}
</script>

<style lang="scss">
.projectManagement {
  height: 100%;
  overflow: auto;
  padding: 10px;
}
.slider-enter-active, .slider-leave-active{
  transition: all .3s;
}
</style>
