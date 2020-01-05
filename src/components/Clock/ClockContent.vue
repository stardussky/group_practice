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
      :mode="mode"
      :class="content.type"
      :elapsedtimer="elapsedtimer"
    />
  </div>
</template>

<script>
import ClockContentList from './ClockContentList'
import { mapGetters } from 'vuex'
export default {
  name: 'ClockContent',
  components: {
    ClockContentList
  },
  props: {
    mode: {
      type: Number,
      required: true
    },
    elapsedtimer: {
      type: Number,
      required: true
    }
  },
  computed: {
    ...mapGetters('clockStore', ['clockList'])
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
