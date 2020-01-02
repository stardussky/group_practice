<template>
  <li class="contentList">
    <div>
      <div
        class="checked"
        @click="changeStatus(!list.status)"
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
          class="clock"
          @click="setTodoClock(!list.isClock)"
        >
          <img
            v-if="!list.isClock"
            src="@/assets/icon/time-left_d.svg"
            alt="clock"
          >
          <img
            v-else
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
    const deleteTodoList = () => emit('deleteTodoList')
    const changeStatus = (status) => emit('changeStatus', status)
    const setTodoClock = (status) => emit('setTodoClock', status)

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
    .clock {
      width: 30px;
      height: 30px;
      position: relative;
      cursor: pointer;
      >img {
        @include positionCenter;
        width: 21px;
        height: 21px;
      }
    }
    .delete {
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
