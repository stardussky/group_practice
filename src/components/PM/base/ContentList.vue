<template>
  <li
    class="contentList"
    @click="changeStatus"
  >
    <div>
      <div class="checked">
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
  cursor: pointer;
  >div{
    display: flex;
    align-items: center;
    @include font;
    p{
      margin-left: 10px;
      overflow: hidden;
      text-overflow: ellipsis;
      &.done {
        text-decoration: line-through;
      }
    }
  }
}
</style>
