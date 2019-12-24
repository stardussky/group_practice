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
      <div>
        <date-picker
          v-model="dateValue"
          type="datetime"
          value-type="YYYY-MM-DD hh:mm"
          format="YYYY-MM-DD hh:mm"
          :show-second="false"
        >
          <template v-slot:icon-calendar>
            <img
              src="@/assets/icon/calendar.svg"
              alt="calendar"
              width="15"
            >
          </template>
        </date-picker>
        <span
          class="status"
          :class="{done: status}"
        >{{ status ? '完成' : '未完成' }}</span>
      </div>
    </div>
  </div>
</template>

<script>
import DatePicker from 'vue2-datepicker'
import { computed } from '@vue/composition-api'
export default {
  name: 'DateComponent',
  components: {
    DatePicker
  },
  props: {
    deadLine: {
      type: String,
      required: true
    },
    dateStatus: {
      type: Boolean,
      required: true
    }
  },
  setup (props, { emit }) {
    const dateValue = computed({
      get () {
        return props.deadLine
      },
      set (val) {
        val = val || '未設定'
        emit('input', val)
      }
    })
    const status = computed({
      get () {
        return props.dateStatus
      },
      set (val) {
        emit('update:dateStatus', val)
      }
    })
    return {
      dateValue,
      status
    }
  }
}
</script>

<style lang='scss'>
$default-color: $dark;
$primary-color: $primary;
$input-hover-border-color: $gray;
.mx-datepicker-main {
  border-radius: 10px;
}
@import '~vue2-datepicker/scss/index.scss';
.dateComponent {
  .mx-datepicker{
      width: 200px;
    }
  .title {
    display: flex;
    align-items: center;
    margin: 5px 0;
    p{
      @include font(1);
      margin-left: 10px;
    }
  }
  .date_status {
    display: flex;
    align-items: center;
    padding: 5px 30px;
    .checked {
      cursor: pointer;
      margin-right: 5px;
    }
    .status {
      @include font;
      border-radius: 5px;
      background-color: $danger;
      padding: 2.5px 5px;
      color: $white;
      margin-left: 5px;
      transition: background-color .3s;
      &.done {
        background-color: $success;
      }
    }
  }
  @include media(479px){
    .mx-datepicker{
      width: 120px;
    }
  }
}
</style>
