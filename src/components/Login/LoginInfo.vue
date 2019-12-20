<template>
  <div class="loginInfo" />
</template>

<script>
export default {
  name: 'LoginInfo'

}
</script>

<style lang='scss'>
.loginInfo {
  width: 50%;
  height: 100%;
  @include media(1023px){
    display: none;
  }
}
</style>
