<template>
  <ValidationObserver
    v-slot="{passes}"
    tag="div"
    class="loginFrom"
    :class="{mode: mode}"
  >
    <div class="select_mode">
      <button
        type="button"
        :class="{active: !mode}"
        @click="changeMode = 0"
      >
        Sign Up
      </button>
      <button
        type="button"
        :class="{active: mode}"
        @click="changeMode = 1"
      >
        Sign In
      </button>
    </div>
    <form @submit.prevent="passes(submit)">
      <div class="form_field">
        <h2>{{ mode ? 'Sign In' : 'Sign Up' }}</h2>
        <transition-group
          tag="div"
          name="flip"
        >
          <component
            :is="input.component"
            v-for="input in formInfo[mode].fields"
            :key="input.name"
            v-model="input.value"
            :rules="input.require"
            :placeholder="input.placeholder"
            :name="input.name"
            :type="input.type"
            :field="input.field"
          />
          <button
            key="button"
            class="submit"
          >
            {{ mode ? 'Sign In' : 'Sign Up' }}
          </button>
        </transition-group>
      </div>
    </form>
  </ValidationObserver>
</template>

<script>
import InputComponent from './InputComponent'
import FileComponent from './FileComponent'
import { ref, computed } from '@vue/composition-api'
export default {
  name: 'LoginForm',
  components: {
    InputComponent,
    FileComponent
  },
  props: {
    mode: {
      type: Number,
      required: true
    }
  },
  setup (props, { emit }) {
    const formInfo = ref([
      {
        fields: [
          {
            component: 'FileComponent',
            type: 'file',
            name: 'headshot',
            value: `${require('@/assets/icon/user.svg')}`
          },
          {
            component: 'InputComponent',
            field: 'Account',
            type: 'text',
            name: 'memId',
            placeholder: '請輸入帳號',
            require: 'required',
            value: ''
          },
          {
            component: 'InputComponent',
            field: 'Password',
            type: 'password',
            name: 'memPsw',
            placeholder: '請輸入密碼',
            require: 'required',
            value: ''
          },
          {
            component: 'InputComponent',
            field: 'Email',
            type: 'email',
            name: 'email',
            placeholder: '請輸入電子信箱',
            require: 'email',
            value: ''
          }
        ]
      },
      {
        fields: [
          {
            component: 'InputComponent',
            field: 'Account',
            type: 'text',
            name: 'memId',
            placeholder: '請輸入帳號',
            require: 'required',
            value: ''
          },
          {
            component: 'InputComponent',
            field: 'Password',
            type: 'password',
            name: 'memPsw',
            placeholder: '請輸入密碼',
            require: 'required',
            value: ''
          }
        ]
      }
    ])
    const changeMode = computed({
      get () {
        return props.mode
      },
      set (val) {
        emit('update:mode', val)
      }
    })
    const userData = computed(() => {
      return formInfo.value[props.mode].fields.reduce((prev, info) => {
        prev[info.name] = info.value
        return prev
      }, [])
    })
    const submit = () => {
      console.log('submit: ', userData.value)
      formInfo.value[props.mode].fields.forEach(info => {
        if (info.name === 'headshot')info.value = `${require('@/assets/icon/user.svg')}`
        else info.value = ''
      })
    }
    return {
      changeMode,
      formInfo,
      submit
    }
  }
}
</script>

<style lang='scss'>
.loginFrom {
  width: 50%;
  height: calc(100% - 10px);
  background-color: $white;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 1;
  transition: left .5s;
  border-radius: 0 0 20px 20px;
  border-top: 3px solid $primary;
  &.mode{
    left: 50%;
  }
  >form{
    width: 100%;
    height: 100%;
    position: relative;
  }
  .select_mode {
    display: none;
    position: absolute;
    top: 15px;
    right: 15px;
    z-index: 1;
  }
  .form_field {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    position: relative;
    padding: 0 10%;
    border-radius: 0 0 20px 20px;
    >div {
      width: 250px;
    }
    h2 {
      @include font(3);
      color: $dark;
      margin-bottom: 20px;
    }
  }
  .submit{
    @include baseBtn;
  }
  @include media(1023px){
    width: 100%;
    &.mode{
      left: auto;
    }
    .form_field{
      margin-top: 0;
      h2 {
        display: none;
      }
    }
    .select_mode {
      @include switchBtn;
    }
  }
  @include media(479px){
    border-width: 2px;
    .select_mode{
      top: 5px;
      right: 5px;
    }
  }
}
</style>
