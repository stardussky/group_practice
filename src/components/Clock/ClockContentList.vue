<template>
  <div class="clockContentList">
    <div class="title">
      <p>專案管理</p>
      <span />
    </div>
    <ul class="list">
      <li />
    </ul>
  </div>
</template>

<script>
export default {
  name: 'ClockContentList'
}
</script>

<style lang='scss'>
.clockContentList {
  width: 50%;
  height: 100%;
  .title {
    width: 100%;
    height: 50px;
    background-color: rgba($white, 1);
    color: $dark;
    box-shadow: 1px 1px 3px $shadow;
    @include font(1, 50px);
    text-align: center;
    border-radius: 0 0 5px 5px;
    position: relative;
    >span {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 3px;
      background-image: linear-gradient(to right, $primary, $third);
    }
  }
  .list {
    width: 100%;
    min-height: calc(100% - 50px);
    background-color: rgba($white, .65);
    list-style: none;
  }
}
</style>
