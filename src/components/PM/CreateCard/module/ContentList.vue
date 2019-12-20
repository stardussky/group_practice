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
    const changeStatus = () => emit('changeStatus', {
      id: props.list.id,
      status: !props.list.status
    })

    return {
      changeStatus
    }
  },
  inject: ['color']
}
</script>

<style lang='scss'>
.contentList {
  border-bottom: 1px solid $shadow;
  cursor: pointer;
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
}
</style>
