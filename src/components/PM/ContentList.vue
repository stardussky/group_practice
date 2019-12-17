<template>
  <li class="contentList">
    <div
      class="checked"
      @click="status = !status"
    >
      <img
        v-if="!status"
        src="@/assets/icon/unchecked_d.svg"
        alt="unchecked"
        width="20"
      >
      <img
        v-else
        src="@/assets/icon/checked_d.svg"
        alt="checked"
        width="20"
      >
    </div>
    <p>切版</p>
  </li>
</template>

<script>
export default {
  name: 'ContentList'
}
</script>

<style lang='scss'>
@import '@/style/_var';
.contentList {

}
</style>
