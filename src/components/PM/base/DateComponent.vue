<template>
  <div class="dateComponent">
    <div class="title">
      <img
        src="@/assets/icon/calendar.svg"
        alt="calendar"
        width="20"
      >
      <p>到期日</p>
    </div>
    <div class="date_status">
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
      <div class="date">
        <p>2019/12/31</p>
        <img
          src="@/assets/icon/down-arrow.svg"
          alt="down"
          width="15"
        >
        <span
          class="status"
          :class="{done: status}"
        >{{ status ? '完成' : '未完成' }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import { ref } from '@vue/composition-api'
export default {
  name: 'DateComponent',
  setup () {
    const status = ref(false)
    return {
      status
    }
  }
}
</script>

<style lang='scss'>
.dateComponent {
  .title {
    display: flex;
    align-items: center;
    margin: 5px 0;
    p{
      @include font(1);
      margin-left: 5px;
    }
  }
  .date_status {
    display: flex;
    align-items: center;
    padding: 5px 25px;
    .checked {
      cursor: pointer;
    }
    p {
      margin: 0 5px;
    }
    .date {
      display: flex;
      align-items: center;
      @include font;
      cursor: pointer;
      >p{
        transition: color .3s;
        &:hover {
          color: $primary;
        }
      }
    }
    .status {
      border-radius: 5px;
      background-color: $danger;
      padding: 0 5px;
      color: $white;
      margin-left: 5px;
      transition: background-color .3s;
      &.done {
        background-color: $success;
      }
    }
  }
}
</style>
