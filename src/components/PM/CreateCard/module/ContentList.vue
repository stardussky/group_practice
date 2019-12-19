<template>
  <li class="contentList">
    <div>
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
      <p :class="{done: status}">
        切版
      </p>
    </div>
    <label>
      <input
        type="text"
        placeholder="增加項目"
        :style="{backgroundColor: color}"
      >
      <img
        src="@/assets/icon/plus_w.svg"
        alt="plus"
        width="15"
      >
    </label>
  </li>
</template>

<script>
import { ref } from '@vue/composition-api'
export default {
  name: 'ContentList',
  setup () {
    const status = ref(false)
    return {
      status
    }
  },
  inject: ['color']

}
</script>

<style lang='scss'>
@import '@/style/_var';
.contentList {
  border-bottom: 1px solid $shadow;
  .checked {
    cursor: pointer;
  }
  >div{
    display: flex;
    align-items: center;
    @include font;
    p{
      margin-left: 15px;
      &.done {
        text-decoration: line-through;
      }
    }
  }
  >label{
    position: relative;
    input {
      width: 50%;
      @include btnReset;
      @include font;
      color: $white;
      border-radius: 5px;
      padding: 5px 25px 5px 5px;
      margin: 5px 0;
      transition: all .3s;
      &::-webkit-input-placeholder{
        color: $white;
        text-align: center;
      }
    }
    img {
      @include positionCenter(y);
      right: 5px;
      cursor: pointer;
    }
  }
}
</style>
