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
  bottom: 30px;
  right: 40px;
  z-index: 1;
  > div {
    @include button(40px);
  }
  .setting_list {
    @include positionCenter(y);
    left: -220px;
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
      img {
        vertical-align: middle;
      }
      p {
        color: $white;
        display: inline-block;
        transition: color .3s;
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
  @include media(479px) {
    bottom: 10px;
    right: 10px;
    .setting_list {
      left: -210px;
    }
  }
}
</style>
