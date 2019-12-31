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
        <div
          v-if="isEdit"
          class="clock"
          @click="setTodoClock"
        >
          <img
            src="@/assets/icon/time-left_d.svg"
            alt="clock"
          >
          <img
            src="@/assets/icon/time-left_c.svg"
            alt="clock"
          >
        </div>
        <div
          class="delete"
          @click="deleteTodoList"
        >
          <img
            src="@/assets/icon/delete.svg"
            alt="delete"
          >
          <img
            src="@/assets/icon/delete_on.svg"
            alt="clock"
          >
        </div>
      </div>
    </div>
  </li>
</template>

<script>
import { mapState } from 'vuex'
export default {
  name: 'ContentList',
  props: {
    list: {
      type: Object,
      required: true
    }
  },
  computed: {
    ...mapState('pmStore', ['isEdit'])
  },
  setup (props, { emit }) {
    const changeStatus = () => emit('changeStatus')
    const deleteTodoList = () => emit('deleteTodoList')
    const setTodoClock = () => emit('setTodoClock')

    return {
      changeStatus,
      deleteTodoList,
      setTodoClock
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
    display: flex;
    align-items: center;
    cursor: pointer;
  }
  >div{
    display: flex;
    align-items: center;
    @include font;
    p{
      margin-left: 10px;
      padding-right: 60px;
      overflow: hidden;
      text-overflow: ellipsis;
      &.done {
        text-decoration: line-through;
      }
    }
  }
  .control {
    display: flex;
    position: absolute;
    right: -30px;
    opacity: 0;
    transition: all .3s;
    .clock, .delete {
      position: relative;
      @include hoverImg(30px);
    }
  }
  &:hover {
    .control {
      right: 0;
      opacity: 1;
    }
  }
}
</style>
