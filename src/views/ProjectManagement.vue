<template>
  <div class="projectManagement">
    <transition
      name="fade"
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
  height: calc(100% - 10px);
  overflow: auto;
  padding: 0 10px;
}
</style>
