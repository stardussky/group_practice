<template>
  <li class="clockList">
    <div class="card_color" />
    <div class="title">
      <p>{{ list.content }}</p>
    </div>
    <div class="info">
      <div class="timer">
        <img
          src="@/assets/icon/time-left_c.svg"
          alt="calendar"
          width="20"
        >
        <p>25:00</p>
      </div>
      <div class="status">
        <div class="done">
          <img
            v-if="list.status"
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
        <div class="cancel">
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
export default {
  name: 'ClockList',
  props: {
    list: {
      type: Object,
      required: true
    }
  }
}
</script>

<style lang='scss'>
.clockList {
  @include todoCard;
  position: relative;
  z-index: 1;
  .card_color {
    background-image: linear-gradient(to right, $primary, $third);
  }
  &:hover {
    .card_color {
      opacity: .3;
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
    .cancel, .done{
      position: relative;
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
