<template>
  <div class="clockContentList">
    <div class="title">
      <p>{{ content.type }}</p>
    </div>
    <ul class="list">
      <ClockList
        v-for="list in content.list"
        :key="list.info.id"
        :list="list"
        :cumulative-timer="cumulativeTimer"
      />
    </ul>
  </div>
</template>

<script>
import ClockList from './ClockList'
export default {
  name: 'ClockContentList',
  components: {
    ClockList
  },
  props: {
    content: {
      type: Object,
      required: true
    },
    cumulativeTimer: {
      type: Number,
      required: true
    }
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
  }
  .list {
    height: calc(100% - 60px);
    list-style: none;
    overflow-y: auto;
  }
  @include media(1280px){
    width: 100%;
    height: calc(50% - 5px);
  }
  @include media(767px){
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
