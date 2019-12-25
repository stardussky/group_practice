<template>
  <div class="LoginTrack">
    <div class="mode sign_in">
      <div>
        <h2>Don't have an account?</h2>
        <p>
          Banjo tote bag bicycle rights, High Life sartorial cray craft beer whatever street art fap.
        </p>
        <button @click="changeMode = 0">
          Sign Up
        </button>
      </div>
    </div>
    <div class="mode sign_up">
      <div>
        <h2>Have an account?</h2>
        <p>
          Banjo tote bag bicycle rights, High Life sartorial cray craft beer whatever street art fap.
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
  background-image: linear-gradient(to right, rgba($primary, .5),  rgba($third, .5));
  outline: 1px solid $white;
  outline-offset: 10px;
  display: flex;
  justify-content: space-between;
  .mode {
    max-width: 600px;
    width: 50%;
    @include font;
    color: $dark;
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
