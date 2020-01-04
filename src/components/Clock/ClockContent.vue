<template>
  <div class="clockContent">
    <div class="select_list">
      <button
        type="button"
        class="active"
      >
        專案項目
      </button>
      <button type="button">
        個人項目
      </button>
    </div>
    <ClockContentList
      v-for="content in clockList"
      :key="content.type"
      :content="content"
      :cumulative-timer="cumulativeTimer"
      :class="content.type"
    />
  </div>
</template>

<script>
import ClockContentList from './ClockContentList'
export default {
  name: 'ClockContent',
  components: {
    ClockContentList
  },
  props: {
    clockList: {
      type: Array,
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
  .clockContent {
    width: 60%;
    height: 100%;
    padding-top: 10px;
    display: flex;
    padding-bottom: 10px;
    .select_list {
      display: none;
    }
    @include media(1280px){
      width: 50%;
      flex-direction: column;
      align-items: center;
    }
    @include media(767px){
      width: 100%;
      height: 60%;
      flex-direction: row;
      align-items: flex-start;
      padding-top: 0;
      .select_list {
        display: block;
        position: absolute;
        top: 15px;
        right: 15px;
        z-index: 1;
        @include switchBtn;
      }
      >.self {
        display: none;
      }
    }
    @include media(479px){
      .select_list{
        top: 5px;
        right: 5px;
      }
    }
  }
</style>
