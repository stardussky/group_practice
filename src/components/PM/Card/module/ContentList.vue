<template>
  <li class="contentList">
    <div>
      <div
        class="checked"
        @click="changeStatus"
      >
        <img
          v-if="!list.status"
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
      <p :class="{done: list.status}">
        {{ list.content }}
      </p>
      <div class="control">
        <img
          src="@/assets/icon/time-left_d.svg"
          alt="clock"
        >
        <img
          src="@/assets/icon/time-left_c.svg"
          alt="clock"
        >
      </div>
    </div>
  </li>
</template>

<script>
export default {
  name: 'ContentList',
  props: {
    list: {
      type: Object,
      required: true
    }
  },
  setup (props, { emit }) {
    const changeStatus = () => emit('changeStatus')

    return {
      changeStatus
    }
  }
}
</script>

<style lang='scss'>
.contentList {
  list-style: none;
  position: relative;
  margin: 5px 0;
  .checked {
    cursor: pointer;
  }
  >div{
    display: flex;
    align-items: center;
    @include font;
    p{
      margin-left: 10px;
      padding-right: 30px;
      overflow: hidden;
      text-overflow: ellipsis;
      &.done {
        text-decoration: line-through;
      }
    }
  }
  .control {
    position: absolute;
    right: 0;
    @include hoverImg(30px);
  }
}
</style>
