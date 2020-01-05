<template>
  <li
    class="clockList"
    :class="[{active: targetInfo && list.info.id === targetInfo.info.id}, clockStyle]"
  >
    <div
      class="card_color"
      :style="{backgroundColor: list.color}"
    />
    <div class="title">
      <p>{{ list.info.content }}</p>
    </div>
    <div class="info">
      <div class="timer">
        <img
          src="@/assets/icon/time-left_c.svg"
          alt="calendar"
          width="20"
        >
        <p>{{ time }}</p>
      </div>
      <div class="status">
        <div
          class="control"
          @click="toggleStatus(!isPlay)"
        >
          <div
            v-if="!isPlay || targetInfo && list.info.id !== targetInfo.info.id"
            class="play"
          >
            <img
              src="@/assets/icon/play.svg"
              alt="play"
            >
            <img
              src="@/assets/icon/play_c.svg"
              alt="play"
            >
          </div>
          <div
            v-else
            class="pause"
          >
            <img
              src="@/assets/icon/pause.svg"
              alt="pause"
            >
            <img
              src="@/assets/icon/pause_c.svg"
              alt="pause"
            >
          </div>
        </div>
        <div
          class="done"
          @click="DONE_CLOCK(list)"
        >
          <img
            v-if="list.info.status"
            src="@/assets/icon/checked_d.svg"
            alt="checked"
            width="17.5"
          >
          <img
            v-else
            src="@/assets/icon/unchecked_d.svg"
            alt="checked"
            width="17.5"
          >
        </div>
        <div
          class="cancel"
          @click="DELETE_CLOCK(list)"
        >
          <img
            src="@/assets/icon/delete.svg"
            alt="checked"
          >
          <img
            src="@/assets/icon/delete_on.svg"
            alt="checked"
          >
        </div>
      </div>
    </div>
  </li>
</template>

<script>
import { computed } from '@vue/composition-api'
import { mapState, mapMutations, mapActions } from 'vuex'
import mixins from './mixins'
export default {
  name: 'ClockList',
  mixins: [mixins],
  props: {
    list: {
      type: Object,
      required: true
    },
    mode: {
      type: Number,
      required: true
    },
    elapsedtimer: {
      type: Number,
      required: true
    }
  },
  setup (props) {
    const clockStyle = computed(() => !props.mode ? 'work' : 'break')
    return {
      clockStyle
    }
  },
  computed: {
    ...mapState('clockStore', ['isPlay', 'targetInfo']),
    clockTime () {
      return this.targetInfo && this.list.info.id === this.targetInfo.info.id
        ? this.list.info.timer + this.elapsedtimer
        : this.list.info.timer
    }
  },
  methods: {
    ...mapMutations('clockStore', ['toggleStatus']),
    ...mapActions('clockStore', ['DONE_CLOCK', 'DELETE_CLOCK'])
  }

}
</script>

<style lang='scss'>
.clockList {
  @include todoCard;
  position: relative;
  z-index: 1;
  &.active{
    &.work {
      .card_color {
        background-image: linear-gradient(to right, $secondary, $primary);
      }
    }
    &.break {
      .card_color {
        background-image: linear-gradient(to right, $danger, $third);
      }
    }
  }
  >.title {
    @include font(2);
    margin: 10px 0 5px;
    >p{
      white-space: nowrap;
      overflow: hidden;
      text-overflow: ellipsis;
    }
  }
  >.info {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .timer, .status {
    display: flex;
    align-items: center;
    p {
      @include font;
      margin-left: 5px;
    }
  }
  .status  {
    display: flex;
    .cancel, .done, .control{
      position: relative;
    }
    .control {
      @include hoverImg(25px);
    }
    .done {
      width: 25px;
      height: 25px;
      >img {
        @include positionCenter;
      }
    }
    .cancel {
      @include hoverImg(25px);
    }
  }
}
</style>
