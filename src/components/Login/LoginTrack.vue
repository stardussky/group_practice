<template>
  <div class="LoginTrack">
    <div class="mode sign_in">
      <div>
        <h2>還沒有帳號嗎?</h2>
        <p>
          立即成為數百萬每日使用 職人口袋－Master Pocket 的用戶之一！
        </p>
        <button @click="changeMode = 0">
          Sign Up
        </button>
      </div>
    </div>
    <div class="mode sign_up">
      <div>
        <h2>立即登入!</h2>
        <p>
          馬上登入開始使用 職人口袋－Master Pocket 吧!
        </p>
        <button @click="changeMode = 1">
          Sign In
        </button>
      </div>
    </div>
  </div>
</template>

<script>
import { computed } from '@vue/composition-api'
export default {
  name: 'LoginTrack',
  props: {
    mode: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit }) {
    const changeMode = computed({
      get () {
        return props.mode
      },
      set (val) {
        emit('update:mode', val)
      }
    })
    return {
      changeMode
    }
  }
}
</script>

<style lang='scss'>
.LoginTrack {
  @include positionCenter(y);
  width: 100%;
  height: 300px;
  background-image: linear-gradient(-30deg, rgba($primary, 1), rgba($secondary, .7), rgba($third, 1));
  outline: 1px solid $white;
  outline-offset: 10px;
  display: flex;
  justify-content: space-between;
  .mode {
    max-width: 600px;
    width: 50%;
    @include font;
    color: $white;
    display: flex;
    align-items: center;
    justify-content: center;
    div{
      padding: 0 20px;
    }
    h2 {
      white-space: nowrap;
    }
    p{
      margin: 20px 0;
    }
    button {
      @include baseBtn;
    }
  }
  @include media(1023px){
    display: none;
  }
}
</style>
