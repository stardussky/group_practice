<template>
  <div class="clockContentList">
    <div class="title">
      <p>專案管理</p>
      <span />
    </div>
    <ul class="list">
      <ClockList />
      <ClockList />
      <ClockList />
      <ClockList />
    </ul>
  </div>
</template>

<script>
import ClockList from './ClockList'
export default {
  name: 'ClockContentList',
  components: {
    ClockList
  }
}
</script>

<style lang='scss'>
.clockContentList {
  width: 50%;
  min-width: 250px;
  max-width: 300px;
  height: 100%;
  border-radius: 20px;
  background-color: rgba($white, .65);
  margin: 0 10px 10px 0;
  >.title {
    @include cardHead;
    background-color: $white;
    color: $dark;
    position: relative;
    >span {
      position: absolute;
      bottom: 0;
      left: 0;
      width: 100%;
      height: 1px;
      background-image: linear-gradient(to right, $primary, $third);
    }
  }
  .list {
    height: calc(100% - 60px);
    list-style: none;
    overflow-y: auto;
  }
  @include media(1280px){
    height: calc(50% - 5px);
  }
  @include media(767px){
    width: 100%;
    height: 100%;
    margin: auto;
    .list {
      height: calc(100% - 50px);
    }
  }
  @include media(479px){
    .list {
      height: calc(100% - 30px);
    }
  }
}
</style>
