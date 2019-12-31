<template>
  <div class="settingComponent">
    <div
      class="navBtn"
      @click="isListOpen = !isListOpen"
    >
      <div class="navBtn_btn">
        <div>
          <img
            src="@/assets/icon/settings.svg"
            width="20"
          >
        </div>
      </div>
    </div>
    <ul
      class="setting_list"
      :class="{ active: isListOpen }"
    >
      <li @click="nowWeather = 'day'">
        <img
          v-if="nowWeather === 'day'"
          src="@/assets/icon/checked.svg"
          width="15"
        >
        <img
          v-else
          src="@/assets/icon/unchecked.svg"
          width="15"
        >
        <p :class="{active: nowWeather === 'day'}">
          Day
        </p>
      </li>
      <li @click="nowWeather = 'night'">
        <img
          v-if="nowWeather === 'night'"
          src="@/assets/icon/checked.svg"
          width="15"
        >
        <img
          v-else
          src="@/assets/icon/unchecked.svg"
          width="15"
        >
        <p :class="{active: nowWeather === 'night'}">
          Night
        </p>
      </li>
      <li @click="nowWeather = 'cloudy'">
        <img
          v-if="nowWeather === 'cloudy'"
          src="@/assets/icon/checked.svg"
          width="15"
        >
        <img
          v-else
          src="@/assets/icon/unchecked.svg"
          width="15"
        >
        <p :class="{active: nowWeather === 'cloudy'}">
          Cloudy
        </p>
      </li>
      <li @click="nowWeather = 'rainy'">
        <img
          v-if="nowWeather === 'rainy'"
          src="@/assets/icon/checked.svg"
          width="15"
        >
        <img
          v-else
          src="@/assets/icon/unchecked.svg"
          width="15"
        >
        <p :class="{active: nowWeather === 'rainy'}">
          Rainy
        </p>
      </li>
    </ul>
  </div>
</template>

<script>
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'Setting',
  props: {
    weather: {
      type: String,
      required: true
    }
  },
  setup (props, { emit }) {
    const isListOpen = ref(false)
    const nowWeather = computed({
      get () {
        return props.weather
      },
      set (val) {
        emit('update:weather', val)
      }
    })
    return {
      isListOpen,
      nowWeather
    }
  }
}
</script>

<style lang="scss">
.settingComponent {
  position: fixed;
  bottom: 35px;
  right: 40px;
  z-index: 1;
  > div {
    @include button(40px);
  }
  .setting_list {
    @include positionCenter(y);
    left: -330px;
    list-style: none;
    display: flex;
    opacity: 0;
    visibility: hidden;
    transition: all 0.5s;
    @include font;
    &.active {
      opacity: 1;
      visibility: visible;
    }
    > li {
      margin: 0 5px;
      cursor: pointer;
      display: flex;
      align-items: center;
      p {
        color: $white;
        transition: color .3s;
        margin-left: 5px;
        &.active{
          color: $primary;
        }
      }
      &:hover {
        p {
          color: $primary;
        }
      }
    }
  }
  @include media(1399px){
    .setting_list {
      width: 190px;
      flex-wrap: wrap;
      justify-content: space-between;
      left: -200px;
    }
  }
  @include media(1023px){
    bottom: 10px;
    right: 10px;
    .setting_list {
      width: auto;
      left: -330px;
    }
  }
  @include media(479px) {
    .setting_list {
      @include font(-.875);
      left: -270px;
      > li {
        p{
          margin-left: 0;
        }
      }
    }
  }
}
</style>
