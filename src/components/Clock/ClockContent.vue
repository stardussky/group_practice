<template>
  <div
    class="clockContent"
    :class="{listType: listType}"
  >
    <div class="select_list">
      <button
        type="button"
        :class="{active: !listType}"
        @click="listType = 0"
      >
        專案項目
      </button>
      <button
        type="button"
        :class="{active: listType}"
        @click="listType = 1"
      >
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
import { ref } from '@vue/composition-api'
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
  setup () {
    const listType = ref(0)
    return {
      listType
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
    padding: 10px 0;
    display: flex;
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
        right: 5%;
        z-index: 1;
        @include switchBtn;

      }
      >.self {
        display: none;
      }
      &.listType {
        >.self {
          display: block;
        }
        >.pm {
          display: none;
        }
      }
    }
    @include media(479px){
      .select_list{
        top: 10px;
        right: 5px;
      }
    }
  }
</style>
